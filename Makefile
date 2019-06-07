DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
SHELL        := /bin/sh
UNAME        := $(shell uname -s)
USER         := $(shell whoami)
OS           := linux

.PHONY: all install

all: install

install: $(OS)

.PHONY: help usage
.SILENT: help usage

help: usage

usage:
	printf "\\n\
	\\033[1mDOTFILES\\033[0m\\n\
	\\n\
	Custom settings and configurations for Unix-like environments.\\n\
	See README.md for detailed usage information.\\n\
	\\n\
	\\033[1mUSAGE:\\033[0m make [target]\\n\
	\\n\
	  make         Install all configurations and applications.\\n\
	\\n\
	  make link    Symlink only Bash and Vim configurations to the home directory.\\n\
	\\n\
	  make unlink  Remove symlinks created by \`make link\`.\\n\
	\\n\
	"

.PHONY: linux link config unlink

linux: stow config

link:
	ln -fs $(DOTFILES_DIR)/bash/.bash $(HOME)/.bash
	ln -fs $(DOTFILES_DIR)/bash/.bashrc $(HOME)/.bashrc
	ln -fs $(DOTFILES_DIR)/git/.gitconfig $(HOME)/.gitconfig
	ln -fs $(DOTFILES_DIR)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -fs $(DOTFILES_DIR)/vim/.vimrc $(HOME)/.vimrc

unlink:
	unlink $(HOME)/.bash
	unlink $(HOME)/.bashrc
	unlink $(HOME)/.gitconfig
	unlink $(HOME)/.tmux.conf
	unlink $(HOME)/.vimrc
	@printf "\\033[32m✓\\033[0m Symlinks removed. Manually remove ~/dotfiles directory if needed.\\n"

.PHONY: stow

config:
	bash $(DOTFILES_DIR)/config.sh

stow:
	stow bash
	stow bin
	stow git
	stow tmux
	stow vim
