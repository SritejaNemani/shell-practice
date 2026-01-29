#!/bin/bash

starttime=$(date)
starttime_sec=$(date +%s)

echo "Script started at $starttime"
echo "Script started at $starttime_sec seconds" #This is a numeric value

sleep 10

endtime=$(date)
endtime_sec=$(date +%s)

echo "Script end at $endtime"
echo "Script end at $endtime_sec seconds" #This is a numeric value

 total_time=(($endtime_sec - $starttime_sec))
echo "Total script rum time is $total_time"