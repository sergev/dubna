//
// Extracode 064 - text output.
//
// For details, see:
//   1) Pages 34-36 of book "Операционная система Диспак для БЭСМ-6"
//      https://github.com/besm6/besm6.github.io/raw/master/doc/%D0%9E%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0-%D0%94%D0%98%D0%A1%D0%9F%D0%90%D0%9A.pdf
//   2) https://github.com/besm6/besm6.github.io/blob/master/wiki/extracodes.txt
//
// Copyright (c) 2023 Serge Vakulenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
#include <unistd.h>

#include <cstring>
#include <iostream>
#include <iomanip>

#include "encoding.h"
#include "gost10859.h"
#include "machine.h"

//
// Width of the printed line.
//
static const unsigned LINE_WIDTH = 128;

//
// If the line is non-blank - print it to stdout.
// Erase it (fill with spaces) and return true.
// If line is empty (all spaces) - return false.
//
static bool line_flush(std::string &line)
{
    int limit;

    for (limit = line.size() - 1; limit >= 0; --limit) {
        if (line[limit] != GOST_SPACE)
            break;
    }

    if (limit < 0) {
        // Nothing to print.
        return false;
    }

    gost_write(line, limit);
    std::fill(line.begin(), line.end(), GOST_SPACE);
    return true;
}

//
// Print one character at a given position.
// Update the position.
//
static void print_char(std::string &line, unsigned &position, int sym)
{
    if (position >= LINE_WIDTH) {
        line_flush(line);
        std::cout << std::endl;
        position = 0;
    }
    line[position] = sym;
    position += 1;
}

//
// Print machine instruction at a given position.
// Update the position.
//
static void print_opcode1(std::string &line, unsigned &position, unsigned cmd)
{
    print_char(line, position, cmd >> 23 & 1);
    print_char(line, position, cmd >> 20 & 7);
    print_char(line, position, GOST_SPACE);
    if (cmd & 02000000) {
        // long address command
        print_char(line, position, cmd >> 18 & 3);
        print_char(line, position, cmd >> 15 & 7);
        print_char(line, position, GOST_SPACE);
        print_char(line, position, cmd >> 12 & 7);
    } else {
        // short address command
        print_char(line, position, cmd >> 18 & 1);
        print_char(line, position, cmd >> 15 & 7);
        print_char(line, position, cmd >> 12 & 7);
        print_char(line, position, GOST_SPACE);
    }
    print_char(line, position, cmd >> 9 & 7);
    print_char(line, position, cmd >> 6 & 7);
    print_char(line, position, cmd >> 3 & 7);
    print_char(line, position, cmd & 7);
}

//
// Extract decimal exponent from the real value.
// Return value in range 0.1 - 0.9(9).
// Input value must be nonzero positive.
//
static double real_exponent(double value, int &exponent)
{
    exponent = 0;
    if (value <= 0)
        return 0; // cannot happen

    while (value >= 1000000) {
        exponent += 6;
        value /= 1000000;
    }
    while (value >= 1) {
        ++exponent;
        value /= 10;
    }
    while (value < 0.0000001) {
        exponent -= 6;
        value *= 1000000;
    }
    while (value < 0.1) {
        --exponent;
        value *= 10;
    }
    return value;
}

//
// Print string in ITM format.
// Return next data address.
//
unsigned Processor::e64_print_itm(unsigned addr0, unsigned addr1, std::string &line, unsigned position)
{
    BytePointer bp(memory, addr0);
    uint8_t lastc = GOST_SPACE;

    while (bp.word_addr) {
        // No data to print.
        if (addr1 && bp.word_addr == addr1 + 1) {
            return bp.word_addr;
        }

        // No space left on the line.
        if (position == LINE_WIDTH) {
            if (!addr1) {
                if (bp.byte_index) {
                    ++bp.word_addr;
                }
                return bp.word_addr;
            }
            line_flush(line);
            std::cout << std::endl;
            position = 0;
        }

        uint8_t c = bp.get_byte();
        switch (c) {
        case 0140: // end of information
            if (bp.byte_index) {
                ++bp.word_addr;
            }
            return bp.word_addr;

        case 040: // blank
            line[position++] = GOST_SPACE;
            break;

        case 0173: // repeat last symbol
            c = bp.get_byte();
            if (c == 040) {
                // fill line by last symbol (?)
                std::fill(line.begin(), line.end(), lastc);
                line_flush(line);
                std::cout << std::endl;
                position = 0;
            } else {
                while (c-- & 017) {
                    line[position++] = lastc;
                }
            }
            break;

        default:
            lastc            = itm_to_gost[c];
            line[position++] = lastc;
            break;
        }
    }
    return 0;
}

//
// Print word(s) in octal format.
// Return next data address.
//
unsigned Processor::e64_print_octal(unsigned addr0, unsigned addr1, std::string &line, unsigned position,
                                    unsigned digits, unsigned width, unsigned repeat)
{
    if (digits > 16) {
        digits = 16;
    }
    while (addr0) {
        // No data to print.
        if (addr1 && addr0 == addr1 + 1) {
            return addr0;
        }

        // No space left on the line.
        if (position >= LINE_WIDTH) {
            if (!addr1) {
                return 0;
            }
            return addr0;
        }
        Word word = machine.mem_load(addr0);
        ++addr0;

        word <<= 64 - digits * 3;
        for (unsigned i = 0; i < digits; ++i) {
            print_char(line, position, (int)(word >> 61) & 7);
            word <<= 3;
        }

        if (!repeat) {
            return addr0;
        }
        --repeat;
        if (width > digits) {
            position += width - digits;
        }
    }
    return 0;
}

//
// Print CPU instruction(s).
// Return next data address.
//
unsigned Processor::e64_print_opcode(unsigned addr0, unsigned addr1, std::string &line, unsigned position,
                                     unsigned width, unsigned repeat)
{
    while (addr0) {
        // No data to print.
        if (addr1 && addr0 == addr1 + 1) {
            return addr0;
        }

        // No space left on the line.
        if (position >= LINE_WIDTH) {
            if (!addr1) {
                return 0;
            }
            return addr0;
        }
        Word word  = machine.mem_load(addr0);
        unsigned a = word >> 24;
        unsigned b = word & BITS(24);
        ++addr0;

        print_opcode1(line, position, a);
        print_char(line, position, GOST_SPACE);
        print_opcode1(line, position, b);

        if (!repeat) {
            return addr0;
        }
        --repeat;
        if (width > 23) {
            position += width - 23;
        }
    }
    return 0;
}

//
// Print real number(s).
// Return next data address.
//
unsigned Processor::e64_print_real(unsigned addr0, unsigned addr1, std::string &line, unsigned position,
                                   unsigned digits, unsigned width, unsigned repeat)
{
    if (digits > 20) {
        digits = 20;
    }
    if (digits < 4) {
        digits = 4;
    }
    while (addr0) {
        // No data to print.
        if (addr1 && addr0 == addr1 + 1) {
            return addr0;
        }

        // No space left on the line.
        if (position >= LINE_WIDTH) {
            if (!addr1) {
                return 0;
            }
            return addr0;
        }

        Word word     = machine.mem_load(addr0);
        bool negative = (word & BIT41);
        double value = 0;
        int exponent = 0;
        if (word & ~BIT41) {
            // Value is non-zero.
            value = besm6_to_ieee(word);
            if (value < 0) {
                value = -value;
            }
            value = real_exponent(value, exponent);
        }
        ++addr0;

        print_char(line, position, GOST_SPACE);
        print_char(line, position, negative ? GOST_MINUS : GOST_PLUS);

        for (unsigned i = 0; i < digits - 4; ++i) {
            value     = value * 10;
            int digit = (int)value;
            print_char(line, position, digit);
            value -= digit;
        }
        print_char(line, position, GOST_LOWER_TEN);
        if (exponent >= 0) {
            print_char(line, position, GOST_PLUS);
        } else {
            print_char(line, position, GOST_MINUS);
            exponent = -exponent;
        }
        print_char(line, position, exponent / 10);
        print_char(line, position, exponent % 10);

        if (!repeat) {
            return addr0;
        }
        --repeat;
        if (width > digits + 2) {
            position += width - digits - 2;
        }
    }
    return 0;
}

//
// Print string in GOST format.
// Return next data address.
// Update the need_newline flag.
//
unsigned Processor::e64_print_gost(unsigned addr0, unsigned addr1, std::string &line, unsigned position,
                                   bool &need_newline)
{
    BytePointer bp(memory, addr0);
    unsigned char last_ch = GOST_SPACE;

    for (;;) {
        if (bp.word_addr == 0)
            return 0;

        // No data to print.
        if (addr1 && bp.word_addr == addr1 + 1)
            return bp.word_addr;

        unsigned char ch = bp.get_byte();
        switch (ch) {
        case GOST_EOF:
        case GOST_END_OF_INFORMATION:
        case 0231:
            if (position == 0 || position == LINE_WIDTH)
                need_newline = false;
            if (bp.byte_index != 0)
                ++bp.word_addr;
            return bp.word_addr;
        case 0201: // new page
            if (position) {
                line_flush(line);
                position = 0;
            }
            if (!isatty(1)) {
                std::cout << '\f';
            }
            line[position++] = GOST_SPACE;
            break;
        case GOST_CARRIAGE_RETURN:
        case GOST_NEWLINE:
            if (position == LINE_WIDTH) {
                position = 0;
                break;
            }
            if (position) {
                line_flush(line);
                position = 0;
            }
            std::cout << std::endl;
            break;
        case 0143: // null width symbol
        case 0341:
            break;
        case GOST_SET_POSITION:
        case 0200: // set position
            ch  = bp.get_byte();
            position = ch % LINE_WIDTH;
            break;
        case 0174:
        case 0265: // repeat last symbol
            ch = bp.get_byte();
            if (ch == 040) {
                // fill line by last symbol (?)
                std::fill(line.begin(), line.end(), last_ch);
                line_flush(line);
                std::cout << std::endl;
                position = 0;
            } else {
                while (ch-- & 017) {
                    if (line[position] == GOST_SPACE)
                        line[position] = last_ch;
                    ++position;
                }
            }
            break;
        case GOST_SPACE2: // blank
        case 0242:        // used as space by forex
            ch = GOST_SPACE;
            // fall through...
        default:
            if (position == LINE_WIDTH) {
                if (addr1) {
                    position = 0;
                } else {
                    // No space left on the line.
                    need_newline = false;
                    if (bp.byte_index != 0)
                        ++bp.word_addr;
                    return bp.word_addr;
                }
            }
            if (line[position] != GOST_SPACE) {
                line_flush(line);
                std::cout << std::endl;
            }
            line[position] = ch;
            last_ch   = ch;
            ++position;
            if (position == LINE_WIDTH) {
                // No space left on the line.
                line_flush(line);
                std::cout << std::endl;
            }
            break;
        }
    }
}

//
// Extracode 064: text output.
//
// The information array has the following format
// - First word:
//   iiii ..... xxxxxxxxxxxxxxx
//   jjjj ..... yyyyyyyyyyyyyyy
// - Other words:
//   ffff bbbbbbbb dddddddddddd
//   esss wwwwwwww rrrrrrrrrrrr
//
// Here:
// x+Ri	- start address of data
// y+Rj	- end address of data
// f	- print format
// b	- starting position, 0 - most left
// d 	- number of digits (for integer formats)
// e	- 1 for final word
// s	- skip this number of lines
// w	- total field width (for integer formats)
// r	- repetition counter (0-once, 1-twice etc)
//
// Print formats:
// 0 	- text in GOST encoding
// 1	- CPU instruction
// 2	- octal number
// 3	- real number (mantissa=digits-4)
// 4	- text in ITM encoding
//
void Processor::e64()
{
    switch (core.M[016]) {
    case 0:  // Disable paging.
        return;
    case 1:  // Enable paging.
        return;
    default: // Print something.
        break;
    }

    // Get start and end addresses from control word #0.
    unsigned ctl_addr = core.M[016];
    E64_Pointer ptr;
    ptr.word = machine.mem_load(ctl_addr);

    unsigned start_addr  = ADDR(ptr.field.start_addr + core.M[ptr.field.start_reg]);
    unsigned end_addr    = ADDR(ptr.field.end_addr + core.M[ptr.field.end_reg]);
    if (end_addr <= start_addr) {
        // No limit.
        end_addr = 0;
    }
    if (start_addr == 0) {
        throw Processor::Exception("Bad start_addr in extracode e64");
    }

    // Create a line buffer, initialize with spaces.
    std::string line(LINE_WIDTH, GOST_SPACE);

    // Execute every format word in order.
    for (;;) {
        // Get next control word.
        ctl_addr++;
        if (ctl_addr >= MEMORY_NWORDS)
            throw Processor::Exception("Unterminated info list in extracode e64");

        // Get format details from control word #1 onwards.
        E64_Info ctl;
        ctl.word = machine.mem_load(ctl_addr);
        machine.trace_e64(ctl, start_addr, end_addr);

        // Extract fields.
        unsigned format = ctl.field.format;
        unsigned offset = ctl.field.offset;
        unsigned digits = ctl.field.digits;
        bool     finish = ctl.field.finish;
        unsigned skip   = ctl.field.skip;
        unsigned width  = ctl.field.width;
        unsigned repeat = ctl.field.repeat1;

        bool need_newline = true;
        switch (format) {
        case 0:
            // Text in GOST encoding.
            start_addr = e64_print_gost(start_addr, end_addr, line, offset, need_newline);
            break;

        case 1:
            // CPU instruction.
            start_addr = e64_print_opcode(start_addr, end_addr, line, offset, width, repeat);
            break;

        case 2:
            // Octal number.
            start_addr = e64_print_octal(start_addr, end_addr, line, offset, digits, width, repeat);
            break;

        case 3:
            // Real number.
            start_addr = e64_print_real(start_addr, end_addr, line, offset, digits, width, repeat);
            break;

        case 4:
            // Text in ITM encoding.
            start_addr = e64_print_itm(start_addr, end_addr, line, offset);
            break;
        }

        if (finish) {
            if (line_flush(line) || (need_newline && !skip))
                ++skip;

            if (end_addr && start_addr <= end_addr) {
                // Repeat printing task until all data expired.
                std::cout << std::endl;
                continue;
            }

            while (skip-- > 0)
                std::cout << std::endl;
            break;
        }

        // Check the limit of data pointer.
        if (end_addr && start_addr > end_addr) {
            line_flush(line);
            std::cout << std::endl;
            break;
        }
    }
}
