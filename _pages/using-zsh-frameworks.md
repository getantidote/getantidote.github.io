---
title: Using Zsh Frameworks
layout: page
permalink: /using-zsh-frameworks
---

There is no special-case logic for specific plugins or frameworks in antidote. It
treats all plugins the same. This can cause issues for dependency-heavy frameworks like
Oh-My-Zsh and Prezto.

The `use-omz` and `use-prezto` plugins bridge that gap by handling framework-specific
logic and dependencies, so you can use subplugins (modules) from them without
issue.

## Using OMZ {#omz}

If you use Oh-My-Zsh with antidote, it is recommended (but not required) to
load [getantidote/use-omz](https://github.com/getantidote/use-omz) first.
Then add any OMZ libs and plugins you want. You can load all of `path:lib`,
selected files from `path:lib/...`, or skip it.

```zsh
# ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Load this first for OMZ compatibility helpers.
getantidote/use-omz

# Optional, but common and recommended.
ohmyzsh/ohmyzsh path:lib

# Pick OMZ plugins.
ohmyzsh/ohmyzsh path:plugins/git
ohmyzsh/ohmyzsh path:plugins/extract
ohmyzsh/ohmyzsh path:plugins/magic-enter
```

If an OMZ plugin does not behave correctly, please report it in
[getantidote/use-omz issues](https://github.com/getantidote/use-omz/issues).

## Using Prezto {#prezto}

If you use Prezto with antidote, the recommended bridge plugin is
[getantidote/use-prezto](https://github.com/getantidote/use-prezto).

Add it first in your `${ZDOTDIR:-$HOME}/.zsh_plugins.txt`, then add the Prezto
modules you want. Keep your normal `${ZDOTDIR:-$HOME}/.zpreztorc` settings.

```zsh
# ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Load this first for Prezto compatibility helpers.
getantidote/use-prezto

# Add Prezto modules you use.
sorin-ionescu/prezto path:modules/environment
sorin-ionescu/prezto path:modules/editor
sorin-ionescu/prezto path:modules/history
sorin-ionescu/prezto path:modules/prompt
```

If a module does not behave correctly, please report it in
[getantidote/use-prezto issues](https://github.com/getantidote/use-prezto/issues).

## Using Zephyr {#zephyr}

[Zephyr](https://github.com/mattmc3/zephyr) is a Zsh framework written by the author of
antidote and designed to work without the dependency issues that burden other
frameworks. Its subplugins all run independently and work seamlessly with antidote, so
you can load whichever Zephyr subplugins you want directly.

```zsh
# ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

mattmc3/zephyr path:plugins/editor
mattmc3/zephyr path:plugins/history
mattmc3/zephyr path:plugins/prompt
mattmc3/zephyr path:plugins/utility
```
