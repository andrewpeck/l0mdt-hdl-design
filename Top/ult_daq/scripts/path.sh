#!/bin/bash

path="$1"

while [[ "$dir" != "Top" ]]
do
    path=$(dirname "$path")
    dir=$(basename "$path")
done

echo $(realpath --relative-to="$path" $1)
