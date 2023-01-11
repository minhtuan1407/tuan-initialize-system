#!/bin/bash
source /etc/os-release
OS=$(echo $PRETTY_NAME | cut -d ' ' -f 1)
echo "------------------------------------------------------------------"
echo "           _       _     _                     _ _  _    ___ _____"
echo " _ __ ___ (_)_ __ | |__ | |_ _   _  __ _ _ __ / | || |  / _ \___  |"
echo "|  _   _ \| |  _ \|  _ \| __| | | |/ _  |  _ \| | || |_| | | | / /"
echo "| | | | | | | | | | | | | |_| |_| | (_| | | | | |__   _| |_| |/ /"
echo "|_| |_| |_|_|_| |_|_| |_|\__|\__,_|\__,_|_| |_|_|  |_|  \___//_/"
echo "Initalize system for $OS"
echo "---------------------------------------------------------------"

if [ $OS == "CentOS" ]
then
	yum update -y
	yum install vim git net-tools curl wget -y
fi

if [ $OS == "Debian" ] || [ $OS == "Ubuntu" ]
then
	apt-get update -y
	apt-get install vim git net-tools curl wget -y
fi

cat << EOF > ~/.vimrc
" use extended function of vim (no compatible with vi)
set nocompatible
" specify encoding
set encoding=euc-jp
" specify file encoding
set fileencodings=iso-2022-jp,sjis
" specify file formats
set fileformats=unix,dos
" take backup
" if not, specify [ set nobackup ]
set backup
" specify backup directory
set backupdir=~/backup
" take 50 search histories
set history=50
" ignore Case
set ignorecase
" distinct Capital if you mix it in search words
set smartcase
" highlights matched words
" if not, specify [ set nohlsearch ]
set hlsearch
" use incremental search
" if not, specify [ set noincsearch ]
set incsearch
" highlights parentheses
set showmatch
" show color display
" if not, specify [ syntax off ]
syntax on
" change colors for comments if it's set [ syntax on ]
highlight Comment ctermfg=LightCyan
" wrap lines
" if not, specify [ set nowrap ]
set wrap
EOF

mkdir -p ~/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4cQkd6WpzUn3stIOXdw7n2SowkONCptxCaprbiumnAOSuRzt4gMwiEK79lwN1T/U+18sZugKwtScnJsTf5JN4oYydY1JTW8J1iqJguQtquILPqOZkA/nRDj2KKorOuHXyiXNPYZxjUtBFdmgSLgXWCaaGGEPLc0OZ7C2S+yRsDEJigH+dkzVk60lm2PMRWWKVUtIt3tmukU6N7GIevcMz5nSZCbgyMZlReC/cYY8W426+NzHglhSY5vMLnpi8qrHc5MpGMXhQ+JW5PqxbGdWdIUbOeXfJ9TujN7reV+PW8rJIuoqZFteAp2Ns3AOgIVhj2IC9qrfnjCxZuLRa2JRwZ2Urf3qZ4y/mJmsE+jzkJI6emrz5XAI6D6ZMhPXVQkkcrre6IQ4o9dtNVpzgbgX6ZGP4NjtOufRUK6E1Xbm1w/H97FTqjVudirKIkgbLwXIQrylDhV7timqsW/bUjQ6Z5y9KGbvg/pTMQsYQqnbfE9n1ubxO3tAODCQpBuUJYQf6aPleKqWtHa5oTOlAbpFwDA4SplbkRAyRH4xyLw7Oy+0+j/OdJX7+VSkrr82ATfirpC87LbJ1Pa/FmTGDz2hxjdpKRqrR+ZcaZX8HlFP7YdwI4DQEqgQBk1/A2BovjAM5we2j/VUlAtF3Fl2VMlntVeM0mhMDl4YbNeIE2RfmfQ== minhtuan1407 personal key" >> ~/.ssh/authorized_keys
