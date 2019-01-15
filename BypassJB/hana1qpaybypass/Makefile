include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Hana1QPayBypass
Hana1QPayBypass_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
