---
title: How much faster?
layout: page
permalink: /fast
---

Loading your plugins with Antidote is fast! It was designed with speed in mind.

A lot of sites recommend benchmarking with this simple, but outdated, method:

```zsh
for i in $(seq 10); do
  /usr/bin/time zsh -lic exit
done
```

You can use that, however, [zsh-bench](https://github.com/romkatv/zsh-bench) provides a
much better way to benchmark Zsh startup times. Have a look at [how Antidote compares to
other setups here](https://github.com/romkatv/zsh-bench/blob/master/doc/linux-desktop.md).

The antidote developer regularly publishes zsh-bench results in his
[dotfiles repo](https://github.com/mattmc3/zdotdir).
