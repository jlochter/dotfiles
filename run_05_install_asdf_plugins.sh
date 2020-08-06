#!/bin/sh

. ./.env

# Add asdf plugins
while read plugin version
do
    asdf plugin list | grep $plugin > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        asdf plugin add $plugin
    fi
done < ~/.tool-versions

# Install asdf packages
asdf install
