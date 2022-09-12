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

## Install with a plugin manager

antidote may also be available in your system's plugin manager:

- [homebrew](https://formulae.brew.sh/formula/antidote): `brew install antidote`
- [Arch AUR](https://aur.archlinux.org/packages/zsh-antidote): `yay -S antidote`

## .zshrc

After installation, the simplest way to use antidote is to call the `antidote load` command from your `.zshrc`:

```zsh
# now, simply add these two lines in your ~/.zshrc

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
```

## Ultra high performance install

If you want to squeeze every last drop of performance out of your antidote config, you can do all the things `antidote load` does for you on your own. If you're fairly comfortable with zsh, this is a more robust `.zshrc` snippet you can use:

```zsh
# ~/.zshrc

# You can change the names/locations of these if you prefer.
antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    source $antidote_dir/antidote.zsh
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle <$plugins_txt >$static_file
  )
fi

# Uncomment this if you want antidote commands like `antidote update` available
# in your interactive shell session:
# autoload -Uz $antidote_dir/functions/antidote

# source the static plugins file
source $static_file

# cleanup
unset antidote_dir plugins_file static_file
```

This method boils down to only the bare essentials and only runs antidote if absolutely necessary. However, note that you'll really only be saving small fractions of a second over simply using `antidote load` directly.
