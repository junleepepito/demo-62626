---
layout: page
title: About
permalink: /about/
published: false
---

## jekyll-with-admin-install-local-base

A ready-to-copy Jekyll starter with the default minima theme and a built-in admin panel. Everything needed to run is already bundled — no internet required after setup.

### Getting started

Copy the folder, then:

```bash
bundle install --local
bundle exec jekyll serve
```

Your site will be at `http://localhost:4000`
Admin panel at `http://localhost:4000/admin`

### What's included

- **Minima theme** — files copied directly into the project, not pulled from the gem
- **jekyll-admin** — browser-based admin panel for managing posts and pages
- **vendor/cache/** — all gems saved locally so `bundle install --local` works offline
- **`_plugins/jekyll_admin_patch.rb`** — fixes a known jekyll-admin UI bug with Jekyll 4.x automatically

### Built on

- [Jekyll](https://github.com/jekyll/jekyll) — static site generator
- [Minima](https://github.com/jekyll/minima) — default Jekyll theme
- [jekyllrb.com](https://jekyllrb.com/) — documentation and guides
