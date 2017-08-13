# `no` language
`no` is a self-hosting language that's written in Perl and can be compiled to
anything (sometimes multiple things at once). `no` is more of an execution
fabric than a typical language, and as such it's relatively conservative in its
set of features.

`no` has two fundamental syntactic elements:

1. `no <thing> ...;`: define a thing
2. `nb {...}`: quote a `no` code block

The basic idea is that `no` uses abstract values inside real Perl code and
watches what happens to them in order to reconstruct your functions, sort of
like an execution-level `(quote)` in Lisp.

`no` does things that modify Perl's global state, so it's a scoped abstraction;
you need to `use no` and then `no no` to delimit regions of code where it's
active. [More about this here.](no/use.md)

## Structs and compilation
- [`no struct`](no/struct.md)
