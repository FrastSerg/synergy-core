synergy-core:
	make -f ~/.VSSCBE/Makefile exe TARGET_NAME=$@ SOURCE_DIRS='src/cmd/synergy-core' \
	V4INCLUDE_DIRS='src/lib ../webrtc/third_party/boringssl/src/include' \
	CBELIBS='synergy webrtc' \
	LIB_DIRS=../webrtc/bin

synergy-core: libsynergy

libsynergy:
	make -f libsynergy.mk

clean cleanall cleanCBE:
	make -f ~/.VSSCBE/Makefile $@

.PHONY: synergy-core libsynergy clean cleanall cleanCBE

include ~/.VSSCBE/Detect-OS

ifeq (Windows, $(.TARGET_OS))
  .LOADLIBES=Advapi32.lib Shell32.lib Gdi32.lib

else ifeq (Darwin, $(.TARGET_OS))
  export OSX_FRAMEWORKS=ScreenSaver IOKit ApplicationServices Foundation Carbon UserNotifications
  .MACRO_DEFS += WINAPI_CARBON=1 _THREAD_SAFE

else ifeq (Linux, $(.TARGET_OS))
  .LOADLIBES=
  .MACRO_DEFS += WINAPI_XWINDOWS=1 _THREAD_SAFE
  .LDFLAGS:= -fPIC

else
  $(error Unsupported OS: '$(.TARGET_OS)')
endif

#######
# Common POSIX
ifneq (Windows, $(.TARGET_OS))
	.MACRO_DEFS += SYSAPI_UNIX=1 HAVE_CONFIG_H=1
	.CXXFLAGS += -std=c++11
endif

export .MACRO_DEFS
export .LOADLIBES
export .LDFLAGS
export .CXXFLAGS
