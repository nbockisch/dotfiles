#!/usr/bin/env bash

if actions_object="$(makoctl list | jq -re '.data[0][0].actions.data | if length > 0 then . else false end')"; then
	selection="$(jq -rn --arg sel "$(
			jq -rn "$actions_object|values[]" |
			$@
		)" \
		"$actions_object|to_entries[]|select(.value == \$sel).key"
	)"
	if [ -n "$selection" ]; then
		makoctl invoke $selection
	fi
fi
