---
title: Troubleshooting
layout: page
permalink: /troubleshooting
---

## Common issues

### no such file or directory

**Problem:** If you get a "no such file or directory" error, it may be because your `~/.zsh_plugins.zsh` static file is out of date. This can happen if you remove your antidote home with `rm -rf $(antidote home)` and need to re-download your plugins.

```zsh
~/.zsh_plugins.zsh:source:3: no such file or directory ~/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
```

**Solution:** Simply delete your `~/.zsh_plugins.zsh` static file and reload Zsh. If you followed the recommended installation procedure and have antidote configured correctly, the static file should be regenerated.

If that isn't working for you, you can run this command:

```zsh
# re-generate ~/.zsh_plugins.zsh
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
```
