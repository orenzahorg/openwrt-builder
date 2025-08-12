#!/bin/bash
set -exu -o pipefail

cd openwrt


for config in ../configs/*; do
  cat $config >> .config
done




cat ../configs/bpi-r4 > .config
cat ../configs/main-router >> .config


# add CONFIG_PINCTRL_MT7987=y
echo 'CONFIG_PINCTRL_MT7987=y' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_COMMON_CLK_MT7987=y' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_VIRTIO_BLK=n' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_VIRTIO_NET=n' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_REMOTEPROC_CDEV=n' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_MTK_SCP=n' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_MEDIATEK_NETSYS_V2=y' >> target/linux/mediatek/filogic/config-6.12
echo 'CONFIG_MEDIATEK_NETSYS_V3=y' >> target/linux/mediatek/filogic/config-6.12
sed -i '/CONFIG_EXTRA_FIRMWARE/d' target/linux/mediatek/filogic/config-6.12
sed -i '/CONFIG_EXTRA_FIRMWARE_DIR/d' target/linux/mediatek/filogic/config-6.12



cd -