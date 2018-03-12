#!/bin/bash

repo_link="${1}"
chart_name="${2}"

function installChart {
    git clone $repo_link
    IFS=/ read -a dirs <<< $repo_link
    dir=${dirs[-1]}
    cd ${dir}
    chart_dir=$(find . -type d -name ${chart_name})
    cd ${chart_dir}/..
    helm install ${chart_name} 
}

installChart
