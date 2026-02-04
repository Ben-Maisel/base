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

  # Reset README
  Remove-Item README.md -ErrorAction SilentlyContinue
@"
# $Name

Project description.

## Setup
Describe setup here.
"@ | Set-Content README.md

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



### Bash / Macos
Install the git create command (one-time)

```bash
git config --global alias.create '!f(){ \
  name="$1"; \
  [ -z "$name" ] && echo "usage: git create <repo-name>" && exit 1; \
  git clone https://github.com/Ben-Maisel/base.git "$name" >/dev/null; \
  cd "$name" || exit; \
  bash init.sh "$name"; \
}; f'
```
After installing, create a new project with:
```bash
git create <repo-name>
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

