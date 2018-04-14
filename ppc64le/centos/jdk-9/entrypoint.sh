#!/usr/bin/env bash

message()
{
    TITLE="Cannot start Robot"
    echo "ERROR: $TITLE\n$1"
}

JAR_FILE=application.jar

GREP=`which egrep`
CAT=`which cat`

VM_OPTIONS_FILE=start.vmoptions
VM_OPTIONS=""
PROG_ARG=""
JAR_URL=""

for opt in ${@}; do
  case ${opt} in
    -ju=*|--jar_url=*)
      JAR_URL="${opt#*=}"
      shift
    ;;
  esac
done

if [ ! -r ${JAR_FILE} ]; then
  curl -o ${JAR_FILE} ${JAR_URL}
fi

if [ -r ${VM_OPTIONS_FILE} ]; then
  VM_OPTIONS=`${CAT} ${VM_OPTIONS_FILE} | ${GREP} -v "^#.*"`
else
  message "Cannot find VM options file"
fi

java ${JAVA_OPTS} ${VM_OPTIONS} -jar ${JAR_FILE} ${@}