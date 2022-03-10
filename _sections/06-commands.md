---
title: Commands
layout: page
permalink: /commands
---

## Home

You can also see where antidote is keeping the plugins with the `home` command:

```zsh
$ antidote home
/Users/matt/Library/Caches/antidote
```

Of course, you can remove the entire thing with:

```zsh
rm -rf $(antidote home)
```

if you decide to start fresh or to use something else.

If you clear out your plugins, don't forget to also run:

```zsh
rm ${ZDOTDIR:-~}/.zsh_plugins.zsh
```
