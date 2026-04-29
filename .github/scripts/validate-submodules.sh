#!/usr/bin/env bash
# Validate Git submodule consistency.
# Fails if any submodule is uninitialized, modified, or has conflicts.

set -eo pipefail

# git submodule status prefixes:
#  '-' : submodule is not initialized
#  '+' : currently checked out submodule commit does not match the SHA-1 found in the index
#  'U' : submodule has merge conflicts
#  ' ' : matches index

if ! git submodule status --recursive | grep -q '^[+-U]'; then
    exit 0
else
    echo "Error: Submodule consistency check failed."
    echo "The following submodules are uninitialized (-), modified (+), or have conflicts (U):"
    git submodule status --recursive | grep '^[+-U]'
    exit 1
fi
