[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Concept for a striple database")
[hm]: # (categories = ["Striple","Design","Concept"])
[hm]: # (tags = ["nosql","db","database","rdf","p2p"])
[hm]: # (+++)


TOMOVE

Info is define in a way were it could not change, **update of statement is only possible through creation of a new statement**. This is very important to allow coherent (pseudo coherent) knowledge database (in the sense that we may have not the same amount of content between two database but both could be synchronized) for distributed information.

  - native distributed/p2p [database] for this kind of informations. Giving easy access to locality information, and easy inference rules (especially simplification and dropping orphan and isolated content (if transient)).

TOMOVE



Some NoSQL databases have interesting approach, riak for instance. Yet for true peer to peer with a dynamic network of peer the place seems open for new tool. The idea is to have a support code for both networking (managing of a p2p network and Keyvalue exchange) and (kinda the idea behind a specific configuring of mydht (a leveldb backend would be suitable)). This could go further to a more generic Striple [database] with regular query syntax (see what exist for rdf) with additional network and peer relaying/propagation considerations.


# level of implementation

For implementation, several step should be followed :

## Triple store

Rdf database like, with specificity (key storage (and additional metainformation), blob in content, abstract id, multi content (possibly multiple ID to index in content), possibly algo info ...).

Management of orphan?


Native indexing :
  - `from` id
  - `about` id
  - `content` id


Advance indexing :
   - full text on content, and other search capability (metadata indexing, image analysis...)
   - simple mixed content (both a content and an ID)
   - multiple id from content
   - multiple content in content

From and About interoperability :
in rules language, query language and index definition, we need a way to manage a common use case where `from` and `about` are interoperable (semantically close : a common use case).

## Crypto

Validation of Key integrity :
  - hash of content in it : on update
  - couple public private working (if owned) : job check

Validation of signing of Striples :
  - check of Striples on creation/reception of new
  - integrity recheck

Possibility to do check in query language.

## Trust

Indexing of specific Striples (those who leads to Striples equivalence), to infer chain of trust.

Transversal generic indexing needed.

This specific indexing could be use to simply and fastly implement trust over Striple database.

Specific indexing could also be for merkle tree as Striple (and optional functionality to add content in sidechain).

## Synchronizable database

Possibility to duplicate and merge database globally.

Possibility to run specific merging/synchro between database depending on rules (for example to refine some user trust).

Here rules are needed (and a language to define them).

## P2P database

Usage of rules of synchro to distribute database (notably usage of specific index = easy trust distributed database), this include the routing problematic.

Additional rules for defining which content should be kept, which content should be promote to others, which content should be queryied.

Adding of a peer discovery (possibly following previous rules).

Usage of multiple possible transport (tcp obviously, and possibility to plug others).


