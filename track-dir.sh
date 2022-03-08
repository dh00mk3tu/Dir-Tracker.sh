#! /bin/bash
# what_was_modified=$(git status -s | cut -c4- | cut -d' ' -f2-)
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)

set –o noclobber
echo "============================Auto Git============================"
echo "|| This script is now monitoring this current directory       ||"
echo "|| Enter the update interval between each push (Eg. 1 = 1 min)||"
echo "================================================================"
echo "-------------------"
read -p "Interval Time: " inter
echo "-------------------"
echo 
echo 
echo 
echo 
echo

while : 

do
    total_no_of_files_modified= echo "Number of Files Modified:" $(git status -s | grep -v "^M" | wc -l)
    what_was_modified= echo "All Modified Files: "$(git status -s | grep -v "^M")
    untracked_files= echo "Untracked Files :"$(git ls-files --others --exclude-standard)
    no_of_untracked_files= echo "Number of Untracked Files: "$(git status -s | grep -v "^??")

    echo "===================================" >> track-dir.md
    echo "|| Date: $date" >> track-dir.md
    echo "|| Time: $time" >> track-dir.md 
    echo "===================================" >> track-dir.md

    echo "===============================================================" >> track-dir.md
    echo "Number of Files Modified:"$(git status -s | grep -v "^M" | wc -l) >> track-dir.md
    echo "All Modified Files: "$(git status -s | grep -v "^M") >> track-dir.md
    echo "Untracked Files :"$(git ls-files --others --exclude-standard) >> track-dir.md
    echo "Number of Untracked Files: "$(git status -s | grep -v "^??") >> track-dir.md
    echo "===============================================================" >> track-dir.md
    echo 
    echo 
    d=$(($inter * 60));
    sleep $d;
done 

# cat track-dir.md