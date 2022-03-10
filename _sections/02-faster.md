---
title: How much faster?
layout: page
permalink: /fast
---

A lot of sites recommend benchmarking with this outdated method:

```zsh
for i in $(seq 10); do; /usr/bin/time zsh -lic exit; done
```

While Antidote should prove to run well using this method, there's a better way.

Nowadays [zsh-bench](https://github.com/romkatv/zsh-bench) is the best way out there to
compare Zsh startup times. Have a look at [how Antidote compares to other setups
here](https://github.com/romkatv/zsh-bench/blob/master/doc/linux-desktop.md).
