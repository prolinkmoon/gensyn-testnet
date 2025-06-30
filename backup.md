# 🔐 Backing Up `swarm.pem` Securely

The `swarm.pem` file is crucial for tracking your contribution in the Gensyn testnet. Losing it means starting from scratch. Here’s how to back it up from various environments to your local machine.

---

### 📤 1. From VPS / Server to Local PC (via SCP)
You can use the `scp` command to transfer the file.
- On Command Prompt (Windows):
```shell
scp VPS-USERNAME@VPS-IP:~/rl-swarm/swarm.pem "YOUR-PC-PATH"
```
✅ Example:
```shell
scp root@203.0.113.45:~/rl-swarm/swarm.pem "C:\Users\USER\Downloads"
```
### 📤 2. From WSL (Windows Subsystem for Linux) to Local PC
- Open either Command Prompt or PowerShell
- Use the following command to copy the file from your WSL environment:
```shell
copy "\\wsl$\Ubuntu\home\YOUR-WSL-USERNAME\rl-swarm\swarm.pem" "YOUR-PC-PATH"
```
✅ Example:
```shell
copy "\\wsl$\Ubuntu\home\prolinkmoon\rl-swarm\swarm.pem" "C:\Users\USER\Downloads"
```

### 🔒 Best Practices
- Do not share `swarm.pem` publicly or upload it to unprotected repositories.
- Keep multiple backups: local drive + secure cloud (Google Drive, Dropbox, encrypted zip, etc).
- Rename or version your backup file with a date for clarity.
