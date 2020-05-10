#!/bin/bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

git pull
git submodule update --init --recursive --remote --merge
yes|cp -r .vim .vimrc vim-plugin ~/

# coc-nvim 需要
# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
    # Or use apt-get
    # sudo apt-get install nodejs
fi

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

# tips
echo "安装 go:"
echo "vim +GoInstallBinaries"
echo "vim +CocInfo"
echo "add the follow to :CocConfig:"
echo "
{
  "go.goplsOptions": {
    "completeUnimported": true
  }
}
"
