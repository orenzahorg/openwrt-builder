#!/bin/bash
set -uax

rm -rf openwrt
cp -r openwrt_bkp openwrt
cd openwrt
git pull
#git checkout 3a481ae21bdc504f7f0325151ee0cb4f25dfd2cd; 
cd -;
rm -rf mtk-openwrt-feeds
cp -r mtk-openwrt-feeds-bkp mtk-openwrt-feeds
cd mtk-openwrt-feeds;
git pull
#git checkout c8e3540e54b5b07b7afb4a5bd09d6f8db8c8a496; 
cd -;
cd openwrt

#echo "packages e4be6dba98298957ef82ae70b4478818a351535e" > ../mtk-openwrt-feeds/autobuild/unified/feed_revision
#echo "luci 9453d7db801bf4ea2555aa3e7c99e58b93c93c1b" >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision
#echo "routing f2ee837d3714f86e9d636302e9f69612c71029cb" >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision


echo "packages de909258525bdb3e227c8e6fc1b61329e9a11f62" > ../mtk-openwrt-feeds/autobuild/unified/feed_revision
echo "luci 8d367398d626436e67478da447ce4a4ffe7992e2" >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision
echo "routing "d53907107d48331ef38978f7a259bc8eac3765a0 >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision
echo "telephony 44d6355a7b2d69dd25d73913811b421fc504b836" >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision
echo "video 1668ab74cf47cdec753895e70007083ba9c69fe4" >> ../mtk-openwrt-feeds/autobuild/unified/feed_revision


bash ../mtk-openwrt-feeds/autobuild/unified/autobuild.sh filogic-mac80211-mt7988_rfb-mt7996 log_file=make
#curl -sL "https://github.com/danpawlik/openwrt-builder/raw/refs/heads/master/configs/mediatek/mt7988a/bpi-r4" > .config
#curl -sL "https://github.com/danpawlik/openwrt-builder/raw/refs/heads/master/configs/common/main-router" >> .config
#curl -sL "https://github.com/danpawlik/openwrt-builder/raw/refs/heads/master/configs/common/snapshot" >> .config
#curl -sL "https://github.com/danpawlik/openwrt-builder/raw/refs/heads/master/configs/common/snapshot-mtk-feed" >> .config

          echo 'CONFIG_PINCTRL_MT7987=y' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_COMMON_CLK_MT7987=y' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_VIRTIO_BLK=n' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_VIRTIO_NET=n' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_REMOTEPROC_CDEV=n' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_MTK_SCP=n' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_MEDIATEK_NETSYS_V2=y' >> target/linux/mediatek/filogic/config-6.6
#          echo 'CONFIG_MEDIATEK_NETSYS_V3=y' >> target/linux/mediatek/filogic/config-6.6
#          sed -i '/CONFIG_EXTRA_FIRMWARE/d' target/linux/mediatek/filogic/config-6.6
#          sed -i '/CONFIG_EXTRA_FIRMWARE_DIR/d' target/linux/mediatek/filogic/config-6.6


make defconfig


#mkdir -p files/lib/firmware
#cp -r ../BPI-Router-Linux/utils/firmware/mediatek files/lib/firmware/mediatek
make -j9 V=s
