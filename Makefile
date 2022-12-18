

brew:
	brew_install
	brew_packages
	brew_cask_packages

brew_install:
	sudo true;
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash;
	
brew_packages:
	brew install pyenv pyenv-virtualenv git vim neovim jq node

brew_cask_packages:
	brew install --cask iterm2 spotify whatsapp alt-tab font-fira-code

oh-my-zsh:
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -c
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	ln -s ~/.dotfiles/.zshrc ~/.zshrc

vim:
	vim_prequisites
	vim_github

vim_prequisites:
	curl -sL install-node.now.sh | bash && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
	cd ~ &&	pip install pynvim

vim_github:
	# Install Direct Packages
	mkdir -p ~/.vim/pack/plugins/start/ && cd ~/.vim/pack/plugins/start
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp
	git clone https://github.com/itchyny/lightline.vim lightline
	git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git Jenkinsfile-vim-syntax
	# Install COC
	mkdir -p ~/.local/share/nvim/site/pack/coc/start
	cd ~/.local/share/nvim/site/pack/coc/start
	git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
	nvim -c "helptags coc.nvim/doc/ | q"
