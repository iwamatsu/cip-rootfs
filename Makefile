USE_MEM :=4
USE_JOBS :=10

define recompress
	mkdir tmp
	sudo tar -xzf debian-$1-$2.tar.gz -C tmp
	sudo tar -cJf debian-$1-$2.tar.xz tmp/
	sudo rm -rf tmp
endef

all: cip_armhf cip_arm64

cip_armhf: cip_armhf_base cip_armhf_ltp
cip_armhf_base:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb rootfs-cip-base.yaml
	$(call recompress,buster,armhf)

cip_armhf_ltp:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb rootfs-cip-ltp.yaml
	$(call recompress,buster,armhf-ltp)

cip_arm64: cip_arm64_base cip_arm64_ltp
cip_arm64_base:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb -t architecture:arm64 rootfs-cip-base.yaml
	$(call recompress,buster,arm64)

cip_arm64_ltp:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb -t architecture:arm64 rootfs-cip-ltp.yaml
	$(call recompress,buster,arm64-ltp)
