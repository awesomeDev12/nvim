# Neovim Config

## Installation

#### For Arch
```
sudo pacman -S nvim
```

#### For Ubuntu

###### Snap Store method
```
sudo snap install nvim --classic
```

###### PPA method [link](https://www.linuxcapable.com/how-to-install-neovim-editor-on-ubuntu-22-04-lts/)

```
# Make your Ubuntu system up-to-date by using the following command

sudo apt update && sudo apt upgrade -y

# Install the following dependencies

sudo apt install software-properties-common -y

# Import the PPA using the following command
# Please note that only one version can be installed simultaneously
# So if you import both stable and unstable versions 
# Then unstable version will be installed as it is the newest version

# Import Stable Neovim PPA

sudo add-apt-repository ppa:neovim-ppa/stable -y

# Import Unstable Neovim PPA

sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Run an APT update to sync the changes

sudo apt-get update

# With the PPA imported, install the editor

sudo apt install neovim -y
```

### Also install nodejs (for coc.nvim)

For Arch 
```
sudo pacman -S nodejs
sudo pacman -S npm
sudo pacman -S npm update
sudo npm i -g yarn
sudo npm i -g neovim
```

For Ubuntu
```
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -

sudo apt-get install nodejs

# If possible update npm

# Install yarn
sudo npm i -g yarn
sudo npm i -g neovim
```


## To use my config file

#### Clone this repository

###### Clone using HTTPS method
```
git clone https://github.com/awesomeDev12/nvim.git ~/.config/nvim
```

OR

###### Clone using Github CLI (Recommended)
```
gh repo clone awesomeDev12/nvim ~/.config/nvim
```

#### Install packer plugin manager
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

#### For snippets

```
CocInstall coc-snippets
```

Use my snippets
```
gh repo clone awesomeDev12/ultisnips ~/.config/coc/ultisnips
```

### Language Support

#### For cpp
```
CocInstall coc-clangd
CocCommand clangd.install
```
Remember to comment out the path to clangd in coc-settings.json
for consistency among devices

#### For python
```
CocInstall coc-jedi
CocInstall coc-pyright
```

For Ubuntu
```
sudo apt install python3-pip
pip install venvs

#Install in virtualenv
python3 -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate && python3 -m pip install --upgrade pip && python3 -m pip install pynvim && which python

# Run this command if the above the command is not working
# Check version before installing (Its needed for debian systems)
sudo apt install python3.10-venv
```

For Arch
```
sudo pacman -S python-pip
pip install venvs

#Install in virtualenv
python -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate && python3 -m pip install --upgrade pip && python3 -m pip install pynvim && which python
```



#### For html,css
```
CocInstall coc-html
CocInstall coc-css
```

#### For javascript and typescript
```
CocInstall coc-tsserver
```


#### For markdown fies 
You need **iamcco/markdown-preview.nvim** plugin installed

If markdown preview is not working 
Then reinstall this plugin after installing yarn 

- Comment out the plugin name in lua/packer-plugins.lua
- Run :PackerSync
- Delete the plugin

- Uncomment the plugin name in lua/packer_plugins.lua
- Restart nvim
- Run :PackerSync


## My Reference for Python

Create a virtualenv
```
python -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate && python3 -m pip install --upgrade pip && python3 -m pip install pynvim && which python
```

Set that path so that nvim reconizes it
```
vim.g.python_host_prog=""
vim.g.python3_host_prog=""
```

to activate
```
source ~/venvs/.nvim-venv/bin/activate
```

[Python Virtualenv Stackoverflow](https://stackoverflow.com/questions/67951453/python-and-nvim-how-to-activate-both-global-and-local-virtual-env-at-the-same-t)


The virtualenv that the python_host_prog is pointing to is not for the virtual environment that the python 
language server uses. It is for nvim to use on python plugins. So you can have a separate virtual environment 
to use to execute the plugins that has pynvim installed and then your virtual environment for your project.
python3 -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate && python3 -m pip install pynvim 
&& which python
Then you can take the output from which python and put that in your init.vim as g:python_host_prog and 
g:python3_host_prog.
Now you can deactivate and go work on a project. Activate your project's virtualenv and start up nvim.
You can :checkhealth and see that the python provider is looking at the virtualenv we created earlier.
Your Python virtual env provider should be set to the project you are in. The virtualenv provider is the one that I believe coc-pyright uses for providing intellisense and it is also the one that will be used when running !python. So everything will work as intended. Now if you install a python nvim plugin that needs pynvim, it will be available but like @fannheyward said, it is unnecessary for coc-pyright because it doesn't use the python nvim interface that pynvim provides.
It is a bit confusing because nvim will look for a provider to use for itself if one is not explicitly provided 
and the project virtualenv python is in that resolution chain. So the purpose of the virtual env provider and
python provider can easily be confused.

