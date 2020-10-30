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

search_string_files_folder () {
  # Searchs for string ( regex ) in files ( wildcard ) in folder.
  STRING=$1
  FILES=$2

  if [ -z "$3" ]
    then
      FOLDER=$3
  else
      FOLDER=.
  fi
 
  find $FOLDER -name "$FILES" -type f -print0 | xargs -0 grep -Hn "$STRING"
}

# SEARCHING-FUNCTIONS ALIAS
alias ssff="search_string_files_folder"

