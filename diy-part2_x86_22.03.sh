#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# echo '删除重复插件'
rm -rf ./feeds/other/lean/luci-app-netdata
rm -rf ./feeds/other/luci-app-adguardhome
rm -rf ./feeds/luci/applications/luci-app-smartdns
#rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/admin/netdata

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.2.3/g' package/base-files/files/bin/config_generate

#修改主机名
#sed -i 's/OpenWrt/N1/g' package/base-files/files/bin/config_generate

# 添加旁路由防火墙
echo "#iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

#修改build日期
curl -Lo ./package/default-settings/files/zzz-default-settings https://raw.githubusercontent.com/kissyouhunter/openwrt_lienol/main/diy/x86_lienol/zzz-default-settings

#替换coremark ./lede/feeds/packages/utils/coremark/coremark.sh
wget -O ./feeds/packages/utils/coremark/coremark.sh https://raw.githubusercontent.com/kissyouhunter/openwrt_lienol/main/diy/x86_lienol/coremark.sh

##更改插件位置

#ZeroTier

#sed -i 's/vpn/network/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/controller/*.lua

#sed -i 's/vpn/network/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/model/cbi/zerotier/*.lua

#sed -i 's/vpn/network/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/*.htm

#wrtbwmon 实时流量监测

#sed -i 's/nlbw/network/g' ./feeds/luci/applications/luci-app-wrtbwmon/luasrc/controller/*.lua

#sed -i 's/nlbw/network/g' ./feeds/luci/applications/luci-app-wrtbwmon/luasrc/model/cbi/wrtbwmon/*.lua

#sed -i 's/nlbw/network/g' ./feeds/luci/applications/luci-app-wrtbwmon/luasrc/view/wrtbwmon/*.htm

#cpulimit cpu限制

#sed -i 's/\<control\>/services/g' ./feeds/kiss/luci-app-cpulimit/luasrc/controller/*.lua

#sed -i 's/control/services/g' ./feeds/kiss/luci-app-cpulimit/luasrc/model/cbi/*.lua

#nlbwmon  网络带宽监视器

#sed -i 's/"admin", "nlbw"/"admin", "network", "nlbw"/g' ./feeds/luci/applications/luci-app-nlbwmon/luasrc/controller/*.lua


#tencentddns 腾讯ddns

#sed -i 's/"admin", "tencentcloud"/"admin", "services", "tencentcloud"/g' ./feeds/kiss/luci-app-tencentddns/files/luci/controller/*.lua


