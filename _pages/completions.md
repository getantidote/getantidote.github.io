---
title: Completions
layout: page
permalink: /completions
---

## Completions

Antidote is a plugin manager, not a complete Zsh framework. If you have used
[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) or
[Prezto](https://github.com/sorin-ionescu/prezto) in the past, you might be used to a
ton of out-of-the-box features like <kbd>TAB</kbd> completions. To get that with an
antidote-based Zsh config, you'll need to set up completions yourself, or use a plugin
that initializes completions. The good news it that's easy to do!

### Manually Configuring

If you want to manually enable Zsh completions, add the following snippet to your
`.zshrc` after you've loaded your plugins.

```zsh
# .zshrc
autoload -Uz compinit && compinit
```

Generating completions can make Zsh slow to open a new shell session, so if you want to
get fancy and are worried about performance you could always use caching and compilation
to speed things up. But once you do that, you may be much better off using a plugin
built to do this.

### Using Plugins

For an easy to use completions plugin I recommend [ez-compinit](https://github.com/mattmc3/ez-compinit).

```zsh
# run towards the TOP of your .zsh_plugins.txt before any compdef calls
mattmc3/ez-compinit

# you can even add more completions later
zsh-users/zsh-completions
```

Alternatively, for a light-weight but full-featured completions plugin you could also
use the [zsh-utils](https://github.com/belak/zsh-utils) micro-framework. You can use
everything zsh-utils offers, or just the
[completion](https://github.com/belak/zsh-utils/tree/main/completion) portion. To use
zsh-utils, simply add the following to your `.zsh_plugins.txt` file:

```zsh
# .zsh_plugins.txt

# add completions functions to fpath
zsh-users/zsh-completions kind:fpath path:src

# run towards the BOTTOM of your .zsh_plugins.txt after fpath is populated
belak/zsh-utils path:completion
```

### Reference Issues:

- [git completions don't work even though zsh-completions is enabled #23](https://github.com/mattmc3/antidote/issues/23)
- [solving command not found: compdef #24](https://github.com/mattmc3/antidote/issues/24)
- [Local completion not working for asdf](https://github.com/mattmc3/antidote/issues/182)
