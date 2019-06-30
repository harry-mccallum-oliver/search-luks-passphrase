#!/bin/bash

create_phrases() {
  local number_of_digits=$1
  local cartesian_product

  cartesian_product=$(printf "{0..9}%.0s" $(seq 1 "$number_of_digits"))

  eval echo "$cartesian_product"
}

search() {
  local candidate_phrases=$1
  local partition_name=$2

  for phrase in $candidate_phrases
  do
    echo "Trying passphrase $phrase"
    echo -n "$phrase" | sudo cryptsetup luksOpen "$partition_name" crypt_mapping -d -

    if [ $? -eq 0 ]; then  
      echo "Passphrase found: $phrase" 
      return
    fi
  done    

  echo "Passphrase was not found"
}

main() {
  local partition_name=$1
  local number_of_digits=$2
  local candidate_phrases

  candidate_phrases=$(create_phrases "$number_of_digits")

  search "$candidate_phrases" "$partition_name"
}

main "$@"
