FRAMES:=-F PNG --render-output `pwd`/output_ --render-frame 1 --render-frame 2 --render-frame 3
ANIMATIONS:=-F AVIJPEG --render-output `pwd`/output_avi_ --frame-start 3 --frame-end 63 --render-anim
BLENDER:=blender
PRE_CMD:=primusrun
# zero threads means proc count
POST_OPTS:=--threads 0
TIME:=/usr/bin/time -v
CMD:=$(PRE_CMD) $(BLENDER) $(POST_OPTS)
SHELL:=/bin/bash
BLENDFILE=`pwd`/gaia8-container.blend
BEEP:=vlc /mnt/unreal/2017-02-16-Snowfootage/bluedanube-synthy.wav

all: both

frames:
	$(TIME) $(CMD) --background $(BLENDFILE) $(FRAMES)
	$(BEEP)

animations:
	$(TIME) $(CMD) --background $(BLENDFILE) $(ANIMATIONS)
	$(BEEP)

both:
	$(TIME) $(CMD) --background $(BLENDFILE) $(FRAMES) $(ANIMATIONS)
	$(BEEP)

open:
	$(CMD) $(BLENDFILE)

beep:
	$(BEEP)

echo:
	-@echo $(TIME) $(CMD) --background $(BLENDFILE) $(FRAMES) $(ANIMATIONS)
