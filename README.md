vim
===
git push configuration sample: 
.git/config
 [core]
   repositoryformatversion = 0
   filemode = true
   bare = false
   logallrefupdates = true
 [remote "origin"]
   fetch = +refs/heads/*:refs/remotes/origin/*
   url = git@github.com:backyes/vim.git
[branch "master"]
   remote = origin
   merge = refs/heads/master
