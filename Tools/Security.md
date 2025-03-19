# Security Tools Setup and Usage in Termux

This guide will walk you through setting up and using various security tools in Termux. These tools are useful for ethical hacking, penetration testing, encryption, and securing your environment.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installing Security Tools](#installing-security-tools)
   - [Password Cracking Tools](#password-cracking-tools)
   - [Encryption Tools](#encryption-tools)
   - [Vulnerability Scanning Tools](#vulnerability-scanning-tools)
   - [Miscellaneous Security Tools](#miscellaneous-security-tools)
3. [Usage Examples](#usage-examples)
   - [John the Ripper](#john-the-ripper)
   - [Hashcat](#hashcat)
   - [OpenSSL](#openssl)
   - [Nmap Scripts](#nmap-scripts)
   - [SQLMap](#sqlmap)
4. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before proceeding, ensure the following:

1. **Termux Installed**: Download and install Termux from the official source (F-Droid or GitHub).
2. **Internet Connection**: Ensure your device has an active internet connection.
3. **Storage Permissions**: Grant storage permissions to Termux if required:
   ```bash
   termux-setup-storage
   ```

---

## Installing Security Tools

### Password Cracking Tools

These tools are used for password recovery and testing password strength.

#### Install John the Ripper
```bash
pkg update && pkg upgrade -y
pkg install john -y
```

#### Install Hashcat
Hashcat requires additional dependencies like OpenCL support, which may not be fully supported on Android. Use it with caution.
```bash
pkg install hashcat -y
```

---

### Encryption Tools

These tools are used for encrypting and decrypting data.

#### Install OpenSSL
```bash
pkg install openssl-tool -y
```

---

### Vulnerability Scanning Tools

These tools are used for identifying vulnerabilities in systems and networks.

#### Install Nmap (with NSE Scripts)
```bash
pkg install nmap -y
```

#### Install SQLMap
```bash
pkg install python -y
pip install sqlmap
```

---

### Miscellaneous Security Tools

These tools are useful for various security tasks.

#### Install Hydra (Brute-Force Tool)
```bash
pkg install hydra -y
```

#### Install Metasploit Framework
Metasploit is a powerful penetration testing framework.
```bash
pkg install wget -y
wget https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh
chmod +x metasploit.sh
./metasploit.sh
```

---

## Usage Examples

### John the Ripper

Crack password hashes.

#### Crack a Password File
```bash
john --format=raw-md5 hash.txt
```

**Explanation:**
- Replace `hash.txt` with the file containing the hash.
- Use `--format` to specify the hash type (e.g., `raw-md5`, `sha256`).

---

### Hashcat

Crack passwords using GPU acceleration (if supported).

#### Crack a Hash
```bash
hashcat -m 0 hash.txt wordlist.txt
```

**Explanation:**
- `-m 0`: Specifies the hash type (MD5 in this case).
- Replace `hash.txt` and `wordlist.txt` with appropriate files.

---

### OpenSSL

Encrypt and decrypt files.

#### Encrypt a File
```bash
openssl enc -aes-256-cbc -salt -in plaintext.txt -out encrypted.txt
```

#### Decrypt a File
```bash
openssl enc -d -aes-256-cbc -in encrypted.txt -out decrypted.txt
```

**Explanation:**
- `-aes-256-cbc`: Specifies the encryption algorithm.
- `-salt`: Adds randomness to the encryption process.

---

### Nmap Scripts (NSE)

Run Nmap scripts to detect vulnerabilities.

#### Detect Vulnerabilities
```bash
nmap --script vuln target.com
```

**Explanation:**
- Replace `target.com` with the target IP or domain.

---

### SQLMap

Automate SQL injection testing.

#### Test for SQL Injection
```bash
sqlmap -u "http://example.com/page?id=1" --dbs
```

**Explanation:**
- Replace the URL with the target URL.
- `--dbs` lists all databases on the target.

---

### Hydra

Perform brute-force attacks.

#### Brute-Force SSH Login
```bash
hydra -l username -P passwords.txt ssh://target.com
```

**Explanation:**
- `-l`: Specify the username.
- `-P`: Specify the password list.
- Replace `target.com` with the target IP or domain.

---

### Metasploit Framework

Exploit vulnerabilities in systems.

#### Start Metasploit Console
```bash
msfconsole
```

#### Search for Exploits
```bash
search exploit/windows/smb/ms17_010_eternalblue
```

#### Use an Exploit
```bash
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS target_ip
exploit
```

**Explanation:**
- Replace `target_ip` with the target IP address.

---

## Troubleshooting

1. **Tool Not Found**:
   - Update your package list: `pkg update`.
   - Reinstall the tool: `pkg install <tool_name>`.

2. **Permission Denied Errors**:
   - Ensure you have granted Termux the necessary permissions.
   - Run `termux-setup-storage` if required.

3. **Metasploit Installation Issues**:
   - Ensure you have sufficient storage space.
   - Run the installation script again.

4. **Hashcat GPU Support**:
   - Hashcat's GPU acceleration may not work on all Android devices due to hardware limitations.

---

## Conclusion

By following this guide, you should now have a fully functional security toolkit in Termux. These tools are invaluable for ethical hacking, penetration testing, encryption, and learning about cybersecurity concepts.

For further assistance, refer to the official documentation of each tool or seek help from the Termux community.

Happy Coding! 🔐
