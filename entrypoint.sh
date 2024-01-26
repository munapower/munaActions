#!/bin/bash
set -e

# do something
    VERSION=$(date +%F.%s)

    DATA="$(printf '{"tag_name":"v%s",' $VERSION)"
    DATA="${DATA} $(printf '"target_commitish":"master",')"
    DATA="${DATA} $(printf '"name":"v%s",' $VERSION)"
    DATA="${DATA} $(printf '"body":"Automated release based on keyword: %s",' "$*")"
    DATA="${DATA} $(printf '"draft":false, "prerelease":false}')"
    URL="https://api.github.com/repos/${GITHUB_REPOSITORY}/releases"
    echo $DATA | http -H "'Authorization: token ${GITHUB_TOKEN}'" POST $URL | jq .

