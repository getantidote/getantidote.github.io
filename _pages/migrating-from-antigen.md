---
title: Migrating From Antigen
layout: page
permalink: /migrating-from-antigen
---

If you are migrating from [antigen](https://github.com/zsh-users/antigen) to antidote, there are some key differences. Simply replacing the word `antigen` with `antidote` in your Zsh configuration won't work the way it would migrating from `antibody`, but it's not too difficult. Let's walk through a sample config.

## Dynamic loading

Antigen dynamically loads plugins. Antidote, on the other hand, encourages creating a static file for speed. But, you can easily use antidote to dynamically load plugins just like antigen if speed isn't your primary concern. Dynamic bundling is the easiest migration path from an existing antigen config.

With dynamic bundling, every time a new shell starts antidote will source the plugins given to it. For this to work, antidote needs to be put in dynamic mode, which is done via this line:

```zsh
source <(antidote init)
```

Antigen's [quick start guide](https://github.com/zsh-users/antigen/wiki/Quick-start) details loading bundles via a HEREDOC. Antidote also supports this.

Here's an example antidote config similar to what you might have already with antigen:

```zsh
# ~/.zshrc

# Clone antidote if necessary.
[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Source antidote.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Initialize antidote's dynamic mode, which changes `antidote bundle`
# from static mode.
source <(antidote init)

# Bundle Fish-like auto suggestions just like you would with antigen.
antidote bundle zsh-users/zsh-autosuggestions

# Bundle extra zsh completions too.
antidote bundle zsh-users/zsh-completions

# Antidote doesn't have the 'use' command like antigen,
# but instead you can accomplish the same via annotations:

# Bundle oh-my-zsh libs and plugins with the 'path:' annotation
ohmyzsh/ohmyzsh path:lib/clipboard.zsh
ohmyzsh/ohmyzsh path:plugins/git
ohmyzsh/ohmyzsh path:plugins/extract

# OR - you might want to load bundles with a HEREDOC.
antidote bundle <<EOBUNDLES
    # Bundle syntax-highlighting
    zsh-users/zsh-syntax-highlighting

    # Bundle with a git URL
    https://github.com/zsh-users/zsh-history-substring-search
EOBUNDLES

# No need to run something like `antigen apply`.
# antidote has no equivalent because your plugins are
# sourced when they are bundled.
```
