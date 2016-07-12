[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Striple")
[hm]: # (categories = ["Striple","Concept"])
[hm]: # (tags = ["introduction","index"])
[hm]: # (menu = "main")
[hm]: # (weight = 10)
[hm]: # (+++)

# YAnother Web3 formultation

Web 2.0, or at least the [semantic web] is a thing. Yet RDF interoperability of any information on the web is very far from being the actual situation.  
Some should say something is wrong, or something is too slow.  
There was an essential vision of openness and interoperability of information, but the set up, the implementation may seems to expensive for most (somehow nice to have), and maybe dangerous for others (less short term economics benefits and a doubt about long term situation).  
In this paper, I would like to express some ideas, a vision of what should be information on the web. This uses two complementary axis, access to information through *peer 2 peer* exchange and *low level trust* in the model.  
It may not be really innovative, but I really think that sharing some vision and using it may really help moving forward, see my main [motivations].

Those concept, were thought out of boredomness the last few year, certainly influence by some major outbreak like bitcoin or previous attempt at decentralized internet like freenet.  

Why a shared git markdown project (should have been a wiki), usage of triplets was something found by trying to find the simplest data structure to define all information (I enjoyed NoSql rising at the time), and I latter rediscover RDF when I looked at the point sometime forgotten that the 'param' is any of the RDF description param (flexible reusability of concepts) : by knowing RDF a little better I would have already got this generic triplets formulation.

It might be interesting to relate with existing definition, research, concept and algorithm to reach better formalisation. Thus the will to open and share here. This is the first **participation axis**  
So any contributions would be gladly welcomed, that is also the point of using a github project to display this : fork, patch, issues and so on.
Furthermore, english is not my native language and some content might be hard to catch or simply badly written, consequently anyone can create issue or propose english correction through versioning, that is the second **participation axis**.
Discussion should also occurs about feasability and concrete use case, if the idea of this web 3 and Striple is fairly simple, its possible application and technical limits are very open to discussion : this is a third **participation axis**, which should start by defining the best suited tools : irc, maillist, rfc project...

About the title, *web3* is a reference to the web being an network for sharing information and since all information are signed triplets web3 seems catchy (with implicit analogy to a web3.0). First naming idea was *distcoin* : referring to bitcoin single chain of trust, we got here distributed multiple trust relation with an inherent value related to its network of relation (no need for a proof of work, we prefer the trust network malleability and its sharing locality to create value). But this seems like a to obvious attempt to surf on the coin-like hype.


# Core Concept

API for concept derives from semantic web RDF : flexibility of RDF with core trust implementation. Plus *Striple* as 'signed triple' (the low level trust).

## simple triple graph like structure as universal description of information


To describe, and define information, graph-like structures are nice : A relate to B, two concept linked. 
For flexible description, the relation needs to be a concept too and we got A C B a triple with C being 'relate to'. That's the level of flexibility needed to describe easily almost anything. Triples with its component that could be at any place. This is very similar to RDF statements. Furthermore triples could be use as concept (E F (A C B) for instance).

Like in RDF, every triples is a *statement*. It is a bit like a simple phrase with subject, verb, complement, but without syntax : every components could be use in any position, and the meaning is very flexible. For our triplets (Striples), the first element would be usually called `from`, the second element would be usually called `about` and the third element would be called `content` (the content is only defined dependently of its two first elements).
Every triple is a statement/concept build from two statement/concept *from*, *about* and containing information (*content*).  
It implies that some statement must be composed by themselves as *from* (and possibly *about* to) : see [triple simple sample](./triplesample1.md).  
It also implies that *content* is either a primary content (for example a picture (or its hash)) or another triple.

This formulation allows various designs (next points about signing give a guideline by giving more precise semantic upon *from* and *about* ) : for example, from *apple* about *being* a content *fruit* or from *fruit* about *containing* a content *apple* or from *containing* about *usable for* a content *association of fruit and apple* (the content being a Striple).  
How useful could this be if things could be formulated in various ways, web semantic likes to follow [ontology], here usage (see [topology]) prevails over definition, in a sense where nothing is given as an absolute truth (or everything is true) : we need to rely on inference (applied to rules used to communicate/share triples).

No namespace : we use abstract id (no name collision), namespace could be define as Striple but are not include natively.

## functional abstract distributed information

Too read this part it may be relevant to first take a look at the trust information part.

All information is defined relatively to its adoption (uses), through its usage as *about*, and *from* relative to other informations, so all information is right.  
Distribution/sharing allows partial information to live locally :  depending upon rules, information will be shared and accepted in a way that leads to info being correct in regard to its position (information is defined by the way it is shared and inferred which is defined by algo), see [topology].

Information in [general semantic](https://en.wikipedia.org/wiki/General_semantics) does not make sense by itself, informations are relativist. Information values depends upon your trust (other information trust) into them (trust is an extension of observation here).  
Info is valid or invalid in regard to others info.  
Even the most basic concept is not true or false (in desencyclopedia 1 might not be additive to 1 while it will be in wikipedia). Foolishness got the right to be an information.  
Information is not something with a name or value but an aggregate (a [position][topology]) between others informations, this corelate with an observer interpreting the info from its own point of view (and the possible trust he got in other information).  
Computers should be able to retrieve the more likely related information the same way we do every day (with our limited trusted knowledge apart from emotion). Nothing is false all is true (and the other way). 
There should be no certitude regarding information (even philosophically who never wonder about the nature of reality (especially when tired, depressed, and other states)). 

So working with our triples, every triples are defined by a key which is an **abstract unique value** (a private key or UUID), to dissociate clearly the content of the information from its use.  
Two identical concepts in term of content (*about*, *from*, *content*), got the right to coexist and be referred from multiple other statement.  
For example two keys and two concepts for C int value 0 referred from statements from C standardization or from java int compatibility. Depending on the triplets using them, we have different semantic. Yet they sure should be merged in a single concept which greater peer adoption (larger statement usage).

So a triplet always involve **three abstract ids** : *from*, *about*,  and the statement/triple id. Possibly some other statement(s) id  might be referred to in *content*.

Another formulation : information exists depending on its [locality][topology], we are on a network (both information network and user network), a special kind of graph where it is easy to think with reference to locality/geography/network.

Info is define in a way were it could not change, **update of statement is only possible through creation of a new statement**. This is very important to allow coherent (pseudo/locally coherent) knowledge database for distributed information. If we may have not the same amount of content between two database, globally both can be synchronized.

Please Notice that a good attack on such formalization is using key (especially if public) and changing content, this makes some orphan resources weak, it leads to the perspective of a global master key (or many but network diverge then) which should not be public (key under it are). Forged content could be detected by checking signature of other trusted Striples.
Technically we need to avoid that, the solution is simply to include a hash of the Striples in its abstract id.

Management of distributed information, and its inherent immutability, requires some known specific actions (which are typical source version operations) :

  - no update or delete, functional inspired info. Long term removal of information implies that storage is likely to lose some info (we do not have infinite storage resources). Information naturally disappear from those distributed table when not use anymore. Some info must be willingly stored forever by some peers.
  - fork, the action of using an existing content and using it in a different context.
    - to initiate a new content (make a change on an existing one)
    - to use an existing content when you do not have ownership on it (see next part about trust). Two main use case : 
      - abuse of ownership, the statement should be public (some basic statements), some statements does not live the way they should.
      - to propose something to an owner : I fork a statement and use the fork, then depending on the usage of my forked statement, the original owner may merge it (otherwhise my fork may take over its).  

  A fork strategy should be to make fork of all other statement (seems not realist since it will fork over all accessible Striple in the network (potentially and quite likely all the network)). There should be difficulties to synchronize with the new network, and it is only if the other statement using the original resource (and the original statement) are public or owned by ourselve. Those kind of operation are more related to merge, and simplification of the existing statements.  
  A right fork strategy induced two new Striples (the new Striple and the Striple defining the hop (the fork relation)), and therefore two more hop to check when inferring content : existing triples apply to forked content and we may need to follow multiple fork link (equally or not depending on the application).  
  Technically it is very likely that application will manage an equivalence table of id to allow efficient fork usage (in complex appli it is related with trust equivalence).  
  Fork are everywhere since it is needed for appropriation of resource and also to make change over statements (thus the usefulness of letting fork be a standard statement which could be forked too).

  - versioning, a special kind of fork, where some information evolves : a version counter is such info. There is various design :
    - a reference to a root id in content (additional signed info) or in id and a version counter, that is very application specific and nothing prevent creation of two version with the same counter.
    - a reference to previous version in counter, reading the version tree is harder. Yet having no version counter, we create implicit subversion by duplicating.
    - same as fork, the costly fork description with an additional counter info.  

  All approach are not incompatible.  
  - revoking : issuing a revoke triple *about* the Striple to revoke, rules and [topology] will make that the info is not transmit anymore and drop locally, leading to possible long term removal.  
    The difficulty, like with fork is dealing with Striple using this info : they will be orphan, depending on purpose we should create a replacement triple (a fork with new info) or link the orphan Striples with another Striples (define by user or by inference) or keeping them orphan leading to their probable disapearance (invalid info in most appli).
  - merge : merge strategy (as fork or other) are not as simple as it seems and it should depends on the context (application managing content). Two strategies :
    - simply adding work done and merged info in a fork (like for collaborative source control systems). We need to reissued Striple using the original resources in order to let old Striple disappear (the merge Striple should have greater interaction in order to replace originator). Reissuing statements where the fork is used in *from* (and resigning them with the new statement key) is easy, but for statement using old content in *about* (except for public one) we cannot reissued them because we do not own the *from* statement : so the merge should be incomplete, and merge request should be emit. 
    - a third resource is created to merge both resource (we do not resolve a fork), this may be define as a special fork of both merged resources. Like with fork this obviously make the number of statement increase by relying on inference on this kind of definition. So the important part is not the special fork but the simplification : the *about* and *from* statement of the original resources are created on the new statement when possible (and merge request and application strategy to forked unresponsive resource). That way the new simpler definition should be privileged in local database and old concept disappear (we need common rules for network convergence).  
    Still the simplification, and disappearance of old concept, is stuck when some resource refer to old concept but we do not own them, several hypothesis :
    - let the network converge, waiting for the owner to simplify (may never happen even with the best algos if owner lost the private key...), and if it never happen the statement may just be forked or consider invalid (it all depend on the use case).
    - collective merge by trying to ask for simplification to owner (involve an application where owner of statement are addressable : resolve owner then contact him (not in all cases)). Merge could be also done through MergeQuery statement (with special propagation rules in the network, or with the help of external services (special peers)) which would be statements asking (asynchronously) for some simplification, no need to know how to address the owner.  

  Said differently, merge is complementary to fork as it is the only way to simplify the network and when a fork is effective, old version should be lost but existing Striple to those version if making sense (still used or queries) should be replace by an equivalent new Striple (this is hard for owned info as it requires a new signing and a direct intervention of the owner - meaning that owner should participate actively in the network otherwise their info is likely to never be simplified and potentially losing some Striples.
  This is, I think the more touchy thing as it requires some network convergence which may be hard to achieve (see [company] or trust services which could help).

Those fundamental operation are still statement types : their application is only done through algorithm. That way they could also be forked merge, own, versionned, trusted, untrusted, the only limit being their interpretation.

## trust information

Probably the main point, every statement is signed (through asymmetric signature algorithm for owned ressources and for the public signature (no private key) a public key being UUID and signature being this UUID hashed with striple content with checking being crypto hash validation). That is where we introduce **Striple** as the name for a signed triple or a signed statement (all statement are Striple).

Information close to a user is true for him or for his concepts, information is issued by a user or a group : it is **signed** by him when he is the creator : directly (through it is user concept) or indirectly (through another owned concept).

Simple inference mechanism will most likely let user information be dominant over other info, except in case where an user trust authority is involved : simple case is a user trusting wikipedia signed info to be more relevant than its own info (see wikipedia case to see value of a dominant most trusted authority doing its job rightly). See [topology].

Signing could be done by a RDF triple like statement with content being another RDF, its hash and signature and originator. Yet the strength of the Striple is that everything is signed and it is kind of an aspect over original triple, it is more practical this way (or at least I think).
  - some info are owned others are shared, owned info may not be use by everyone (its private key is not publicly shared), shared/public info let everyone use both its private and publickey (actually no private key here and signing will simply use the public key so everyone can do it). See [ownership].  
  For self induced info (for exemple a master key), the triplet is define over three time the same id (or two time) and self signed its content.
  - what if I lost my private key, what if someone abuse its position of private key owner. That is not a big issue, the community of user must switch to a fork of this concept (*fork* is a concept and there is always a public fork concept to run this (private fork concept may exist to redirect user to more likely better fork (close to versioning)).
  - [trust][ownership] as a Striple, trust to infer right info, in this model everything is trust, and trust triplet allows simple generic relationship between concepts, leading to efficient inference rules (for example in user trust database). Design is *from* being originator, *about* being trust (multiple kind of trust possible of course), and content typically the trust level and the trusted ressource
  - a temptation is to limit trust (*from*) to user statement (statement defining an user). This is not generic and the fact that every statement can sign/trust over statement is very important, information does not require user (private statement are yet owned by a physical person).

**Technically it means that the abstract id should be a hash of both the public part of the key and the signature of the content (for signing and immutability).**

The signing role of *for* is more important than semantics. In fact *for* and *about* are a semantically close and it is the signing nature of for that is preponderant.
This two statement may be semantically equivalent but the first one involve ownership of "user1" :
- *from* user1, *about* public like, *content* user2
- *from* public like, *about* user1, *content* user2

One important legal point is that key should only be used to sign content, a key that should be use to crypt content should be in a separate Striple : the point is that some legislation or future legislation may require that private key are send to national security services, this could more easily be justified to decrypt content, if I use my ownership content key to crypt something I may be legally asked for it and my ownership of the resource will be compromised at the same time.

# FAQ

- this model is not realist : every update create a new shareable distributed triple other network any relation between two data the same, any trust cost the same and any info got its trust so this is very likely to explode. 

  Yes, that is why it is a model and it needs to be constrained by implementation depending on usecases : the model is generic, the implementations and algorithm do not need to be (that give real value to coding, and adhere to locally manage information principle).  
  So for some simple use case it is pretty realistic (for example a user shared trust database). Yet interoperability means that it must exists : to allow datamining between various application (even if topology of the application is different (for example I could use desencyclopedia appli and wikipedia appli and still cross reference)).  Some tooling like [database] require some genericity in recurrent index definition, yet it could not be a global scale knowledge database, the purpose is local database restricted to some topology with realist assumptions.

- update and inference is central, with trust (for example) it implies statements being issued everywhere, concept about concept about concept... 

  You need to simplify the model by issuing concept simplifying other concepts, for example a consolidated trust. This is true for RDF to, it is a major point, yet pretty common to data-modelisation. The simplification is facilitate by :
    - the possibility to be driven by striple (for example more trusted actor which will lead it, with potential usage of [sidechain]) : meaning some pretty drastic trust rules. This is especially true for information that should be globally shared.
    - p2p network locality : algorithm routing choice of p2p database to query in function of inference rules (allowing more likely convergence to local simple coherent topologies). This is the more natural use case, yet it required some well designed routing rules and application rules.

- fork of owned statement is bad, it will lead to copyright material appropriation.

  Trust must be use to know who deserve respect for its creation. See [trustright] usecase. Plus author group trusted representative are here to sign rightful ownership (forked ownership could only be preferred by someone distrusting those group).

- May it help with participative application?

  Since everything is signed and public, it is well suited to publish stuff and retain a form of [trustright]. But there are several use case where the core concept of web of trust should be applied to help to communicate, for example in participative decision taking. see [democracy] or [vote].

- Evolution of crypto makes all this useless, plus nothing is formally define, it seems all too generic.

  This is related to **Striple validation** : key and signature must be check by specific algorithm which may evolve with crypto state of the art.
   - changing algo is done by creating a special kind of fork : easy
   - using the right algo is a lot more tricky. The validation algo should be include in the Striple (like with bitcoin script), yet the question stay open : showing that we are able to check sign and key by applying a trustworthy method should be enough, it is then a responsibility of the application to add information about such methods : an application, for exemple a user trust shared database, could statically define its validation leading to a range of Striples for whom the method to use are only known by the application. Interoperability with other application is done by including specific info when using those statement in *about* or *from*, specific info which should be in content or non signed or even in key definition (the best solution for me). Therefore not including the validation script is bad (we should at least have a shared id of the validation process include in the id of the Striple), but it should not be a limit to using the Striple model (non standard Striple may be forked to standard one or lost). [Standard](./standard.md) propose to include an striple reference as non signed information.

- This is beautiful by its simplicity, but it is just RDF like with trust, how could we expect that people will implement it?

  Making a program, making [code] is value, there is true design decision to take over : inference rules, Striples definition, cross application striples interfacing or equivalence, simplification rules... Those decisions are really what will impact the [topology] of the information, coding is in itself a form of ownership : 
   - so we need opensource for distributed application like bitcoin for convergence of the network peers must apply the same rules and they must be public. Open does not mean that rules could not be owned (code as Striple).
   - a version of an application is defined as an Striple leading to possible :
      - donation
      - version control and patch correction rewards...
      - ownership of distribution

- This is meant to be decentralized but as I see it big company will quickly take the lead over all that by being more trusted, having more servers...

  That is true, yet the fact that trust could go the other way and leads to topologically local better suited Striples is still true. In fact big company should take the lead as long as they do their job, the current issue with big company is the abuse of dominant position. Using Striple, big actor keep their ownership of info (by their dominant position on trust) but allow other info to coexist on local topologies.

- How does it relate with bitcoin, nowadays all distributed application must relate with bitcoin.

  Bitcoin and its sidechains are different use case but a complementary one in some case. See [sidechain].

- Signing a master key is impossible : because if its *from* and *about* are its key and its key derives from the signature we cannot sign the result of the signature!!

  *from* is not included in the signature, it is the signing scheme that must ensure that the verification makes it impossible for him to be altered :
    - an RSA scheme makes that the publickey of from cannot be changed, and the publickey of *from* is included in *from* signature which is origin for *from* key.
    - a public scheme does not care about it, and in case of public hashing, the hash to calculate id must be done by including the id of *from* and the content (an UUID as public key is included in the content to avoid id collision).
  *about* if not defined and not included in signing content is implicitly inferred as being the same value as *from*.
  So for a master key, *from* is define afterward and *about* is null.

# Use cases

## Semantic

  - RDF appropriation. Any RDF statement could be formulated as Striples to allow interoperability with a quite nice existing semantic information basis. In fact Striple is so close to RDF, but with a less rich syntax (no namespace) and more potential incentive (ownership is valuable).  
  So running after conceptual knowledge appropriation could be a thing : by linking to some knowledge and by using existing knowledge (and forking when we own or find something should be public).  
  This also involve communication of Striples between peers (to get some ownership or just to collaboratively build knowledge) : manually doable at small scale, but it also needs to be automatized to find similarity and shared knowledge in a better way. See possible [mapping for RDF](./rdfmapping.md)
  - native distributed/p2p [database] for this kind of informations. Giving easy access to locality information, easy inference rules (especially simplification and stopping persistence of orphan and isolated content), plus a less common database functionality : multiple flexible peers/instances management.
  - specific [programing language](./code.md), here types are concept, and all is statically defined about the nature of the language : we say such type (rust u8) is such concept, such type over another type is another concept (struct NewConcept(u8)), but it is very static and not native. There is some room for innovation here.

## Web of Trust, society of trust

  - [PKI] with user : a truly distributed Web Of Trust, with a distributed certificate authority.
  - Copyright alternative, [trustright],  I draw this shit or give birth to this meme, please tip me.  
    Problem, anyone can use this content (the draw) and say they are the owner, impersonating ownership of the ressource. This is a bad situation, locally we know the ressource is fine users having a relative level of trust that is ok, and if the ressource get known larger it should be done from the originator, [ownership] impersonation being relagate to garbage locality. Yet creating a resource from non active user makes it prone to impersonation by little more active users, and you need a mechanism to show that in order to relocate this little more active user to garbage. Two ways to achieve that :
    - have a more trusted user register your content (its hash and your id). This looks relatively safe and create business.
    - using a sidechain (bitcoin chain being higher than every thing for temporal conflict), publishing hash of resource (plus owner id obviously) in sidechain. After it is committed publishing resource with proof that it existed before as an Striple. This is 100% safe. It create business to service specialized in side chain publication (by factorizing the number of content (hash of large number of hash-user id) the cost becomes close to nothing and the service position should allow for monetization of it). see for instance [sidechaintimestamp].
    - [crowdfounding] : escrow model to earn, trust to delegate, risk really taken by [company]
  - non material [assets](./item.md) : things that are valuable by its public/shared acceptance of value (even if copyable as a single content) : example of rare item
  - [exchange markets](./exchange.md), trust in itself is value, Striples are owned and could be therefore be bought/exchange, all that is needed to have a trust based market exchange.
  - [democratic](./democracy.md) process and organization are based upon the principle of trust (generally through vote).

## Evolution of existing tools

### Technical tools

Even when writing this I considered : should I create a statement for this (for example the drafted [RDF mapping][./rdfmapping.md]) : that would be a good idea.  
This is also true for all codes, and resources that are created, versioned and possibly collaboratively edited. 
That was also the primary reason I edit this as a git project (fork, merge, ownership of code and modifications). Creating an Striple over it is not meant  to lock everything, it is just to own priority on evolution management, by keeping a central position as long as I actively participate or at least signing some credential.  
Yet if I did, I should also put it in a [sidechain] \(actually I have enough trust in using git web hosting google persistence for not doing it), and other action that should be automatic : the easier way should be to emit Striple with each commit, so have some code plugged in git. An extension should be the Striples of **builds** (more CI and distribution related).

  - [git] plugin, or any code versioning tools should be able to include Striples at every commit. This allows ownership of code (as a rightful author), and could be extend to error management (patch and correction), documentation and [builds](./linker.md).
  - In previous source control case, code is trusted through Striples over commit, it also give the idea to do Striples for build (and analogy with UEFI), signed build is something, yet there is something smarter, signed library. For dynamic shared library (so, dll, and such) it would be nice to have Striples over the .so to transmit trust over programs using this .so : leading to chain of signed dependencies and a nice way to manage package (in linux distro for instance). This could go further, at a function/api level. see [linker]

### Information network

  - Obviously all kind of [social] network application, web 2.0 big contenders like facebook or twitter or linking manipulates big data are easily representable as RDF triple. The user got a central place : therefore Striple using *from* being the user are the basis to implement such informations. P2P in it allows a different control over the data (particularly about the [confidentiality](./socialnetwork.md)).
  - [collaborative knowledge databases](./wiki.md) : being similar to RDF in its triple description of the world, knowledge databases should use Striple for ownership (even if they are not fully Peer 2 Peer knowledge databases).
  - chain of information (bitcoin). [sidechain] , [sidechaintimestamp]
  - decentralized internet : ok nothing to add, a full p2p internet is nothing new, starting from freenet like some decades ago. Recent approach seems to enjoy mesh network, truly a good thing, nothing incompatible especially since mesh network generally replace address by a public key (for instance [cjdns](./cjdns.md)), Striples could be easily be defined over them. Another thing is access to Striples in websites, and p2p website, this require some [browser] compatibility.
  - information discovery (such as [DNS](./dns.md) or [web search engine](./searchengine.md))
  - meta info about content (see [browser] plugin)

### Entertainment
  - video game monetization, some interesting use case for online games (other games category should only use Striples for [owned content](./trustright.md)) :
    - [multiplayers games](./multipgame.md)
    - [Free to play games](./f2p.md)
  
### content creation and distribution
 
  - remuneration based on trust, see [trustright] and [ownership], a basic thing is to add an Striple signed *from* a content Striple *about* donation with a bitcoin address as content.
  - [crowdfounding]
  - P2P for [distribution](./distribution.md)

## open algorithm/protocol

  - [vote] machine : protocol for voting
  - [multi user random and share value](./itemattribution.md) : protocol example for creation of shared random content
  - shared [ownership] : multiple owner
  - [sidechaintimestamp] : usage of bitcoin chain to timestamp an Striple
  - merging two Striple example

## MyDHT example

A [lib](https://github.com/cheme/mydht) implementing a generic distributed table with some extension to trusted KeyPair for the table. At cf702164ec366c7f4aa477f00a1ea009cf744062 commit their was no usage of [rust-striple](https://github.com/cheme/rust-striple) but a similar approach.  

Implementation consideration and performance over Striple usage should involve attachment of more information (non Striple information) or involve factorizing multiple Striple in one object.  
A pseudo real-life example should be a rust implementation of a [web of trust](./pki.md) : the model used in mydht web of trust, involves three roles *truster* (the ability to trust and be use as a from), *trustedval* (the abilit to be a signed *content*), and a kind of trust TrustRel being *about*.  
Yet the traits used allow a sharable object (KeyVal) to be signed by multiple TrustRel, over multiple Striples (trustedval method *get_signed_content* resolves the content to sign depending on a TrustRel type) and with possibly non signed content.

That way, striples management is done through technical object having more information than just a standard striple. Indeed when a trusted val is signed, the application (example of TrustedPeer) includes the *from* and *about* ids, and when key is calculated it is from the public key of the trustedval.  
Similarity to Striple Ids, the key is derived from the publickey (hash), the signature is not include in key calculation but it is an error and should have been done that way. The trusted peer also include a transient technical information which could be check in real time but is not signed : the address of the peer (checked by ping). Conceptually it is a bit wrong, the address should be include in a statement with signature from the originator when he started its peer exchange, but the signature is checked when trying to ping the peer and other peer does not transmit non connected address : a trade off.

Peersign (an object with the current trust to an user (trust may change with every new trust)) objects on the other hand are clearly invalid statements (as global object) : keys are the key of the TrustedUser Statement (object exchanged are typed so two identical key may be stored in different storage). The signing is done through this key. That means that we have two Striples signed with a same key.  
Sharing a keypair for two statement is not really an issue if the signature is include in the striple id calculation (that is the case). Yet here with PeerSign we have an incomplete statement : Key pair is missing (and must be retrieve from user with same id) and statement id is missing (it could be calculated by retrieving user public id and hashing with the signing), but in the applicative context it is not an issue and in fact all is here to export this to well formed Striples if needed.

In this example we see that just by signing with inclusion of *about* id in the signed content we produce something that may be exported to Striple. (*from* is implicit to the signing action and content is a struct of many field, being an arbitrary content). Yet it is nice to try to be closer to the model (usage of many Striple ids in the content is not a good idea (it is yet possible) : just *about* id and an optional *content* id should be nicer).


# standardization proposal

Content is algebraic (anything or id of Striple), it is in a sense two kind of content, but some extension make sense : multiple ID in content (inference is different). 
In general any kind of content : need additional info or binary (type of binary given by *about*).

The question of the kind of algo : use a statement id, to be able to check. Thus allowing locked proprietary checked (need to be forkable)... : this kind of info could be include in id of Striple but it may be clearer to have metainfo.
The problem is we may put everything in ID of Striple (already hash of content (through its signing) and publickey) but we also need the ID to be stay easily addressable (in this sense a hash is good, for instance for distributed hashtable).
Finally it seems that additional metainfo is not avoidable, but those info does not need to be hashed (the hash to create id is already define in an Striple).

See [frame standard proposal](./standard.md).


[sidechain]: ./sidechain.md
[sidechaintimestamp]: ./sidechaintimestamp.md
[motivations]: ./motivations.md
[trustright]: ./trustright.md
[ontology]: ./ontology.md
[topology]: ./topology.md
[ownership]: ./ownership.md
[company]: ./company.md
[code]: ./code.md
[democracy]: ./democracy.md
[vote]: ./votealgo.md
[linker]: ./linker.md
[git]: ./git.md
[item]: ./item.md
[database]: ./database.md
[PKI]: ./pki.md
[social]: ./socialnetwork.md
[semantic web]: http://www.w3.org/standards/semanticweb/
[browser]: ./browser.md
[crowdfounding]: ./crowdfounding.md
