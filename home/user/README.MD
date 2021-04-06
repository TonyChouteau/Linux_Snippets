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
