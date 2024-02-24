#!/usr/bin/env zsh

urlencode() {
    setopt localoptions extendedglob
    input=( ${(s::)1} )
    print ${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-])/%${(l:2::0:)$(([##16]#match))}}
}

gsearch() {
  if [ $1 ]
  then
    w3m "https://www.google.com/search?q=$(urlencode $1)"
  else
    echo "Please provide search string"
  fi
}
