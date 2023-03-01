
synergy-core:
	make -f ~/.VSSCBE/Makefile exe TARGET_NAME=$@ SOURCE_DIRS='src/cmd/synergy-core' \
	V4INCLUDE_DIRS='src/lib ../webrtc/third_party/boringssl/src/include' \
	CBELIBS='synergy boringssl boringssl_asm' \
	LIB_DIRS='../webrtc/bin' \
	LOADLIBES='Advapi32.lib Shell32.lib Gdi32.lib'

synergy-core: libsynergy

libsynergy:
	make -f libsynergy.mk

clean cleanall cleanCBE:
	make -f ~/.VSSCBE/Makefile $@

.PHONY: synergy-core libsynergy clean cleanall cleanCBE