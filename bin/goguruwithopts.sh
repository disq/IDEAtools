#!/usr/bin/env bash

GETBYTES_SH=getbytes.sh

if [[ $# -lt 6 ]]; then
    echo "Usage: $0 guru-command filename line col line col [guru-opts]" 2>&2
    exit 1
fi
re='^[0-9]+$'

CMD=$1; shift
FN=$1; shift
LN1=$1; shift
CN1=$1; shift
LN2=$1; shift
CN2=$1; shift

if ! [[ $LN1 =~ $re ]] ; then
   echo "Error: line number must be numeric" >&2
   exit 1
fi
if ! [[ $CN1 =~ $re ]] ; then
   echo "Error: column number must be numeric" >&2
   exit 1
fi
POS=$(${GETBYTES_SH} $FN $LN1 $CN1)

if ! [[ $LN2 =~ $re ]] ; then
   echo "Error: end line number must be numeric" >&2
   exit 1
fi
if ! [[ $CN2 =~ $re ]] ; then
   echo "Error: end column number must be numeric" >&2
   exit 1
fi

POS=${POS},\#$(${GETBYTES_SH} $FN $LN2 $CN2)

$GOPATH/bin/guru "$@" $CMD $FN:\#$POS
