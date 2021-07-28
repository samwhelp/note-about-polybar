

################################################################################
### Head: Model polybarrc_profile_install
##

polybarrc_profile_install () {

	## $ polybarrc-ctrl install demo https://github.com/samwhelp/note-about-polybar.git

	local name="$1"
	local repo_url="$2"

	util_error_echo
	polybarrc_repo_clone "$name" "$repo_url"
	util_error_echo

}

##
### Tail: Model polybarrc_profile_install
################################################################################
