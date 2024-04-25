#!/bin/bash

# Function to run command and handle failure
run_command() {
    local command="$1"
    local output_dir="$2"
    mkdir -p $output_dir

    echo "Running $command..."
    $command
    exit_status=$?

    if [ $exit_status -ne 0 ]; then
        echo "$command failed, skipping..."
        return 1
    else
        echo "$command completed successfully"
        return 0
    fi
}

# Check if input domains are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [-f input_file | domain1 domain2 ...]"
    exit 1
fi

# Function to process domains from file
process_domains_from_file() {
    local file="$1"
    while IFS= read -r domain || [ -n "$domain" ]; do
        run_command "subfinder -d $domain -o $(pwd)/subfinder/${domain}_subfinder.json" "$(pwd)/subfinder"
        run_command "wafw00f -a ${domain} -o $(pwd)/wafw00f/${domain}_wafw00f.json" "$(pwd)/waw00f"
        run_command "python3 /usr/bin/Corsy/corsy.py -u ${domain} -o $(pwd)/corsy/${domain}_corsy.json -d 1" "$(pwd)/corsy"
        run_command "naabu -host ${domain} -json -o $(pwd)/naabu/${domain}_naabu.json —passive" "$(pwd)/naabu"
    done < "$file"
}

# Check if input file option is provided
if [ "$1" == "-f" ]; then
    if [ -z "$2" ]; then
        echo "Usage: $0 -f input_file"
        exit 1
    fi
    input_file="$2"
    # Process domains from file
    process_domains_from_file "$input_file"
else
    # Process domains from command line arguments
    for domain in "$@"; do
        run_command "subfinder -d $domain -o $(pwd)/subfinder/${domain}_subfinder.json" "$(pwd)/subfinder"
        run_command "wafw00f -a ${domain} -o $(pwd)/wafw00f/${domain}_wafw00f.json" "$(pwd)/waw00f"
        run_command "python3 /usr/bin/Corsy/corsy.py -u ${domain} -o $(pwd)/corsy/${domain}_corsy.json -d 1" "$(pwd)/corsy"
        run_command "naabu -host ${domain} -json -o $(pwd)/naabu/${domain}_naabu.json —passive" "$(pwd)/naabu"
    done
fi

echo "All tasks completed."
