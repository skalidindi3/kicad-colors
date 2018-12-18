# TODO: switch on macOS vs Linux

EESCHEMA_CFG_PATH=~/Library/Preferences/kicad/eeschema

.PHONY: show_current
show_current:
	@echo "Reading current configuration from $(EESCHEMA_CFG_PATH):\n"
	@grep Color4D $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_default
set_eeschema_default:
	@sed -i "" "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@cat ./default/eeschema_default.cfg >> $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_onedark
set_eeschema_onedark:
	@sed -i "" "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# ./onedark/eeschema_onedark.cfg >> $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_nord
set_eeschema_nord:
	@sed -i "" "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# ./nord/eeschema_nord.cfg >> $(EESCHEMA_CFG_PATH)

set_base16_%: base16/%.cfg
	@sed -i "" "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# $< >> $(EESCHEMA_CFG_PATH)

