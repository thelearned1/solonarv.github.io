.PHONY : compiler site-contents preview deploy
compiler: site.hs solonarv-com.cabal stack.yaml
	stack build

site-contents: compiler
	stack exec site build

preview: site-contents
	stack exec site watch

deploy: site-contents
	scp -r _site 'solonarv@kojima.uberspace.de:~/html'

clean-cache: compiler
	stack exec site clean