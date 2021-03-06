#!/bin/sh

for dir in files downloads logs data;
do
  if ! [ -d $dir ]
    then echo "==> Creating $dir"
    mkdir $dir
  fi
done

if ! [ -f torrents.txt ]
  then echo "==> Creating torrents"
  touch torrents.txt
fi

if ! [ -f configs/config.json ]
  then echo "==> Copying configs"
  cp configs/config.default configs/config.json
  if [ ${#MASTER_KEY} -gt 0 ]
  then
    sed -i -e 's/MY_KEY/'$MASTER_KEY'/' configs/config.json
  fi
fi

sed -i -e 's/invitationKey/masterKey/' configs/config.json

mkdir files/folder
mkdir files/folder2
touch files/myimage.png
touch files/mymovie.avi
touch files/folder/randomstuff.txt
