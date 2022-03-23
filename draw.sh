#!/bin/bash

# determine row and column from index
# Dec 29 2019 is a Sunday, and is the beginning reference
timezone=$(date +%z --date="$1")
secondsAfter=$[$(date +%s --date="$1") - $(date +%s --date="Dec 29, 2019 00:00 $timezone")]
((index=secondsAfter/60/60/24))
((row=index % 7))
((column=index / 7))

# determine index of pattern list; determines slope by region:
# +----+----+     +---+---+ 
# | 1  | -1 |     | / | \ | 
# +----+----+ ->  +---+---+ 
# | -1 | 1  |     | \ | / | 
# +----+----+     +---+---+ 
# This creates a diamond structure
listIndex=
if [ $[$column % 12 / 6] -eq $[$row / 4] ]; then
	((listIndex=column+row))
else
	((listIndex=column-row))
fi

# pattern is repeated infinitely and indexed by listIndex
pattern=123432
length=6
((listIndex=(listIndex+length)%length+1))
fillIndex=$(echo $pattern | head -c $listIndex | tail -c +$listIndex)

# commit fillIndex times on given date
count=0
while [ $count -lt $fillIndex ]
do
	((count=count+1))
	# create empty commits on given date
	git commit --allow-empty --date="$1" -m "Commit Art"
done
