# Network Scanner Script

## Description
A PowerShell script to ping a range of IP addresses and save the results in a CSV file. 
This helps identify devices that are active and reachable within the same subnet.

## Usage
1. **Edit Variables:**
   - `$subnet`:   Set the subnet.
   - `$startIP` and `$endIP`:   Define the IP range.
   - `$outputFile`:   Path to save the results.

2. **Run the Script:**
   ```powershell
   .\NetworkScanner.ps1
