#!/usr/bin/env bash

GETBYTES_SH=getbytes.sh

if [[ $# -ne 4 && $# -ne 6 ]]; then
    echo "Usage: $0 guru-command filename line col [line col]" 2>&2
    exit 1
fi
re='^[0-9]+$'
if ! [[ $3 =~ $re ]] ; then
   echo "Error: line number must be numeric" >&2
   exit 1
fi
if ! [[ $4 =~ $re ]] ; then
   echo "Error: column number must be numeric" >&2
   exit 1
fi
POS=$(${GETBYTES_SH} $2 $3 $4)

if [[ $# == 6 ]]; then
    if ! [[ $5 =~ $re ]] ; then
       echo "Error: end line number must be numeric" >&2
       exit 1
    fi
    if ! [[ $6 =~ $re ]] ; then
       echo "Error: end column number must be numeric" >&2
       exit 1
    fi

    POS=${POS},\#$(${GETBYTES_SH} $2 $5 $6)
fi

$GOPATH/bin/guru $1 $2:\#$POS
