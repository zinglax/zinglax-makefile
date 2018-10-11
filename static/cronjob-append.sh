#!/bin/bash
# CRONJOBS APPEND
# Appends the first argument (a file) to the bashrc

CRONJOBS=$(crontab -l) 
APPENDFILE=$1
STRING=$2

if [[ $CRONJOBS == *"$STRING"* ]];
then
    echo "Cron job is already there" 
else
    echo "crontab not found"
    # Create temp crontab file
    crontab -l > temp_crontabs
    # Add new cronjob code if not found
    cat $APPENDFILE >> temp_crontabs
    crontab temp_crontabs
    rm temp_crontabs
fi

echo "$(crontab -l)"
