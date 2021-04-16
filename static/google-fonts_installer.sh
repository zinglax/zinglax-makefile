#!/bin/bash
# Installs google fonts to system

#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#Z VARS ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
# Fonts Extension 
F_EXT="TTF" 

# Local Fonts Directory
LF_DIR=${HOME}/.local/share/fonts 

# Google Fonts URL 
GF_URL="https://github.com/google/fonts/archive/main.zip"

# Google Fonts Local ( Extracted ) Directory
GFL_DIR=${HOME}/.local/share/google-fonts 

# Google Fonts ( Local File ) Zip
GF_ZIP="${GFL_DIR}/google-fonts-master.zip" 

echo "Local Fonts Directory:\t\t${LF_DIR}"
echo "Google Fonts URL:\t\t${GF_URL}"
echo "Google Fonts Local Directory:\t${GFL_DIR}"
echo "Google Fonts Zip:\t\t${GF_ZIP}"

#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#Z STEPS ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
# Get Google Fonts Zip from URL
echo "Get Google Fonts Zip from URL"
curl -o ${GF_ZIP} ${GF_URL}

# Ensure Local Fonts Directoy Exists
echo "Ensure Local Fonts Directoy Exists"
if [ ! -d "$LF_DIR" ]; then
	echo "Creating local fonts dir"
	mkdir -p ${LF_DIR}
fi

# Ensure Google Fonts Local Directoy Exists
echo "Ensure Google Fonts Local Directoy Exists"
if [ ! -d "$GFL_DIR" ]; then
	echo "Creating local google fonts dir"
	mkdir -p ${GFL_DIR}
fi

# Empty Google Fonts Local Directoy
echo "Empty Google Fonts Local Directoy"
rm -rf ${GFL_DIR}/*

# Unzip Google Fonts Zip to Google Fonts Local Directoy 
echo "Unzip Google Fonts Zip to Google Fonts Local Directoy "
unzip ${GF_ZIP} -d ${GFL_DIR}

# Find ttf's and copy to Local Fonts Directory
echo "Find ttf's and copy to Local Fonts Directory"
find ${GFL_DIR} -name "*.ttf" -type f -exec /bin/cp {} ${LF_DIR} \;

# Cleanup Google Fonts Local Directoy
echo "Cleanup Google Fonts Local Directoy"
rm -rf ${GFL_DIR}

# Update Font Cache
echo "Update Font Cache"
fc-cache -fv

