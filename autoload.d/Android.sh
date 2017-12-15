android_rotate_landscape() {
	adb shell content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:1
}

android_rotate_portrait() {
	adb shell content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:0
}

android_lowpower_trigger() {
	adb shell dumpsys battery reset;adb shell dumpsys battery set level 12;adb shell dumpsys battery unplug
}
