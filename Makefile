files := build/Git.html
tohtml = pandoc -f gfm --toc -so "build/$(2).html" "$(1).md" -H "Header/Header.html"

all: $(files)
clean:
	rm -f build/*

git: build/Git.html
build/Git.html: Git/Git.md
	$(call tohtml,Git/Git,Git)
