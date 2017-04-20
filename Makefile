DOTPATH=`pwd`

install: install_git_autocomplete link_dotfiles
.PHONY: install
.default: install

link_dotfiles:
	echo "=== Linking Dotfiles ===\n"
	ln -sf $(DOTPATH)/gitconfig ~/.gitconfig
	ln -sf $(DOTPATH)/gitignore ~/.gitignore
	ln -sf $(DOTPATH)/bash_profile ~/.bash_profile
	ln -sf $(DOTPATH)/vimrc.vim ~/.vimrc
	ln -sf $(DOTPATH)/tmux.conf ~/.tmux.conf
.PHONY: link_dotfiles

install_git_autocomplete:
	echo "=== Downloading git-completion.bash ===\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash
.PHONY: install_git_autocomplete
