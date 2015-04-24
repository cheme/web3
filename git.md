

Version control with statement
------------------------------

All version control tools should do this, you use them to manage fork, merge, keeping ownership and responsability over actions. All this is very close to how striples function.

The idea is to add key trust into version control tools, and while doing this formalize it as striples.

Furthermore trust and topology still matters to ensure ownership is correct (distrust poeple copying code without referencing original authors).

Git case
--------

TODO study git design (plugin, user management and action).

## Specific action

### plugin

### user management

### commit

Categorization of commit : example doc update commit, spell commit, evo,....
This is similar to github tag for anomalies (and commit for them) but with signing, should be external to git.

### fork

### merge

### build

+ close source trust + reference to os bootstrap

## backend and storage

simply in .git

## distribution

Not needed to p2p this, you need some central trust actors (for example github) to keep tracability (avoid someone to copy/fork a project without referencing original orignal authors).

Then more p2p decentralized trust would be good, but its general to striple management and is something that concerns more the generic database use case, plus it should be another tools (checking that code is not stolen). 

## license

TODO license implication (public or private striple...)

## git codebase

### plugin

### low level data model evolution

it should be trivial to externalize all those striples as external data referencing git content, yet for such a sensitive thing envisaging a git native storage as close as possible to git info seems better.

### external addin

striples used to enrich git : 
- commit, merge... categorization (trust over those cats is powerfull concept)
- error categorization (trust over those cats is powerfull concept)

There should be a way to export github info as striples (or at least extract them).

