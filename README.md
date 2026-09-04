<div align="center">

# 🌐 Omarchy · Lumon Industries

**A whole-system _Severance_ theme for [Omarchy](https://omarchy.org) — boot to lock screen.**

Every stage of using the machine, re-skinned as Lumon: the Plymouth splash while it
boots, the "enter your access code" lock screen, an animated terminal greeting, the
severed-floor crew as wallpapers, an ambient screensaver reel, colour + look'n'feel
polish, and a rotating quote placard on the desktop.

Each piece is its own repo — take the whole set or just the parts you want. Everything
installs **on top of** Omarchy's own code (patches / plugins / marker-guarded blocks),
so `omarchy update` never reverts it, and every repo ships an uninstaller.

<!-- TODO: hero image — a 2x4 contact sheet or a short looping gif of the full flow -->
![The Lumon desktop](docs/hero.jpg)

</div>

---

## The set

| Repo | What it does | Preview |
|---|---|---|
| **[omarchy-lumon-boot](https://github.com/KaiCryan/omarchy-lumon-boot)** | Plymouth boot splash — Lumon globe on the dark ground, matching LUKS password prompt | <!-- docs/boot.jpg --> |
| **[omarchy-lumon-lock](https://github.com/KaiCryan/omarchy-lumon-lock)** | Lock screen — prompts _"Enter your access code"_, L U M O N / United in Severance caption, 60s wake light | <!-- docs/lock.jpg --> |
| **[omarchy-lumon-greeting](https://github.com/KaiCryan/omarchy-lumon-greeting)** | Terminal greeting — 19 animations (spinning globe, the descent, an MDR bin filling, Defiant Jazz…), then `fastfetch` | <!-- docs/greeting.gif --> |
| **[omarchy-lumon-wallpapers](https://github.com/KaiCryan/omarchy-lumon-wallpapers)** | The severed-floor crew as ASCII line portraits + clean 4K brand wallpapers, with an hourly cycler | <!-- docs/wallpapers.jpg --> |
| **[omarchy-lumon-screensaver](https://github.com/KaiCryan/omarchy-lumon-screensaver)** | Capped-fps `ttfx` effects + an ambient reel of 8 looping scenes. Won't drop over a video that's playing. | <!-- docs/screensaver.gif --> |
| **[omarchy-lumon-theme](https://github.com/KaiCryan/omarchy-lumon-theme)** | Colour scheme, Hyprland look'n'feel (gaps, blur, cyan drop shadow), `fastfetch` + `omarchy about` branding | <!-- docs/theme.jpg --> |
| **[omarchy-desktop-quote](https://github.com/KaiCryan/omarchy-desktop-quote)** | A Variety-style rotating quote placard over the wallpaper, behind your windows. Plain-text quotes file. | <!-- docs/quote.jpg --> |
| **[omarchy-lumon-assets](https://github.com/KaiCryan/omarchy-lumon-assets)** | Shared ASCII art, font list and build tools the other repos pull from | — |

---

## Install the lot

```sh
git clone https://github.com/KaiCryan/omarchy-lumon
cd omarchy-lumon
./install-all.sh
```

`install-all.sh` clones each repo into `~/.local/share/omarchy-lumon/` and runs its
installer in order. It'll stop and ask before the one step that needs `sudo`
(the boot splash). Skip pieces with flags:

```sh
./install-all.sh --skip boot --skip quote
```

Or just follow the install steps in whichever individual repos you want.

## Uninstall

Run `./uninstall.sh` in each repo you installed (or `./uninstall-all.sh` here), then
`omarchy theme set <something-else>` to drop the Lumon colours.

---

<div align="center">
<sub>Not affiliated with Apple TV+ or the <em>Severance</em> production. A personal,
non-commercial desktop theme. Character portraits are built from Wikimedia headshots —
see <code>SOURCES.md</code> in the wallpapers repo.</sub>
</div>
