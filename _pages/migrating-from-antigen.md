---
title: Migrating From Antigen
layout: page
permalink: /migrating-from-antigen
---

If you are migrating from [Antigen](https://github.com/zsh-users/antigen) to Antidote, there are some key differences. Simply replacing the word `antigen` with `antidote` in your Zsh configuration won't work.

## Dynamic loading

Antigen encouraged the concept of dynamically loading plugins. Antidote, on the other hand, encourages using the static loading method for speed. However, you can still use the dynamic load mechanism if speed isn't your primary concern. For static loading, the main documentation should help you to convert. This document only explores dynamic loading, which is the easiest migration from antigen.

With dynamic bundling, every time a new shell starts antidote will apply the plugins given to it. For this to work, antidote needs to be put in dynamic mode, which is done via this line:

```zsh
# ~/.zshrc
source <(antidote init)
```

Antigen's [quick start guide](https://github.com/zsh-users/antigen/wiki/Quick-start) details things like loading via a HEREDOC. Antidote also supports this. So a sample config to get you going could look like this:

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

# Bundle Fish-like auto suggestions.
antidote bundle zsh-users/zsh-autosuggestions

# Bundle extra zsh completions.
antidote bundle zsh-users/zsh-completions

# OR - load bundles with a HEREDOC.
antidote bundle <<EOBUNDLES
    # Antidote doesn't have the 'use' command like antigen,
    # but instead you can accomplish the same via annotations:

    # Bundles from the ohmyzsh libs/plugins
    ohmyzsh/ohmyzsh path:lib/clipboard.zsh
    ohmyzsh/ohmyzsh path:plugins/git
    ohmyzsh/ohmyzsh path:plugins/extract

    # Syntax highlighting bundle
    zsh-users/zsh-syntax-highlighting

    # Search history like Fish
    zsh-users/zsh-history-substring-search
EOBUNDLES

# `antigen apply` has no equivalent.
# There's no need to run 'apply' with antidote.
```
