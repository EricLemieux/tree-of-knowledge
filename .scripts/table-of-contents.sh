#!/usr/bin/env bash

set -euo pipefail

function get_file_name() {
  echo "${1}"
}

function get_readable_name() {
  echo "${1}"
}

function md_link() {
    xargs -I{} echo "[{}]({})"
}

function main() {
  dir="${1}"
  intro_file="${dir}/_intro.md"
  intro=""

  echo "---------"
  echo "Directory: ${dir}"

  if [[ -f "${intro_file}" ]]; then
    intro=$(cat "${intro_file}")
  else
    intro="# ${dir/\.\/}"
  fi

  folders=$(find "${dir}" -maxdepth 1 -type d -printf "%f\n" \
    | tail -n +2 \
    | grep -P "^(?!\.)" \
    | md_link || echo "")

  files=$(find "${dir}" -maxdepth 1 -type f -printf "%f\n" \
    | grep -P "^(?!\.|_|README|Makefile).*$" \
    | md_link || echo "")

  # Create readme
  echo "<!-- This file is generated by a script, do not modify manually -->
${intro}

## Table of contents

${folders}
${files}
" >"${dir}/README.md"
}

main "${@}"
