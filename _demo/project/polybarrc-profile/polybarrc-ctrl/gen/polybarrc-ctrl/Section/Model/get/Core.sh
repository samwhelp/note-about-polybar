

################################################################################
### Head: Model mod_polybarrc_profile_get
##

mod_polybarrc_profile_get () {

	#echo "mod_polybarrc_profile_get"
	#echo "$@"

	# polybarrc-ctrl get

	local target_path="$THE_POLYBARRC_DIR_PATH" ## ~/.config/polybar
	local dir_path="$(LANG=C file "$target_path" | awk -F ' symbolic link to ' '{print $2}')"
	local name="$(basename "$dir_path")"

	echo $name

}

##
### Tail: Model mod_polybarrc_profile_get
################################################################################
