# compile vendor kernel from source

## prepare toolchain

    # gcc
    git clone -b android-11.0.0_r18 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 ~/aosp-gcc-aarch64
    git clone -b android-11.0.0_r18 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 ~/aosp-gcc-arm

    # clang
    wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-11.0.0_r18/clang-r370808.tar.gz
    mkdir ~/aosp-clang
    tar xzf clang-r370808.tar.gt -C ~/aosp-clang

## compile kernel

    export PATH="~/aosp-gcc-aarch64/bin:~/aosp-gcc-arm/bin:~/aosp-clang/bin:${PATH}"

    git clone -b aosp/LA.UM.7.1.r1 https://github.com/sonyxperiadev/kernel.git ~/kernel-sony
    cd ~/kernel-sony

    make ARCH=arm64 SUBARCH=arm64 \
      CC=clang CLANG_TRIPLE=aarch64-linux-gnu \
      CROSS_COMPILE=aarch64-linux-android- \
      CROSS_COMPILE_ARM32=arm-linux-androideabi- \
      aosp_yoshino_lilac_defconfig

    make ARCH=arm64 SUBARCH=arm64 \
      CC=clang CLANG_TRIPLE=aarch64-linux-gnu \
      CROSS_COMPILE=aarch64-linux-android- \
      CROSS_COMPILE_ARM32=arm-linux-androideabi- \
      -j$(nproc)

    cp arch/arm64/boot/Image.gz-dtb ~/aosp/kernel/sony/msm-4.14/common-kernel/kernel-dtb-lilac

## create boot.img

    $ source build/envsetup.sh && lunch
    including vendor/qcom/opensource/core-utils/vendorsetup.sh
    
    You're building on Linux
    
    Lunch menu... pick a combo:
         1. aosp_arm-eng
         2. aosp_arm64-eng
         3. aosp_blueline_car-userdebug
         4. aosp_bonito_car-userdebug
         5. aosp_bramble-userdebug
         6. aosp_coral_car-userdebug
         7. aosp_crosshatch_car-userdebug
         8. aosp_flame_car-userdebug
         9. aosp_g8141-eng
         10. aosp_g8141-userdebug
         11. aosp_g8142-eng
         12. aosp_g8142-userdebug
         13. aosp_g8341-eng
         14. aosp_g8341-userdebug
         15. aosp_g8342-eng
         16. aosp_g8342-userdebug
         17. aosp_g8441-eng
         18. aosp_g8441-userdebug
         [...]

    Which would you like? [aosp_arm-eng] 17

    $ make -j$(nproc) bootimage
