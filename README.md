##### Option 1 (recommended)

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

##### Option 2 (fall back)
```bash
git clone https://github.com/Ben-Maisel/base.git <repo-name>
```
```bash
cd <repo-name>
```
```bash
bash init.sh <repo-name>
```