#!/bin/bash
set -exu -o pipefail

cd openwrt
echo 'CONFIG_PINCTRL_MT7987=y' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_COMMON_CLK_MT7987=y' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_VIRTIO_BLK=n' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_VIRTIO_NET=n' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_REMOTEPROC_CDEV=n' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_MTK_SCP=n' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_MEDIATEK_NETSYS_V2=y' >> target/linux/mediatek/filogic/config-6.6
echo 'CONFIG_MEDIATEK_NETSYS_V3=y' >> target/linux/mediatek/filogic/config-6.6
sed -i '/CONFIG_EXTRA_FIRMWARE/d' target/linux/mediatek/filogic/config-6.6
sed -i '/CONFIG_EXTRA_FIRMWARE_DIR/d' target/linux/mediatek/filogic/config-6.6

# patch thermal
curl https://github.com/openwrt/openwrt/commit/54c1ba940d76d5b25f898b3ca0923641f895d304.patch | git apply

cd -