#!/bin/bash
echo Enter year to populate:
read year
startDate=$(date +%s --date="Jan 1 $year")
((startDate=startDate+3600*2))

echo "Make sure you are on the master branch [ENTER]"
read null

echo "Are you sure you want to populate the whole year? (type YES)"
echo "This is basically irreversable....."
read answer
[ "$answer" != "YES" ] && exit

for i in {0..365}
do
	./draw.sh "@$[$startDate+$i*24*3600]"
done
