---
title: Installation
layout: page
permalink: /install
---

The simplest way to use antidote is to call the `antidote load` command from your
`.zshrc`:

```zsh
# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load
```

## Ultra high performance install

To squeeze out every last drop of performance, you can do all the things `antidote load`
does for you on your own. This is the `.zshrc` snippet you can use:

```zsh
# clone antidote if necessary and generate a static plugin file
zhome=${ZDOTDIR:-$HOME}
if [[ ! $zhome/.zsh_plugins.zsh -nt $zhome/.zsh_plugins.txt ]]; then
  [[ -e $zhome/.antidote ]] \
    || git clone --depth=1 https://github.com/mattmc3/antidote.git $zhome/.antidote
  [[ -e $zhome/.zsh_plugins.txt ]] || touch $zhome/.zsh_plugins.txt
  (
    source $zhome/.antidote/antidote.zsh
    antidote bundle <$zhome/.zsh_plugins.txt >$zhome/.zsh_plugins.zsh
  )
fi

# uncomment if you want your session to have commands like `antidote update`
# autoload -Uz $zhome/.antidote/functions/antidote

# source static plugins file
source $zhome/.zsh_plugins.zsh
unset zhome
```

This method boils down to only the bare essentials. However, note that you'll really
only be saving small fractions of a second over using `antidote load` directly.
