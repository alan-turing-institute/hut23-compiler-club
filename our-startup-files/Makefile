all: ./out/microbit-v2.ld README.org

./out/microbit-v2.ld: microbit-v2.org
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-babel-tangle

README.org: microbit-v2.org
	rm -f $@ 
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-org-export-to-org
	mv $<.org $@
