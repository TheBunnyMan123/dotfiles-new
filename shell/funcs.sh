#!/usr/bin/env zsh

urlencode() {
    setopt localoptions extendedglob
    input=( ${(s::)1} )
    print ${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-])/%${(l:2::0:)$(([##16]#match))}}
}

gsearch() {
  if [ $1 ]
  then
    w3m "https://www.google.com/search?q=$(urlencode $(sed 's/^"\(.*\)"$/\1/' <<<"$1"))"
  else
    echo "Please provide search string"
  fi
}

mvtotrash() {
  if [ $1 ]
  then
    mkdir ~/.trash &> /dev/null
    mv -v $1 "$HOME/$1 - $(date --iso-8601=ns)"
  else
    echo "Please provide file to delete"
  fi
}
