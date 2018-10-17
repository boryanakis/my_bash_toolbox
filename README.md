# My Bash Toolbox

### Overview
This repository is used as an archive for bash commands/tricks that I use infrequently but every time I do, I have to google them.

### Contents

1. Rename all files in a directory whose file names contain white spaces.

```bash
for f in *\ *; do mv "$f" "${f// /_}"; done
```

2. Count the number of files in all subdirectories and print in ascending order

```bash
for i in $(find . -maxdepth 1 ! -path . -type d); do echo -n $i": "; (find $i -type f | wc -l); done | sort -k 2 -n
```

3. Rename/replace part of a filename. It can be used to replace extensions, or prefixes. The command structure is:  
> rename `OLD_PATTERN` `NEW_PATTERN` `FILE(S)`


For example, when I want to replace the `.fastq` extension with `.fq`, I use this command:  

```bash
rename .fastq .fq *.fastq
```
