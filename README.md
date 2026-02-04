### PowerShell

Requires WSL.

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
