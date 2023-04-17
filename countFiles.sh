#!/bin/bash

# define a function to count files with each extension
function count_files {
    for file in "$1"/*; do
        if [ -f "$file" ]; then
            ext="${file##*.}"
            ((count["$ext"]++))
        elif [ -d "$file" ]; then
            count_files "$file"
        fi
    done
}

# initialize the count array

declare -A count  



# call the count_files function on the current directory
# call the count_files function on the current directory
count_files "."

# print the results
for ext in "${!count[@]}"; do
    echo "${ext}: ${count[$ext]}"
done
