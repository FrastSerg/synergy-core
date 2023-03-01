TARGET_NAME     := synergy
.V4INCLUDE_DIRS := src/lib ../webrtc/third_party/boringssl/src/include ext/WinToast/src
SOURCE_DIRS     := $(addprefix src/lib/, arch arch/win32 base client common io ipc mt net net/InverseSockets server shared synergy synergy/languages synergy/win32) ext/WinToast/src
SOURCES         := $(wildcard src/lib/platform/MSWindows*.cpp)

CBE_C_PREINCLUDE  = $(.CBE.BinDir)/version.h
.PREBUILD_TARGETS = $(CBE_C_PREINCLUDE)

lib:
include ~/.VSSCBE/Makefile

$(call .CBE.ConvertSrcNamesToObj, ./src/lib/net/InverseSockets/SslLogger.cpp): .V4FLAGS=-D'SSL_get_client_ciphers(x)=nullptr'
#$(error $(call .CBE.ConvertSrcNamesToObj, ./src/lib/net/InverseSockets/SslLogger.cpp))

$(CBE_C_PREINCLUDE): cmake/Version.cmake
	sed -ne 's/set\s\+(\(SYNERGY_VERSION_[^ \t)]\+\)\s\+\([0-9][^)]*\).*$$/#define \1 \2/p' $^ > $@ && echo -e '#define ___cbe_V2S(x) #x\n#define __cbe_V2S(x) ___cbe_V2S(x)\n#define SYNERGY_VERSION __cbe_V2S(SYNERGY_VERSION_MAJOR) "." __cbe_V2S(SYNERGY_VERSION_MINOR) "." __cbe_V2S(SYNERGY_VERSION_PATCH) "." __cbe_V2S(SYNERGY_VERSION_BUILD)\n#define SYNERGY_VERSION_STRING SYNERGY_VERSION\n#define SSL_get_client_ciphers(x) nullptr' >> $@
