### PowerShell

Open your PowerShell profile (one-time):
```bash
notepad $PROFILE.CurrentUserAllHosts
```
Add the following:
```bash
function git-create {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Name
  )

  # Clone starter
  git clone https://github.com/Ben-Maisel/base.git $Name | Out-Null
  Set-Location $Name

  # Detach from starter (bash via WSL)
  wsl bash -lc "./init.sh"

  # Fresh git repo (Windows Git only)
  git init | Out-Null
  git branch -M main
  git add .
  git commit -m "Initial commit" | Out-Null
}
```
Restart PowerShell, then create a new project with:
```bash
git-create <repo-name>
```

### Mac (zsh)
Open your shell profile (one-time):
```bash
nano ~/.zshrc
```
Add this function
```bash
git-create () {
  if [ -z "$1" ]; then
    echo "usage: git-create <repo-name>"
    return 1
  fi

  NAME="$1"

  # Clone the base repo
  git clone https://github.com/Ben-Maisel/base.git "$NAME" >/dev/null
  cd "$NAME" || return 1

  # Remove base repo history completely
  rm -rf .git

  # Optional: run init script if present
  if [ -f init.sh ]; then
    bash init.sh
  fi

  # Fresh git repo
  git init >/dev/null
  git branch -M main
  git add .
  git commit -m "Initial commit" >/dev/null
}
```
Reload your shell
```bash
source ~/.zshrc
```
Use it
```bash
git-create <repo-name>
```

### Option 2 (fall back)
```bash
git clone https://github.com/Ben-Maisel/base.git <repo-name>
```
```bash
cd <repo-name>
```
```bash
bash init.sh <repo-name>
```
