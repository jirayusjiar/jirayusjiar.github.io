# Jirayus Jiarpakdee CV

Single-page CV site built with Astro and exported to PDF during production builds.

## Stack

- Astro 5
- Tailwind CSS
- Playwright for PDF generation
- GitHub Pages deployment via GitHub Actions

## Local development

This repo expects Node 22. The included wrapper script also falls back to a supported Homebrew Node when the default shell Node is too old.

```bash
npm ci
npm run dev
```

The site runs at `http://localhost:4321`.

## Production build

```bash
npm run build
```

This does three things:

1. Runs Astro type checks.
2. Starts a local server and generates `public/resume.pdf`.
3. Builds the static site into `dist/`.

## GitHub Pages

This repo includes a GitHub Pages workflow at `.github/workflows/deploy.yml`.

To use it:

1. Push the repo to GitHub.
2. In GitHub, open `Settings -> Pages`.
3. Set `Source` to `GitHub Actions`.
4. Push to `master` to trigger deployment.

Because this repository is the root `*.github.io` site, no extra `base` path is needed in Astro config.

## Important files

- `src/pages/index.astro`: CV content and structure
- `src/styles.css`: screen and PDF styling
- `scripts/generate-pdf.js`: Playwright PDF export
- `scripts/with-supported-node.sh`: Node runtime guard

## Repo hygiene

Generated and local-only files are ignored in `.gitignore`, including:

- `node_modules/`
- `.astro/`
- `dist/`
- `output/`
- `.playwright-tmp/`
- `public/resume.pdf`

## Notes

- `public/.nojekyll` is included so GitHub Pages serves Astro's `_astro/` assets correctly.
- If Chromium is missing locally, rerun `npm ci` or `npm run postinstall`.
