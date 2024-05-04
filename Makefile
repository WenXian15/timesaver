include ./makefile.inc

get_riscv_toolchain :
	@echo "Installing riscv toolchain"
	@mkdir -p ./toolchain/
	(cd ./toolchain; \
		wget $(TOOLCHAIN_WEB)/$(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz -O \
		$(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz; \
		tar xfz $(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX).tar.gz; \
		if [-d $(TOOLCHAIN_VER)]; then mv $(TOOLCHAIN_VER) $(TOOLCHAIN_VER)$(TOOLCHAIN_DL_SUFFIX); fi)

get_lowriscv_toolchain :
	@echo "Installing lowriscv toolchain"
	@mkdir -p ./toolchain/lowriscv/
	(wget $(LOWRISCV_WEB)/$(LOWRISCV_RELEASE_TAG)/$(LOWRISCV_FILENAME).tar.xz -O $(LOWRISCV_FILENAME).tar.xz; \
		tar -xf $(LOWRISCV_FILENAME).tar.xz; \
		rm -rf $(LOWRISCV_FILENAME).tar.xz; \
		mv $(LOWRISCV_FILENAME) ./toolchain/lowriscv/)

get_oss_cad_suite :
	@echo "Installing oss_cad_uite"
	(wget $(OSS_CAD_WEB)/$(RELEASE_TAG)/$(OSS_CAD_SUITE_FILENAME).tgz -O $(OSS_CAD_SUITE_FILENAME).tgz; \
	tar -xvzf $(OSS_CAD_SUITE_FILENAME).tgz; \
	rm -rf $(OSS_CAD_SUITE_FILENAME).tgz)

get_fusesoc :
	@echo "Installing fusesoc"
	@eho "cache purge because of non-matching hashes: Google reddit ERROR: THESE PACKAGES DO NOT MATCH THE HASHES FROM THE REQUIREMENTS FILE"
	sudo pip3 cache purge
	sudo pip3 install --upgrade --user fusesoc

clean :
	@echo "rm oss-cad-suite"
	rm -rf oss-cad-suite
	pip3 uninstall fusesoc

help:
	@echo "get_oss_cad_suite"
	@echo "get_riscv_toolchain"
	@echo "get_fusesoc"

clean :
	rm -rf oss-cad-suite TOOLCHAIN
