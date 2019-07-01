# LUKS passphrase search

This repository contains a bash script that searches for a LUKS passphrase to unlock a given encrypted partition.

*Note: This script is limited to searching for numeric passphrases only.*

To search for a passphrase, pass the name of the encrypted partition and the length of the passphrase as arguments to the bash script.

```shell
$ . search-luks-passphrase <partition_name> <number_of_digits>
```

## Example 

To run a search of all four-digit numeric passphrases on the encrypted partition with name /dev/sda5, enter the following at the shell prompt.

```shell
$ . search-luks-passphrase.sh "/dev/sda5" 4
```

Text will then display in the terminal window of the form shown below.

```shell
Trying passphrase 0000
No key available with this passphrase

Trying passphrase 0001
No key available with this passphrase

...
Passphrase found: 4124
```

The message *Passphrase was not found* will be displayed if the search was unsuccessful.

To try this script 

* Boot to a Linux live CD/USB on a computer with a LUKS encrypted drive
* Clone this repository
* Review bash script `search-luks-passphrase.sh`
* Run script passing the partition name and the passphrase length as arguments 
