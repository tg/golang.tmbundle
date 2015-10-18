#!/bin/sh
# brew install imagemagick

# create HiDPI icons from Texmate Go-code screenshot
convert all.png -crop 60x30+12+27  func.png
convert all.png -crop 60x30+63+117 const.png
convert all.png -crop 60x30+58+146 var.png
convert all.png -crop 60x30+58+177 type.png
convert all.png -crop 60x30+58+207 package.png

