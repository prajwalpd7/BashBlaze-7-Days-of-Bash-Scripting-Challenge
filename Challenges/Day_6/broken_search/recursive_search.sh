#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2
if [[ ! -d $search_directory ]];then
	echo "Search directory not found"
	exit 1
fi

# TODO: Implement the recursive search logic here

path=$(find "$search_directory" -name "$target_file" 2>/dev/null)
if [[ -n $path ]];then
	for line in $path;do
		echo "$line"
	done
else
	echo "File not found: $target_file"
fi

exit 1
