//
// Generic plotter for BESM-6.
//
// Copyright (c) 2024 Serge Vakulenko
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
#ifndef DUBNA_PLOTTER_H
#define DUBNA_PLOTTER_H

#include <functional>

#include "memory.h"

class Plotter {
private:
    std::string watanabe;
    std::string calcomp;
    std::string tektronix;

public:
    // Save all data files.
    void finish();

    // Send one byte to Watanabe WX4675 plotter.
    void watanabe_putch(char ch) { watanabe += ch; }

    // Send one byte to Calcomp plotter.
    void calcomp_putch(char ch) { calcomp += ch; }

    // Send one byte to Tektronix plotter.
    void tektronix_putch(char ch) { tektronix += ch; }

private:
    // Save output, if available.
    void save_to_file(const std::string &filename, const std::string &data);

    // Convert output to SVG format.
    void watanabe_convert_svg(const std::string &filename);
    void calcomp_convert_svg(const std::string &filename);
    void tektronix_convert_svg(const std::string &filename);

    // Parse raw file and invoke given routine for each line.
    void watanabe_parse(const std::function<void(char, unsigned, unsigned&)> &func);
    void tektronix_parse(const std::function<void(bool, unsigned, unsigned&)> &func);
};

#endif // DUBNA_PLOTTER_H
