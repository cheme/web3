
Using striple to represent a web of trust is very easy.

# PGP like users

Every user posses a pair of Key, associated with their profile (signing user metainformation).

Having PGP users represented as an striple is therefore simply :
  - two striple :
    - user key abstract triple with `from` being a master key, a CA or the user key, `about` informative of a user key, `content` an abstract content or non updatable infos (publickey if this striple key is derived from key and not exact copy of key).
    - `from` user striple  `about` informative of a user meta signing, with `content` its metainformations.
  - one striple of id the user publickey (or derive from) : `from` this striple,  `about` informative of a signed user, with `content` its metainformations (with user public key if striple key is just derive from publickey).

Plus extensible to any striple using user as `From` for example adding an hcard (hcard should be split into multiple striple in fact).

# Web of trust

Introduction of trust and rules to infer trust to others users depending upon their trust.

For example Trust could be an int between 0 and 5, 0 being ourself, and having an user to of lower trust trusting another user makes that we trust this other user at a trust of at most the original user trust plus one. (for example A is trusted at 2, if A trust B at 1 I will trust B at 3, if A trust C at 4 I will trust C at 5).

There is several possible strategies (a number of users trust needed to promote another user trust)... 

# Distributed Certificate Authority for PGP

A first step should be to make PGP user directory in a more Peer 2 Peer approach, by relying on multiple certificate authorities (every users as peer are a CA), with inclusion of those CA as trust (same as the user hosting the CA).
For instance the CA we host is naturally our user database and of maximal trust.

# Difficulties

Those are general to striple but here in context of an existing PGP user directory, it add some difficulties.

## Update of a user meta infos

- if user is modeled as two striple : it is simply signing a new meta info striple then waiting for network to converge to the new one (you need at least a version or a date in the metas but inclusion in a [sidechain][./sidechain.md] is nicer (author opinion)). (basic principle of update)

- a new user is emit with reference to the old one (at least the old public key is in its meta to allow retro compatibility). Since we now use multiple key for signing this is worst than previous approach (author opinion). This scenari is more like a revoke - new user.

## Revokation of a user

- an striple of revokation is emit by user and network will converge to untrust the existence of the user. Obviously the distributed nature of the ca makes it difficult to revoke globally (specific rules are needed). (basic principle of delete).

# User authenticity

For some usage user may be validated by external services, for instance passeport shown in a townhall (numeric ID) to register a linked signature (striple) as a citizen.

It is nothing more than another trust but by an authority who should be well prioritized.

For French citizen there was/is an initiative of numeric ID delivered on presentation of identity paper to allow some oauth derivative authentification but only by using their services and with the drawback (it makes the initiative quite useless) that a public key can not be linked with the profile at the time (only useless things like name or address , no abstract id).

