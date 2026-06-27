# demo626

Personal site built with Jekyll, the Minima theme, and jekyll-admin for local content management.

---

## Running locally

All gems are pre-cached in `vendor/cache/` and committed to the repository, so `bundle install --local` works without internet access after cloning.

```bash
# Install gems from local cache
bundle install --local

# Start the dev server
bundle exec jekyll serve
```

- Site → `http://localhost:4000`
- Admin panel → `http://localhost:4000/admin`

---

## Deploying to GitHub Pages

Pushes to `main` automatically build and deploy via GitHub Actions (`.github/workflows/deploy.yml`).

The workflow merges `_config.yml` with `_config_prod.yml` at build time, which sets the correct `url` and `baseurl` for GitHub Pages. This keeps local dev unaffected — `bundle exec jekyll serve` always runs at `http://localhost:4000` with no subfolder.

In your repo **Settings → Pages**, set the source to **GitHub Actions**.

Live site: `https://junleepepito.github.io/demo-62626`

> `jekyll-admin` is local-only and not used during CI builds.

---

## Project structure

```
├── _layouts/           ← page templates (default, home, post, page)
├── _includes/          ← reusable HTML parts (header, footer, head)
├── _sass/              ← styles
├── assets/             ← compiled CSS and icons
├── _plugins/           ← runtime patches
├── _posts/             ← blog posts
├── vendor/cache/       ← cached gems for offline install
├── .github/workflows/  ← GitHub Actions deploy workflow
├── Gemfile             ← dependencies
├── Gemfile.lock        ← locked versions
├── _config.yml         ← site settings (local)
└── _config_prod.yml    ← production URL overrides (CI only)
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
