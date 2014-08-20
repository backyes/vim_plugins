#!/bin/sh
#authur backyes@gmail.com

user=$1
vim_dir=/usr/share/vim/vim73

if [ -z "$user" ]; then 
  echo "./install <user>"
  echo "please input user name!!"
  exit 0
else 
  if [ $user = "root" ]; then 
    user_dir="/$user"
  else 
    user_dir="/home/$user"
  fi
fi 

echo "install ssh config to $user_dir"
cp config $user_dir/.ssh/

echo "install ctags and cscope scripts to $user_dir" 
cp cscope_tags.sh cscope_kernel.sh $user_dir/

echo "install expect login script to $user_dir"
cp -r expect $user_dir

echo "install vim configuration"
cp vimrc $user_dir/.vimrc -f 
cp -r vim $user_dir/.vim
if [ ! -d "$vim_dir" ]; then 
  echo "Only support vim73 version"
  exit 0
fi
cp -r vim_color_in_usrsharevim/* $vim_dir/colors

echo "install yumgroup develop tools and library"
yum groupinstall  "Development Libraries"
yum groupinstall "Development Tools"
