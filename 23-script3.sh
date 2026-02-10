#!/bin/bash

country=canada

echo " I live in $country"
echo " PID of the script is $$"

source ./21-script1.sh #running other script inside this script using source
source ./22-script1.sh