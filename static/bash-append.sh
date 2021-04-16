#!/bin/bash
# BASHRC APPEND
# Appends the first argument (a file) to the bashrc

BASHRC="$HOME/.bashrc"
APPENDFILE=$1
STRING=$2

if grep -Fq "$STRING" $BASHRC
then
    echo "bash file already has this functionality" 
else
    # code if not found
    echo "" >> $BASHRC
    cat $APPENDFILE >> $BASHRC
fi


echo $BASHRC
. $BASHRC

