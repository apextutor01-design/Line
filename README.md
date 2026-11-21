# LINE
Minimalist endless arcade game. HTML5 Canvas + vanilla JS, installable offline PWA.

## Controls
- Tap: switch lane (fires ~0.2s after the tap so a double-tap can be told apart)
- Double-tap: TURBO (3s active, 6s cooldown; no collision immunity)
- Desktop: Space/←/→ lane, Shift/↑ turbo, P/Esc pause (keyboard has no delay)

## Deploy on GitHub Pages (free)
1. Create a repo, put all files from this folder at the repo root, push.
2. Settings → Pages → Deploy from branch → `main` / root.
3. Open `https://<user>.github.io/<repo>/` (HTTPS is required for the service worker). On Android Chrome: menu → Install app.
4. When you change any file, bump `V` in `sw.js`, otherwise returning players keep the cached version.

Local test: `python3 -m http.server 8000` then open http://localhost:8000

## Power-ups
Slow-mo (5s, world runs at 60% speed), Magnet (8s, pulls points in), Shield (absorbs one crash). Collect the glowing symbols; they appear every ~9 rows.
