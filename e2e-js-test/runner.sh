#!/bin/sh

code=0
testfile=$1
files=$testfile

if [ -z $testfile ]
then
  files=$(ls *_test.js)
fi

for test in $files
do
#  node test_helper.js
  casperjs test $test
  ret=$?
  if [ ! $ret == "0" ]; then code=1; fi
done

exit $code
