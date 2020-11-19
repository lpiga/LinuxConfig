#!/usr/local/bin/python3
import os
import sys
from run import *

def valid_range(f, curr_line, selected_lines_array):
    line_count = curr_line
    for sel_line in selected_lines_array[1:]:
        sel_line = sel_line.strip()
        line = f.readline().strip()
        line_count += 1
        if line != sel_line:
            return curr_line, line_count, False
    return curr_line, line_count, True

def find_region_of_interest(filename, cursor_line, selected_text):
    selected_lines_array=selected_text.split("\n")
    with open(filename) as f:
        line_count = 0
        possible_range_start = [cursor_line - len(selected_lines_array) + 1,
                                cursor_line,]
        if selected_lines_array[-1].strip() == "":
            selected_lines_array = selected_lines_array[:-1]

        while True:
            line = f.readline()
            line_count += 1
            if line_count in possible_range_start:
                if line.find(selected_lines_array[0].strip()) < 0:
                    continue
                start, end, valid = valid_range(f, line_count,
                                                selected_lines_array)
                if valid:
                    return start, end
                line_count = end
            if line_count > possible_range_start[1] + len(selected_lines_array):
                return -1, -1 # Not found

def main():
    if len(sys.argv) != 4:
        sys.exit(1)
    filename=sys.argv[1]
    line_number=int(sys.argv[2])
    selected_text=sys.argv[3]

    basename, file_extension = os.path.splitext(filename)
    if file_extension.lower() not in [".h", ".hpp", ".c", ".cpp"]:
        print("Invalid file type")
        sys.exit(1)

    start, end = find_region_of_interest(filename, line_number, selected_text)
    args = ["clang-format",
            "-lines={:d}:{:d}".format(start, end),
            filename]
    cmd = run_cmd(args, False)
    with open(filename, "wb") as f:
        f.write(cmd.stdout)
    return 0

if __name__ == "__main__":
    main()
