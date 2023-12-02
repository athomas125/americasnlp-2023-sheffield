import os
import shutil

def move_files_with_substring(source_dir, dest_dir, substring):
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if substring in file:
                source_file_path = os.path.join(root, file)
                
                # Construct the destination file path
                relative_path = os.path.relpath(root, source_dir)
                dest_file_path = os.path.join(dest_dir, relative_path, file)
                
                # Create the destination directory if it doesn't exist
                os.makedirs(os.path.dirname(dest_file_path), exist_ok=True)
                
                # Copy the file
                shutil.copy2(source_file_path, dest_file_path)

                # Optionally, uncomment the next line to delete the original file
                # os.remove(source_file_path)

# Example usage
file_location = os.path.dirname(__file__)
source_directory = file_location + '../../data'
destination_directory = file_location + '../../data/filtered-data'
substring = 'filtered'

move_files_with_substring(source_directory, destination_directory, substring)
