include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BypassInterparkBookJB
BypassInterparkBookJB_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += bypasskbankjb
include $(THEOS_MAKE_PATH)/aggregate.mk
