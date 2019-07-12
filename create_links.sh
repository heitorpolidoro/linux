#!/usr/bin/env bash

# Getting directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# hidden files
cd ${DIR}
cd home
echo "Creating symbolic links in ~/"
for file in $(ls -dp .[^.]* | grep -v /); do
    ln -sfv ${DIR}/home/${file} ~/${file}
done
cd -

echo "Creating symbolic link ~/bin"
ln -sfv ${DIR}/scripts ~/bin