---
title: Commands
layout: page
permalink: /commands
---

Let’s look what other commands antidote has available for us!

## Home

You can also see where antidote is keeping the plugins with the `home` command:

```console
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
rm ~/.zsh_plugins.zsh
```

## Install

You can quickly add a plugin to your plugins file with `antidote install`:

```console
$ antidote install zsh-users/zsh-autosuggestions
Bundle 'zsh-users/zsh-autosuggestions' added to '/Users/matt/.zsh_plugins.txt'.
```

If you have an alternate location for your plugins file, you can provide that too:

```console
$ antidote install zsh-users/zsh-history-substring-search ${ZDOTDIR:-~}/myplugins.conf
Bundle 'zsh-users/zsh-history-substring-search' added to '/Users/matt/.zsh/myplugins.conf'.
```

Don't forget to reload zsh afterwards to load the plugin you just added!

## List

If you want to see what plugins you have in your home folder, you can of course list
them:

```console
$ antidote list
https://github.com/zsh-users/zsh-autosuggestions                 /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions
https://github.com/zsh-users/zsh-history-substring-search        /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search
# ...
```

## Load

The core command for loading your plugins file from your `.zshrc`. It takes a parameter
for your plugins file, or defaults to `.zsh_plugins.txt` if no file provided:

```zsh
# .zshrc
# make a static plugins file and source it to load all your plugins
antidote load
```

With a specified plugins file:

```zsh
# .zshrc
antidote load ${ZDOTDIR:-~}/myplugins.conf
```

## Path

You can see the path being used for a cloned bundle.

```console
$ antidote path ohmyzsh/ohmyzsh
/Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh
```

This is particularly useful for projects like oh-my-zsh that rely on storing its path in
the `$ZSH` environment variable:

```zsh
$ ZSH=$(antidote path ohmyzsh/ohmyzsh)
```

## Purge

You can remove a bundle completely by purging it:

```console
$ antidote purge ohmyzsh/ohmyzsh
Removing ohmyzsh/ohmyzsh...
```

## Update

Antidote can update itself, and all bundles in a single pass.

Just run:

```console
$ antidote update
Updating antidote...
Updating f6c4391..7b8d560
...
Updating all bundles in /Users/matt/Library/Caches/antidote...
...
```
