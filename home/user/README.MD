# Linux Snippets

## .inputrc

### Auto complete command

Use Arrow up and down to auto complete partial bash command line

## .bashrc

### Svn make diff dump "diff"

Usages : \
```$ diff <commit_number>```\
Return a dump containing changes between <commit_number> and HEAD

```$ diff <commit_number_start>:<commit_number_end>```\
Return a dump containing changes between <commit_number_start> and <commit_number_end>

Dump are saved in `/home/<user>/diff_dd-mm-yy_hh:mm:ss`

### replacement of timestamps by datetime in "ls" bash command listing

Usage : \
```$ python3 ls_time.py [ls_args]```\
Work as ls, but replacing timestamp (seconds and micro) by human readable datetime

Usages with .bashrc alias :\
```$lt -l```\
```$lt -alh /path/to/```

