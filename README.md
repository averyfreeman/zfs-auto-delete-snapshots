# zfs auto delete snapshots

### Bash script to delete zfs snapshots easily

Simply clone this repo and type `./zfs-delete-snapshots.sh` to get started

Example output:

```
$ ./zfs-snapshot-delete.sh
A list of your current snapshots:
NAME                                                               USED  AVAIL     REFER  MOUNTPOINT
bpool/BOOT/ubuntu_dupcpc@autozsys_gsgkzx                          84.8M      -      188M  -
bpool/BOOT/ubuntu_yg6r3d@autozsys_ehdils                             8K      -      187M  -
rpool/ROOT/ubuntu_dupcpc@autozsys_gsgkzx                           308M      -     9.70G  -

. . .

rpool/ROOT/ubuntu_yg6r3d/var/www@autozsys_ehdils                     0B      -       96K  -
What dataset would you like to delete snapshots from?
(Enter all or part of name):
rpool
would you like to delete from head (oldest) snapshots or from tail (newest)?
(type 'head' or 'tail')
head
Counting number of zfs snapshots...
32 snapshots in selected dataset rpool
will delete snapshots from head of rpool
How many snapshots would you like to delete?
10
Delete snapshots with dependencies? (DANGER: Might cause issues with other snapshots)
Enter '-R' if yes, or hit enter for 'no'
-R
OK, deleting 10 snapshots from rpool
will destroy rpool/ROOT/ubuntu_dupcpc@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/usr@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/usr/local@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/srv@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var/snap@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var/www@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var/lib@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var/lib/dpkg@autozsys_gsgkzx
will destroy rpool/ROOT/ubuntu_dupcpc/var/lib/AccountsService@autozsys_gsgkzx
All done!

```

Note: -R will delete dependent snapshots - use with caution! I recommend only using it if you are comfortable potentially deleting all your system snapshots.

(dependent snapshots are usually automatically created by the system, e.g. by zsys / autozsys - does not typically apply to user folder(s))
