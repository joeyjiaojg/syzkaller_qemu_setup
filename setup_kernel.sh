epxort KERNEL=kernel-git

git clone https://github.com/torvalds/linux.git $KERNEL
cd $KERNEL
make defconfig
echo -e "CONFIG_KCOV=y\nCONFIG_DEBUG_INFO=y\nCONFIG_KASAN=y\nCONFIG_KASAN_INLINE=y\nCONFIG_DEBUG_INFO=y\nCONFIG_CONFIGFS_FS=y\nCONFIG_SECURITYFS=y" >> .config
yes "" | make oldconfig
make -j$(nproc)
