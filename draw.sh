#!/bin/bash
# Dec 29 2019 is a Sunday, and is the beginning reference
timezone=$(date +%z --date="$1")
secondsAfter=$[$(date +%s --date="$1") - $(date +%s --date="Dec 29, 2019 00:00 $timezone")]
((index=secondsAfter/60/60/24))
((row=index % 7))
((column=index / 7))
echo $row,$column
