set shell := ["zsh", "-cu"]

ruby_prefix := "/opt/homebrew/opt/ruby@3.3/bin"
bundler_version := "2.5.14"

# Show available recipes.
default:
  @just --list

# Check whether github-pages in Gemfile.lock is up to date.
gp-check:
  export PATH="{{ruby_prefix}}:$PATH"
  bundle _{{bundler_version}}_ outdated github-pages

# Show latest github-pages version available on RubyGems.
gp-latest:
  export PATH="{{ruby_prefix}}:$PATH"
  gem search -r "^github-pages$"

# Update github-pages and lock compatible dependency versions.
gp-update:
  export PATH="{{ruby_prefix}}:$PATH"
  bundle _{{bundler_version}}_ update github-pages

# Install gems from Gemfile.lock.
bundle-install:
  export PATH="{{ruby_prefix}}:$PATH"
  bundle _{{bundler_version}}_ install

# Run jekyll locally with dev config.
serve:
  export PATH="{{ruby_prefix}}:$PATH"
  bundle _{{bundler_version}}_ exec jekyll serve -w --config _config.yml,_config-dev.yml --livereload
