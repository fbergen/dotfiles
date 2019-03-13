#key /trqA4+lAq/KrqWTMOJg3C8kjVPmHfiGidLFx/mn
DOTPATH=`pwd`
UNAME_S := $(shell uname -s)

install: osx install_git_scripts install_completion link_dotfiles
.PHONY: install
.default: install

link_dotfiles:
	@echo "=== Linking Dotfiles ===\n"
	# To add a new submodule, run: git submodule add 
	git submodule update --init --recursive
	ln -sf $(DOTPATH)/gitconfig ~/.gitconfig
	ln -sf $(DOTPATH)/gitignore ~/.gitignore
	ln -sf $(DOTPATH)/bash_profile ~/.bash_profile
	ln -sf $(DOTPATH)/vimrc ~/.vimrc
	ln -sf $(DOTPATH)/vim ~/.vim
	ln -sf $(DOTPATH)/tmux.conf ~/.tmux.conf
	ln -sf $(DOTPATH)/inputrc ~/.inputrc
	ln -sf $(DOTPATH)/karabiner.json ~/.config/karabiner/karabiner.json
	mkdir -p ~/.config/htop
	ln -sf $(DOTPATH)/htoprc ~/.config/htop/htoprc
	ln -sf $(DOTPATH)/scripts ~/.scripts
.PHONY: link_dotfiles

install_git_scripts:
	@echo "=== Downloading git-completion.bash ===\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash

	@echo "=== Downloading git-prompt.bash ===\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/git-prompt.sh

.PHONY: install_git_autocomplete

install_completion:
	@echo "=== Downloading docker completion script===\n"
	sudo curl -L https://raw.githubusercontent.com/docker/compose/1.17.0/contrib/completion/bash/docker-compose -o /usr/local/etc/bash_completion.d/docker-compose
.PHONY: install_completion



# Setup Mac
osx:
ifeq ($(UNAME_S), Darwin)
	@echo "=== Setting up a mac ==="
	$(DOTPATH)/osx/brew.sh
	$(DOTPATH)/osx/osx.sh
endif
$(DOTPATH)/install.sh
.PHONY: osx
