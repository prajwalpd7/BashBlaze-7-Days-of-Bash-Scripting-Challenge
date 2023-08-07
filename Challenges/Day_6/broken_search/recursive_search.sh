#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2

if [ ! -d "$search_directory" ]; then
	echo "This directory is not present. Please enter an existing directory name."
	exit 0
fi

search(){
	local abs="$1"
	local t="$2"
	for i in "$abs"/*
	do
		if [ -f "$i" ] && [ "$(basename "$i")" = "$t" ]; then
			echo "Path of the file- $i"
		exit 1
		elif [ -d "$i" ]; then
			search "$i" "$t"
		fi
	done
		
}

abs_path=`cd "$search_directory" && pwd`
search "$abs_path" "$target_file"

echo "File $target_file not found"
