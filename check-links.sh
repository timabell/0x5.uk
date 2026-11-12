#!/bin/sh
# Builds the site and checks internal links and images.
#
# Usage: ./check-links.sh
#
# Needs zola and lychee on the path (nix packages).
# CI gets the same ones from nixpkgs (.github/workflows/check.yml).
#
# Not checked: external links (offline), or URLs that only work via
# netlify.toml redirects (e.g. /meet/).
# Accepted breakage goes in .lycheeignore, one regex per line.
set -e

echo "zola build"
zola build

# --root-dir resolves /assets/... style links, must be absolute.
echo "lychee --offline --no-progress --root-dir $PWD/public 'public/**/*.html'"
lychee --offline --no-progress --root-dir "$PWD/public" 'public/**/*.html'
