---
title: Migrating From Antibody
layout: page
permalink: /migrating-from-antibody
---

If you are migrating from [Antibody](https://getantibody.github.io/) to Antidote, it might help you to know that Antidote is meant to be a drop-in replacement for Antibody. It was designed to work the same way with the same commands, but implemented as a pure Zsh superset of that functionality. That means that simply replacing the word `antibody` with `antidote` in your Zsh configuration should essentially work.

## Dynamic loading

Antibody encouraged the concept of dynamically loading plugins. Antidote, on the other hand, encourages using the use of static loading for speed. However, you can still use the legacy dynamic load mechanism if speed isn't your primary concern. With dynamic loading, every time the a new shell starts, antidote will apply the plugins given to it.

For this to work, antidote needs to be wrapped into your `.zshrc`. To do that, run:

```zsh
# ~/.zshrc
source <(antidote init)
```

And reload your current shell or open a new one.

Then, you will also need to tell antidote which plugins to bundle. This can also be done in the `.zshrc` file:

```zsh
# ~/.zshrc
antidote bundle < ~/.zsh_plugins.txt
```

This is the same as how antibody worked.
