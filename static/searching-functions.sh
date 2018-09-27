# SEARCHING-FUNCTIONS
# Note must use full paths
search_folder_string () {
    grep -rnw "$1" -e "$2"
}

search_system_string () {
    sudo grep -rnw "/" -e "$1"
}

search_system_file () {
    sudo find "/" -name "$1" -type f
}

search_system_dir () {
    sudo find '/' -name '$1' -type d
}

