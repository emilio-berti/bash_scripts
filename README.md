# Less known bash features

To split output and error streams: 
`command 1> message.mssg 2> error.err`.

The tee pipe permits to save the output to a file *while* passing it to the next command: 
`command | tee message.log | wc -l`.

If you want to exit the shell when an error occurres *set* will do the trick: `set -e`.

If you want to run a child process that doesn't terminate when you exit the shell, use *nohup*: `nohup command`.

To remove with prompt files containing a string:
```bash
rm -i $(grep -l 'This file is obsolete' * )
```

## select

This is a built-in function that creates menus and perform operations on choices.

```bash
#!/bin/bash

if (( $# == 0 ))
then
  ext=".txt$"
elif (( $# > 1 ))
then
  printf "%b" "Error. Only one (optional) argument can be passed.\n"
  exit 1
else
  ext=$1
fi

cols=$(tput cols)
files="Exit $(ls | grep $ext)"
PS3='File to print? ' #select prompt
until [ "$file" == "Exit" ]
do
	printf "%b" "\a\nSelect a file to print:\n" >&2
	select file in $files
	do
		if [ "$file" == "Exit" ]
		then
			echo "Exiting..."
		break
		elif [ -n "$file" ]
		then
			cols=$(tput cols)
			printf "%b" "Printing $file...\n\n"
			for (( i=1 ; i < $cols; i++ )); do printf "%b" "=" ; done
                        printf "%b" "\b\n"
			head $file
			for (( i=1 ; i < $cols; i++ )); do printf "%b" "=" ; done
                        printf "%b" "\b\n"
			break #necessary to go back to menu
		else
			echo "Invalid selection!"
		fi
	done
done
```
The above will prompt a menu asking for a file to be _head_-ed.

## awk

awk is a complete programming language for string manipulation.

awk has a default variable *NF* that stores the number of fields (integer); *$NF* is instead the last field (string).

To print the *n* word in a line:
```bash
awk '{print $1}' < file.txt 
```
To reverse the words in a line:
```bash
awk '{for (i=NF; i>=0; i--) {printf "%s ", $i;} printf "\n"}' filename
```

awk can take a command that is ran at the beginning or at the end using the keywords *BEGIN* and *END*. For example, to count the sum of all sizes of files:
```bash
ls -l | awk '{sum += $5}; END {print sum}'
```

To skip a line of text depending on how it starts:
```bash
ls -l | awk '/^total/{next} {sum += 5}; END {print sum}'
```
This skip (*next*) every line that starts with 't-o-t-a-l', but execute the sum for every one else.

Print a paragraph with a keyphrase (paragraphs are separated by blank lines):
```bash
/keyphrase/ { flag=1 }
flag == 1 { print }
/^$/ { flag = 0 }
```
and `awk -f para.awk -v keyphrase < myfile`

## logic and arithmetic

Use *$(( ))* or *let* for arithmetic expressions:

`select` provides a way to select an element from a list:
```bash
select x in $(ls)
do
  echo "You selected '$x'"
done
```

```bash
COUNT=$((COUNT + 5**POW + MAX * 2))
let COUNT+='5+MAX*2'
```

# If conditions

General if elif else:

```bash
if ...
then
  ...
elif ...
then
  ...
else
  ...
fi
```

Condition statements:

```bash
if [ -d $DIR ] # $DIR is a directory
if [ -e $FILE ] # $FILE exists
if [ -z $VAR ] # $VAR is empty
if [ -n $VAR ] # $VAR has length > 0
if [ $str1 = $str2 ] # string $str1 is equal to string $str2
if [ $n1 -eq $n2 ] # number $n1 is equal to number $n2
if [ $n1 -ne $n2 ] # number $n1 is **not** equal to number $n2
if [ file1 -ot -file2 ] # file1 is older than file2
if [ file1 -nt -file2 ] # file1 is newer than file2
if [ -d $DIR -a -e $FILE ] # $DIR is a directory **and** (-a) $FILE exists
if [ -d $DIR -o -d $FILE ] # $DIR is a directory **or** (-o) $FILE is a directory
if [[ "${MYFILENAME}" == *.jpg ]] # pattern matching, requires two [[ ]]
```

# While loops

General while loop:

```bash
while (( COUNT < MAX ))
do 
  ...
  let COUNT++
done
```

# For loops

General for loop:
```bash
for (( i=0; i < 10; i++ ))
do
  ...
done
```

For floating values:
```bash
for float in $(seq 1.0 .01 1.1) ...
```

# gdrive (use at your own risk)
https://github.com/prasmussen/gdrive
