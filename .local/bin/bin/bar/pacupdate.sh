#!/bin/bash
cupd=$(((checkupdates | wc -l) + (checkupdates-aur | wc -l)))
echo "$cupd updates"

