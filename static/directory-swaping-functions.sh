# DIRECTORY-SWAPING-ALIAS 
alias pd="pushd ."
alias ppd="popd"
alias ddd="dirs -v"
p() {
	# Function for p alias,  takes the first argument as a 
	# number corresponding to a folder in dirs -v 
	# then directs it to cd command using tilde notation.
	cd ~"$1"
}

