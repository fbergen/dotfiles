DOTPATH=`pwd`
UNAME_S := $(shell uname -s)

install: osx install_git_scripts link_dotfiles
.PHONY: install
.default: install

link_dotfiles:
	echo "=== Linking Dotfiles ===\n"
	ln -sf $(DOTPATH)/gitconfig ~/.gitconfig
	ln -sf $(DOTPATH)/gitignore ~/.gitignore
	ln -sf $(DOTPATH)/bash_profile ~/.bash_profile
	ln -sf $(DOTPATH)/vimrc ~/.vimrc
	ln -sf $(DOTPATH)/vim ~/.vim
	ln -sf $(DOTPATH)/tmux.conf ~/.tmux.conf
	ln -sf $(DOTPATH)/inputrc ~/.inputrc
.PHONY: link_dotfiles

install_git_scripts:
	echo "=== Downloading git-completion.bash ===\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash

	echo "=== Downloading git-prompt.bash ===\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/git-prompt.sh
.PHONY: install_git_autocomplete

# Setup Mac
osx:
ifeq ($(UNAME_S), Darwin)
	echo "- Setting up a mac"
	$(DOTPATH)/osx/brew.sh
endif
.PHONY: osx
