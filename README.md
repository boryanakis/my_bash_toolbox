# My Bash Toolbox

### Overview
This repository is used as an archive for bash commands/tricks that I use infrequently but every time I do, I have to google them. 

### Contents

1. Rename all files in a directory whose file names contain white spaces. 

```bash 
for f in *\ *; do mv "$f" "${f// /_}"; done
```
