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

Theme: [godalming123/minimal](https://github.com/godalming123/minimal)
