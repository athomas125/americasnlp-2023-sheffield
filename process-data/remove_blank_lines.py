import argparse
import os

def remove_blank_lines(path1, path2):

    # Construct the output file paths
    output_path1 = os.path.join(os.path.abspath(path1) + "_filtered")
    output_path2 = os.path.join(os.path.abspath(path2) + "_filtered")

    with open(path1, 'r', encoding='utf-8') as file1, open(path2, 'r', encoding='utf-8') as file2, \
         open(output_path1, 'w', encoding='utf-8') as out1, open(output_path2, 'w', encoding='utf-8') as out2:
        for line1, line2 in zip(file1, file2):
            if line1.strip() and line2.strip():  # Check if both lines are non-blank
                out1.write(line1)
                out2.write(line2)

def main():
    parser = argparse.ArgumentParser(description="Remove blank lines from parallel files")
    parser.add_argument('--path1', required=True, help="Path to the first file")
    parser.add_argument('--path2', required=True, help="Path to the second file")
    args = parser.parse_args()

    remove_blank_lines(args.path1, args.path2)

if __name__ == "__main__":
    main()