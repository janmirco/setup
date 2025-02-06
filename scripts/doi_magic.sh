#!/usr/bin/env bash

if [[ "$1" == "bib" || "$1" == "bibtex" || "$1" == "tex" ]]; then
    curl --silent --location --header "Accept: application/x-bibtex" "$2"

elif [[ "$1" == "txt" || "$1" == "apa" ]]; then
    curl --silent --location --header "Accept: text/x-bibliography; style=apa" "$2"

elif [[ "$1" == "jsonfull" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2"

elif [[ "$1" == "json" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2" | jq '{
    author: [(.author // [])[] | "\(.family // ""), \(.given // "")"] | select(length > 0),
    year: (.issued."date-parts"[0][0] // null),
    month: (if .issued."date-parts"[0][1] then (["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"][(.issued."date-parts"[0][1] | tonumber - 1)] // null) else null end),
    title: (.title // null),
    publisher: (.publisher // ."publisher-name" // (.publisher[0].name // null) // null),
    journal: (."container-title" // null),
    type: (.type // null),
    volume: (if .volume then (.volume | tonumber?) else null end),
    number: (if .issue then (.issue | tonumber?) else null end),
    pages: (.page // null),
    DOI: ("https://doi.org/" + (.DOI // "")),
    ISSN: (.ISSN // null),
    abstract: ((.abstract // "") | gsub("<[^>]*>"; "") | gsub("\n"; " ") | gsub("\\s+"; " "))
}'

elif [[ "$1" == "yaml" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2" | jq '{
    author: [(.author // [])[] | "\(.family // ""), \(.given // "")"] | select(length > 0),
    year: (.issued."date-parts"[0][0] // null),
    month: (if .issued."date-parts"[0][1] then (["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"][(.issued."date-parts"[0][1] | tonumber - 1)] // null) else null end),
    title: (.title // null),
    publisher: (.publisher // ."publisher-name" // (.publisher[0].name // null) // null),
    journal: (."container-title" // null),
    type: (.type // null),
    volume: (if .volume then (.volume | tonumber?) else null end),
    number: (if .issue then (.issue | tonumber?) else null end),
    pages: (.page // null),
    DOI: ("https://doi.org/" + (.DOI // "")),
    ISSN: (.ISSN // null),
    abstract: ((.abstract // "") | gsub("<[^>]*>"; "") | gsub("\n"; " ") | gsub("\\s+"; " "))
}' | python3 -c '
import sys
import yaml
import json

class OrderedLoader(yaml.SafeLoader):
    pass

def construct_mapping(loader, node):
    loader.flatten_mapping(node)
    return dict(loader.construct_pairs(node))

OrderedLoader.add_constructor(yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG, construct_mapping)
json_data = json.loads(sys.stdin.read())
print(yaml.dump(json_data, sort_keys=False, allow_unicode=True))
'

fi
