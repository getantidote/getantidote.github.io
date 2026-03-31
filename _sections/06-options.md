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
fpath+=( "$HOME/.cache/repos/github.com/zsh-users/zsh-autosuggestions" )
source "$HOME/.cache/repos/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
```

### kind:path

The `kind:path` mode will just put the plugin folder in your `$PATH`.

Example:

```console
$ antidote bundle romkatv/zsh-bench kind:path
export PATH="$HOME/.cache/repos/github.com/romkatv/zsh-bench:$PATH"
```

### kind:fpath

The `kind:fpath` only puts the plugin folder on the fpath, doing nothing else. It can be
especially useful for completion scripts that aren't intended to be sourced directly, or
for prompts that support `promptinit`.

Example:

```console
$ antidote bundle sindresorhus/pure kind:fpath
fpath+=( "$HOME/.cache/repos/github.com/sindresorhus/pure" )
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
don't need available right away or are slow to load. [Use with caution](https://github.com/romkatv/zsh-bench#deferred-initialization).

Example:

```zsh
$ antidote bundle olets/zsh-abbr kind:defer
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/.cache/repos/github.com/romkatv/zsh-defer" )
  source "$HOME/.cache/repos/github.com/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/.cache/repos/github.com/olets/zsh-abbr" )
zsh-defer source "$HOME/.cache/repos/github.com/olets/zsh-abbr/zsh-abbr.plugin.zsh"
```

### kind:autoload

The `kind:autoload` option autoloads all functions in the bundle directory instead
of sourcing a plugin file. This is useful for repos that contain a collection of functions.
Unlike `autoload:<path>`, `kind:autoload` changes the bundle's primary load behavior.

Example:

```console
$ antidote bundle sorin-ionescu/prezto path:modules/utility/functions kind:autoload
fpath+=( "$HOME/.cache/repos/github.com/sorin-ionescu/prezto/modules/utility/functions" )
builtin autoload -Uz $fpath[-1]/*(N.:t)
```

## Branch

You can also specify a branch to download, if you don't want the default (`main`)
branch for whatever reason.

Example:

```console
$ antidote bundle zsh-users/zsh-autosuggestions branch:develop
fpath+=( "$HOME/.cache/repos/github.com/zsh-users/zsh-autosuggestions" )
source "$HOME/.cache/repos/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
```

## Path

You may specify a subfolder or a specific file if the repo you are bundling contains
multiple plugins. This is especially useful for frameworks like
[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh).

File Example:

```console
$ antidote bundle ohmyzsh/ohmyzsh path:lib/clipboard.zsh
source "$HOME/.cache/repos/github.com/ohmyzsh/ohmyzsh/lib/clipboard.zsh"
```

Folder Example:

```console
$ antidote bundle ohmyzsh/ohmyzsh path:plugins/magic-enter
fpath+=( "$HOME/.cache/repos/github.com/ohmyzsh/ohmyzsh/plugins/magic-enter" )
source "$HOME/.cache/repos/github.com/ohmyzsh/ohmyzsh/plugins/magic-enter/magic-enter.plugin.zsh"
```

## Pin

Use `pin:<SHA>` to lock a bundle to a specific commit SHA. Pinned bundles are
skipped by `antidote update`, which helps keep plugin versions reproducible.

Example:

```console
$ antidote bundle zsh-users/zsh-autosuggestions pin:85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5
```

## Conditional

Use `conditional:<function_name>` to load a plugin only when a zero-argument zsh
function returns success.

Example:

```zsh
is_macos() {
  [[ $OSTYPE == darwin* ]]
}

antidote bundle ohmyzsh/ohmyzsh path:plugins/macos conditional:is_macos
```

## Pre / Post Hooks

Use `pre:<function_name>` and `post:<function_name>` to run setup/teardown style
functions before or after a bundle's load script.

One place this is helpful is for plugins that require keybindings. For example,
`zsh-users/zsh-history-substring-search` needs keybindings to be useful:

```zsh
# .zshrc
hss-bindkey() {
  zmodload zsh/terminfo
  for keymap in main emacs viins; do
    bindkey -M "$keymap" "$terminfo[kcuu1]" history-substring-search-up
    bindkey -M "$keymap" "$terminfo[kcud1]" history-substring-search-down
  done
}
```

```text
# .zsh_plugins.txt
zsh-users/zsh-history-substring-search post:hss-bindkey
```

You can still use `pre:` the same way when a plugin needs setup before it loads.

## Autoload Path

Use `autoload:<relative_path>` to autoload a functions directory in addition to the
bundle's normal `kind` behavior.
Unlike `kind:autoload`, this keeps the bundle's primary load behavior and
also adds an extra autoloaded functions path.

Example:

```console
$ antidote bundle owner/repo kind:zsh autoload:functions
```

## Bundle Directory Naming

You can configure how antidote names its cloned bundle directories with `path-style`:

```zsh
zstyle ':antidote:bundle' path-style full     # github.com/owner/repo (default)
zstyle ':antidote:bundle' path-style short    # owner/repo
zstyle ':antidote:bundle' path-style escaped  # https-COLON--SLASH--SLASH-github.com-SLASH-owner-SLASH-repo (antibody style)
```
