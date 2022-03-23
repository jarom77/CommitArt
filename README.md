# Github Commit Art Generator

This utility generates commit art on the contribution graphic on the user's Github homepage. It does so by committing a specified amount of times for a given day.

## Usage

There are two built-in ways to use this utility, `draw.sh` and `year.sh`. They must be called one of two ways, which are shown below.

`chmod 700 *.sh
./draw.sh`

or

`bash draw.sh`

> Instructions will be given below assuming the file has been made executable as in the first example.

### draw.sh

`./draw.sh [date]`

Commits the correct amount of times for the given date. If date is not provided, commits for today. As a precaution, changes still have to be pushed to remote manually, in case of accidental run.

### year.sh

`./year.sh`

No arguments need to be provided. The script will prompt the user for a year to populate with commits. There are two steps afterward to prevent accidental running. This script simply loops through the days in the given year and calls `draw.sh` on each day. Because of this, changes still have to be pushed to remote manually.

Created by Jarom Christensen
