#!/bin/bash

# Arguments:
#   $1: Regex to parse the coverage report file with
#   $2: Path to the coverage report.

if [[ -z $1 ]] || [[ -z $2 ]]; then
    echo "Not all arguments are provided or valid"
    exit 1
fi

COVERAGE_REGEX=$1

# COVERAGE_REGEX='<Root.*CoveragePercent="([0-9]*)"'

while IFS= read -r line; do
    if [[ $line =~ $COVERAGE_REGEX ]]; then
        coveragePercent="${BASH_REMATCH[1]}%"
        echo "Coverage result $coveragePercent"
        exit 0
    fi
done < $2

echo "Coverage result 0%"
