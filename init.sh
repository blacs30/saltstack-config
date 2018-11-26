#!/usr/bin/env bash
HOMEDIR=$HOME
USERNAME=$(whoami)

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

# Are we on OSX and do we need homebrew?
command -v brew > /dev/null 2>&1
if [ $? -ne 0 ];
then
	echo "Homebrew not found. Installing ..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install git lfs
brew install git-lfs
git lfs install
git lfs fetch
git lfs pull

# Do we need to install SaltStack?
command -v salt-call > /dev/null 2>&1
if [ $? -ne 0 ];
then
	echo "SaltStack not found. Installing ..."
	brew install saltstack
fi

# Ask if the highstate should be applied
printf '%s ' 'Do you want to run highstate now? (y/n)'
read answer
if [ "$answer" = "y" ];
then
    echo "Running highstate now. This will take some minutes."
    $USE_SUDO salt-call --local --config=~/saltstack-config state.highstate
fi
