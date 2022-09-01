---
title: Completions
layout: page
permalink: /completions
---

## Completions

Antidote is a plugin manager, not a complete Zsh framework. If you have used [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) or [Prezto](https://github.com/sorin-ionescu/prezto) in the past, you might be used to a ton of out-of-the-box features like <kbd>TAB</kbd> completions. To get that with an antidote-based Zsh config, you'll need to set up completions yourself, or use a completions plugin. The good news it that's easy to do!

### Manually Configuring

If you want to manully enable Zsh completions, add the following snippet to your `.zshrc` after you've loaded your plugins.

```zsh
# .zshrc
autoload -Uz compinit && compinit
```

Generating completions can make Zsh slow to open a new shell session, so if you want to get fancy and are worried about performance you could always use caching and compilation to speed things up:

```zsh
# .zshrc
autoload -Uz compinit
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP(#qNmh-20) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi
{
  # compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &!
```

However, once you start to get too fancy you might be better off using a plugin to initialize your completions.

### Using Plugins

For a light-weight but full-featured completions plugin I recommend the [zsh-utils](https://github.com/belak/zsh-utils) micro-framework. You can use everything zsh-utils offers, or just the [completion](https://github.com/belak/zsh-utils/tree/main/completion) portion. To use zsh-utils, simply add the following to your `.zsh_plugins.txt` file:

```zsh
# .zsh_plugins.txt

# add even more completions
zsh-users/zsh-completions

# now, configure and run compinit to initialize completions
belak/zsh-utils path:completion
```

Another option is to use the completion module from [Prezto](https://github.com/sorin-ionescu/prezto/tree/master/modules/completion):

```zsh
# .zsh_plugins.txt

sorin-ionescu/prezto path:modules/completion
```

### Reference Issues:

- [git completions don't work even though zsh-completions is enabled #23](https://github.com/mattmc3/antidote/issues/23)
- [solving command not found: compdef #24](https://github.com/mattmc3/antidote/issues/24)
