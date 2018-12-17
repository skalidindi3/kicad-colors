#!/usr/bin/env python3

import json
import pathlib

def hex2rgb(hv):
    hv = hv[-6:]
    r = int(hv[0:2], 16)
    g = int(hv[2:4], 16)
    b = int(hv[4:6], 16)
    return "rgb(%d, %d, %d)" % (r, g, b)

colors_json_path = pathlib.PosixPath("~/.cache/wal/colors.json").expanduser()
with open(colors_json_path, "r") as f:
    colors = json.loads(f.read())

# TODO: intelligent dark_gray selection with HSL ?
black = hex2rgb(colors["colors"]["color0"])
dark_gray = hex2rgb(colors["colors"]["color8"])
#dark_gray = hex2rgb(colors["special"]["cursor"])
red = hex2rgb(colors["colors"]["color9"])
green = hex2rgb(colors["colors"]["color10"])
yellow = hex2rgb(colors["colors"]["color11"])
blue = hex2rgb(colors["colors"]["color12"])
magenta = hex2rgb(colors["colors"]["color13"])
cyan = hex2rgb(colors["colors"]["color14"])

generated = [
    "###################################",
    "# GENERATED FROM IMAGE WITH PYWAL #",
    "###################################",
    "# pywal:black => " + black,
    "Color4DBgCanvasEx=" + black,
    "# pywal:dark_gray => " + dark_gray,
    "Color4DBodyBgEx=" + dark_gray,
    "# onedark:red => " + red,
    "Color4DBodyEx=" + red,
    "Color4DPinEx=" + red,
    "Color4DPinNumEx=" + red,
    "Color4DGLabelEx=" + red,
    "# onedark:green => " + green,
    "Color4DWireEx=" + green,
    "Color4DConnEx=" + green,
    "Color4DPinNameEx=" + green,
    "# onedark:yellow => " + yellow,
    "Color4DGridEx=" + yellow,
    "Color4DLLabelEx=" + yellow,
    "Color4DHLabelEx=" + yellow,
    "# onedark:blue => " + blue,
    "Color4DBusEx=" + blue,
    "Color4DNoConnectEx=" + blue,
    "Color4DNoteEx=" + blue,
    "# onedark:magenta => " + magenta,
    "Color4DSheetEx=" + magenta,
    "Color4DSheetLabelEx=" + magenta,
    "# onedark:cyan => " + cyan,
    "Color4DFieldEx=" + cyan,
    "Color4DReferenceEx=" + cyan,
    "Color4DValueEx=" + cyan,
    "# error => RED",
    "Color4DErcWEx=rgb(255, 0, 0)",
    "Color4DErcEEx=rgb(255, 0, 0)",
    "# other => default to magenta",
    "Color4DNetNameEx=" + magenta,
    "Color4DSheetFileNameEx=" + magenta,
    "Color4DSheetNameEx=" + magenta,
    "Color4DBrighenedEx=" + magenta,
]

print("\n".join(generated))
