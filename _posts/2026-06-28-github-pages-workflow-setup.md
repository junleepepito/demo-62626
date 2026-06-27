---
layout: post
title: "Setting Up GitHub Pages with GitHub Actions"
date: 2026-06-28
---

Got GitHub Pages deploying via GitHub Actions instead of the default branch-based build. Here's what was needed and why.

## The problem with the default GitHub Pages builder

GitHub Pages natively supports Jekyll, but it pins to Jekyll 3.x and only allows a small set of whitelisted plugins. This site uses Jekyll 4.x and `jekyll-admin`, so the default builder wasn't an option.

## The setup

Two config files handle the local vs. production difference:

- `_config.yml` — used locally, `baseurl` is empty so `bundle exec jekyll serve` always runs at `http://localhost:4000`
- `_config_prod.yml` — production overrides with the correct `url` and `baseurl` for GitHub Pages, merged in by CI only

The Actions workflow (`.github/workflows/deploy.yml`) builds with both configs merged:

```bash
bundle exec jekyll build --config _config.yml,_config_prod.yml
```

This keeps local dev completely unaffected — no subfolder, no extra flags, just `bundle exec jekyll serve`.

## jekyll-admin stays local

`jekyll-admin` is in the Gemfile so anyone cloning the repo gets the admin panel at `localhost:4000/admin`. It's a `jekyll serve`-only plugin and doesn't do anything during `jekyll build`, so it's safely ignored in CI.

## Offline install

All gems are committed in `vendor/cache/`, so `bundle install --local` works on any machine without internet access after cloning.

## One gotcha

The `Gemfile.lock` was generated on Windows and only had the `x64-mingw-ucrt` platform. CI runs on Linux, so it failed until adding the Linux platform:

```bash
bundle lock --add-platform x86_64-linux
```
