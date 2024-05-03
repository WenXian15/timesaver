include ./makefile.inc

get_riscv_toolchain :
	mkdir -p ./TOOLCHAIN
	@echo "Installing riscv toolchain"
	(cd ./TOOLCHAIN; \
		wget $(TOOLCHAIN_WEB)/$(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz -O \
		$(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz; \
		tar xfz $(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz; \
		if [-d $(TOOLCHAIN_VER)]; then mv $(TOOLCHAIN_VER) $(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX); fi)

get_oss_cad_suite :
	@echo "Installing oss_cad_uite"
	(wget $(OSS_CAD_WEB)/$(RELEASE_TAG)/$(OSS_CAD_SUITE_FILENAME).tgz -O $(OSS_CAD_SUITE_FILENAME).tgz; \
	tar -xvzf $(OSS_CAD_SUITE_FILENAME).tgz; \
	rm -rf $(OSS_CAD_SUITE_FILENAME).tgz)

rm :
	@echo "rm oss-cad-suite"
	rm -rf oss-cad-suite

help:
	@echo "get_oss_cad_suite"
	@echo "get_riscv_toolchain"

clean :
	rm -rf oss-cad-suite TOOLCHAIN
