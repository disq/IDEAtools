# IDEA tools #

## Description ##

`bin/getbytes.sh` will take a filename and a line/cursor position, and give a byte offset. It assumes that the files are saved with UNIX line endings. I've also opened an [issue](https://youtrack.jetbrains.com/issue/IDEA-165314) in the JetBrains issue tracker for byte-offset macros. If/when they are implemented, this repo will be unnecessary at its current state.

## Requirements ##

awk, bash.

## Install ##

Put `bin/getbytes.sh` in your path, or edit the `GETBYTES_SH` definition in `bin/goguru.sh`.


## Tools ##

### The Go Guru Invoker ###

#### Invoke any Guru command ####

To be able to invoke [Go Guru](http://golang.org/s/using-guru) from IntelliJ IDEA, configure external tool parameters like so:

|         Key | Value     |
|------------:|:----------|
|        Name | Guru ???  |
|     Program | /bin/bash |
|  Parameters | /path/to/goguru.sh $Prompt$ $FileName$ $SelectionStartLine$ $SelectionStartColumn$ $SelectionEndLine$ $SelectionEndColumn$ |
| Working Dir | $FileDir$ |

The configuration above will prompt you for a guru command (callees, callers, callstack, definition, freevars, describe, ... that kind of thing)

#### Invoke specific Guru commands ####

Alternately, you can create different external tool entries for different commands:

|         Key | Value          |
|------------:|:---------------|
|        Name | Guru Describe  |
|     Program | /bin/bash      |
|  Parameters | /path/to/goguru.sh describe $FileName$ $SelectionStartLine$ $SelectionStartColumn$ $SelectionEndLine$ $SelectionEndColumn$ |
| Working Dir | $FileDir$      |
