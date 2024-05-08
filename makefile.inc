
uname:=$(shell uname)
uname_m:=$(shell uname -m)

#############################################################################

OSS_CAD_WEB=https://github.com/YosysHQ/oss-cad-suite-build/releases/download
RELEASE_TAG=2024-05-03

ifeq ($(uname_m),aarch64)
	OSS_CAD_SUITE_FILENAME=oss-cad-suite-linux-arm64-20240503
else 
	OSS_CAD_SUITE_FILENAME=oss-cad-suite-linux-x64-20240503
endif


#############################################################################

LOWRISCV_WEB=https://github.com/lowRISC/lowrisc-toolchains/releases/download
LOWRISCV_RELEASE_TAG=20240206-1
ifeq ($(uname),aarch64)
LOWRISCV_FILENAME=lowrisc-toolchain-gcc-rv64imac-20240206-1
else ifeq($(uname),x86_64)
LOWRISCV_FILENAME=lowrisc-toolchain-gcc-rv64imac-20240206-1
endif

#############################################################################


show_config:
	@echo "ARCH=$(ARCH)"
	@echo "ABI=$(ABI)"
	@echo "OPTIMIZE=$(OPTIMIZE)"
	@echo "DEVICES=$(DEVICES)"
	@echo "DEVICES_ASM=$(DEVICES_ASM)"

ifeq ($(uname),Darwin)
	$(info Configuring for Mac)
	TOOLCHAIN_WEB=https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v10.1.0-1.1
	TOOLCHAIN_VER=xpack-riscv-none-embed-gcc-10.1.0-1.1
	TOOLCHAIN_DL_SUFFIX=-darwin-x64
	TOOLCHAIN_GCC_VER=10.1.0
	RVTOOLCHAIN_BIN_PREFIX=riscv-none-embed
	OSS_CAD_SUITE_FILENAME=oss-cad-suite-darwin-linux-x64-20231030
else
	ifeq ($(uname_m),aarch64
	$(info Configuring for ARM64)
		TOOLCHAIN_WEB=https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v10.1.0-1.1
		TOOLCHAIN_VER=xpack-riscv-none-embed-gcc-10.1.0-1.1
		TOOLCHAIN_DL_SUFFIX=-linux-arm64
		TOOLCHAIN_GCC_VER=10.1.0
		RVTOOLCHAIN_BIN_PREFIX=riscv-none-embed
		OSS_CAD_SUITE_FILENAME=oss-cad-suite-linux-arm64-20231030
	else ifeq ($(uname_m),arm7l)
		$(info Configuring for Raspberry Pi)
		TOOLCHAIN_WEB=https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/downoad/v8.3.0-2.3
		TOOLCHAIN_VER=xpack-riscv-none-embed-gcc-8.3.0-2.3
		TOLCHAIN_DL_SUFFIX=-linux-arm
		TOOLCHAIN_GCC_VER=8.3.0
		RVTOOLCHAIN_BIN_PREFIX=riscv-none-embed
		OSS_CAD_SUITE_FILENAME=oss-cad-suite-linux-arm-20231030
	else
		$(info Configuring for Linux x84_64)
		TOOLCHAIN_WEB=https://static.dev.sifive.com/dev-tools
		TOOLCHAIN_DL_SUFFIX=x86_64-linux-ubuntu14
		TOOLCHAIN_VER=riscv64-unknown-elf-gcc-8.3.0-2020.04.0
		TOOLCHAIN_GCC_VER=8.3.0
		RVTOOLCHAIN_BIN_PREFIX=riscv64-unknown-elf
		OSS_CAD_SUITE_FILENAME=oss-cad-suite-linux-x64-20231030
	endif
endif

RVTOOLCHAIN_DIR=/TOOLCHAIN/$(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX)
RVTOOLCHAIN_BIN_DIR=$(RVTOOLCHAIN_DIR)/bin






