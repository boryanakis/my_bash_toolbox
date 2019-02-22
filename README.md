# My Bash Toolbox

### Overview
This repository is used as an archive for bash commands/tricks that I use infrequently but every time I do, I have to google them.

### Contents

1.  Rename all files in a directory whose file names contain white spaces.

``` bash
for f in *\ *; do mv "$f" "${f// /_}"; done
```

2.  Count the number of files in all subdirectories and print in ascending order

``` bash
for i in $(find . -maxdepth 1 ! -path . -type d); do echo -n $i": "; (find $i -type f | wc -l); done | sort -k 2 -n
```

3.  Rename/replace part of a filename. It can be used to replace extensions, or prefixes. The command structure is:  
    > rename `OLD_PATTERN` `NEW_PATTERN` `FILE(S)`


For example, when I want to replace the `.fastq` extension with `.fq`, I use this command:  

``` bash
rename .fastq .fq *.fastq
```

4.  Replace a string (`OLD`) with another string (`NEW`) in a file. `-i` means 'in-place', `s` is for 'substitution', and `g` means 'global'. [sed reference](http://www.grymoire.com/Unix/Sed.html)

``` bash
sed -i 's/OLD/NEW/g' file.txt
```

5.  Loop through a file. For some reason, the syntax of this one still seems weird and I have to google it most times just to verify that I have the right syntax.

Say that I want to loop through `shoppingList.txt`.

``` bash
while read line
do
  printf "${line}"
done < shoppingList.txt
```

6.  Filter the lines in one file (`big_list.txt`), and only keep lines for which a unique ID can be found in a second file (`filter.txt`). IMPORTANT: This won't work if the line endings are not Unix compatible.

``` bash
grep -Fwf filter.txt big_list.txt >> filtered_big_list.txt
```

7.  Get file size in human understandable unit. I used this in a script where I assign it to a variable so that it can be output later with other information.

``` bash
stat -c %s posfile | numfmt --to=si --suffix=B
```

8.  Print information to a tab-delimited file.

``` bash
printf "%s\t%s\n" "Data1" "Data2" >> filename.txt
```

9. Get a list of sequence headers from a FASTA file and delete the `>` character.

``` bash
grep "^>" dmel-all-chromosome-r6.25.CHR_ARMS.fasta | tr -d '>' >> scripts/b018_mpileup_ARRAY_input.txt
```
