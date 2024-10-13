import requests
import sys

# SQL Injection Tester
# Usage: python3 sql_injection_tester.py <target-url> <payload>

# Check if required arguments are provided
if len(sys.argv) != 3:
    print("Usage: python3 sql_injection_tester.py <target-url> <payload>")
    sys.exit(1)

# Get the target URL and payload from command line arguments
target_url = sys.argv[1]
payload = sys.argv[2]

# Replace the parameter value with the payload
injected_url = target_url.replace('=', f'={payload}')

try:
    # Send HTTP request with the payload
    response = requests.get(injected_url)
    
    # Analyze the response
    if "error" in response.text or "SQL" in response.text or "sql" in response.text:
        print(f"[+] Vulnerable to SQL Injection: {injected_url}")
    elif response.status_code == 500:
        print(f"[+] Possible SQL Injection (500 Internal Server Error): {injected_url}")
    else:
        print(f"[-] Not vulnerable: {injected_url}")

except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
