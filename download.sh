#!/usr/bin/env sh

alias curl="curl -s -H 'Authorization: Bearer $1'"
tlds=$(mktemp)
mkdir data

terminate() {
    rm $tlds
    exit 0
}

curl -X POST 'https://czds-api.icann.org/czds/requests/all' \
    -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -d '{"status":"Approved","filter":null,"pagination":{"size":5000,"page":0},"sort":{"field":"created","direction":"desc"}}' |
    jq '.requests[] | select (.status=="Approved") | .tld' -r | sort -u | uniq >$tlds

for tld in $(<$tlds); do
    curl -X GET "https://czds-api.icann.org/czds/downloads/$tld.zone" | gunzip -d >"data/$tld.zone"
    echo downloaded $tld to data/$tld.zone
done

terminate