files := build/Git.html build/JavaScript.html
tohtml = pandoc -f gfm --toc -so "build/$(2).html" "$(1).md" -H "Header/Header.html"

all: $(files)
clean:
	rm -f build/*

git: build/Git.html
build/Git.html: Git/Git.md
	$(call tohtml,Git/Git,Git)

js: build/JavaScript.html
build/JavaScript.html: JavaScript/JavaScript.md
	$(call tohtml,JavaScript/JavaScript,JavaScript)

ts: build/TypeScript.html
build/TypeScript.html: TypeScript/TypeScript.md
	$(call tohtml,TypeScript/TypeScript,TypeScript)

jsx: build/JSX.html
build/JSX.html: JSX/JSX.md
	$(call tohtml,JSX/JSX,JSX)

sak: build/ScoutingAppKnowledge.html
build/ScoutingAppKnowledge.html: ScoutingAppKnowledge/ScoutingAppKnowledge.md
	$(call tohtml,ScoutingAppKnowledge/ScoutingAppKnowledge,ScoutingAppKnowledge)
