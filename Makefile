.PHONY: brew brew_install brew_packages brew_cask_packages pyenv_init pyenv_install_default_python oh-my-zsh vim vim_prequisites vim_github luma_onboarding

brew: brew_install brew_packages brew_cask_packages pyenv_init pyenv_install_default_python

brew_install:
	@echo "Installing Homebrew..."
	sudo true;
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash;
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nir.weber/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

brew_packages:
	@echo "Installing brew packages..."
	brew install pyenv pyenv-virtualenv git vim neovim jq node awscli

brew_cask_packages:
	@echo "Installing cask packages..."
	@for package in iterm2 spotify whatsapp alt-tab font-fira-code; do \
		if ! brew list --cask $$package; then \
			brew install --cask $$package; \
		fi \
	done

pyenv_init:
	@echo "Initializing pyenv..."
	if command -v pyenv 1>/dev/null 2>&1; then \
		eval "$$(pyenv init -)"; \
	fi

pyenv_install_default_python:
	@if pyenv versions --bare | grep -q $$DEFAULT_PYTHON_VERSION; then \
		read -p "Python version $$DEFAULT_PYTHON_VERSION already exists. Do you want to overwrite it? (y/n) " yn; \
		case $$yn in \
			[Yy]* ) pyenv uninstall -f $$DEFAULT_PYTHON_VERSION;; \
			* ) echo "Skipping installation of Python $$DEFAULT_PYTHON_VERSION"; exit 0;; \
		esac; \
	fi; \
	echo "Installing the default Python version ($$DEFAULT_PYTHON_VERSION) with pyenv..."; \
	pyenv install $$DEFAULT_PYTHON_VERSION; \
	pyenv global $$DEFAULT_PYTHON_VERSION
	python -m ensurepip --upgrade

oh-my-zsh:
	@echo "Installing oh-my-zsh..."
	-~/.dotfiles/sh_files/check_and_overwrite.sh ~/.oh-my-zsh "installation of oh-my-zsh" && (rm -rf ~/.oh-my-zsh; curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh)
	-~/.dotfiles/sh_files/check_and_overwrite.sh ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions "cloning of zsh-autosuggestions" && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	-~/.dotfiles/sh_files/check_and_overwrite.sh ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting "cloning of zsh-syntax-highlighting" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	-~/.dotfiles/sh_files/check_and_overwrite.sh ~/.zshrc "linking of ~/.zshrc" && [ ! -f ~/.zshrc ] && ln -s ~/.dotfiles/.zshrc ~/.zshrc

vim: vim_prequisites vim_github

vim_prequisites:
	@echo "Installing vim prerequisites..."
	curl -sL install-node.now.sh | sudo bash && curl --compressed -o- -L https://yarnpkg.com/install.sh | sudo bash
	pyenv global $$DEFAULT_PYTHON_VERSION
	cd ~ && pip install pynvim

vim_github:
	@echo "Installing vim packages from GitHub..."
	mkdir -p ~/.vim/pack/plugins/start
	cd ~/.vim/pack/plugins/start && \
	~/.dotfiles/sh_files/check_and_overwrite.sh ctrlp "cloning of ctrlp" && git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp || true
	cd ~/.vim/pack/plugins/start && \
	~/.dotfiles/sh_files/check_and_overwrite.sh lightline "cloning of lightline" && git clone https://github.com/itchyny/lightline.vim lightline || true
	cd ~/.vim/pack/plugins/start && \
	~/.dotfiles/sh_files/check_and_overwrite.sh Jenkinsfile-vim-syntax "cloning of Jenkinsfile-vim-syntax" && git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git Jenkinsfile-vim-syntax || true
	mkdir -p ~/.local/share/nvim/site/pack/coc/start
	cd ~/.local/share/nvim/site/pack/coc/start && \
	~/.dotfiles/sh_files/check_and_overwrite.sh coc.nvim "cloning of coc.nvim" && git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1 || true
	nvim -c "helptags coc.nvim/doc/ | q"

luma_onboarding:
	@echo "Onboarding to luma..."
	cd $$PATH_TO_WORKSPACE_DIR && \
	~/.dotfiles/sh_files/clone_and_setup.sh internal-tools && \
	~/.dotfiles/sh_files/clone_and_setup.sh synergy && \
	~/.dotfiles/sh_files/clone_and_setup.sh task_manager_airflow && \
	~/.dotfiles/sh_files/clone_and_setup.sh config && \
	~/.dotfiles/sh_files/clone_and_setup.sh dbt-luigi