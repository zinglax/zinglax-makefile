#!/bin/sh


###############################################################################
#### VARS
###############################################################################
NOW=$(date +"%Y-%m-%d-%H-%M-%S")
THEMES_FOLDER=/usr/share/themes
CURRENT_THEME=/etc/alternatives/current_theme.txt
NEW_THEME=/etc/alternatives/current_theme-$NOW.txt


###############################################################################
#### DEFAULT THEME 
###############################################################################
COLOR_1=f07746
COLOR_2=ffffff
COLOR_3=000000


###############################################################################
#### NEW THEME 
###############################################################################
NEW_COLOR_1=bada55
NEW_COLOR_2=ffffff
NEW_COLOR_3=000000



# Read the current theme file
if [ -e $CURRENT_THEME ]
then
    echo "Current theme file detected!"
    source $CURRENT_THEME
else
    echo "No Current theme file detected."
    echo "Assuming Default theme."
fi


#   # Modify the themes folder to have the desired theme colors. 
#   sudo find $THEMES_FOLDER -name "*.*" -type f -exec sed -i -e "s/$COLOR_1/$NEW_COLOR_1/g" -- {} +
#   
#   
#   # Modify the gdm3.css
#   
#   # Backup the current gdm3.css theme. 
#   sudo cp /etc/alternatives/gdm3.css /etc/alternatives/gdm3.css.bakup.$NOW



# Create the current theme file
cat > $NEW_THEME <<EOL
#!/bin/sh
LAST_MODIFIED=${NOW}
COLOR_1=${NEW_COLOR_1}
COLOR_2=${NEW_COLOR_2}
COLOR_3=${NEW_COLOR_3}
EOL

echo "The New Theme is now $NEW_THEME"
echo "It contains the following colors"
cat $NEW_THEME


