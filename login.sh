#!/usr/bin/env sh

# login using the configured account

curl -s -X POST https://account-api.icann.org/api/authenticate \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d $(jq -nc \
        --arg username "$(awk '{print $1}' account.txt)" \
        --arg password "$(awk '{print $2}' account.txt)" \
        '{$username, $password}') |
    jq .accessToken -r
