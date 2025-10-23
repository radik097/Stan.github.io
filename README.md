# Your Mate Handyman — Site

Static site powered by Jekyll + GitHub Pages with a Bootstrap landing, image cache, and a light/dark theme toggle.

## Features

- Responsive landing (Hero, Services, Gallery, About, Contact)
- External CDNs: Bootstrap 5, Font Awesome, AOS, Google Fonts (Inter)
- Custom palette: #E8AE05 #BBBBB3 #251509 #5C8A82 #E4BA05 #2A1506
- Wood texture background and angular accents
- SEO/OG meta + JSON‑LD LocalBusiness
- Local image cache for gallery/hero
- Light/Dark theme toggle (persists)

## Theme toggle

- Button in the navbar toggles between light/dark.
- Preference is stored in `localStorage` under `ymh-theme`.
- Initial theme respects `prefers-color-scheme`.

## Structure

```text
_config.yml                 # remote theme config
_includes/
	head-custom.html          # external CSS + custom CSS
	footer-custom.html        # external JS + theme toggle script
	seo.html                  # meta/og
_layouts/
	default.html              # base layout
assets/css/style.scss       # custom palette & helpers
assets/images/              # cached images (work-1..6.jpg)
scripts/fetch-images.ps1    # download/refresh images
.github/workflows/fetch-images.yml  # scheduled/dispatch image refresh
index.html                  # site content using the layout
```

## Local preview

You can quickly preview without Ruby:

```powershell
cd C:\Users\rod\Desktop\Stan_site
python -m http.server 8080
# open http://localhost:8080
```

Or build with Jekyll locally if you prefer.

## Publish to GitHub Pages

1) Commit and push to `main`.
2) In GitHub → Settings → Pages: Source = Deploy from a branch, Branch = `main`, Folder = `/`.

If this is a project site (URL …/Stan/), set in `_config.yml`:

```yml
baseurl: "/Stan"
```

Links using `{{ '/path' | relative_url }}` will auto-adjust.

## Image cache

- To refresh images locally:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\fetch-images.ps1
```

- CI auto-refresh: dispatch the workflow “Fetch Images Cache” in Actions or wait for the weekly schedule.

## Contacts

- Call/SMS/Email/WhatsApp buttons and vCard download are included on the page.
