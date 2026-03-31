---
title: Snapshots
layout: page
permalink: /snapshots
---

`antidote snapshot` manages point-in-time snapshots of your cloned bundles.
A snapshot is simply a bundle file where each repository plugin is annotated with
`kind:clone pin:<SHA>`.

## Synopsis

Get detailed help with:

```console
$ antidote snapshot --help
```

## Commands

`home`
: Print the path to the snapshot directory.

`list`
: List available snapshot files.

`save`
: Save a snapshot of currently cloned bundles. If no file is given, antidote
  creates a timestamped file in the snapshot directory.

`restore`
: Restore bundles from a snapshot. If no file is given, antidote restores the
  most recent snapshot.

`remove`
: Remove snapshot files. If no file is given and `fzf` is available, antidote
  shows an interactive multi-select picker.

## Where snapshots are stored

By default, snapshots are automatically saved to `$XDG_DATA_HOME/antidote/snapshots`
(or `~/Library/Application Support/antidote/snapshots` on macOS).

Use this command to print your current snapshot directory:

```console
$ antidote snapshot home
$XDG_DATA_HOME/antidote/snapshots
```

## Examples

Manually save a snapshot:

```console
$ antidote snapshot save
```

List snapshots:

```console
$ antidote snapshot list
snapshot-20260327-101530.txt
snapshot-20260328-091015.txt
# ...
```

Restore from the most recent snapshot:

```console
$ antidote snapshot restore
```

Restore a specific snapshot:

```console
$ antidote snapshot restore ~/.local/share/antidote/snapshots/snapshot-20260101-120000.txt
```

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

Snapshots are saved automatically during `antidote update` in static mode.
They are not created in dynamic mode.
