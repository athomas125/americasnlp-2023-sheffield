import argparse
import os

def remove_blank_lines(path1, path2, output_dir):
    # Create the output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Construct the output file paths
    output_path1 = os.path.join(output_dir, os.path.basename(path1))
    output_path2 = os.path.join(output_dir, os.path.basename(path2))

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

    output_dir = "data/post-processed/"

    remove_blank_lines(args.path1, args.path2, output_dir)

if __name__ == "__main__":
    main()