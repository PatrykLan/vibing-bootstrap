# Vibing Bootstrap

Public bootstrap script for fresh Ubuntu machines. Installs prerequisites, authenticates, then clones the private setup repo.

## One Command Install

```bash
curl -fsSL https://raw.githubusercontent.com/PatrykLan/vibing-bootstrap/main/bootstrap.sh | bash
```

## What It Does

1. Installs git and GitHub CLI
2. Prompts you to authenticate with GitHub
3. Clones your private `setup` repo
4. Runs the full setup (install.sh + terminal.sh + server.sh)

## Files

- `bootstrap.sh` - The main script

## First Time Setup (for repo owner)

1. Clone this repo and update username in bootstrap.sh
2. Push to GitHub:

   ```bash
   gh repo create vibing-bootstrap --public --source=. --push
   ```

3. Make sure your private `setup` repo exists:
   ```bash
   cd ~/Coding/setup
   gh repo create setup --private --source=. --push
   ```

## Usage

On any fresh Ubuntu machine:

```bash
curl -fsSL https://raw.githubusercontent.com/PatrykLan/vibing-bootstrap/main/bootstrap.sh | bash
```

Then follow the prompts.
