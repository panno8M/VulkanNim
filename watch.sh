#!/bin/sh
update_time() {
  echo `ls --full-time $1 | awk '{print $6"-"$7}'`
}
update_hash() {
  echo `openssl sha256 -r $1 | awk '{print $1}'`
}
if [ $# -ne 2 ]; then
  echo "Two augs is required.
  first: the target file
  second: the command executed when the target file is modified
  E.g.  $ ./watch.sh a.cpp 'g++ a.cpp && ./a.cpp'"
  exit 1
fi
if [ ! -f $1 ]; then
  echo "$1 is not exists! Give valid path."
  exit 1
fi

echo "Do the command:  $ $2
when the file: $1
is modified."

INTERVAL_SEC=1
last_time=`update_time $1`
last_hash=`update_hash $1`
while true; do
  sleep $INTERVAL_SEC
  current_time=`update_time $1`
  if [ $last_time != $current_time ] ; then
    current_hash=`update_hash $1`
    if [ $last_hash != $current_hash ] ; then
      echo "[WATCH DO] $1 was changed."
      last_time=$current_time
      last_hash=$current_hash
      eval $2
    fi
  fi
done