TESTFOLDER := tests/
TESTFILES := $(wildcard $(TESTFOLDER)Test-*.js)
TESTFILENAMES := $(notdir $(TESTFILES))

FILES := $(wildcard *.js)

.PHONY : tests docs
tests:
	@echo \#\#\# START \#\#\#
	@for file in $(TESTFILENAMES); do \
                echo \#\#\# $$file \#\#\#; \
                node $(TESTFOLDER)$$file; \
        done
	@echo \#\#\# END \#\#\# 
	@echo `echo "\033[33;32m### SUCCESS ###\033[33;0m"`
docs:
	@echo `touch ../tempindex.html`
	@echo `dox -t 'GridFS' \
	-d 'Simple GridFS capabilities built on [node-mongodb-native]\
	(https://github.com/christkv/node-mongodb-native "node-mongodb-native").' \
	$(FILES) > ../tempindex.html`
	@echo `git checkout gh-pages`
	@echo `git branch -l`
	@echo `mv ../tempindex.html index.html`
	@echo `git add index.html`
	@echo `git commit -m 'Updated docs.'`
	@echo `git push origin gh-pages`
	@echo `git checkout master` 


