#!/usr/bin/env bash

if [[ "$1" == "bib" || "$1" == "bibtex" || "$1" == "tex" ]]; then
    curl --silent --location --header "Accept: application/x-bibtex" "$2"

elif [[ "$1" == "json" ]]; then
    curl --silent --location --header "Accept: application/citeproc+json" "$2" | jq '{
    type: "article",
    title,
    volume,
    ISSN,
    DOI,
    number: (.issue // null),
    journal: ."container-title",
    publisher: (.publisher // ."publisher-name" // .publisher[0].name // null),
    author: [.author[] | {family, given}],
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
    type: "article",
    title,
    volume,
    ISSN,
    DOI,
    number: (.issue // null),
    journal: ."container-title",
    publisher: (.publisher // ."publisher-name" // .publisher[0].name // null),
    author: [.author[] | {family, given}],
    year: .issued."date-parts"[0][0],
    month: (.issued."date-parts"[0][1] | tonumber | . - 1 | ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"][.]),
    pages: (.page // null)
}' | python3 -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))'

fi
