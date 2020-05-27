#!/usr/bin/env bash

# Getting directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# hidden files
cd ${DIR}

echo "Creating symbolic links in ~/"
cd home
for file in $(ls -dp .[^.]* | grep -v /); do
    ln -sfv ${DIR}/home/${file} ~/${file}
done
cd - 1> /dev/null

echo "Creating symbolic link ~/bin"
ln -sfv ${DIR}/scripts ~/bin

echo "Creating symbolic links for config"
cd config
# shellcheck disable=SC2045
for dir in $(ls); do
    ln -sfv ${DIR}/config/${dir} ~/.config/${dir}
done