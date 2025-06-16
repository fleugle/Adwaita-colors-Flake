
# 🎨 Adwaita-colors Icons as a Nix Flake

A simple Nix flake that packages a collection of Adwaita-based icon themes in various color variants.

---

## 🧩 Features

- Provides multiple Adwaita icon themes with different folder color variants
- Designed for easy integration with Home Manager
- Automatically falls back to the default Adwaita theme for any missing icons

---

## 📦 Requirements

Ensure the following icon theme dependencies are available in your system or user environment:

- `adwaita-icon-theme`
- `adwaita-icon-theme-legacy`
- `hicolor-icon-theme`

You can install them using either `home.packages` in Home Manager or `environment.systemPackages` in your system configuration:

```nix
environment.systemPackages = with pkgs; [
  adwaita-icon-theme
  adwaita-icon-theme-legacy
  hicolor-icon-theme
];
```

These are required for icons fallbacks, as these icons sets are not standalone, but rather are just re-color variants for some of original icons.

Tested on **nixpkgs 25.05**, but should also work with slightly older versions.

---

## 🚀 Installation

1. Add this flake to your `flake.nix` inputs:

```nix
inputs.adwaita-colors-icons.url = "github:fleugle/Adwaita-colors-Flake/main";
```

2. Use it in your Home Manager icon theme related configuration:

(example from my setup)
```nix
{
  gtk.iconTheme = {
    name = "Adwaita-purple"; # Replace with your preferred variant
    package = inputs.adwaita-colors-icons.packages.${pkgs.system}.adwaita-colors;
  };
}
```

Make sure the theme name matches one of the directories provided by the icon set (e.g., `Adwaita-blue`, `Adwaita-purple`, `Adwaita-green`, etc.).

---

## 🐛 Issues

If something doesn't work as expected (e.g. missing icons, misnamed variants), feel free to open an issue or contribute a fix. PRs are welcome!

---

## 📚 Credits

Based on [dpejoh/Adwaita-colors](https://github.com/dpejoh/Adwaita-colors) — all credit for the icons goes to the original creator.

This flake simply packages them for convenient NixOS/Home Manager usage.
