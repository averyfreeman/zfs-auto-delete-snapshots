#!/bin/bash
#sudo su
echo "A list of your current snapshots:"
zfs list -t snapshot
echo "What dataset would you like to delete snapshots from?"
echo "(Enter all or part of name):"
read dataset
echo "would you like to delete from head (oldest) snapshots or from tail (newest)?"
echo "(type 'head' or 'tail')"
read direction
echo "Counting number of zfs snapshots..."
count=$(zfs list -t snapshot -o name | grep $dataset | wc -l)
echo "$count snapshots in selected dataset $dataset"
echo "will delete snapshots from $direction of $dataset"
echo "How many snapshots would you like to delete?"
read n
echo "Delete snapshots with dependencies? (DANGER: Might cause issues with other snapshots)"
echo "Enter '-R' if yes, or leave blank and hit enter for 'no'"
read Rflag
echo "OK, deleting $n snapshots from $dataset"
zfs list -t snapshot -o name | grep $dataset |  $direction -n $n | xargs -n 1 sudo zfs destroy $Rflag -vr
echo "All done!"