---
title: Cookbook
---


# A Cookbook of Shell Scripts - Wicked Shell Scripts, 2d Edition

You should browse the table of contents of [this book](https://nostarch.com/wcss2) and use the shell scripts contained within off the shelf if possible.  

- GitHub: https://github.com/hamelsmu/wicked_cool_shell_scripts_2e/
- Link to book on GitHub:  https://github.com/hamelsmu/wicked_cool_shell_scripts_2e/blob/master/WickedCoolShellScripts2E.pdf
- Book: https://nostarch.com/wcss2


# Things Learned From The Cookbook
In addition to just using the library of shell scripts,  I also learned the following bash tidbits from this book.


## `shift`  and `$#`  pop args off and count args
shift.sh
```sh
#!/bin/bash
while (( $# )); do
    echo "process args: $1"
    shift
done
```

Results in:

```
$ ./shift.sh foo bar bash                                                                             
process args: foo
process args: bar
process args: bash
```


### Using shift for CLI options:

```sh
#!/bin/bash
# newquota--A frontend to quota that works with full-word flags a la GNU

# quota has three possible flags, -g, -v, and -q, but this script
#   allows them to be '--group', '--verbose', and '--quiet' too:

flags=""
realquota="$(which quota)"

while [ $# -gt 0 ]
do
  case $1
  in
    --help)  echo "Usage: $0 [--group --verbose --quiet -gvq]" >&2
                       exit 1 ;;
    --group )  flags="$flags -g";       shift ;;
    --verbose)  flags="$flags -v";   shift ;;
    --quiet)  flags="$flags -q";       shift ;;
    --)  shift;           break ;;
    *)  break;          # done with 'while' loop!
  esac
done

exec $realquota $flags "$@"

```

## `$*` collect all arguments
shift2.sh
```sh
#!/bin/bash
for var in $*; do
    echo $var
done
``` 

Results in:

```
$ ./shift2.sh foo bar bash                                                                             
process args: foo
process args: bar
process args: bash
```


## Multi Option Case Statement
```sh
while read command args
do
  case $command
  in
    quit|exit) exit 0                                  ;;
    help|\?)   show_help                               ;;
    scale)     scale=$args                             ;;
    *)         scriptbc -p $scale "$command" "$args"  ;;
  esac

  /bin/echo -n "calc> "
done
```

### Another example of case statement

```sh
  case $1 in
    1 ) month="Jan"    ;;  2 ) month="Feb"    ;;
    3 ) month="Mar"    ;;  4 ) month="Apr"    ;;
    5 ) month="May"    ;;  6 ) month="Jun"    ;;
    7 ) month="Jul"    ;;  8 ) month="Aug"    ;;
    9 ) month="Sep"    ;;  10) month="Oct"    ;;
    11) month="Nov"    ;;  12) month="Dec"    ;;
    * ) echo "$0: Unknown numeric month value $1" >&2; exit 1
  esac
  return 0

```

## Collecting stdout with `-`

`echo "Enter something: " | cat -`

## Formatting Long Lines `fmt`
Will make lines no longer than 30 characters, not cutting off any words.

`fmt -w30 long_text.txt`


## IFS - Internal Field Seperator
Sets the internal delimiter

ifs_variable.sh
```sh
#!/bin/bash
IFS=":"
var='a:b-c~d'
for n in $var
do
    echo "$n"
done
```

Results in 

```
$ ./1/ifs_variable.sh
a
b-c~d
```

### IFS in Great Expectations Action

I'm using this in the [Great Expectations Action](https://github.com/superconductive/great_expectations_action) to parse a list of arguments given as a string to an input

```bash
# Loop through checkpoints
STATUS=0
IFS=','
for c in $INPUT_CHECKPOINTS;do
    echo ""
    echo "Validating Checkpoint: ${c}"
    if ! great_expectations checkpoint run $c; then
        STATUS=1
    fi
done
```

### IFS for iterating through $PATH

```sh
#!/bin/bash
IFS=":"
for directory in $PATH ; do
   echo $directory
done
```

### IFS: Double vs. Single Quotes 

With double quotes the outcome of the command expansion would be fed as one parameter to the source command. Without quotes it would be broken up into multiple parameters, depending on the value of IFS which contains space, TAB and newline by default.

```sh
var="some value"

# $var fed into cmd as one parameter
cmd "$var"

# $var is fed into cmd as two parameters
#  delimted by the default IFS character, space
cmd '$var'

```

## $RANDOM
`echo $RANDOM` will print out a random number

## Debugging Shell Scripts `-x`

Debug a script:

`bash -x myscript.sh`

OR, within a script:

```sh
set -x # start debugging
./myscript.sh
set +x # stop debugging
```

All variables will be substituted and lines that are run will be printed to screen, showing the control flow of the program

## Sourcing files with `. `

So you can "import" scripts

```sh
. myscript.sh
# is equivalent to
source myscript.sh
```

## Using functions to set exit codes

```sh

validAlphaNum()
{
  # Validate arg: returns 0 if all upper+lower+digits, 1 otherwise.
  # Remove all unacceptable chars.
  validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

  if [ "$validchars" = "$1" ] ; then
    return 0
  else
    return 1
  fi
}

exit validAlphaNum

```

## Know if someone running the script directly with  `$BASH_SOURCE`
The variable `$BASH_SOURCE` can let you differentiate between when a script is run standalone vs when its invoked from another script:

```sh
if [ "$BASH_SOURCE" = "$0" ]
```


## `xargs` 

https://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/

```sh
> echo 1 2 3 4 | xargs -n2 -I {} echo hello {} world                                                                                                                                                                                                                                                   
hello 1 2 world
hello 3 4 world

```