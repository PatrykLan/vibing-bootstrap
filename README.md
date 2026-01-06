# Vibing Bootstrap

Public bootstrap script for fresh Ubuntu machines. Installs prerequisites, authenticates, then clones the private setup repo.

## One Command Install

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/vibing-bootstrap/main/bootstrap.sh | bash
```

## What It Does

1. Installs git and GitHub CLI
2. Prompts you to authenticate with GitHub
3. Clones your private `setup` repo
4. Runs the full setup

## Files

- `bootstrap.sh` - The main script

## Setup

1. Create this repo (public):

   ```bash
   gh repo create vibing-bootstrap --public
   ```

2. Update `bootstrap.sh` with your GitHub username

3. Push:

   ```bash
   git add -A && git commit -m "init" && git push
   ```

4. Make sure your private `setup` repo exists:
   ```bash
   cd ~/Coding/setup
   gh repo create setup --private --source=. --push
   ```

## Usage

On any fresh Ubuntu machine:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/vibing-bootstrap/main/bootstrap.sh | bash
```

Then follow the prompts.
