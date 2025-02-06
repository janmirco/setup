#!/usr/bin/env bash

if [[ "$1" == "bib" || "$1" == "bibtex" || "$1" == "tex" ]]; then
    curl --silent --location --header "Accept: application/x-bibtex" "$2"

elif [[ "$1" == "json" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2" | jq '{
    type,
    title,
    volume: (.volume | tonumber),
    ISSN,
    DOI: ("https://doi.org/" + .DOI),
    number: (.issue | tonumber // null),
    journal: ."container-title",
    publisher: (.publisher // ."publisher-name" // .publisher[0].name // null),
    author: [.author[] | "\(.family), \(.given)"],
    year: .issued."date-parts"[0][0],
    month: (.issued."date-parts"[0][1] | tonumber | . - 1 | ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"][.]),
    pages: (.page // null)
}'

elif [[ "$1" == "jsonfull" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2"

elif [[ "$1" == "txt" || "$1" == "apa" ]]; then
    curl --silent --location --header "Accept: text/x-bibliography; style=apa" "$2"

elif [[ "$1" == "yaml" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2" | jq '{
    type,
    title,
    volume: (.volume | tonumber),
    ISSN,
    DOI: ("https://doi.org/" + .DOI),
    number: (.issue | tonumber // null),
    journal: ."container-title",
    publisher: (.publisher // ."publisher-name" // .publisher[0].name // null),
    author: [.author[] | "\(.family), \(.given)"],
    year: .issued."date-parts"[0][0],
    month: (.issued."date-parts"[0][1] | tonumber | . - 1 | ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"][.]),
    pages: (.page // null)
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
