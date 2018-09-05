
NOW=$(date +"%Y-%m-%d-%H-%M-%S")
THEMES_FOLDER=/usr/share/themes
CURRENT_THEME=/etc/alternatives/current_theme.txt
NEW_THEME=/etc/alternatives/current_theme-$NOW.txt

echo $NOW
echo $CURRENT_THEME
echo $NEW_THEME

kernel="2.6.39"
distro="xyz"
cat > myconfig.conf <<EOL
line 1, ${kernel}
line 2, 
line 3, ${distro}
line 4 line
EOL

cat myconfig.conf
