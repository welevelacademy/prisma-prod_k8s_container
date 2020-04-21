#!/usr/bin/env bash
#                                         , _                         
# (|  |  |_/_ |\  _       _ |\           /|/ \ ,_  o  ,           _,  
#  |  |  | |/ |/ |/ |  |_|/ |/    ----    |__//  | | / \_/|/|/|  / |  
#   \/ \/  |_/|_/|_/ \/  |_/|_/           |      |/|/ \/  | | |_/\/|_/
#                                                                     
# Build a Prisma Production docker image compatible with k8s ENVs
#
# Usage:
#   build tag
#
# Depends on:
#  docker
#
#

set -o nounset
set -o errexit
set -o errtrace
set -o pipefail

IFS=$'\n\t'

###############################################################################
# Environment
###############################################################################

# $_ME
#
# Set to the program's basename.
_ME=$(basename "${0}")

###############################################################################
# Help
###############################################################################

# _print_help()
#
# Usage:
#   _print_help
#
# Print the program help information.
_print_help() {
  cat <<HEREDOC
                                         , _                         
 (|  |  |_/_ |\  _       _ |\           /|/ \ ,_  o  ,           _,  
  |  |  | |/ |/ |/ |  |_|/ |/    ----    |__//  | | / \_/|/|/|  / |  
   \/ \/  |_/|_/|_/ \/  |_/|_/           |      |/|/ \/  | | |_/\/|_/
                                                                     
Build a Prisma Production docker image compatible with k8s ENVs
Usage:
  ${_ME} <tag> Specify a tag to build from prismagraphql/prisma-prod like 1.34.10
  ${_ME} -h | --help
Options:
  -h --help  Show this screen.
HEREDOC
}

###############################################################################
# Program Functions
###############################################################################

_build() {
	docker build --build-arg tag=${1} -t welevelacademy/prisma-prod:${1} .
	docker push welevelacademy/prisma-prod
}

###############################################################################
# Main
###############################################################################

# _main()
#
# Usage:
#   _main [<options>] [<arguments>]
#
# Description:
#   Entry point for the program, handling basic option parsing and dispatching.
_main() {
  # Avoid complex option parsing when only one program option is expected.
  if [[ "${1:-}" =~ ^-h|--help$  ]]
  then
    _print_help
  else
    _build "$@"
  fi
}

# Call `_main` after everything has been defined.
_main "$@"
