all: ./out/microbit-v2.ld

./out/microbit-v2.ld: microbit-v2.org
	emacs $< --batch --eval="(require 'org)" --eval="(require 'ob-tangle)" -f org-babel-tangle
