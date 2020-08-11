# zfs auto delete snapshots

### Bash script to delete zfs snapshots easily

Simply clone this repo and type `./zfs-delete-snapshots.sh` to get started

Example output:

```
$ ./zfs-delete-snapshots.sh

Here's list of your current snapshots:

NAME                                          USED  AVAIL     REFER  MOUNTPOINT
rpool/USERDATA/avery_7qtbuj@autozsys_0jki6y  17.8M      -     73.6G  -
rpool/USERDATA/avery_7qtbuj@autozsys_4ukybs  11.6M      -     73.6G  -
rpool/USERDATA/avery_7qtbuj@autozsys_dmpldh  5.95M      -     73.5G  -
rpool/USERDATA/root_7qtbuj@autozsys_0jki6y      0B      -     79.5M  -

Note: hit ctrl-c at any time to abort this script

What dataset would you like to delete snapshots from?
(Enter all or part of name): rpool

would you like to delete from head (oldest) snapshots or from tail (newest)?
(type 'head' or 'tail'): head

 *** will delete snapshots from head of rpool ***

Counting number of zfs snapshots... 4 snapshots in selected dataset rpool

How many snapshots would you like to delete?: 4

Delete snapshots that provide dependencies?

(DANGER: This might delete additional snapshots that were not explicitly specified, or create unpredictable behavior when restoring affected snapshots)

Type '-R' and hit enter for yes, or leave blank and hit enter for 'no': -R

OK, ** now deleting 4 snapshots from rpool **
[sudo] password for avery:
will destroy rpool/USERDATA/avery_7qtbuj@autozsys_0jki6y
will reclaim 17.8M
will destroy rpool/USERDATA/avery_7qtbuj@autozsys_4ukybs
will reclaim 264M
will destroy rpool/USERDATA/avery_7qtbuj@autozsys_dmpldh
will reclaim 29.7M
will destroy rpool/USERDATA/root_7qtbuj@autozsys_0jki6y
will reclaim 0B

All done!


```

Notes about dependent snapshots and potential errors:

-The '-R' flag will delete snapshots that other snapshots depend on - use with caution! I recommend only using it if you are comfortable potentially deleting all your system snapshots.

-Sometimes you'll see a message like `could not find any snapshots to destroy; check snapshot names.` This means that the snapshot with that name was a dependent snapshot and has already been deleted.

(dependent snapshots are usually automatically created by the system, e.g. by zsys / autozsys - does not typically apply to user folder(s))
