#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source "$(dirname "${BASH_SOURCE[0]}")/_shared.sh"

psql "$(get_db_url)" < cas_db.dump