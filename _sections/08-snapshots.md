---
title: Snapshots
layout: page
permalink: /snapshots
---

`antidote snapshot` manages point-in-time snapshots of your cloned bundles.
A snapshot is a bundle file where each repository is annotated with
`kind:clone pin:<SHA>`.

## Synopsis

Show snapshot help:

```console
$ antidote snapshot --help
```

## Commands

Use `home` to print the snapshot directory. By default this is
`$XDG_DATA_HOME/antidote/snapshots` (or
`~/Library/Application Support/antidote/snapshots` on macOS):

```console
$ antidote snapshot home
$XDG_DATA_HOME/antidote/snapshots
```

Use `list` to show available snapshot files:

```console
$ antidote snapshot list
snapshot-20260327-101530.txt
snapshot-20260328-091015.txt
# ...
```

Use `save` to create a snapshot of currently cloned bundles. If no file is
given, antidote creates a timestamped file in the snapshot directory. You can
also pass a custom file path:

```console
$ antidote snapshot save
$ antidote snapshot save /tmp/my-snapshot.txt
```

Use `restore` to restore bundles from a snapshot. If no file is given and
`fzf` is available, antidote will use that as an interactive picker:

```console
$ antidote snapshot restore
$ antidote snapshot restore ~/.local/share/antidote/snapshots/snapshot-20260101-120000.txt
```

Use `remove` to delete one or more snapshot files. If no file is given and
`fzf` is available, antidote will use that as an interactive picker:

```console
$ antidote snapshot remove ~/.local/share/antidote/snapshots/snapshot-20260101-120000.txt
$ antidote snapshot remove ~/.local/share/antidote/snapshots/snapshot-20260101-120000.txt ~/.local/share/antidote/snapshots/snapshot-20260102-080000.txt
$ antidote snapshot remove
```

To make configs reproducible across machines, save a snapshot on one machine,
commit or copy that snapshot file, then run `antidote snapshot restore <file>`
on the other machine.

## Configuration

Change snapshot directory:

```zsh
zstyle ':antidote:snapshot' dir ~/.antidote-snapshots
```

Change how many snapshots are kept (default `100`):

```zsh
zstyle ':antidote:snapshot' max 50
```

Disable automatic snapshots:

```zsh
zstyle ':antidote:snapshot:automatic' enabled no
```

In static mode, snapshots are saved automatically during `antidote update`.
They are not created in dynamic mode.
