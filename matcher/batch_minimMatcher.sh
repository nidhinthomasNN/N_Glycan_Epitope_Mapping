#!/bin/bash

# Set the directory path
dir="./"

# Use the find command to list all .pdb files in the directory
find $dir -name "*CSTFILE_1.pdb" > pdb_files_for_min.txt

# Print a message to the user
echo "List of .pdb files generated in the file pdb_files_for_min.txt"

split -l 50 pdb_files_for_min.txt file_ --additional-suffix=.txt && for f in file_*; do mv "$f" "pdb_file_min_split_$((++i)).txt"; done

for file in pdb_file_min_split_*.txt; do sbatch minimMatcher.sh ${file}; done
