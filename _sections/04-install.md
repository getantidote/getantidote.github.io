---
title: Installation
layout: page
permalink: /install
---

## Install with git

You can install the latest release of antidote by cloning it with `git`:

```zsh
# first, run this from an interactive zsh terminal session:
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
```

## Install with a package manager

antidote may also be available in your system's package manager:

- [homebrew](https://formulae.brew.sh/formula/antidote): `brew install antidote`
- [Arch AUR](https://aur.archlinux.org/packages/zsh-antidote): `yay -S zsh-antidote`

## .zshrc

After installation, the recommended way to use antidote is to call the `antidote load` command from your `.zshrc`:

```zsh
# now, simply add these two lines in your ~/.zshrc

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
```

**Note:** If you installed antidote with a package manager, the path will be different
than `${ZDOTDIR:-~}/.antidote`. For example, if you are using homebrew on macOS, the
command you will need will be:
`source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh`.
Be sure to follow the instructions provided by your package manager.

## Ultra high performance install

If you want to squeeze every last drop of performance out of your antidote config, you can do all the things `antidote load` does for you on your own. If you're fairly comfortable with zsh, this is a more robust `.zshrc` snippet you can use:

```zsh
# ~/.zshrc

# Set the name of the static file antidote will generate.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Generate the static plugin file if .zsh_plugins.txt has been updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
  (
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins:r}.txt >$zsh_plugins
  )
fi

# Uncomment this if you want to make the antidote command available:
# fpath+=(${ZDOTDIR:-~}/.antidote)
# autoload -Uz antidote

# Source your static plugins file.
source $zsh_plugins
```

This method boils down to only the bare essentials and only runs antidote if absolutely necessary. However, note that you'll really only be saving small fractions of a second over calling the much simpler `antidote load` command directly.
