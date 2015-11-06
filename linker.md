[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Trust from source to program linking")
[hm]: # (+++)



We have seen in [code](./code.md) that applicative as a whole have value, but pursuing this idea (and especially the fact that the application are a striple), with conjonction of source control including trust (see [git](./git.md)), we may repercut the trust up to compiled shared library interfaces (that way trusted code will be trusted up to its dependencies).

This lead to special compiler plugins and [linker] to sign shared library interface.
Leading to fully signed/trusted open and participative OS/systems.

C linux use case : TODO

LLVM/rust use case : TODO


  - abusing a dominant position : some [company] should take possession of the most basics concepts through their dominant market position. This is especially true for closed source software like operating system : obviously forking concepts enclosed in a close os is not realistic. So applicative should no be able to use os primitive with linking concept, that means that a linker should never be allowed to enforce concept linkage (and like for any ffi implementation it should be possible to write an interface between concept) : in fact it is simply include some concept fork in interface with primitive and having algorithm that underrate such forced concepts (even if they are shared by millions).

# Api level

rust/llvm usecase

# bootstrap process : loading

# calculing usage of so striples (compiling)

# License consideration

case where fork of something to pay : distrust services...

api if striples at a function level could be partially usable : build using free function will not require signing of a paid library, build using pay function will be restricted (for example message about this being test or something else | or distrust for selling by steam or applicative market) or even better fees (decentralized money or payment to a trusted seller) from a program using payed api will be redistribute proportionally to api maker!! TODO rephrase (2 idea : level of license in same build and money from using dep).



TODO think about piracy for example a stream + game usecase (or opengl + game)

# Operating System

a linux build with included signed package dependancy.
- standard dist : archlinux
- advanced dist : Nix
Already the case but without signing : 
