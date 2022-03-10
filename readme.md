# getantidote.github.io

Start here:

[Creating a GitHub Pages site with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll)

## Jekyll

Initialize site

```shell
jekyll new --skip-bundle .
```

Use github pages

```shell
# Gemfile
# gem "jekyll", "~> 4.2.2"
gem "github-pages", group: :jekyll_plugins
```

Jekyll and Ruby 3 have a weird interaction where you need to add webrick yourself

```shell
bundle add webrick
```

Install gems

```shell
bundle install
```

Serve jekyll

```shell
bundle exec jekyll serve
```

## Syntax

Syntax highlighting help [here](https://mcpride.github.io/posts/development/2018/03/06/syntax-highlighting-with-jekyll/)

## Themes

- [godalming123/minimal](https://github.com/godalming123/minimal)
