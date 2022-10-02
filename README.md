# Less known bash features

To split output and error streams: 
`command 1> message.mssg 2> error.err`.

The tee pipe permits to save the output to a file *while* passing it to the next command: 
`command | tee message.log | wc -l`.

If you want to exit the shell when an error occurres *set* will do the trick: `set -e`.

If you want to run a child process that doesn't terminate when you exit the shell, use *nohup*: `nohup command`.

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
