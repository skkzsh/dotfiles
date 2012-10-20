# Install

```sh
git clone git://github.com/skkzsh/dotfiles.git
cd dotfiles
git submodule init
git submodule update
```

# Update

```sh
cd dotfiles
git pull origin master

git submodule init
git submodule update
git submodule foreach 'git checkout master; git pull'
```
