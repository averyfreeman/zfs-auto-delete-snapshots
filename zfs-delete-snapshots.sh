#!/bin/bash
#sudo su
printf "\nHere's list of your current snapshots:\n\n"
zfs list -t snapshot
printf "\nNote: hit ctrl-c at any time to abort this script\n"
printf "\nWhat dataset would you like to delete snapshots from?\n"
printf "(Enter all or part of name): "
read dataset
printf "\nwould you like to delete from head (oldest) snapshots or from tail (newest)?\n"
printf "(type 'head' or 'tail'): "
read direction
printf "\n *** will delete snapshots from $direction of $dataset *** \n"
printf "\nCounting number of zfs snapshots... "
count=$(zfs list -t snapshot -o name | grep $dataset | wc -l)
printf "$count snapshots in selected dataset $dataset\n"
printf "\nHow many snapshots would you like to delete?: "
read n
printf "\nDelete snapshots that provide dependencies?\n\n(DANGER: This might delete additional snapshots that were not explicitly specified, or create unpredictable behavior when restoring affected snapshots)\n\n"
printf "Type '-R' and hit enter for yes, or leave blank and hit enter for 'no': "
read Rflag
printf "\nOK, ** now deleting $n snapshots from $dataset ** \n"
zfs list -t snapshot -o name | grep $dataset |  $direction -n $n | xargs -n 1 sudo zfs destroy $Rflag -vr
printf "\nAll done!\n\n"