# ESLINT-HELPERS
#  Commands to make eslint quicker & easier

jl () {
    # Calls eslint using the development config
    eslint -c ${HOME}/.eslint/conf/eslint.dev.conf.json $1
}


jlp () {
    # Calls eslint using the development config
    eslint -c ${HOME}/.eslint/conf/eslint.prod.conf.json $1
}


jlf () {
    # Calls eslint using the development config & fixes issues
    eslint -c ${HOME}/.eslint/conf/eslint.conf.json $1 --fix
}

jlwat () {
    # Watches jl command 
    watch -n $1 jl $2 
}

jlpwat () {
    # Watches jl command 
    watch -n $1 jlp $2 
}



