We have seen in [code][./code.md] that applicative as a whole have value, but pursuing this idea (and especially the fact that the application are a striple), with conjonction of source control including trust (see [git][./git.md]), we may repercut the trust up to compiled shared library interfaces (that way trusted code will be trusted up to its dependencies).

This lead to special compiler plugins and [linker] to sign shared library interface.
Leading to fully signed/trusted open and participative OS/systems.

C linux use case : TODO

LLVM/rust use case : TODO


  - abusing a dominant position : some [company] should take possession of the most basics concepts through their dominant market position. This is especially true for closed source software like operating system : obviously forking concepts enclosed in a close os is not realistic. So applicative should no be able to use os primitive with linking concept, that means that a linker should never be allowed to enforce concept linkage (and like for any ffi implementation it should be possible to write an interface between concept) : in fact it is simply include some concept fork in interface with primitive and having algorithm that underrate such forced concepts (even if they are shared by millions).
