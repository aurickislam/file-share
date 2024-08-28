#!/bin/bash

HOST_URL="http://192.168.1.2:8089"

# declare a download function that takes a path as an argument
download() {
  # fetch directory path from file path
  dir=$(dirname $1)

  # create the directory if it doesn't exist
  mkdir -p $dir

  # download the file from the given path
  curl "$HOST_URL/$1" > $1
}

# call the download function with the given path
download src/file/path/file1.html
download src/file/path/file2.html
