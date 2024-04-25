# naabu

## Tool Purpose
[naabu](https://github.com/projectdiscovery/naabu) is a port scanning tool written in Go that allows you to enumerate valid ports for hosts in a fast and reliable manner. It is a really simple tool that does fast SYN/CONNECT/UDP scans on the host/list of hosts and lists all ports that return a reply.

### Relavent Usage
```
naabu -host <top-level domain (TLD)> -json -o <output.json> --passive
```

### Output of Test Cases
- [example.com](example.com_naabu.json)
- thegioididong.com 
 - no valid ipv4 or ipv6 targets were found, no files was created (could be due to firewall)
- owasp.org
 - no logs/exception was displayed, no files was created 