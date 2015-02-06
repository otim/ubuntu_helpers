#!/bin/bash

# system monitor
sudo add-apt-repository ppa:indicator-multiload/stable-daily -y
sudo apt-get update


# some usefull packages
sudo apt-get install vim htop meld gitk git-cola indicator-multiload emacs terminator -y

# install some codecs
#sudo apt-get install libavformat-extra-53 libavcodec-extra-53 ubuntu-restricted-extras -y


# --- SET UP GIT ---

while true; do
    read -p "Do you wish to set up git? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# fancy bash coloring for git :)
sh -c 'echo "export GIT_PS1_SHOWDIRTYSTATE=1" >> ~/.bashrc'
echo "export PS1='\[\033[03;32m\]\u@\h\[\033[01;34m\]:\w\[\033[02;33m\]\$(__git_ps1)\[\033[01;34m\]\\$\[\033[00m\] '" >> ~/.bashrc


echo ""
read -p "your git user name (Full name)? " git_name
echo "$ git config --global user.name \"$git_name\""
git config --global user.name "$git_name"

echo ""
read -p "your git email? " git_email
echo "$ git config --global user.email "$git_email
git config --global user.email $git_email
echo ""

git config --global credential.helper cache
git config --global push.default current

git config --list

echo ""

echo "*** setting up ssh ***"
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "ssh key not found!"
    echo "generating one for you"
    echo "$ ssh-keygen"
    ssh-keygen
else
    echo "ssh public key found!"
fi
echo 


echo "$ cat ~/.ssh/id_rsa.pub"
cat ~/.ssh/id_rsa.pub
echo
read -p "Please copy your ssh public key to your github account" temp

