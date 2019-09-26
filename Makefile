USE_MEM :=4
USE_JOBS :=10

all: cip_armhf cip_arm64

cip_armhf: cip_armhf_base cip_armhf_ltp
cip_armhf_base:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb rootfs-cip-base.yaml

cip_armhf_ltp:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb rootfs-cip-ltp.yaml

cip_arm64: cip_arm64_base cip_arm64_ltp
cip_arm64_base:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb -t architecture:arm64 rootfs-cip-base.yaml

cip_arm64_ltp:
	debos -c $(USE_JOBS) --memory $(USE_MEM)Gb -t architecture:arm64 rootfs-cip-ltp.yaml
