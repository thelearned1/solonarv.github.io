---
title: Making a blog with Hakyll
---

I've long wanted a personal website, for a variety of reasons - a portfolio of my few actually completed
projects, the challenge of setting it up, and to have somewhere to put the occasional blog post. It
also seems right to own the domain name associated with my (globally unique, as far as I'm aware) username,
and what use is owning a domain name without something to put behind it? And what good is a website with
nothing on it?

I'm a big fan of Haskell, and I have a strong preference for static websites that don't require several
megabytes of JS just to be readable. This made [Hakyll](http://jaspervdj.be/hakyll) a natural choice for me.
There were a few hoops to jump through, however.

First, annoyingly, was the install process. I use `stack` for all my haskell needs, which is also the recommended
way to install hakyll.

    $ stack install hakyll --resolver lts-11.10

This seemed to work fine, right until the very end (compiling hakyll itself, after its many dependencies are done).
The build failed with an obscure error, reproduced below:

    [48 of 53] Compiling Hakyll.Web.Feed  ( lib\Hakyll\Web\Feed.hs, .stack-work\dist\5c8418a7\build\Hakyll\Web\Feed.o )
    Access violation in generated code when executing data at 0000000103644510

I was rather baffled. I tried again a few times, and googled a few combinations of "hakyll", "stack", "access violation" etc.; to no avail.
Eventually I had the bright idea to use stackage nightly instead; maybe that error was a bug that'd gotten fixed by now?

    $ stack install hakyll --resolver nightly-2018-05-21

An eternity later, I had `hakyll` installed.

    $ hakyll-init solonarv.com
    $ cd solonarv.com

I saw a cabal file (nice!), but a conspicuous lack of `stack.yaml`. Eh, easily fixed - `stack init`, and edit the resulting
file to use the same `nightly-2018-05-21` resolver that I'd built with. Now let's see if this works.

    $ stack build
    $ stack exec site watch
    $ # navigate to localhost:8000

Hey, it worked! By then it was getting rather late, so I went to bed. The next day, I came back and set about turning this
heap of Lorem Ipsum into my own blog; starting with deleting all the existing example posts and stubbing about/contact/index pages.

Since a blog without any posts is rather pointless, I pondered for a bit and then started writing this very post.

After writing the first paragraph, I was greeted with another vague error message complaining about an "invalid character". It took some
head-scratching and a few fruitless google search queries before I noticed that the generated HTML ended right after the "I" in the first
paragraph - in other words, right before the `'`. Maybe that was the invalid character? Sure enough, replacing it with the corresponding
HTML entity `'` fixed it. But the English language uses rather a lot of apostrophes, and typing `'` all over the place will
get old quickly.

Fortunately, Hakyll's "configuration file" is actually just a haskell file, which means I can knead data before passing it to pandoc.
I didn't even have to do very much; simply replace the default

```haskell
compile $ pandocCompiler
```

with `compile $ escapedPandocCompiler`, and write `escapedPandocCompiler` as a wrapper around `pandocCompiler` that first replaces reserved
HTML characters (`<>'"&`) with their corresponding HTML entities. Conveniently enough, hakyll provides a function to perform string replacements.
I ended up with something like this:

```haskell
escapeReservedChars :: Item String -> Compiler (Item String)
escapeReservedChars = pure . fmap go
    where
        go = replaceAll "\\\\?[<>&'\"\\\\]" $ \case
            "<" -> "&lt;"
            ">" -> "&gt;"
            "&" -> "&amp;"
            "'" -> "'"
            "\"" -> """
            '\\' : s -> s
            s -> s

escapedPandocCompiler :: Compiler (Item String)
escapedPandocCompiler = getResourceBody >>= escapeReservedChars >>= renderPandoc
```

This worked perfectly: hakyll was no longer throwing up on apostrophes! On with the writing!

But it wasn't so simple... I soon found that double-quotes were still causing trouble, even though I was escaping them! But *only* if there
were two or more in the same paragraph.

I decided to replace double-quotes with `-q-` in the source file for this post. Somehow I was still getting errors. This didn't stop
when I changed `site.hs` and this post even more, so that there were no double-quotes anywhere: not in the source, not in the intermediate
string that's passed to pandoc, and not in the output.

I was still having issues.

I backslash-escaped every single apostrophe and quote in this post, and it actually worked! Until hakyll reached the ellipsis three paragraphs
above this one.

This reminded me of something: one of pandoc's many, many extensions is called `smart`, and it turns ASCII quotes, ellipses and the like into
their unicode equivalents. I removed my hodgepodge of multi-pass find-replace, and turned off that extension - lo and behold, it works perfectly,
and I don't even have to backslash-escape anything anymore.

I have not filed a bug report, as I'm not yet convinced that I'm not simply doing something massively stupid.

It is now a day later, and I found [this](https://jaspervdj.be/hakyll/tutorials/faq.html#hgetcontents-invalid-argument-or-commitbuffer-invalid-argument)
in the hakyll FAQ: It seems that I need to explicitly set the character encoding to UTF-8. That seems to have fixed it.

The next step is to massage hakyll into building two output pages out of a single input, so I can have each post automatically link to its source.
But I'll do that another time.