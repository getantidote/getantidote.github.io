---
title: Options
layout: page
permalink: /options
---

There are a few options you can use that should cover most common use cases. Let's take
a look!

## Kind

The `kind` annotation can be used to determine how a bundle should be treated.

### kind:zsh

The default is `kind:zsh`, which will look for files that match these globs:

- `*.plugin.zsh`
- `*.zsh`
- `*.sh`
- `*.zsh-theme`

And `source` them.

Example:

```zsh
$ antidote bundle zsh-users/zsh-autosuggestions kind:zsh
fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions )
source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
```

### kind:path

The `kind:path` mode will just put the plugin folder in your `$PATH`.

Example:

```zsh
$ antidote bundle romkatv/zsh-bench kind:path
export PATH="/Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-bench:$PATH"
```

### kind:fpath

The `kind:fpath` only puts the plugin folder on the fpath, doing nothing else. It can be
especially useful for completion scripts that aren't intended to be sourced directly, or
for prompts that support `promptinit`.

Example:

```zsh
$ antidote bundle sindresorhus/pure kind:fpath
fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure )
```

### kind:clone

The `kind:clone` only gets the plugin, doing nothing else. It can be useful for managing
a package that isn't directly used as a shell plugin.

Example:

```console
$ antidote bundle mbadolato/iTerm2-Color-Schemes kind:clone
```

### kind:defer

The `kind:defer` option defers loading of a plugin. This can be useful for plugins you
don't need available right away or are slow to load. [Use with caution][deferred-init].

Example:

```zsh
$ antidote bundle olets/zsh-abbr kind:defer
if ! (( $+functions[zsh-defer] )); then
  fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer )
  source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer/zsh-defer.plugin.zsh
fi
fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-olets-SLASH-zsh-abbr )
zsh-defer source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-olets-SLASH-zsh-abbr/zsh-abbr.plugin.zsh
```

## Branch

You can also specify a branch to download, if you don't want the `main` branch for
whatever reason.

Example:

```zsh
$ antidote bundle zsh-users/zsh-autosuggestions branch:develop
fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions )
source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
```

## Path

You may specify a subfolder or a specific file if the repo you are bundling contains
multiple plugins. This is especially useful for frameworks like
[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh).

File Example:

```zsh
$ antidote bundle ohmyzsh/ohmyzsh path:lib/clipboard.zsh
source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/clipboard.zsh
```

Folder Example:

```zsh
$ antidote bundle ohmyzsh/ohmyzsh path:plugins/magic-enter
fpath+=( /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/magic-enter )
source /Users/matt/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/magic-enter/magic-enter.plugin.zsh
```

## Friendly Names

You can also change how Antidote names the plugin directories by adding this to your
`.zshrc`:

```zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'
```

Now, the directories where plugins are stored is nicer to read. For example:

`https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions`
becomes `zsh-users__zsh-autosuggestions`.

```zsh
$ antidote bundle zsh-users/zsh-autosuggestions
fpath+=( /Users/matt/Library/Caches/antidote/zsh-users__zsh-autosuggestions )
source /Users/matt/Library/Caches/antidote/zsh-users__zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
```
