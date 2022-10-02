# bash_scripts

To split output and error streams: 
`command 1> message.mssg 2> error.err`.

The tee pipe permits to save the output to a file *while* passing it to the next command: 
`command | tee message.log | wc -l`.

If you want to exit the shell when an error occurres *set* will do the trick: `set -e`.

If you want to run a child process that doesn't terminate when you exit the shell, use *nohup*: `nohup command`.

chapter 2 finished

## Link to gdrive
https://github.com/prasmussen/gdrive
