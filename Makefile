ifeq ($(shell uname -s),Darwin)
  EESCHEMA_CFG_PATH=~/Library/Preferences/kicad/eeschema
  SED_IN_PLACE=sed -i ''
else
  ifeq ($(shell uname -s),Linux)
    EESCHEMA_CFG_PATH=~/.config/kicad/eeschema
    SED_IN_PLACE=sed -i''
  endif
endif

.PHONY: get_current_eeschema
get_current_eeschema:
	@echo "Reading current configuration from $(EESCHEMA_CFG_PATH):\n"
	@grep Color4D $(EESCHEMA_CFG_PATH)

.PHONY: show_eeschema_options
show_eeschema_options:
	@ls eeschema/*.cfg \
	  | sed "s/\//_/" \
	  | sed "s/^/set_/" \
	  | sed "s/\.cfg//" \
	  | sort

set_eeschema_%: ./eeschema/%.cfg
	@$(SED_IN_PLACE) "/Color4D/d" $(EESCHEMA_CFG_PATH)
	@grep -v \# $< >> $(EESCHEMA_CFG_PATH)

