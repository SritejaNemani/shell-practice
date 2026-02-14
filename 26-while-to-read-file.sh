#!/bin/bash

while IFS= read -r line; 
do  
    echo "$line" #prints line by line - process each line
done < 21-script1.sh #input file to read
