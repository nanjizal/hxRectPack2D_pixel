# hxRectPack2D_pixel

Pixel hxRectPack2D example. 

Hard coded to process a folder of images called **assets** into a subfolder containing a packed image and json description.

It looks for **png**, **bmp**, **gif** and pack them into one **png** and then creates a subfolder **rectPack** folder with an atlas and json inside ( see assets/rectPack for the example file ).


## Requirements:

haxelib git format https://github.com/haxefoundation/format

haxelib git hxRectPack2D https://github.com/nanjizal/hxRectPack2D

haxelib git hxPixels https://github.com/azrafe7/hxPixels

haxelib git folder https://github.com/nanjizal/folder


## Use
neko main.n

```
load binary ./assets/backHoff.png
load binary ./assets/backLegBottom.png
load binary ./assets/backLegTop.png
load binary ./assets/body.png
load binary ./assets/chin.png
load binary ./assets/frontHoff.png
load binary ./assets/frontLegBottom.png
load binary ./assets/frontLegTop.png
load binary ./assets/head.png
load binary ./assets/neck.png
load binary ./assets/tail.png
total images 11
width 300
delete directory ./assets/rectPack
deleting file <-
deleting file zebra_Atlas.json
deleting file zebraAtlas.png
create directory ./assets/rectPack
render chin.png: x0, y:0, w:11, h:12, rotated:false
render frontHoff.png: x11, y:0, w:20, h:15, rotated:false
render backHoff.png: x11, y:15, w:20, h:16, rotated:false
render frontLegBottom.png: x11, y:31, w:18, h:51, rotated:false
render backLegBottom.png: x29, y:31, w:31, h:58, rotated:false
render backLegTop.png: x60, y:31, w:64, h:73, rotated:false
render head.png: x124, y:31, w:77, h:45, rotated:true
render tail.png: x29, y:89, w:23, h:88, rotated:false
render frontLegTop.png: x201, y:31, w:92, h:57, rotated:true
render body.png: x60, y:104, w:230, h:100, rotated:false
render neck.png: x60, y:204, w:110, h:92, rotated:true
save png ./assets/rectPack/zebraAtlas.png
save text ./assets/rectPack/zebra_Atlas.json
```
