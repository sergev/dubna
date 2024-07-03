//
// Tests for Session class.
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
#include <fstream>

#include "fixture_session.h"

//
// Check the version string.
//
TEST_F(dubna_session, version)
{
    // Capture the usage message.
    std::string result = Session::get_version();
    std::cout << result;

    // Check output.
    EXPECT_NE(result.find("."), std::string::npos);
    EXPECT_NE(result.find("-"), std::string::npos);
}

//
// Enable tracing of extracodes and run empty job.
// Make sure the trace is correct.
//
TEST_F(dubna_session, trace_end_file)
{
    std::string base_name      = get_test_name();
    std::string job_filename   = base_name + ".dub";
    std::string trace_filename = base_name + ".trace";

    // Enable trace.
    session->set_trace_file(trace_filename.c_str(), "e");

    // Run the job.
    create_file(job_filename,
                "*name empty\n"
                "*end file\n");
    session->set_job_file(job_filename);
    session->run();

    // Read the trace.
    auto trace = file_contents_split(trace_filename);

    // Check output.
    ASSERT_GE(trace.size(), 4);
    EXPECT_TRUE(starts_with(trace[0], "Dubna Simulator Version"));
    EXPECT_STREQ(trace[1].c_str(), "02010 R: 00 070 3002 *70 3002");
    EXPECT_STREQ(trace[2].c_str(), "      Drum 21 PhysRead [00000-00377] = Zone 1 Sector 2");
    EXPECT_STREQ(trace[trace.size() - 5].c_str(), "00427 L: 00 074 0000 *74");
}

//
// Run 'OKHO' example and check output.
//
TEST_F(dubna_session, okno)
{
    auto output = run_job_and_capture_output(R"(*name окно
*call ОКНО
*call ВОКНО
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_okno.expect");
    check_output(output, expect);
}

//
// Run *EDIT example and check output.
//
TEST_F(dubna_session, edit)
{
    auto output = run_job_and_capture_output(R"(*name Edit
*edit
*RO
*W:27001,2
Варкалось. Хливкие шорьки
Пырялись по наве,
И хрюкотали зелюки,
Как мюмзики в мове.
*EE
*
*edit
*R:270001
*LL
*EE
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_edit.expect");
    check_output(output, expect);
}

//
// Run *ASSEM example and check output.
//
TEST_F(dubna_session, assem)
{
    auto output = run_job_and_capture_output(R"(*name ассемблер
*assem
 program: ,name,
          ,*64 , inf64
          ,*74 ,
 inf64:   ,    , text
          ,    , text
          ,001 ,
         8,    ,
 text:    ,gost, 18h Hello, World!'214'
          ,gost, 6h'231'
          ,end ,
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_assem.expect");
    check_output(output, expect);
}

//
// Run *MADLEN example and check output.
//
TEST_F(dubna_session, madlen)
{
    auto output = run_job_and_capture_output(R"(*name мадлен
*madlen
 program: ,name,
          ,*64 , inf64
          ,*74 ,
 inf64:   ,    , text
          ,    , text
          ,001 ,
         8,    ,
 text:    ,gost, 18h Hello, World!'214'
          ,gost, 6h'231'
          ,end ,
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_madlen.expect");
    check_output(output, expect);
}

//
// Run *FORTRAN example and check output.
//
TEST_F(dubna_session, fortran)
{
    auto output = run_job_and_capture_output(R"(*name фортран
*fortran
        program hello
        print 1000
        stop
 1000   format('Hello, World!')
        end
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_fortran.expect");
    check_output(output, expect);
}

//
// Run *FTN example and check output.
//
TEST_F(dubna_session, ftn)
{
    auto output = run_job_and_capture_output(R"(*name фортран
*ftn
        program hello
        print 1000
        stop
 1000   format('Hello, World!')
        end
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_ftn.expect");
    check_output(output, expect);
}

//
// Run *ALGOL example and check output.
//
TEST_F(dubna_session, algol)
{
    auto output = run_job_and_capture_output(R"(*name aлгол
*algol
'begin'
    print(''Hello, World!'');
'end'
'eop'
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_algol.expect");
    check_output(output, expect);
}

//
// Run *PASCAL example and check output.
//
TEST_F(dubna_session, pascal)
{
    auto output = run_job_and_capture_output(R"(*name pascal
*pascal
program main (output);
_(
    writeln('Hello, World!');
_).
*execute
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_pascal.expect");
    check_output(output, expect);
}

//
// Run *LIBPUNCH example and check output.
//
TEST_F(dubna_session, libpunch)
{
    // See Mazny book, page 140.
    auto output = run_job_and_capture_output(R"(*name libpunch
*table:libpunch(print8)
*libpunch
*end file
)");
    auto expect = file_contents(TEST_DIR "/output_libpunch.expect");
    check_output(output, expect);
}

//
// Print real values from Fortran and check output.
// https://github.com/besm6/dubna/issues/1
//
TEST_F(dubna_session, epsilon)
{
    auto output = run_job_and_capture_output(R"(*name epsilon
*no list
      program eps
      real a
      a = 4020000000000010b
      print 1000, a, a
      a = 4020000000000004b
      print 1000, a, a
      a = 4020000000000002b
      print 1000, a, a
      a = 4020000000000001b
      print 1000, a, a
 1000 format(o17, f44.40)
      stop
      end
*no load list
*execute
*end file
)");
    // Split output into lines.
    auto lines = multiline_split(output);
    auto len = lines.size();
    ASSERT_GE(lines.size(), 8);

    //
    // This example shows bugs in floating-point formatted print of Fortran-Dubna.
    //

    // This line is OK.
    EXPECT_STREQ(lines[len-8].c_str(), " 4020000000000010 -0.9999999999927240423858165740966796875000");

    // Correct output would be: " 4020000000000004 -0.9999999999963620211929082870483398437500"
    EXPECT_STREQ(lines[len-7].c_str(), " 4020000000000004 -0.9999999999956344254314899444580078125000");

    // Correct output would be: " 4020000000000002 -0.9999999999981810105964541435241699218750"
    EXPECT_STREQ(lines[len-6].c_str(), " 4020000000000002 -0.9999999999970896169543266296386718750000");

    // Correct output would be: " 4020000000000001 -0.9999999999990905052982270717620849609375"
    EXPECT_STREQ(lines[len-5].c_str(), " 4020000000000001 -0.9999999999985448084771633148193359375000");
}

//
// Capture overflow.
// https://github.com/besm6/dubna/issues/2
//
TEST_F(dubna_session, overflow)
{
    auto output = run_job_and_capture_output(R"(*name overflow
*no list
*fortran
       program ovfl
       a = 1.0
       i = 0
       if (ifovfl(0) .eq. 1) goto 10
 20    a = a + a
       i = i + 1
       goto 20
 10    print 1000, i
 1000  format (i6)
       end
*no load list
*execute
*end file
)");
    // Split output into lines.
    auto lines = multiline_split(output);
    auto len = lines.size();
    ASSERT_GE(lines.size(), 5);

    EXPECT_STREQ(lines[len-5].c_str(), "    62");
}

//
// Capture division by zero.
//
TEST_F(dubna_session, divzero)
{
    auto output = run_job_and_capture_output(R"(*name divzero
*no list
*fortran
       program divz
       a = 123.4
       i = 0
       if (ifovfl(0) .eq. 1) goto 10
 20    a = a / i
       i = i + 1
       goto 20
 10    print 1000, a
 1000  format (f6.1)
       end
*no load list
*execute
*end file
)");
    // Split output into lines.
    auto lines = multiline_split(output);
    auto len = lines.size();
    ASSERT_GE(lines.size(), 5);

    EXPECT_STREQ(lines[len-5].c_str(), " 123.4");
}
