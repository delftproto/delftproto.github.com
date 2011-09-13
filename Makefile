.PHONY: update update-origin clean

repository := git://github.com/delftproto/delftproto.git

update:
	if [ ! -d git ]; then mkdir git && git clone $(repository) git; else cd git && git pull && cd ..; fi
	git rm -r --ignore-unmatch vm
	cp -rH git/doc/* .
	git add .
	if ! git diff --cached --quiet; then git commit -m "Automatic update for commit `git --git-dir git/.git show -s --pretty=format:%h`."; fi

clean:
	rm -rf git
