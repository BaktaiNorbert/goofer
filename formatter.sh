#!/bin/bash

response=$(jq '.response' '/home/szarka/Programs/spritepanel/output.txt')
clean_response="${response:1:-1}"
echo $clean_response > /home/szarka/Programs/spritepanel/output_clean.txt