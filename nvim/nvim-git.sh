#!/bin/bash
# Sets Git's default editor if vim is installed

if hash git 2>/dev/null; then               
        git config --global core.editor "nvim"
fi


