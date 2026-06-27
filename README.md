# demo626

Personal site built with Jekyll, the Minima theme, and jekyll-admin for local content management.

---

## Running locally

All gems are pre-cached in `vendor/cache/` — no internet needed after cloning.

```bash
# Install gems from local cache
bundle install --local

# Start the dev server
bundle exec jekyll serve
```

- Site → `http://localhost:4000`
- Admin panel → `http://localhost:4000/admin`

---

## Project structure

```
├── _layouts/       ← page templates (default, home, post, page)
├── _includes/      ← reusable HTML parts (header, footer, head)
├── _sass/          ← styles
├── assets/         ← compiled CSS and icons
├── _plugins/       ← runtime patches
├── _posts/         ← blog posts
├── vendor/cache/   ← cached gems for offline install
├── Gemfile         ← dependencies
├── Gemfile.lock    ← locked versions
└── _config.yml     ← site settings
```

---

## Notes

### jekyll-admin patch

`_plugins/jekyll_admin_patch.rb` fixes two bugs in jekyll-admin 0.12.0 with Jekyll 4.x:

1. The config API endpoint fails to serialize, causing **"Could not fetch the config"** in the admin panel.
2. The admin panel crashes on load if `jekyll_admin:` is absent from `_config.yml`.

The patch loads automatically — no manual steps needed.

### What not to commit

`_site/`, `vendor/bundle/`, `.jekyll-cache/`, and `.sass-cache/` are excluded via `.gitignore`. The gem cache (`vendor/cache/`) is intentionally committed so the repo works offline.
