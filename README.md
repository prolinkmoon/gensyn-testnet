<h1>🧠 Gensyn Testnet Node Setup Guide</h1>

## ⚙️ System Requirements

| Component          | Minimum Requirements                                        |
|--------------------|-------------------------------------------------------------|
| **CPU**            | Compatible with `arm64` or `amd64`                          |
| **RAM**            | Minimum of 24 GB recommended                                |
| **GPU** | `RTX 3090/4070/4090`, `A100`, or `H100` recommended         |
| **Python**         | Version 3.10+ (Mac users may need to upgrade manually)      |
| **Cuda**         | Version 12.8+       |

---

## 🚀 Renting a GPU Instance

> 💡 *Optional: You can use a VPS or WSL instead, but this may reduce performance and success rate.*

1. Go to [Quick Pod](https://console.quickpod.io?affiliate=d5e26172-66ea-41c8-9a6e-337388bd6353)
2. Sign up and verify your email
3. Fund your account via crypto or credit card
4. Choose `Ubuntu 22.04 jammy` from templates
5. Select `RTX 4090` as the GPU
6. Click **Create POD**, then **Connect to Web Terminal** when ready  

---

## 🛠️ Node Installation
### 1. Install sudo:
```bash
apt update && apt install -y sudo
```
### 2. Install dependencies:
```bash
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof nano unzip iproute2 build-essential gcc g++
```
### 3. Install CUDA:
```bash
curl -o install-cuda.sh https://raw.githubusercontent.com/prolinkmoon/gensyn-testnet/main/install-cuda.sh && chmod +x install-cuda.sh && ./install-cuda.sh
```
### 4. Create a screen session:
```bash
screen -S gensyn
```
### 5. Clone the Gensyn repo and navigate to it:
```bash
git clone https://github.com/gensyn-ai/rl-swarm.git && cd rl-swarm
```
### 6. Start the Swarm:
```bash
python3 -m venv .venv
source .venv/bin/activate
./run_rl_swarm.sh
```

---

## 🌍 Making Your Node Public (Tunnel)
> This lets Gensyn reach your local instance. We'll use LocalTunnel.

### 1. Open a new terminal tab (don’t stop the running node)
### 2. Install node.js & npm
```bash
curl -fsSL https://raw.githubusercontent.com/prolinkmoon/gensyn-testnet/main/install-nodejs.sh -o install-nodejs.sh && chmod +x install-nodejs.sh && ./install-nodejs.sh
```
### 3. Install `LocalTunnel`:
```bash
npm install -g localtunnel
```
### 4. Optionally retrieve tunnel password:
```bash
curl https://loca.lt/mytunnelpassword
```
### 5. Start tunnel:
```bash
lt --port 3000
```
### 6. Visit the given link (e.g., https://something.loca.lt) and log in via email.
### 7. Comeback to your main terminal and you see logs started to progress
It will ask some questions, you should send response properly
```bash
Would you like to push models you train in the RL swarm to the Hugging Face Hub? [y/N]: 
```
> Write `N`
### 8 Detach from `screen session`
Use `Ctrl + A` and then press `D` to detach from this screen session.

---

## 💾 Backup `swarm.pem`
> Essential! Losing this file means losing your testnet progress.
### 🔒 Use Manual Method ( Recomended )
refer to manual [backup instructions](https://github.com/prolinkmoon/gensyn-testnet/blob/main/backup.md).

## 📊 Monitor Your Node
✅ View Logs
```bash
screen -r gensyn
```
> To exit: Ctrl + A, then press D.
## 🏆 Track Points
1. Go to: [Gensyn Testnet Dashboard](https://dashboard-math.gensyn.ai/)
2. Enter your node ID from the logs
   > eg: `melodic giant dragonfly`
