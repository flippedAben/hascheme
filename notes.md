# Setting Up A Haskell Build System

Stephen Diehl's guide is much more detailed than mine. Check it out.

## `.cabal` file

In order to start a new Haskell project, `cabal init`. This command will prompt
you for a bunch of answers. For the license part, choose MIT, because it's a
pretty good deal.

## Sandbox

Create a new sandbox with `cabal sandbox init`. This gives you an environment
that you can install packages into.
