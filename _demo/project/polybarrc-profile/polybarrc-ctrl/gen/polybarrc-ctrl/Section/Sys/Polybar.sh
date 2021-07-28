

################################################################################
### Head: Sys
##

is_polybarrc_dir () {

	local dir_path="$1"
	local polybarrc_file_path="$dir_path/$THE_POLYBARRC_FILE_NAME" ## ~/.config/polybarrc-profile/demo/polybar.conf

	if [ ! -f "$polybarrc_file_path" ]; then ## check ~/.config/polybarrc-profile/demo/polybar.conf
		return 1
	fi

	return 0
}

is_not_polybarrc_dir () {

	local dir_path="$1"
	local polybarrc_file_path="$dir_path/$THE_POLYBARRC_FILE_NAME" ## ~/.config/polybarrc-profile/demo/polybar.conf

	if [ -f "$polybarrc_file_path" ]; then ## check ~/.config/polybarrc-profile/demo/polybar.conf
		return 1
	fi

	return 0

}

polybarrc_find_dir_path_by_name () {
	local name="$1"
	echo "$THE_POLYBARRC_PROFILE_DIR_PATH/$name"
}


polybarrc_check_polybarrc_dir_exists () {

	local polybarrc_dir_name="$THE_POLYBARRC_DIR_NAME"
	local polybarrc_dir_path="$THE_POLYBARRC_DIR_PATH"

	if ! [ -a "$polybarrc_dir_path" ]; then ## file not exists
		return 0
	fi


	if [ -h "$polybarrc_dir_path" ]; then ## ~/.config/polybar is symbolic link
		return 0
	fi



	util_error_echo "## Dir is exists:" "$polybarrc_dir_path"
	util_error_echo

	util_error_echo "## Try to backup:"
	util_error_echo

	local now="$(date +%Y%m%d_%s)"
	local bak_dir_path="${HOME}/.backup/${polybarrc_dir_name}.bak"
	local bak_target_path="${bak_dir_path}/${polybarrc_dir_name}.bak.${now}"

	util_error_echo "mkdir -p ${bak_dir_path}"
	mkdir -p "${bak_dir_path}"


	util_error_echo "cp -a ${polybarrc_dir_path} ${bak_target_path}"
	cp -a "${polybarrc_dir_path}" "${bak_target_path}"

	if [ "$?" != "0" ]; then
		util_error_echo
		util_error_echo '## Backup Failure!'
		#exit 1
		return 1
	fi

	util_error_echo


	return 0
}


polybarrc_profile_init_dir () {

	if ! [ -d "$THE_POLYBARRC_PROFILE_DIR_PATH" ]; then
		##echo "$THE_POLYBARRC_PROFILE_DIR_PATH"
		mkdir -p "$THE_POLYBARRC_PROFILE_DIR_PATH"
	fi

	return 0
}


polybarrc_repo_clone () {

	## $ polybarrc-get demo

	local name="$1"
	local repo_url="$2"

	if [ "none$name" == 'none' ]; then
		name='default'
	fi

	util_error_echo "mkdir -p $THE_POLYBARRC_PROFILE_DIR_PATH"
	mkdir -p "$THE_POLYBARRC_PROFILE_DIR_PATH"

	util_error_echo "cd $THE_POLYBARRC_PROFILE_DIR_PATH"
	cd "$THE_POLYBARRC_PROFILE_DIR_PATH" ## cd ~/.local/share/polybarrc-profile


	if [ -d "$name" ]; then
		util_error_echo
		util_error_echo "## Is Exists:" "$THE_POLYBARRC_PROFILE_DIR_PATH/$name"
		return 0;
	fi

	util_error_echo "git clone --recursive $repo_url $name "
	git clone --recursive "$repo_url" "$name"  ## git clone --recursive https://github.com/conformal/polybar.git demo

	## $ man cd
	util_error_echo "cd $OLDPWD"
	cd "$OLDPWD"

}

##
### Tail: Sys
################################################################################
