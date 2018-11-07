---
title: >
  Making a blog with Hakyll 2: GitHub Pages & Travis
---

This is a follow-up to my previous post, [Making a blog with Hakyll](/posts/2018-05-22-making-blog-with-hakyll.html). You don't need to read it,
though; I started over (mostly) from scratch.

As you may have already noticed, this blog is hosted on GitHub pages. This has
a number of advantages, the main ones being that I don't need to worry about
hosting and can easily make the blog's source code available. You can find the
source code [here](https://github.com/Solonarv/solonarv.com).

GitHub pages doesn't support Hakyll out of the box, but it can serve a static site just fine.
I just need to somehow upload Hakyll's output into [Solonarv/solonarv.github.io](https://github.com/Solonarv/solonarv.github.io/tree/master)'s master branch. Fortunately,
that's well within the abilities of a CI service. I chose [Travis](https://travis-ci.org)
because it's the one I'm most familiar with, it's free, and it has easy GitHub integration.
On top of that, Travis has built-in facilities for deploying to GitHub pages, documented [here](https://docs.travis-ci.com/user/deployment/pages/).

Travis expects its configuration in a `travis.yml` file in the repository's root directory.
Getting Travis to build my site generator and run it is fairly simple:

```yaml
language: haskell

script: stack build --fast && stack exec -- site build
```

The `deploy` section needs a bit more configuration, because my use-case doesn't exactly fit
the default provided by Travis:

```yaml
deploy:
  provider: pages
  skip-cleanup: true
  github-token: $GITHUB_TOKEN
  keep-history: true
  committer-from-gh: true
  local-dir: _site
  repo: Solonarv/solonarv.github.io
  target-branch: master
```

This is still fairly straightforward, in my opinion. Let's see if it works:

```sh
$ git add --all
$ git commit
$ git push
```

Augh! Travis is installing cabal and trying to compile with that! That's definitely not what
I want. Fortunately, a quick search turns up [the `stack` docs](https://docs.haskellstack.org/en/stable/travis_ci/), which provide a ready-made `.travis.yml`.
It's fairly large, so I won't be including it. Let's try again.

This first build takes a while (nearly 40 minutes, in fact!), since `stack` and hakyll's dependencies need to be set up first; but future builds will be faster, because Travis can
cache the results of that work.

Now that I've got a successful build, it's time to get the deployment working. `$GITHUB_TOKEN`
needs to be set to an appropriately-scoped GitHub Personal Access Token, which is easy to set up.

A few minutes later, and... it's done! That was much easier than I expected it to be. All that's left is to push the latest version of this very blog post.