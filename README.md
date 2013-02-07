dots
====

private dotfiles

for file in $(find . -name '*rc'); do ln -s `readlink -f $file` /root/`basename $file`; done
cp .gitconfig /root
