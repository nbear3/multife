include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MultiFE
MultiFE_FILES = Listener.xm
MultiFE_LIBRARIES = activator
MultiFE_PRIVATE_FRAMEWORKS = MobileCoreServices FrontBoard
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	#Filter plist
	$(ECHO_NOTHING)if [ -f Filter.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/; cp Filter.plist $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/MultiFE.plist; fi$(ECHO_END)
	#PreferenceLoader plist
	$(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MultiFE; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MultiFE/; fi$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
