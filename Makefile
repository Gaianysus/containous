SHELL:=/bin/bash
BLENDFILE=`pwd`/gaia8-container.blend
frame:
	/usr/bin/time -v primusrun blender -t 0 -b $(BLENDFILE) -o `pwd`/output_#####.png -F PNG -f 1

echo:
	echo "/usr/bin/time blender -t 0 -b -f 1 -F PNG $(BLENDFILE) -o `pwd`/output_#####.png"

open:
	primusrun blender -t 0 $(BLENDFILE) -o `pwd`/output_#####.png

beep:
	vlc /mnt/unreal/2017-02-16-Snowfootage/bluedanube-synthy.wav

all: frame beep
