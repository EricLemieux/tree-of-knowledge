# Tee

Read from stdin and write to both stdout and a file.

## Example

One quick use case is log the output of a long-running script that you want to watch,
that way you can watch your script in real time as well as keep the log for analysis later.

```shell script
./some_long_running_script.sh | tee log.txt
```
