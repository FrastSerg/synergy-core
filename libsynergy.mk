TARGET_NAME     := synergy

lib:

include ~/.VSSCBE/Detect-OS

.V4INCLUDE_DIRS := src/lib ../webrtc/third_party/boringssl/src/include
SOURCE_DIRS     := $(addprefix src/lib/, arch base client common io ipc mt net net/InverseSockets server shared synergy synergy/languages)
SOURCES         :=

ifeq (Windows,$(.TARGET_OS))
  .V4INCLUDE_DIRS += ext/WinToast/src
  SOURCE_DIRS     += $(addprefix src/lib/, arch/win32 synergy/win32) ext/WinToast/src
  SOURCES         += $(wildcard src/lib/platform/MSWindows*.cpp)

else

  SOURCE_DIRS += src/lib/arch/unix

  ifeq (Darwin,$(.TARGET_OS))
    SOURCES += src/lib/synergy/unix/AppUtilUnix.cpp 
    SOURCES += $(wildcard src/lib/platform/OSX*.cpp)
    SOURCES += $(wildcard src/lib/platform/OSX*.m)
    SOURCES += $(wildcard src/lib/platform/OSX*.mm)
    SOURCES += src/lib/platform/IOSXKeyResource.cpp
  else
    SOURCE_DIRS += src/lib/synergy/unix
    SOURCES += $(wildcard src/lib/platform/XWindows*.cpp)
  endif

endif

CBE_C_PREINCLUDE  = $(.CBE.BinDir)/version.h
.PREBUILD_TARGETS = $(CBE_C_PREINCLUDE)

$(call .CBE.ConvertSrcNamesToObj, ./src/lib/net/InverseSockets/SslLogger.cpp): .V4FLAGS=-D'SSL_get_client_ciphers(x)=nullptr'
#$(error $(call .CBE.ConvertSrcNamesToObj, ./src/lib/net/InverseSockets/SslLogger.cpp))

$(CBE_C_PREINCLUDE): cmake/Version.cmake
	sed -ne 's/set\s\+(\(SYNERGY_VERSION_[^ \t)]\+\)\s\+\([0-9][^)]*\).*$$/#define \1 \2/p' $^ > $@ && {  \
	echo '#define ___cbe_V2S(x) #x'; \
	echo '#define __cbe_V2S(x) ___cbe_V2S(x)'; \
	echo '#define SYNERGY_VERSION __cbe_V2S(SYNERGY_VERSION_MAJOR) "." __cbe_V2S(SYNERGY_VERSION_MINOR) "." __cbe_V2S(SYNERGY_VERSION_PATCH) "." __cbe_V2S(SYNERGY_VERSION_BUILD)'; \
	echo '#define SYNERGY_VERSION_STRING SYNERGY_VERSION'; \
	echo '#define SSL_get_client_ciphers(x) nullptr'; } >> $@

include ~/.VSSCBE/Makefile
