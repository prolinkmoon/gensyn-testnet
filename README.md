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
1. Go to: [Gensyn Testnet Dashboard](https://dashboard.gensyn.ai/)
2. Enter your node ID from the logs
   > eg: `melodic giant dragonfly`
   
---

# Discord Role / Gensyn Monitoring via Telegram Bot

This guide will walk you through setting up a **Gswarm Telegram Bot** to monitor your swarm node and earn **The Swarm** Discord role.

📘 Official Docs: [Gswarm.dev/docs](https://gswarm.dev/docs)

## 🚀 Step 1: Install Go and Gswarm

First, make sure you have Go installed properly. If you're unsure, just run these commands:

```bash
# Remove existing Go (if any)
sudo rm -rf /usr/local/go

# Install Go 1.22.4
curl -L https://go.dev/dl/go1.22.4.linux-amd64.tar.gz | sudo tar -xzf - -C /usr/local

# Set Go environment variables
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bash_profile
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bash_profile
source ~/.bash_profile

# Check version
go version
```

Now install the Gswarm CLI:
```bash
go install github.com/Deep-Commit/gswarm/cmd/gswarm@latest
```
You should now be able to run `gswarm` from anywhere in your terminal.

✅ Verify Installation:
```bash
gswarm --version
```

## 🤖 Step 2: Create Your Telegram Bot
### 1. Generate a Bot with [@BotFather](https://t.me/botfather)
- Open Telegram and search for @BotFather
- Send `/newbot` and follow the steps (pick a name and username)
- Save the Bot Token you receive

### 2. Find Your Chat ID
- Start a conversation with your bot and send any message
- Visit the following URL in your browser (replace with your actual bot token):
```bash
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates
```
- Enable Pretty Print to make the JSON readable
- Look for the "chat": {"id": ...} field in the response — that number is your chat ID

📌 Note: If the result is empty ("result": []), send a message to your bot and refresh the page.

## 🔧 Step 3: Run the Gswarm Bot
Back in your terminal, simply run:
```bash
gswarm
```
Follow the interactive prompts to enter:
- Your Telegram Bot Token
- Your Chat ID
- Your EOA Address (visible in your [Gensyn Dashboard](https://dashboard.gensyn.ai/))


## 🌐 Step 4: Link Discord & Telegram
To receive The Swarm Discord role:

### 1. Get the Code
On Discord, go to the `#|swarm-link` channel
Type:
```bash
/link-telegram
```
### 2. Verify in Telegram
Open your Telegram bot
Type:
```bash
/verify <code>
```
(Replace `<code>` with the one you got on Discord)
Once verified, your accounts will be linked — and you'll get the shiny new The Swarm role!

### 💡 Tips
If you want to keep the bot running in the background:
```bash
sudo apt install screen
screen -S gswarm-bot
gswarm
```
Then use `CTRL + A + D` to detach.

gswarm & Happy Swarming! ⚙️
