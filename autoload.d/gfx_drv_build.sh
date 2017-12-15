ufo_make() {
	echo "JZB: making BXT UFO libs!"
	make GFXGEN=9 ANDROID_SRC=/home/jzb/src/OneAndroid BUILD_TYPE=release TARGET_PRODUCT=bxt_rvp ARCH=32 UFO_OCL=n UFO_RS=n UFO_PAVP=n JOBS=$(nproc) ufo
}

ufo_android_make() {
	echo "JZB: making BXT android & UFO!"
	make GFXGEN=9 ANDROID_SRC=/home/jzb/src/OneAndroid BUILD_TYPE=release TARGET_PRODUCT=r2_bxt_rvp UFO_OCL=n UFO_RS=n JOBS=$(nproc) android
}

ufo_all_make() {
	echo "JZB: making BXT UFO libs, including OCL, RS, PAVP!"
	make GFXGEN=9 ANDROID_SRC=/home/jzb/src/OneAndroid BUILD_TYPE=release TARGET_PRODUCT=bxt_rvp ARCH=32 UFO_OCL=y UFO_RS=y UFO_PAVP=y JOBS=$(nproc) ufo
}

ufo_clean() {
	echo "JZB: cleaning BXT UFO libs!"
	make GFXGEN=9 ANDROID_SRC=/home/jzb/src/OneAndroid BUILD_TYPE=release TARGET_PRODUCT=bxt_rvp ARCH=32 UFO_OCL=n UFO_RS=n UFO_PAVP=n JOBS=$(nproc) ufo-clean
}

ufo_all_clean() {
	echo "JZB: cleaning BXT UFO libs, including OCL, RS, PAVR!"
	make GFXGEN=9 ANDROID_SRC=/home/jzb/src/OneAndroid BUILD_TYPE=release TARGET_PRODUCT=bxt_rvp ARCH=32 UFO_OCL=y UFO_RS=y UFO_PAVP=y JOBS=$(nproc) ufo-clean
}
