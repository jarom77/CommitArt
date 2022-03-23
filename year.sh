#!/bin/bash

# move to containing directory
cd $(dirname "$0")

# read in year from user
echo Enter year to populate:
read year

# set start date as Jan 1 {year} at 2:00 am to avoid DST problems
startDate=$(date +%s --date="Jan 1 $year")
((startDate=startDate+3600*2))

# confirmation messages
echo "Make sure you are on the master branch [ENTER]"
read null

echo "Are you sure you want to populate the whole year? (type YES)"
echo "This is basically irreversable....."
read answer
[ "$answer" != "YES" ] && exit

# runs draw.sh for each start date, shifting by i days each time
for i in {0..365}
do
	bash draw.sh "@$[$startDate+$i*24*3600]"
done
