#!/bin/bash

SOPS_AGE_KEY_FILE="$HOME/icloud/homelab/talos/homelab/sops/age/age.agekey"

# Find all the *.sops.yaml files recursively in the current directory and apply the decrypt and encrypt commands to them
find ../ -name "*.sops.yaml" -type f -print0 | while IFS= read -r -d '' file; do
	# eval "sops --decrypt --age $(cat $SOPS_AGE_KEY_FILE | ggrep -oP '(?<=public key: )(.*)') --encrypted-regex '(^(.*[Pp]ass.*)$)|(^(data|stringData)$)|(^(.*[Tt]oken.*)$)' --in-place $file"
	eval "sops --encrypt --age $(cat $SOPS_AGE_KEY_FILE | ggrep -oP '(?<=public key: )(.*)') --encrypted-regex '(^(.*[Pp]ass.*)$)|(^(data|stringData)$)|(^(.*[Tt]oken.*)$)' --in-place $file"
done
