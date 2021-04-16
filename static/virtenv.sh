# VIRTENV
VIRTUAL_ENVS=$HOME/envs
virtevn () {

    if [ -d $VIRTUAL_ENVS ]   # for file "if [-f $HOME/file.txt]"
    then
        echo "Envs directory exists."
    else
        mkdir $VIRTUAL_ENVS
        echo "Envs directory created."
    fi

    if [ -d $VIRTUAL_ENVS/$1 ]
    then
        echo "$VIRTUAL_ENVS/$1 present"
    else
        echo "$VIRTUAL_ENVS/$1 not present"
        echo "$1 virtual environment probably doesn't exist creating it now"
        echo "Using Python3"
        virtualenv -p python3 $VIRTUAL_ENVS/$1
    fi

    echo "Deactivating any current virtual environments. "
    echo "(will error command not found if not in an env)"
    deactivate

    echo "Activating virtual environment -  $1"
    . $VIRTUAL_ENVS/$1/bin/activate

    if [ -z ${2+x} ]
    then
        echo "Requirements file not given."
    else
        echo "Requirements file given - $2"
        echo "Installing now"
        pip install -r $2
        echo "Done installing requirements"
    fi
}

