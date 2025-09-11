NAMES = Tpc U F Step

.PHONY: all clean veryclean report $(NAMES)

SUCCESS_FILE := .typechecked_success
FAIL_FILE    := .typechecked_fail

all: clean $(NAMES) report

define TYPECHECK_template
$(1):
	@echo "Typechecking Demo/Demo$(1).ist ..."
	@if istari Demo/Demo$(1).ist; then \
		echo "Demo/$(1).ist" >> $(SUCCESS_FILE); \
		echo "\033[0;32mTypechecked Demo/Demo$(1).ist successfully.\033[0m"; \
	else \
		echo "Demo/$(1).ist" >> $(FAIL_FILE); \
		echo "\033[0;31mTypechecking Demo/Demo$(1).ist failed.\033[0m"; \
	fi
endef

$(foreach name,$(NAMES),$(eval $(call TYPECHECK_template,$(name))))	

report:
	@echo "---------------------------------------"
	@if test -s $(SUCCESS_FILE); then \
		echo "\033[0;34mSuccessfully typechecked files:\033[0m"; \
		cat $(SUCCESS_FILE); \
	else \
		echo "\033[0;33mNo files typechecked successfully.\033[0m"; \
	fi
	@echo "---------------------------------------"
	@if test -s $(FAIL_FILE); then \
		echo "\033[0;31mFailed files:\033[0m"; \
		cat $(FAIL_FILE); \
		echo "---------------------------------------"; \
		$(MAKE) clean; \
		exit 1; \
	else \
		echo "\033[0;32mAll files typechecked successfully.\033[0m"; \
		echo "---------------------------------------"; \
	fi
	$(MAKE) clean

clean:
	@rm -f $(SUCCESS_FILE) $(FAIL_FILE)

veryclean: clean
	@rm -f **/*.isto
