---
title: > Making a blog with Hakyll 2: GitHub Pages & Travis
---

This is a follow-up to my previous post, [Making a blog with Hakyll](/posts/2018-05-22-making-blog-with-hakyll.html). You don't need to read it,
though; I started over (mostly) from scratch.

As you may have already noticed, this blog is hosted on GitHub pages. This has
a number of advantages, the main ones being that I don't need to worry about
hosting and can easily make the blog's source code available.

GitHub pages doesn't support Hakyll out of the box, but it can serve a static site just fine.
I just need to somehow upload Hakyll's output into [Solonarv/solonarv.github.io](https://github.com/Solonarv/solonarv.github.io/tree/master)'s master branch. Fortunately,
that's well within the abilities of a CI service. I chose [Travis](https://travis-ci.org)
because it's the one I'm most familiar with, it's free, and it has easy GitHub integration.