.PHONY: update update-origin clean

repository := git://github.com/delftproto/delftproto.git

update:
	if [ ! -d git ]; then mkdir git && git clone $(repository) git; else cd git && git pull && cd ..; fi
	make -C git/doc
	rm -rf doc
	git rm -r --ignore-unmatch doc
	cp -r git/doc/html doc
	cp git/doc/readme.html index.html
	git add doc
	git add index.html
	if ! git diff --cached --quiet; then git commit -m "Automatic update for commit `git --git-dir git/.git show -s --pretty=format:%h`."; fi

clean:
	rm -rf git
