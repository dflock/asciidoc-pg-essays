#!/usr/bin/env bash

# Bash strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o nounset   # Using an undefined variable is fatal
set -o errexit   # A sub-process/shell returning non-zero is fatal
# set -o pipefail  # If a pipeline step fails, the pipelines RC is the RC of the failed step
#set -o xtrace    # Output a complete trace of all bash actions; uncomment for debugging

#IFS=$'\n\t'  # Only split strings on newlines & tabs, not spaces.

#
# Mirror original essays from http://paulgraham.com/articles.html to ./mirror
#

# Get article index & save to list of filenames
curl http://paulgraham.com/articles.html | \
# Tidy so it's not all on one long line
tidy -q --show-warnings no | \
# Pull out the article links
grep 'face="verdana"><a href=".*\.html"' | \
# Narrow it down to just the filenames
grep --only-matching 'href=".*\.html"' | \
grep --only-matching '".*"' | \
# Strip quotes
tr -d '"' | \
# Prefix with URL & save to list
sed 's|^|http://paulgraham.com/|' > ./mirror/article-list.txt

# Get all the articles in the list
wget -P --quiet ./mirror/orig/ -i ./mirror/article-list.txt