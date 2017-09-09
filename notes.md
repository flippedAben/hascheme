# Setting Up A Haskell Build System (with Testing)

Stephen Diehl's guide is much more detailed than mine. Check it out.

## `.cabal` file

In order to start a new Haskell project, `cabal init`. This command will prompt
you for a bunch of answers. For the license part, choose MIT, because it's a
pretty good deal.

## Sandbox

Create a new sandbox with `cabal sandbox init`. This gives you an environment
that you can install packages into.

Install the packages specified in the `build-depends` sections of the `.cabal`
file into the sandbox by executing `cabal install --only-dependencies`.

This will not install any of the testing packages into the sandbox. More on this
in the next section.

## Testing

Add a section to the `.cabal` file called `test-suite test`. Customize it to
your liking. I specified all the packages that my testing process uses under the
`build-depends` section.

In order to install the testing packages into the sandbox, we need to run:
```
cabal install --only-dependencies --enable-tests
```

Next, configure `cabal` to compile the testing code:
```
cabal configure --enable-tests
```
