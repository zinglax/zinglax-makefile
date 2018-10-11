
# WAL-THEME Color changes
cat ${HOME}/.cache/wal/sequences

# wal tty support
source ~/.cache/wal/colors-tty.sh

# Wal background and theme switcher
export WALLPAPER_IMAGES=${HOME}/Pictures/alena-aenami
export WALLPAPER_INTERVAL=300

# Start the wallpaper changer
WAL_COUNT=$(ps aux | grep wal-switcher -c)
if (( "$WAL_COUNT" > 1  ));
then
   echo "Wallpaper switcher already running"
else
  echo "Wallpaper switcher starting"
  bash ${HOME}/.wal-switcher.sh &
fi

