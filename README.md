# SQL Injection Testing Tool

An automated tool for testing web applications for SQL injection vulnerabilities using Bash and Python. This tool injects SQL payloads into web applications and analyzes server responses to determine if the application is vulnerable to SQL injection attacks.

## Features

- Automates SQL injection testing with a list of predefined payloads.
- Analyzes server responses for SQL errors and vulnerabilities.
- Supports easy configuration for different target URLs.
- Built with Bash scripting for orchestration and Python for HTTP request handling.
- Suitable for use in authorized testing environments like DVWA, OWASP Mutillidae, and PortSwigger Web Security Academy.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Example](#example)
- [Contributing](#contributing)
- [Disclaimer](#disclaimer)

## Requirements

To run this project, you will need:

- **Kali Linux** (or any other Linux distribution with Bash support).
- **Python 3.x** installed.
- **Python requests library**:
  ```bash
  pip3 install requests
  ```
- **Git** (if cloning the repository from GitHub):
  ```bash
  sudo apt-get install git
  ```

## Installation

1. **Clone the Repository**:

   Clone the project repository to your local machine using Git:
   ```bash
   git clone https://github.com/username/sql-injection-test-tool.git
   ```

   Replace `username` with the appropriate GitHub username if needed.

2. **Navigate to the Project Directory**:
   ```bash
   cd sql-injection-test-tool
   ```

3. **Make the Shell Script Executable**:
   ```bash
   chmod +x sql_injection_test.sh
   ```

## Usage

1. **Prepare the Target URL**:
   Ensure you have the correct target URL with a vulnerable parameter for SQL injection. Example:
   ```
   http://example.com/login.php?user=1
   ```

2. **Run the Tool**:
   Use the shell script to inject payloads into the target URL:
   ```bash
   ./sql_injection_test.sh "http://example.com/login.php?user=1"
   ```

   The script will automatically:
   - Loop through the SQL injection payloads in `payloads.txt`.
   - Pass each payload to the Python script (`sql_injection_tester.py`).
   - Analyze the server's response and display whether the target is vulnerable.

### Example Output
```bash
Testing payload: ' OR 1=1 --
[+] Vulnerable to SQL Injection: http://example.com/login.php?user=' OR 1=1 --
------------------------------------
Testing payload: admin' --
[-] Not vulnerable: http://example.com/login.php?user=admin' --
------------------------------------
```

## Example

Here is a step-by-step example of how to use the tool:

1. **Run a Local Vulnerable Web Application** (e.g., DVWA).
2. **Use the Tool on the Login Page** of DVWA:
   ```bash
   ./sql_injection_test.sh "http://localhost/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit"
   ```
3. The tool will display results indicating which payloads were successful in causing SQL injection.

## Files

- `sql_injection_test.sh`: Main shell script that manages the testing process.
- `sql_injection_tester.py`: Python script that injects payloads and analyzes server responses.
- `payloads.txt`: List of SQL injection payloads to be tested against the target URL.

## Contributing

Contributions are welcome! If you would like to contribute to the project, please fork the repository and submit a pull request. You can also raise issues for bug reports or feature requests.

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a pull request.

## Disclaimer

**WARNING**: This tool is designed for educational purposes and should only be used in legal, controlled environments. Unauthorized use of this tool on live websites without permission is illegal and unethical. You are fully responsible for your actions, and the authors of this tool disclaim any liability for misuse.

---

This `README.md` provides all the necessary details for someone to understand the project, set it up, and run it. Make sure to adjust the GitHub repository URL and any additional project-specific details as needed.
