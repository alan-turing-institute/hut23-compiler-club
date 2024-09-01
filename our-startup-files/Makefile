all: ./out/microbit-v2.ld README.md

./out/microbit-v2.ld: microbit-v2.org
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-babel-tangle

README.org
	rm $<
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-org-export-to-org
	mv $<.org $<
