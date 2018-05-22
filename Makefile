.PHONY : watch site-contents preview deploy watch
.stack-work/built: site.hs solonarv-com.cabal stack.yaml
	stack build
	touch .stack-work/built

site-contents: .stack-work/built
	stack exec site build

watch: .stack-work/built
	stack exec site watch

preview: site-contents
	stack exec site watch

deploy: site-contents
	scp -r _site 'solonarv@kojima.uberspace.de:~/html'

clean-cache: compiler
	stack exec site clean