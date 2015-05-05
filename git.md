
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

Git include some GPG functionality TODO check it!!!!

### commit

* signing of overy commit instead of simple sha-1, sha-1 could become sha-1 of signing of commit instead of directly sha-1 of content. Both mode should coexist.

So commit striple is `from` a user, `about` fork striple, `content` commit sha-512 (or ripemd (or multiple hash...)).

* Categorization of commit : example doc update commit, spell commit, evo,....
This is similar to github tag for anomalies (and commit for them) but with signing, should be external to git.

### tag

same as commit (same as every GitObject).

### fork/branch

* Same signing as commit : an owner sign the fork and may define (web of trust )a group of users allowed to commit in this fork.

It involves that every fork associate a user (not only the commit) : in fact nothing need to be store it is only the validation rules that will say that this commit refers to a fork and is allowed for this user signature.

Yet it would be nice having an actual fork striple : `from` user, `about` project striple, `content` fork name
And related trust for commit striple : linking user to fork (plus one making it public).

### merge

Similar to commit case (ownership being the branch destination owner).

### build

Not a git thing, yet git related striple network (p2p or github or else) should distribute build related to a commit striple (or to a version striple related to a commit striple...).

close source trust + reference to os bootstrap

## backend and storage

simply in .git. Additional key are required, for adding all signature. In fact using sha-1 of signature may abstract the tools, but we still need access to striple to check those one (sha-1 could not be striple id), furthermore we wan striple for project and branch.

So it seems better to add storage of publickey and signing.
Private key should be stored in user profile : that is a bit more complexity over current user management. A master password should be use. Key should be in project .git but only if protected by master pass, otherwhise in user system preferences and synchronizable. 

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

striples used to enrich git (it is close to decentralizing github by p2p its concept and objects as striples) : 
- commit, merge... categorization (trust over those cats is powerfull concept)

The issue here is that  commit (and therefore merge) are identified in git by their sha-1, this is real good because we have an hash of the commit, this is real sad because we cannot trust sha-1.
So the idea of creating striple referencing commit is only valid if we reference all content of commit by using another hash scheme of commit : we at least need to create new hashes directly in git (and therefore why not do the signing).


- error categorization (trust over those cats is powerfull concept)



There should be a way to export github info as striples (or at least extract them).

