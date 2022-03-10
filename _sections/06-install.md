---
title: Installation
layout: page
permalink: /install
---

To get the best performance and a seamless install of antidote, the recommended install
method is to add the following snippet to your `.zshrc`:

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
autoload -Uz $zhome/.antidote/functions/antidote
source $zhome/.zsh_plugins.zsh
unset zhome
```
