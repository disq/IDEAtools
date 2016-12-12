#!/usr/bin/env bash
if [[ $# -ne 3 ]]; then
    echo "Usage: $0 filename line col" 2>&2
    exit 1
fi
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
   echo "Error: line number must be numeric" >&2
   exit 1
fi
if ! [[ $3 =~ $re ]] ; then
   echo "Error: column number must be numeric" >&2
   exit 1
fi

awk $"BEGIN{RS=\"\\n\";FS=\"\"}{if (FNR==$2){print b+$3}else{b+=length(\$0)+1}}" $1 # | tee >(cat >&2)
