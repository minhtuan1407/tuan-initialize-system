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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDO+MZH1AaNd1HZgtKPPjKnfPCiz9Nm9c4Ju1fGyMwN4dpXWEQ9yZc3F9Yg4jF5gPiDv8fmQhWRPVxCBv8GWV8+fbDWA4wEQ9fwo8sQPh4bV5QuwJrWcKDMZNTSUqql+izAFpMcv3r23j1TII3xE8Mydf3rsiaFJpISSccL9P2qmO/bVO+BOdMAeRrXpES6j379orhKA602R2OL5KqS7D+dPxMgTT88ssnk+ptr8TaZ0kvObK3osOZdwEXUG7xoiCVkm+c8QqMl27h5wskNTnPEpq1pO6L2p9tYGFiNqKKGXBpI7J7gojhAEmcLkkaWJf0IzjGeyD/lhWDtCvKtADxaNDlbmrKicz5gaiD9SBnbnrqwBGpDAgfzz0E12+xHj9N6YwQeOTbQBjkyw4pxjUqYZ3WICw60c6YPO8QgFrXgagP9RHtZItX3hjcFCbBJf/0nzr/TsM0cG7iYAbl70bsWxZNv1958gJj+/dQ5kjPpFIs8ybgTMZ14Xx3UNhEk9OTIK70qn6nyqQJHAtoC427P+oglEPBjjVCxH0X4WUWBKnGkhdTSzdQm+3BeY2xiTIVf0+T7PabRcaNiLHhEjKgdcv42Jn928IfLepxqtWPDdVw/TzQ4r2aQqqklkSMbl5M14rjxcJMH6XMqby4CLlTB8epoJps4pgbCXp6yCElKPQ== minhtuan1407 personal key" >> ~/.ssh/authorized_keys
