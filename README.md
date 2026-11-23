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

## Shop, side button, speed
Points (◆) are banked after each run and spent in the Shop on Shield (8s protection), Slow-mo, Pulse and ◆x2. Equip one; use it from the side button (hold ~0.4s and drag to move it) or make it the double-tap action in Settings (Turbo then moves to the side button). Settings also has speed x1–x5 (speed is capped so obstacles stay visible long enough to react).

## Revive
After a crash you can pay ◆25, then ◆35, then ◆45 (max 3 per run) to continue with 3s protection and the obstacles right ahead cleared. Planned: replace with a rewarded ad later.
