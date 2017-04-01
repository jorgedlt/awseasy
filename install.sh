#!/usr/bin/env bash

# Install.sh - for awseasy

# my awseasy
echo; echo "${GREEN}" ~/.awseasy/awseasy "${YELLOW}"

# rsync is broken
# rsync -av --progress "$HOME/code/awseasy" "$HOME/.awseasy/" --exclude ".git"

##
# cd ~/code/awseasy
/bin/cp -f \
 ~/code/awseasy/* \
 $HOME/.awseasy

# cd ~/.awseasy
rm -fr ~/.awseasy/.git \
       ~/.awseasy/.DS* \
       ~/.awseasy/README.md \
       ~/.awseasy/contributors.txt \
       ~/.awseasy/future-features \
       ~/.awseasy/install.sh \
       ~/.awseasy/insync.sh

# now that I got rid of .bash-functions within this repo as redodant, add something to the code of 
# this script to ensure that the .bashrc and .bash-func.sh include ${COLORS} and other needed functions

echo; echo "${GREEN}"REPO Files "${YELLOW}"
ls -la  "$HOME/code/awseasy/"

echo; echo "${GREEN}" In Situ Files "${YELLOW}"
ls -la  "$HOME/.awseasy/"

echo "${RESET}"

# .bashrc
 [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc" || :

# Basic Functions
 [ -f "$HOME/.bash-func.sh" ] && source "$HOME/.bash-func.sh" || :

# AWS Credentials
 [ -f "$HOME/.awseasy/awseasy" ] && source "$HOME/.awseasy/awseasy" || :
 [ -f "$HOME/.aws-keys" ] && source "$HOME/.aws-keys" || :

exit
