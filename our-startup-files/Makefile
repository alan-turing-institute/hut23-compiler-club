all: ./out/microbit-v2.ld README.md

# Cancel the built-in ("implicit") rules
.SUFFIXES:

.PHONY: empty
.PHONY: nearly-empty

./out/microbit-v2.ld: microbit-v2.org
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-babel-tangle

README.md: microbit-v2.org
	rm -f $@ 
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-org-export-to-org
	pandoc --to=gfm --standalone -o $@ $<.org

empty: 
	arm-none-eabi-as -o $@.o $@.s
	arm-none-eabi-ld --print-map \
	--orphan-handling=warn --warn-section-align \
	-T ./out/microbit-v2.ld -o $@.bin $@.o

nearly-empty: 
	arm-none-eabi-as -o $@.o $@.s
	arm-none-eabi-ld --print-map \
	--orphan-handling=warn --warn-section-align \
	-T ./out/microbit-v2.ld -o $@.bin $@.o
