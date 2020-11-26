# [bizzk3t](repo)’s basic dotfiles
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/bizzk3t/basic-dotfiles/CI)
![GitHub](https://img.shields.io/github/license/bizzk3t/basic-dotfiles)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/bizzk3t/basic-dotfiles)

```sh
curl -L https://git.io/Jk2oa | sh
wget -O- https://git.io/Jk2oa | sh
```

[https://git.io/Jk2oa](https://git.io/Jk2oa) is short for [https://raw.githubusercontent.com/bizzk3t/basic-dotfiles/main/install.sh](https://raw.githubusercontent.com/bizzk3t/basic-dotfiles/main/install.sh)

To run tests locally

```sh
docker run alpine /bin/sh -c 'apk add git && wget -O- https://git.io/Jk2oa | sh && cd $HOME/.dotfiles && ./test.sh'

$ docker run -v $PWD:/mnt alpine /bin/sh -c 'cd /mnt && apk add git && wget -O- https://git.io/Jk2oa | sh && cd $HOME/.dotfiles && ./test.sh'
```
