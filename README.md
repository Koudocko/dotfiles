# dotfiles

**How to Install:**
1. Download the [alps](https://github.com/Koudocko/alps) configuration manager 
2. Clone this repo into ~/.config/alps
3. Run "alps -Sg dotfiles"

**WARNING:** These dotfiles are designed for a clean system install. Meaning some root files will be edited (e.g. /etc/locale.conf).

If you wish to remove these entries, run:

```
alps -Eg dotfiles
```

Delete the following entries under the label "[CONFIGS]":
- /etc/locale.conf
- /etc/locale.gen
- /etc/issue
