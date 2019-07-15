# KiCad Colors

Quickly swap KiCad themes/colorschemes.

KiCad's default colors appear to be chosen from the values [0, 132, 194, 255]
for each value of the R, G, and B components. We can modify these colors for a
more aesthetically pleasing outcome.

Original idea & inspiration from https://github.com/pointhi/kicad-color-schemes

## Usage

:exclamation:
**Invoking the Makefile will modify your current configuration files in-place**
:exclamation:
  * macOS: `~/Library/Preferences/kicad/eeschema`
  * Linux: `~/.config/kicad/eeschema`

:exclamation:
**MAKE A BACKUP**
:exclamation:

```bash
# list available themes for eeschema
$ make show_eeschema_options
set_eeschema_base16_dracula
set_eeschema_base16_nord
set_eeschema_base16_oceanicnext
set_eeschema_base16_onedark
set_eeschema_base16_rebecca
set_eeschema_default
set_eeschema_handpicked_nord
set_eeschema_handpicked_onedark

# select specific theme for eeschema
$ make set_eeschema_base16_nord

# switch back to original eeschema colors
$ make set_eeschema_default
```

## eeschema

Colors in `eeschema` can be treated as a form of syntax highlighting since all
objects on the canvas are drawn on top of a generic background. Therefore, we
can get reasonable results by generating themes based on existing terminal
colorschemes. They are displayed below.

color-scheme                       | screenshot
-----------------------------------|---------------------------------------------------
**default**                        | ![default][default_png_link]
[handpicked_onedark][onedark_link] | ![handpicked_onedark][handpicked_onedark_png_link]
[handpicked_nord][nord_link]       | ![handpicked_nord][handpicked_nord_png_link]
**base16_onedark**                 | ![base16_onedark][base16_onedark_png_link]
**base16_nord**                    | ![base16_nord][base16_nord_png_link]
**base16_rebecca**                 | ![base16_rebecca][base16_rebecca_png_link]
**base16_dracula**                 | ![base16_dracula][base16_dracula_png_link]
**base16_oceanicnext**             | ![base16_oceanicnext][base16_oceanicnext_png_link]

[default_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/default.png
[onedark_link]: https://github.com/sonph/onehalf/blob/master/vim/colors/onehalfdark.vim
[handpicked_onedark_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/handpicked_onedark.png
[nord_link]: https://github.com/arcticicestudio/nord-vim/blob/develop/colors/nord.vim
[handpicked_nord_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/handpicked_nord.png
[base16_onedark_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/base16_onedark.png
[base16_nord_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/base16_nord.png
[base16_rebecca_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/base16_rebecca.png
[base16_dracula_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/base16_dracula.png
[base16_oceanicnext_png_link]: https://raw.githubusercontent.com/skalidindi3/kicad-colors/master/eeschema/base16_oceanicnext.png

## pcbnew (TODO)

Coloring `pcbnew` is a harder task because layers allow for overlapping
information. It is no longer sufficient for an object to have a color with
passable contrast to a single background. Each object must now contrast its
color against all objects it in the visible stackup. Doing so in an
aesthetically pleasing way is difficult.

Since I am not even an "armchair expert" in optics or the color gamut,
the task as defined above is beyond what I care to put effort into.
Instead, I will restrict my problem space by aiming to have high contrast
only on specific layers. This makes aesthetics my de facto priority. Since
the `Makefile` makes it easy to switch between themes, this won't be a deal
breaker for me. I can choose a theme well suited for each specific subtask
and switch back to the default for final review.

