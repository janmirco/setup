#!/usr/bin/env bash

$EDITOR $(array=($(git status --short | grep \?\?)); for i in ${!array[*]}; do if [ $((i % 2)) -ne 0 ]; then echo ${array[$i]}; fi; done; unset array)
