#!/usr/bin/env bash

year="$(date +%Y)"
month="$(date +%m)"
mkdir --parents $HOME/.klog/"$year"
cp $HOME/.klog/worktimes.klg $HOME/.klog/"$year"/"$month".klg
