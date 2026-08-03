.PHONY: epub read clean

epub:
	@test -n "$(PIECE)" || { echo "usage: make epub PIECE=<folder under manuscripts/>"; exit 1; }
	mkdir -p build
	pandoc manuscripts/$(PIECE)/metadata.yaml manuscripts/$(PIECE)/*.md --split-level=1 -o build/$(PIECE).epub

read: epub
	open build/$(PIECE).epub

clean:
	rm -rf build
