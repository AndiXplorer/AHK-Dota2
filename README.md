# Dota 2 Hero Macro Scripts

This repository contains AutoHotkey scripts to help automate ability and item combos in Dota 2. Each hero’s script is designed to allow quick casting of abilities using custom key combinations.

## Folder Structure

- `invoker.ahk` – Example script for Invoker.
- `utility.ahk` – Contains common functions used by all hero scripts.
- `icons/` – Folder containing hero icons (e.g., `invoker.jpg`). Each hero’s script loads its icon from this folder.

## Getting Started

1. **Download & Install AutoHotkey:**  
   Visit [AutoHotkey's official website](https://www.autohotkey.com/) and install the latest version.

2. **Configure Your Script:**  
   - Open the hero’s script (e.g., `invoker.ahk`) in a text editor.
   - Adjust the key bindings and configuration variables if your in-game settings differ.
   - For Invoker, you can modify variables such as `invokeKey`, `quas`, `wex`, `exort`, etc.

3. **Running the Script:**  
   - Double-click the hero script (e.g., `invoker.ahk`) to launch it.
   - The script will display its icon in the system tray and listen for the defined hotkeys.
   - Use the hotkeys (such as `Space + s` for Meteor + Blast) during your game.

## Adding New Heroes

- **Separate File:**  
  Create a new AHK file (e.g., `hero2.ahk`), copy the structure from `invoker.ahk`, and update hero-specific settings.
  
- **Icon:**  
  Place the corresponding icon image (named to match your hero, e.g., `hero2.jpg`) in the `icons/` folder.

- **Modularization:**  
  Common functions are kept in `utility.ahk` so you can easily share code between hero scripts.

## Disclaimer

These scripts are provided for personal use. Be aware of game policies regarding macros and automated scripts. Use at your own risk.

