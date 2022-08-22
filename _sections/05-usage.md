---
title: Usage
layout: page
permalink: /usage
---

Antidote achieves its speed by doing all the work of cloning plugins up front and
generating the code your `.zshrc` needs to source those plugins. Typically, we want to
do this via a plugins file.

## Plugins file

A plugins file is basically any text file that has one plugin per line.

In our examples, let's assume we have a `~/.zsh_plugins.txt` file with these
contents:

```zsh
# .zsh_plugins.txt

# comments are supported like this
zshzoo/zfunctions
zshzoo/zshrc.d
zsh-users/zsh-completions

# empty lines are skipped

# annotations are also allowed:
ohmyzsh/ohmyzsh   path:lib
ohmyzsh/ohmyzsh   path:plugins/colored-man-pages
romkatv/zsh-bench kind:path
olets/zsh-abbr    kind:defer

# prompts:
#   with prompt plugins, remember to add this to your .zshrc:
#   `autoload -Uz promptinit && promptinit && prompt pure`
sindresorhus/pure     kind:fpath
romkatv/powerlevel10k kind:fpath

# other plugins
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
zsh-users/zsh-autosuggestions
```

Now that we have a plugins file, let's look how can we load them!

## Loading plugins

If you followed the recommended install procedure, your plugins will already be loaded
when you called `antidote load` in your `.zshrc`.

However, you could choose generate your static plugins file manually with
`antidote bundle`. Basically, antidote will only need to run when you change your
`.zsh_plugins.txt` file. After you change this, use antidote to regenerate the static
file.

Assuming the `.zsh_plugins.txt` be created above, we can run:

```zsh
# generate ~/.zsh_plugins.zsh
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
```

We can run this at any time to update our static `.zsh_plugins.zsh` file, however if you
followed the recommended install procedure you won't need to do this yourself.

Finally, the static generated plugins file gets sourced in your `.zshrc`.

```zsh
# .zshrc
source ~/.zsh_plugins.zsh
```

_Note that to use `antidote bundle` this way, we will never want to call
`antidote init`. **Be sure that's not in your ~/.zshrc**. `antidote init` is a wrapper
provided for backwards compatibility for users familiar with antibody and antigen, but
is no longer recommended._

## CleanMyMac or similar tools

If you use CleanMyMac or similar tools, make sure to set it up to ignore the `antidote
home` folder, otherwise it may delete your plugins.

You may also change Antidote's home folder, for example:

```zsh
export ANTIDOTE_HOME=~/.cache/antidote
```
