# PICOM
A compositor based from compton

## How to use

1. Clone the repository from https://github.com/yshui/picom
2. Build the binary using the instructions from the source
3. Copy `picom.conf` to `~/.config/picom/`

## Notes

At the time of writing, when building the binary, I had to use
the following commands:

```sh
$ meson configure -Dprefix=~/.local build
$ ninja -C build install
```
