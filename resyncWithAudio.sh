#! /bin/bash

# I have arranged that my master files are shadowed to
# the github project with hard links in the github directories.
# However, after mreging branches, the link is broken.
# This re-establishes the link.
#
# Note, I'm not trying to version control my master files, only
# to version control the changes shadowed via git


function checkInode() {
  shadow=$1
  echo $shadow
  principal=$2
  inShadow=`stat --format=%i "${shadow}"` # return inode
  inPrincipal=`stat --format=%i "${principal}"`
  if [ $inShadow -ne $inPrincipal ] ; then
      echo "inodes don't match, fixing..."
      unlink "${shadow}"
      if [ $? -ne 0 ] ; then
        echo "unlink failed"
      fi
      # Must be in the directory to create a hard link
      cd "`dirname "${shadow}"`"
      if [ $? -ne 0 ] ; then
        echo "cd failed"
        exit 7
      fi
      echo "now in ${PWD}"
      ln "${principal}"
      if [ $? -ne 0 ] ; then
        echo "link failed"
        exit 8
      fi
  fi
}

cd ~/github/christmasMusic
for f in */*.ly; do
  local="./${f}"
  echo $f
  #echo $local
  master="/home/siddalp/audio/${f}"
  #echo $master
  diff "${local}" "${master}"
  if [ $? -ne 0 ] ; then
      echo "files do not match for ${local}"
  else
    echo "files match"
    checkInode "${local}" "${master}"
  fi
done
