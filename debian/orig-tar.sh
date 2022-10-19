#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
TAR=../wsdl4j_$2.orig.tar.gz
DIR=wsdl4j-$2

# clean up the upstream tarball
unzip $3
mv wsdl4j-* $DIR
GZIP=--best tar -c -z -f $TAR $DIR
rm -rf $DIR $3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
