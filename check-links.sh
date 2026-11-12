#!/bin/sh
# Checks the built site for broken internal links and images.
#
# Usage: ./check-links.sh
#
# Same script runs locally and in CI (.github/workflows/check.yml).
# Everything runs in docker, nothing needs installing on the host.
#
# What it checks: every href/src in the generated HTML that points
# at this site must exist as a file in public/.
# What it doesn't: external links (offline mode, no network), or URLs
# that only work via netlify.toml redirects (e.g. /meet/).
#
# Breakage you've accepted goes in .lycheeignore, one regex per line.
set -e

# Same zola version as ./up-docker and mise; also pinned in netlify.toml.
ZOLA_VERSION=$(sed -n 's/^zola *= *"\(.*\)"/\1/p' mise.toml)
LYCHEE_VERSION=0.24.2

# 1. Build the site into public/ (gitignored).
#    -u keeps the output owned by you rather than root.
echo "docker run ghcr.io/getzola/zola:v$ZOLA_VERSION build"
docker run --rm -u "$(id -u):$(id -g)" \
	-v "$PWD":/app -w /app \
	"ghcr.io/getzola/zola:v$ZOLA_VERSION" \
	build

# 2. Check links in the built HTML.
#    --offline     only check local files, skip anything over the network
#    --root-dir    where root-relative links like /assets/... resolve to
#                  (must be absolute, hence the /input mount path)
#    the glob is quoted so lychee expands it, not the shell
#    Exits non-zero on any broken link, which fails the script (set -e).
echo "docker run lycheeverse/lychee:$LYCHEE_VERSION --offline public/**/*.html"
docker run --rm -u "$(id -u):$(id -g)" \
	-v "$PWD":/input -w /input \
	"lycheeverse/lychee:$LYCHEE_VERSION" \
	--offline --no-progress --root-dir /input/public \
	'public/**/*.html'
