# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal blog for <https://0x5.uk>: a [Zola](https://www.getzola.org/) static site deployed by Netlify (`netlify.toml` runs `zola build`, publishes `public/`, which is gitignored).

## Commands

The host is NixOS with `zola`, `lychee` and `markdownlint-cli2` installed via nix. mise isn't installed.

- `./up-docker` – `zola serve` in docker at http://localhost:1111/ with live reload. Extra args go to `zola serve` (e.g. `./up-docker --drafts`).
- `./up` – same, using the nix zola.
- `./check-links.sh` – markdownlint (bare URLs only, `.markdownlint-cli2.jsonc`), then `zola build`, then lychee `--offline` over `public/**/*.html` to check internal links and images. This is the only check. CI runs it with the same tools from nixos-26.05 (`.github/workflows/check.yml`). Known breakage goes in `.lycheeignore`, one regex per line.
- `./new "Post title"` – creates `content/blog/YYYY-MM-DD-kebab-title.md` from `_drafts/template.md`, then opens vim.

New scripts get a `.sh` suffix. Only `new` and `up*` are exempt.

The Zola version is pinned in **two** places: `mise.toml` (the docker scripts also read it from there) and `ZOLA_VERSION` in `netlify.toml`. Keep them in sync.

## Structure

- `content/blog/` – posts. Filenames are `YYYY-MM-DD-slug.md` and the date comes from the filename. Front matter is YAML (`---`), with an explicit `path: /YYYY/MM/DD/slug/` that keeps the old Jekyll-era URLs. Don't change existing paths: old URLs aren't redirected (only the redirects in `netlify.toml` exist).
- `content/blog/_index.md` – `render = false`. The section exists so that `templates/index.html` can list its pages via `get_section`. Posts render with `post.html` (giscus comments, subscribe box).
- `content/pages/` – standalone pages (about, hire, etc.), also with explicit `path:` front matter, rendered with `page.html`.
- `_drafts/` – unpublished posts plus the `./new` template. Zola doesn't build this directory.
- `static/assets/posts/` – post images, referenced as `/assets/posts/...`. `static/assets/site/` – images used by templates and config. Use plain root-relative paths, not Jekyll `{{ site.baseurl }}`.
- `sass/` – compiled by Zola (`compile_sass = true`), entry point `style.scss`.
- `templates/` – Tera templates. Everything extends `base.html`.

Don't use Jekyll/kramdown syntax such as `{:height="200px"}`: Zola renders it as literal text. To size an image, use an HTML `<img ... height="200">`.

Zola doesn't autolink bare URLs (VS Code's preview does, unless linkify is off). Write `<https://...>` or `[text](https://...)`. markdownlint (MD034) catches them, both in `./check-links.sh` and in VS Code via the recommended extension.
