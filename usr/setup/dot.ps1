<#
.SYNOPSIS
Make symbolic links or copy dot files
from repository, Dropbox, and host OS.
#>

### Setting

## 共有元の設定FilesのDirctory
switch ($ENV:COMPUTERNAME) {
    default           { $prefix = "$ENV:USERPROFILE" }
}
$unix_dir = "$prefix\Repository\bitbucket\unix_files"
$dropbox = "$prefix\Dropbox\setting"
#$vim = 'C:\vim73-kaoriya-win32'
$vim_prefix = "$ENV:HOME"

## 共有元の各Directoryで共有させるFilesのList
$bashrc = '.bash_profile', '.bashrc', '.inputrc'
$zshrc = '.zshrc', '.zprofile'

$dot_zsh = 'conf', 'functions', 'public_repos'

$vimrc = 'vimrc', 'gvimrc'
$dot_emacs = '.emacs-w3m', '.wl', '.folders', '.signature'
$dot_emacs_d = 'conf', 'lisp', 'elpa', 'auto-install', 'public_repos', 'usr'

$dot_unix_files = '.latexmkrc', '.screenrc', '.gitconfig', '.gitignore', '.perltidyrc', '.ackrc'
$dot_unix_dirs = '.auto-insert'
#$dot_unix_dirs = '.auto-insert', '.bash'


### Symbolic Link

## Emacs
smartln.ps1 mklink "$unix_dir\.emacs.d\init.el" "$ENV:HOME\.emacs.d\init.el"
foreach ($dir in $dot_emacs_d) {
    smartln.ps1 mklink "$unix_dir\.emacs.d\$dir" "$ENV:HOME\.emacs.d\$dir"
}

## Vim
foreach ($file in $vimrc) {
    smartln.ps1 mklink "$unix_dir\.$file" "$vim_prefix\_$file"
}
smartln.ps1 mklink "$unix_dir\.vim" "$vim_prefix\vimfiles"
smartln.ps1 mklink "$unix_dir\.vim" "$vim_prefix\.vim"

## Dot Files
foreach ($file in $bashrc + $dot_unix_files + $dot_emacs + $dot_unix_dirs) {
    smartln.ps1 mklink "$unix_dir\$file" "$ENV:HOME\$file"
}

## SSH
#smartln.ps1 mklink "$unix_dir\.ssh\config" "$ENV:HOME\.ssh\config"

## texmf
smartln.ps1 mklink "$unix_dir\share\texmf" "$ENV:USERPROFILE\texmf"

## Vimperator
#foreach ($file in .vimperatorrc .muttatorrc) {
#    smartln.ps1 mklink "$dropbox\$file" "$ENV:HOME\$file"
#}
#smartln.ps1 mklink "$dropbox\.vimperator\plugin" "$ENV:HOME\vimperator\plugin"
#smartln.ps1 mklink "$dropbox\.vimperator\conf" "$ENV:HOME\vimperator\conf"

exit 0
