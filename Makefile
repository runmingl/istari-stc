ZIP_NAME = mstc.zip

.PHONY: all clean zip dtt calf

all: dtt calf

dtt:
	${MAKE} -C src/DTT

calf:
	${MAKE} -C src/Calf

zip:
	find . -type f \( -name '*.ist' -o -name '*.pdf' -o -name 'Makefile' -o -name 'README.md' \) | zip $(ZIP_NAME) -@

clean:
	rm -f $(ZIP_NAME)