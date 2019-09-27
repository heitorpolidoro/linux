#!/usr/bin/env bash
# Function to be executed when the script exits
function finish {
    echo "finish params=$*"
    error_code=$?
    if [[ ${error_code} -eq 0 ]]; then
        echo "Success"
    else
        echo "Error code: ${error_code}"
    fi
}

# Trap the function 'finish' to execute when the script exits
trap finish EXIT

err_report() {
    echo "err_report params=$*"
    echo "Error on line $1"
}

trap 'err_report $LINENO' ERR

# trap to exit the script with a CTRL+C
function ctrl_c() {
    echo "ctrl_c params=$*"
    echo "CTRL+C"
    exit 130
}
trap ctrl_c INT

#sleep 10

echo hello | grep foo
