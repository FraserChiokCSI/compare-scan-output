```

```

# Compare Scan Output

## Purpose

The purpose of this repository is to view the individual output of scanners from Mantis Scanner, for implementation purposes.

## Prerequisites

- Ensure Mantis is installed.

## Installation

Activate Mantis
```sh
mantis-activate
```

Clone repository
```sh
git clone https://github.com/FraserChiokCSI/compare-scan-output.git
```

Change Directory
```sh
cd compare-scan-output
```

Make Script Executable
```sh
chmod +x ./run-scan.sh
```

## Usage

```
Usage: 
./run-scan.sh [-f input_file | domain1 domain2 ...]
```

## Examples
```
./run-scan.sh example.com
./run-scan.sh example.com example.net
./run-scan.sh -f domains.txt
```