---
title: Troubleshooting
layout: page
permalink: /troubleshooting
---

## Bug reports/Feature requests

Feel free to suggest a new feature or file a bug report [here](https://github.com/mattmc3/antidote/issues).

## Common issues

### no such file or directory

**Problem:** If you get a "no such file or directory" error, it may be because your `~/.zsh_plugins.zsh` static file is out of date. This can happen if you remove your antidote home with `rm -rf $(antidote home)` and need to re-download your plugins.

```zsh
~/.zsh_plugins.zsh:source:3: no such file or directory ~/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
```

**Solution:** Simply delete your `~/.zsh_plugins.zsh` static file and reload Zsh. If you followed the recommended installation procedure and have antidote configured correctly, the static file should be regenerated.

If that isn't working for you, you can run this command:

```zsh
# re-generate ~/.zsh_plugins.zsh
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
```

### completions

Antidote is simply a plugin manager, not a complete Zsh framework. If you have used [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) or [Prezto](https://github.com/sorin-ionescu/prezto) in the past, you might be used to a ton of out-of-the-box features like <kbd>TAB</kbd> completions. To get that with an antidote-based Zsh config, you'll need to set up completions yourself, or use a completions plugin.

### configuring completions

If you want to manully enable Zsh completions, the following snippet needs to go towards the end of your `.zshrc`.

```zsh
# .zshrc
autoload -Uz compinit && compinit
```

Generating completions can be slow, so if you want to get fancy and are worried about performance you could always use caching and compilation to speed things up:

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

But, once you start to get too fancy, you're probably be better off using a plugin.

### completions plugins

For a light-weight but full-featured completions plugin I recommend the [zephyr](https://github.com/mattmc3/zephyr) micro-framework. You can use everything zephyr offers, or just the completions portion by simply adding the following to your `.zsh_plugins.txt` file:

```zsh
# .zsh_plugins.txt

# use all of zephyr
mattmc3/zephyr

# use just zephyr's completions
mattmc3/zephyr path:plugins/completions
```

Another option is to use the completion module from [Prezto](https://github.com/sorin-ionescu/prezto):

```zsh
# .zsh_plugins.txt

sorin-ionescu/prezto path:modules/completion
```

Reference Issues:
- [git completions don't work even though zsh-completions is enabled #23](https://github.com/mattmc3/antidote/issues/23)
- [solving command not found: compdef #24](https://github.com/mattmc3/antidote/issues/24)
