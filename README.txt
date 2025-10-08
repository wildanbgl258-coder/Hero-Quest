Hero Quest - Build-Ready Godot Project (Debug)

This package is prepared for Godot 4.2.2 and includes:
- Splash screen (scenes/SplashScreen.tscn) showing icon/app_icon.png
- 3 example level scenes (Level1/2/3), BossScene, UI scene
- scripts for Player, Monster, Boss, Level, Splash
- export_presets.cfg configured for Android debug (landscape)
- .github/workflows/build-android.yml to auto-build APK via GitHub Actions (debug)

IMPORTANT:
- Replace icon/app_icon.png with your provided logo image (square, recommended 512x512 PNG) to use your actual artwork.
- After uploading to GitHub, push to main branch and check Actions -> Build Hero Quest APK. Download artifact when done.

How to use on mobile (no PC):
1. Create a GitHub repo (public or private) and upload all files from this zip (preserve folders).
2. In GitHub repo, ensure branch 'main' exists. The workflow will trigger on push to 'main'.
3. Wait for Actions to finish; download produced hero_quest.apk from the workflow artifacts.
