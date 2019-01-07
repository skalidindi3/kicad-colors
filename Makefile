# TODO: switch on macOS vs Linux

ifeq ($(shell uname -s),Darwin)
  EESCHEMA_CFG_PATH=~/Library/Preferences/kicad/eeschema
  SED_IN_PLACE=sed -i ''
else
  ifeq ($(shell uname -s),Linux)
    EESCHEMA_CFG_PATH=~/.config/kicad/eeschema
    SED_IN_PLACE=sed -i''
  endif
endif

.PHONY: show_current
show_current:
	@echo "Reading current configuration from $(EESCHEMA_CFG_PATH):\n"
	@grep Color4D $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_default
set_eeschema_default:
	@$(SED_IN_PLACE) "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@cat ./default/eeschema_default.cfg >> $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_onedark
set_eeschema_onedark:
	@$(SED_IN_PLACE) "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# ./onedark/eeschema_onedark.cfg >> $(EESCHEMA_CFG_PATH)

.PHONY: set_eeschema_nord
set_eeschema_nord:
	@$(SED_IN_PLACE) "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# ./nord/eeschema_nord.cfg >> $(EESCHEMA_CFG_PATH)

set_base16_%: base16/%.cfg
	@$(SED_IN_PLACE) "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# $< >> $(EESCHEMA_CFG_PATH)

