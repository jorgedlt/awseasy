#!/usr/bin/env bash

# Install.sh - for awseasy

# my awseasy
echo; echo "${GREEN}" ~/.awseasy/awseasy "${YELLOW}"
echo rsync is broken
exit

# rsync -av --progress "$HOME/code/awseasy" "$HOME/.awseasy/" --exclude ".git"

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
