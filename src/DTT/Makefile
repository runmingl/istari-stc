NAMES = Tp Tm Bool True False If IfTrue IfFalse Pi Lam App PiBeta PiEta

.PHONY: all $(NAMES)

all: $(NAMES)
	@echo "\033[0;32m All files have been typechecked.\033[0m"

define TYPECHECK_template
$(1):
	@istari Demo/Demo$(1).ist && \
	echo "\033[0;32m Typechecked Demo/Demo$(1).ist successfully.\033[0m" || \
	(echo "\033[0;31m Typechecking Demo/Demo$(1).ist failed.\033[0m"; exit 1)
endef

$(foreach name,$(NAMES),$(eval $(call TYPECHECK_template,$(name))))