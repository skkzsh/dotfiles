<#
.SYNOPSIS
#>

### Setting

## 共有元の設定FilesのDirctory
$unix_dir = "$ENV:HOMEPATH\Repository\bitbucket\unix_files"
$prefix_dropbox = "$ENV:HOMEPATH\Dropbox"
$setting = "$dropbox\setting"
$vim = 'C:\vim73-kaoriya-win32'

## 共有元の各Directoryで共有させるFilesのList
$bashrc = '.profile', '.bashrc', '.bash_aliases', '.inputrc', '.bash_env'
$zshrc = '.zshrc', '.zprofile', '.zsh_aliases'

$dot_zsh = 'plugin', 'functions'

$vimrc = 'vimrc', 'gvimrc'
$dot_emacs = '.emacs-w3m', '.wl', '.folders', '.signature'
$dot_emacs_d = 'conf', 'lisp', 'elpa', 'auto-install', 'public_repos'

$dot_unix_files = '.screenrc', '.gitconfig', '.gitignore', '.perltidyrc'
$dot_unix_dirs = '.auto-insert'


### Symbolic Link

## Emacs
smartln.ps1 mklink "$unix_dir\.emacs.d\init.el" "$ENV:HOME\.emacs.d\init.el"
foreach ($dir in $dot_emacs_d) {
    smartln.ps1 mklink "$unix_dir\.emacs.d\$dir" "$ENV:HOME\.emacs.d\$dir"
}

## Vim
foreach ($file in $vimrc) {
    smartln.ps1 mklink "$unix_dir\.$file" "$vim\_$file"
}
smartln.ps1 mklink "$unix_dir\.vim" "$vim\vimfiles"

## Dot Files
foreach ($file in $bashrc, $dot_unix_files, $dot_emacs) {
    smartln.ps1 mklink "$unix_dir\$file" "$ENV:HOME\$file"
}
## Dot Directories
foreach ($dir in $dot_unix_dirs) {
    smartln.ps1 mklink "$unix_dir\$file" "$ENV:HOME\$file"
}

## SSH
smartln.ps1 mklink "$unix_dir\.ssh\config" "$ENV:HOME\.ssh\config"

## Vimperator
foreach ($file in .vimperatorrc .muttatorrc) {
    smartln.ps1 mklink "$setting\$file" "$ENV:HOME\$file"
}
smartln.ps1 mklink "$setting\.vimperator\plugin" "$ENV:HOME\vimperator\plugin"
smartln.ps1 mklink "$setting\.vimperator\conf" "$ENV:HOME\vimperator\conf"

exit 0
