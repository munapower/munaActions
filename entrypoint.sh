#!/bin/bash
set -e

if [ -n "$GITHUB_EVENT_PATH" ];
then
    EVENT_PATH=$GITHUB_EVENT_PATH
else
    echo "No JSON data to process! :("
    exit 1
fi

env
jq . < $EVENT_PATH


    # do something
    VERSION=$(date +%F.%s)

    DATA="$(printf '{"tag_name":"v%s",' $VERSION)"
    DATA="${DATA} $(printf '"target_commitish":"master",')"
    DATA="${DATA} $(printf '"name":"v%s",' $VERSION)"
    DATA="${DATA} $(printf '"body":"Automated release based on keyword: %s",' "$*")"
    DATA="${DATA} $(printf '"draft":false, "prerelease":false}')"
    URL="https://api.github.com/repos/${GITHUB_REPOSITORY}/releases?access_token=${GITHUB_TOKEN}"
    echo $DATA | http POST $URL | jq .

