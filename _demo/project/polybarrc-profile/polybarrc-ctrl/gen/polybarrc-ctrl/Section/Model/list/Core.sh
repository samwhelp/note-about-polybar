

################################################################################
### Head: Model mod_polybarrc_profile_list
##



mod_polybarrc_profile_list () {
	#echo "mod_polybarrc_profile_list"
	#echo "$@"

	# polybarrc-ctrl list

	local name=''
	local dir_path=''

	polybarrc_profile_init_dir

	cd "$THE_POLYBARRC_PROFILE_DIR_PATH"

	## for name in $(ls ./ -1); do
	for name in *; do
		dir_path="$THE_POLYBARRC_PROFILE_DIR_PATH/$name" ## ~/.local/share/polybarrc-profile/demo
		if is_not_polybarrc_dir "$dir_path"; then ## check ~/.local/share/polybarrc-profile/demo/polybar.conf
			continue
		fi

		echo "$name"
	done

	cd "$OLDPWD"

}

##
### Tail: Model mod_polybarrc_profile_list
################################################################################
