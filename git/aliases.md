
```
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.di diff
```
## Branch
```
git config --global alias.br branch
git config --global alias.bl "branch --sort=-committerdate"
```

## Stash
```
git config --global alias.ss "stash save $1"
git config --global alias.pop "stash pop"
git config --global alias.sl "stash list"
git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git stash store -m "$2" $rev; }; _'

```
