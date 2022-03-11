---
title: Commands
layout: page
permalink: /commands
---

Let’s look what other commands antidote has available for us!

## Update

Antidote can update all bundles in a single pass.

Just run:

```zsh
$ antidote update
Updating all bundles in /Users/matt/Library/Caches/antidote...
```

and that’s it.

## Purge

You can remove a bundle completely by purging it:

```zsh
$ antidote purge ohmyzsh/ohmyzsh
Removing ohmyzsh/ohmyzsh...
```

## List

If you want to see what plugins you have in your home folder, you can of course list
them:

```zsh
$ antidote list
https://github.com/Tarrasch/zsh-bd            /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-Tarrasch-SLASH-zsh-bd
https://github.com/caarlos0/git-add-remote    /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-git-add-remote
# ...
```

## Path

You can see the path being used for a cloned bundle.

```zsh
$ antidote path ohmyzsh/ohmyzsh
/Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh
```

This is particularly useful for projects like oh-my-zsh that rely on storing its path in
the `$ZSH` environment variable:

```zsh
$ ZSH=$(antidote path ohmyzsh/ohmyzsh)
```

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
