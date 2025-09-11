ZIP_NAME = mstc.zip

.PHONY: all clean

all:
	find . -type f \( -name '*.ist' -o -name 'Makefile' -o -name 'README.md' \) | zip $(ZIP_NAME) -@

clean:
	rm -f $(ZIP_NAME)