#!/bin/bash

Suff='';
case $(uname -s) in
  Darwin)     Suff=m64g;        CompName=macbuild;   CompType=client;;
  Linux)      Suff=l64g;        CompName=brix-linux; CompType=client;;
esac

[ -z "$Suff" ] && {
  echo "Unsupported platform" >&2;
  exit 2;
}

Exec="$(dirname "$0")/synergy-core-${Suff}";

CommandLine='';
HostName='';

while [[ $# -gt 0 ]]; do
  case "$1" in
    -*) CommandLine="${CommandLine} $1";
	    ;;
    *) HostName="$1"
	    ;;
  esac
  shift;
done

[ -z "${CommandLine}" ] && CommandLine="-1 -f -d DEBUG -n macbuild";

[ -z "$HostName" ] && HostName="sergeyu-pc.local";

until ping -c3 "$HostName"; do
  echo "Host '$HostName' not found";
  sleep 5;
done

echo "${Exec}" ${CompType} ${CommandLine} "${HostName}";
exec "${Exec}" ${CompType} ${CommandLine} "${HostName}";

