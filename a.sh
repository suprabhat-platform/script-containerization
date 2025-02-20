#!/bin/bash

# Function to check command existence and print version
check_version() {
    command_name=$1
    version_command=$2
    
    if command -v $command_name &> /dev/null
    then
        echo "$command_name version:"
        eval "$version_command"
        echo "------------------------------"
    else
        echo "$command_name is not installed."
        echo "------------------------------"
    fi
}

echo "Checking installed versions..."
echo "=============================="

check_version "docker" "docker --version"
check_version "kubectl" "kubectl version"
check_version "helm" "helm version --short"

# Check if jq is installed
if command -v jq &> /dev/null
then
    echo "jq is installed."
else
    echo "jq is NOT installed."
fi
