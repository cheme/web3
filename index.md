
Web 2.0, or at least the [semantic web] is a thing. Yet interoperability through RDF is very far from easy to find, in this sense some should say something is wrong. There was a vision of openness and interoperability of information, but the effort seems to expensive for most (somehow nice to have).
In this paper, I would like to express some idea, a vision of what should be information on the web. This uses two complemetary axis, access to information through peer 2 peer exchange and low level trust in the model.

This concept, were thought out of boredomness the last few year. It might be interesting to relate with existing definition, concept and algorithm to reach better formalisation.
For instance, usage of triplets was something found by trying to find the simpliest data structure to define all information (I enjoyed NoSql rising at the time), and I latter rediscover RDF when I looked at the point sometime forgotten that the 'param' is any of the RDF description param : by knowing RDF a little better I would have already got this generic triplets formulation.
So any contributions would be gladly welcomed, that is also the point of using a github project to display this : fork, patch, issues and so on.
Furthermore, english is not my native language and some content might be hard to catch or even not well written, that is one of the reason why I use a github project for this material : consequently anyone can create issue or propose english correction through versioning.

About the title, web3, it is a reference to the web being an network for sharing information and since all information are signed triplets web3 seems catchy. First idea was distcoin refering to bitcoin single chain of trust we got here distributed multiple trust relation with an inherent value related to its network of relation (no need for had calculus timestamp that is the network and its locality when sharing that create value).

This may not be really innovative, but I really think that the net is slow to evolve, see my main [motivations].


# Core Concept

Api for concept derived from RDF : expressivity of RDF with core trust implementation.
Plus striples as signed triple.

## simple triple graph like structure as universal description of information


To describe, and define information, graph like structure are nice : A relate to B, two concept linked. 
For flexible description, the relation needs to be a concept too and we got A C B a at triple with C being 'relate to'. That's the level of flexibility needed to describe easily almost anything. Triples with its component that could be at any place. This is very similar to RDF statements. Furthermore triples could be use as concept.

Like in RDF every triples is a `statement`. It is a bit like a simple phrase with subject, verb, complement, but without syntax : every component could be use in any position, and the meaning is very flexible. For our triplets (striple), the first element would be usually called `from`, the second element would be usually called `about` and the third element would be called `content` (the content is only defined dependantly of its two first elements).
Every triple is a statement/concept build from two statement/concept `from`, `about` and containing information (`content`). This means that some statement must be composed by themselve as `from` : see [triple simple sample](./triplesample1.md). And it also mean that `content` is either a primary content (for example a picture (or its hash)) or another triple.

This formulation is very flexible and things could be designed in various way (next points about signing give a guideline by giving more precise semantic upon `from` and `about` ) : for example, from `apple` about `being` content `fruit` or from `fruit` about `containing` content `apple` or from `containing` about `usable for` content `association of fruit and apple` (the content being an striple). How usefull is it if things could be formulated in various ways, we RDF we like to follow [ontology], here usage (see [topology]) prevails over definition, in the sense that nothing is given as an absolute truth (or everything is true) and we need to rely on inference (in rules used to communicate triples).

No namespace : we use abstract id (no name collision).

## functional abstract distributed information

All information is correct, because all information is defined by its adoption, by the statement done about it and from it.

Distribution allows partial information to live locally, and depending upon rules, information will be shared and accepted in a way that leads to info being correct in regard to its position (information is defined by the way it is shared and inferred which is defined by algo), see [topology].

Information in [general semantic](https://en.wikipedia.org/wiki/General_semantics) does not make sense by itself, informations are relativist. Information values depends upon your trust (other information trust) into them.
Info is valid or invalid in regard to others info.
Even the most basic concept is not true or false (in desencyclopedia 1 might not be additive to 1 while it will be in wikipedia). Foolishness as a right to be an information. 
Information is not something with a name or value but an aggregate (a [position][topology]) between others informations and at the end it is the observer that interprate the info from its own point of view. 
The computers should be able to retrieve the more likely related information. Nothing is false all is true (and the other way).
There should be no certitude regarding information (even phylosophically who never wonder about the nature of reality (espacially when tired, depressed, and other states)). 

So working with our triples, every triples are defined by a key which is an abstract unique value (a private key or UUID). 

Two identical concepts in term of content (`about`, `from`, `content`), as a right to coexist and be refered from multiple other statement.
For example two keys and two concepts for C int value 0 refered from statements from C standardization or from java int compatibility
Depending on the triplets using them, we have different semantic. But it sure should be merged in a new concept which peers should adopt (more statement usage).
So a triplet always involve three abstract ids : `from`, `about`, the statement/triple id and possibly some other statement(s) id in `content`.

Another formulation : information exists depending on its [locality][topology], we are on a network, a special kind of graph where it is easy to think with reference to locality/geography/network.

Info is define in a way were it could not change, **update of statement is only possible through creation of a new statement**. This is very important to allow coherent (pseudo coherent) knowlege database (in the sense that we may have not the same amount of content between two database but both could be synchronized) for distributed information.


Please Notice that a good attack on such formalization is using key (especially if public) and changing content, this makes some orphan resources weak, it leads to the perspective of a global master key (or many but network diverge then) which should not be public (key under it are). Forged content could be detected by checking signature of other trusted striples.
Technically we need to avoid that, the solution is simply to include a hash of the striples in its abstract id.

Management of distributed information and its inherent immutability, requires some known specific actions (which are typical source version operations) :

  - no update or delete, functional inspired info, means that storage is likely to lose some info. It is distributed table where information naturally disapear when not use anymore. Some info must be stored forever by some peer especially when using.
  - fork, the action of using an existing content and using it in a different context.
    - to initiate a new content (make a change on an existing one)
    - to use an existing content when you do not have ownership on it. Two main use case : 
      - abuse of ownership, the statement should be public (some basic statements), some statement doesnot live the way they should.
      - to propose something to an owner : I fork a statement and use the fork, then depending on the usage of my forked statement, the original owner may merge it (otherwhise my fork may take over its).
  A fork strategie should be to make fork of all other statement (seems not realist since it will repercute over all accessible striple in the network (potentially and quite likely all the network). there should be difficulties to synchronize with the new network), but it is only if the other statement using the original ressource (and the original statement) are public or owned by ourselve. Those kind of operation are more related to merge, simplification of the existing statements
  Fork induced two new striple (the new striple and the striple defining the hop), and two more hop to check when inferring content : existing triples apply to forked content and we may need to follow multiple fork link (equally or not depending on the application).
  Technically it is very likely that application will manage an equivalence table of id to allow efficient fork usage (in complex appli it is related with trust equivalence).
  Fork are everywhere since it is needed for appropriation of ressource and also to make change over statements (thus the usefulness of letting fork as a standard statement which could be forked too).
  - versioning, a special kind of fork, where some information evolve, a version counter is such info. Their is various design :
    - a reference to a root id in content (additional signed info) or in id and a version counter, that is very application specific and nothing prevent creation of tweo version with the same counter.
    - a reference to previous version in counter, it is harder to reconstitute the version tree but having no version counter, we create implicit subversion by duplicating.
    - same as fork, the costly fork description with an additional counter info.
  All approch are not incompatible.
  - revoking : issuing a revoke triple `about` the striple to revoke, rules and [topology] will make that the info is not transmit anymore and drop locally, leading to possible disapearance.
    The difficulty, like with fork is dealing with striple using this info : they will be orphan, depending on purpose we should create a replacement triple (a fork with new info) or link the orphan striples with another striples (define by user or by inference) or keeping them orphan leading to their probable disapearance (invalid info in most appli).
  - merge : Yet merge strategie (as fork or other) are not that simple and it should depends on the context (application managing content). Two strategie :
    - a specific one where we just want to incorporate work done on a fork (like for collaborative source control systems) : the action of merging a statement on another one by adding statement where the fork is used in `from` (and resigning them with the original statement key). But when statement are issued with the fork id in `about` we couldn't reissued the statement because we do not own the `from` statement : so the merge should be incomplete, merge request should be emit. 
    - a third ressource is create to merge both ressource (we do not resolve a fork), this may be define as a special fork of both merged ressources. Like with fork this obviously make the number of statement increase by relying on inference on this kind of definition. So the important part is not the special fork but the simplification : the `about` and `from` statement of the original ressources are created on the new statement when possible (and merge request and application strategie to forked unresponsive resource). That way the new simplier definition should be priviledged in local database and old concept disapear.
    Still the simplification, and disappearance of old concept, is stuck when some resource refer to old concept but we do not own them, several hypothesis :
    - let the network converge, waiting for the owner to simplify (may never happen even with the best algos if owner lost the private key...), and if it never happen the statement may just be forked or consider invalid (it all depend on the use case).
    - collective merge by trying to ask for simplification to owner (involve an application where owner of statement are addressable : resolve owner then contact him (not in all cases)). Merge could be also done through MergeQuery statement (with special propagation rules in the network, or with the help of external services (special peers)) which would be statements asking (asynchronously) for some simplification, no need to know how to address the owner.

  Said differently, merge is complementary to fork as that is the only way to simplify the network and when a fork is effective, old version should be lost but existing triple to those version if making sense (still used or queries) should be replace by an equivalent new striple (this is hard for owned info as it requires a new signing and a direct intervention of the owner - meaning that owner should participate actively in the network otherwhise their info is likely to never be simplified and potentially losing some striples.
  This is, I think the more touchy thing as it may require network convergence which may be hard to achieve (see [company] or trust services which could help).

Those fundamental operation are still statement types : their application is only done through algorithm. That way they could also be forked merge, own, versionned, the only limit being their interpretation.



## trust information

Probably the most important point, every statement is signed (through asymetric signature algorithm, including the public asymetric scheme with no private key an public key being UUID and signature being this UUID with checking being ok if both UUID are the same (most likely allways)). That is where we introduce **striple** as the name for a signed triple or a signed statement (all statement are striple).

Information close to a user is true for him or for his concepts, information is issued by a user or a group : it is **signed** by him when he is the creator : directly (through it is user concept) or indirectly (through another owned concept).

Simple inference mechanism will most likely let user information be dominant over other info, except in case where an user trust authority is involved : simple case is a user trusting wikipedia signed info to be more relevant than its own info (see wikipedia case to see value of a dominant most trusted authority doing its job rightly). See [topology].

Signing could be done by a RDF triple like statement with content being another RDF, its hash and sign and originator. Yet the strength of the striple is that everything is signed and it is kind of an aspect over original triple, it is more practical this way (or at least I think).
  - some info are owned others are shared, owned info may not be use by everyone (its private key is not publicly knowned), shared/public info let everyone use both its private and publickey (actually no private key here and signing is simply use the public key so everyone can do it). See [ownership].
  For self induced info (for exemple a master key), the triplet is define over three time the same id (or two time) and self signed its content.
  - what if I lost my private key, what if someone abuse its position of private key owner. That is not an issue, the community of user must switch to a fork of this concept (`fork` is a concept and there is always a public fork concept to run this (private fork concept may exist to redirect user to more likely better fork (close to versioning)).
  - trust as a striple, trust to infer right info, in this model everything is trust, and trust triplet allows simple generic relationship between concepts, leading to efficient inference rules (for exemple in user trust database). Design is from being originator, about being trust (multiple kind of trust possible of course), and content typically the trust level and the trusted ressource
  - a temptation is to limit trust (`from`) to user statement (statement defining an user). This is not the purpose and the fact that every statement can sign/trust over statement is very important, information does not require user (private statement are yet owned by a pysical person).

Technically it means that the abstract id should be a hash of both the public part of the key and the signature of the content (for signing and immutability).

The signing role of `for` is more important than semantics. In fact `for` and `about` are a semantically close and it is the signing nature of for that is preponderant.
This two statement are semantically equivalent but the first one involve ownership of user1 :
- `from` user1, `about` public like, `content` user2
- `from` public like, `about` user1, `content` user2

One important legal point is that key should only be used to sign content, a key that should be use to crypt content should be in a separate striple : the point is that some legislation or future legislation may require that private key are send to national security services, this could only be justified to decrypt content, if I use my ownership content key to crypt something I may be legally asked for it and my ownership of the resource will be compromised at the same time.

# FAQ

- this model is not realist : every update create a new shareable distributed triple other network any relation betwenn two data the same, any trust cost the same and any info got its trust so this is very likely to explode. 
  Yes, that is why it is a model and it needs to be restrained by implementation depending on usecases : the model is generic, the implementations and algorithm do not need to be (that give real value to coding). So for some simple use case it is pretty realistic (for example a user shared trust database). Yet interoperability means that it must exists : so datamining between various application is possible (even if topology of the application is different (for example I could use desencyclopedia appli and wikipedia appli and still cross reference)). 

- update and inference is central, whith trust (for example) it implies statements being issued everywhere, concept about concept about concept... 
  You need to simplify the modelisation by issuing concept simplifying other concepts, for example a consolidated trust. This is true for RDF to, it is a major point, yet pretty common to data-mining. The simplification is facilitate by :
    - the possibility to be lead by satement (for example more trusted actor which will lead it, with potential usage of [sidechain]). This is especially true for knowlege which should be globally shared.
    - p2p network locality : algorithm routing choice of p2p database to query in function of inference rules (so that all is more likely to converge to local simple coherent topologies). This is the more natural use case, yet it required some well designed routing rules and application rules.

- fork of owned statement is bad, it will lead to copyright material impersonification.
  Trust must be use to know who deserve respect for its creation. See [trustright] usecase.

- May it help with participative application?
  Since everything is sign and public it is well suited to publish stuff and retain a form of [trustright], but there are several use case where it is the concept of web of trust which should apply and help to communicate, for example in participative decision taking. see [democracy] or [vote].

- Evolution of crypto makes all this useless, plus nothing is formally define, it seems all too generic.
  This is related with **striple validation** : key and signature must be check by specific algorithm which may evolve with crypto state of the art.
   - changing algo is done by creating a special kind of fork : easy
   - using the right algo is a lot more tricky. The validation algo should be include in the striple (like with bitcoin script), yet the question stay open : showing that we are able to check sign and key by applying a trustworthy method should be enough, it is then a responsability of the application to add information about such methods : an application, for exemple a user trust shared database, could statically define its validation leading to a range of striples for whom the method to use them are only known by the application. Interoperrability with other application is done by including specific info when using those statement in `about` or `from`, specific info which should be in content or non signed or even in key definition (the best solution for me). Therefore not including the validation script is bad (we should at least have a shared id of the validation process include in the id of the striple), but it should not be a limit to using the striple model (non standard striple may be forked to standard one or lost). 

- This is beautifull by its simplicity, but it is just RDF like with trust, how could we expect that poeple will program it?
  Making a programme, its [code] is value, there is true design decision to take over what should be infered, what should be striples, what cross application triples to address, what simplification to make, and this is really what will impact the [topology] of the knowledge, coding is in itself a form of ownership : 
   - so we need opensource for distributed application (otherwhise )
   - and from that version of an application is an striples leading to possible :
      - donation
      - version control and patch correction rewards...

- This is meant to be decentralized but as I see it big company will fastly take the lead over all that by being more trusted, having more servers...
  That is true, yet the fact that trust could go the other way and leads to topologic local better suited striples is still true. In fact big company should take the lead as long as they do their job, the current issue with big company is the abuse of dominant position. Using striple, big actor keep their ownership of info (by their dominant position on trust) but allow other info to coexist on local topologies.

- How does it relate with bitcoin, nowaday all distributed abpplication must relate with bitcoin.
  Bitcoin and its sidechains are different use case but a complementar one in some case. See [sidechain].

# Use cases

## Semantic

  - RDF appropriation. Any information could be formulated as an striples to allow linking. In fact it is the same thing as RDF, but there is more potential incentive behind. So running after conceptual knowlege appropriation is nice, by linking to some knowlege and by using existing knowlege (and forking when we own or find something should be public). This required communication of striples between peers, manually doable at small scale, but it needs to be automatized to find similarity and shared knowlege in a better way. See possible [mapping for RDF](./rdfmapping.md)
  - native distributed/p2p [database] for this kind of informations. giving easy access to locality information, easy inference rules (especially simplification and droping orphan and isolated content (if transient)), and multiple peers management.
  - specific [programing language](./code.md), here types are concept, and all is statically defined about the nature of the language : we say such type (rust u8) is such concept, such type over another type is another concept (struct NewConcept(u8)), but it is very static and not native. There is some room for inovation here.

## Web of Trust, society of trust

  - [PKI] with user : a truly distributed Web Of Trust, with a distributed certificate authority.
  - Copyright alternative, [trustright],  I draw this shit or give birth to this meme, please tip me. 
    Problem anyone can use this content (the draw) and say they are the owner, impersonate ownership of the ressource. This is a bad situation, locally we know the ressource is fine users having a relative level of trust that is ok, and if the ressource get known larger it should be done from the originator, [ownership] impersonation being relagate to garbage locality. Yet creating a resource from non active user makes it prone to impersonation by little more active users, and you need a mechanism to show that in order to locate this little more active user to garbage. Two ways to achieve that :
    - have a more trusted user register your content (its hash and your id). This looks relatively safe and create business.
    - using a sidechain (bitcoin chain being higher than every thing for temporal conflict), publishing hash of resource (plus owner id obviously) in sidechain and when it is commited publishing ressource with proof that it existed before. This is 100% safe. It create business to service specialized in side chain publication (by factorizing the number of content (hash of large number of hash-user id) the cost becomes close to nothing and the service position should allow for monetization of it).
    - crowdfunding : escrow model to earn, trust to delegate, risk really taken by [company]
  - non material [assets](./item.md) : things that are valuable by its public/shared acceptance of value (even if copyable as a single content) : example of rare item
  - [exchange markets](./exchange.md), trust in itself is value, striples are owned and could be therefore be bought/exchange, all that is needed to have a trust based market exchange.
  - [democratic](./democracy.md) process and organization are based upon the principle of trust (generally through vote).

## Evolution of existing tools

### Technical tools

Even when writing this I considered : should I create a statement for this (for exemple the drafted [RDF mapping][./rdfmapping.md]) : that would be a good idea.
This is also true for all codes, and ressources that are created, versioned and possibly collaboratively edited. 
That was also the primary reason I edit it as a git project (fork , merge, ownership of code and modifications). Creating an striple over it (RDF mapping) is not meant  to lock everything, it is just to own priority on evolution management, by keeping a central position as long as I actively participate. 
Yet if I did it I should also put it in a [sidechain] (actually I have enough trust in using github for not doing it), and other action that should be automatic : the easier way should be to emit striple with each commit, so have some code plugged in git. An extension should be the striples of **builds** (more CI and distribution related).

  - [git] plugin, or any code versioning tools should be able to include striples at every commit. This allows ownership of code (as a rightful author), and could be extend to error management (patch and correction), documentation and [builds](./linker.md).
  - source meta info and deriving usage of shared lib (linking with trust) TODO remove this point (explicit in descriptions)
  - In previous source control case, code is trusted through striples over commit, it also give the idea to do striples for build (and analogy with UEFI), signed build is something, yet there is something smarter, signed library. For dynamic shared library (dll,so and such) it would be nice to have striples over the so to repercute on programs using this .so leading to chain of signed dependencies. This could go further, at a function/api level. see [linker]

### Information network

  - Obviously all kind of [social] network application, web 2.0 big contenders like facebook or twitter or linking all manipulates big data easily reprensentable as RDF triple, with a central role for the users : therefore striple using `from` being the user are the basis to implement such informations. P2P in it allows a different control over the data (particularily about the [confidentiality](./socialnetwork.md)).
  - [collaborative knowlege databases](./wiki.md) : being similar to RDF in its triple description of the world, knowledge databases should use striple, for ownership (even if they are fully Peer 2 Peer knowledge databases).
  - chain of information (bitcoin). [sidechain] , [sidechaintimestamp]
  - decentralized internet : ok nothing to add, a full p2p internet is nothing new, starting from freenet like some decades ago. Recent approach seems to enjoy mesh network, truly a good thing, nothing incompatible especially since mesh network generaly replace address by a public key (eg [cjdns](./cjdns.md)), striples could be easily define over them. Another thing is access to striples in websites, and p2p website, this require some [browser] compatibility.
  - information discovery (such as [DNS](./dns.md) or [web search engine](./searchengine.md))
  - meta info about content (see [browser] plugin)

### Entertainment
  - video game monetarization, some interesting use case for online games (other games are more like any [owned content](./trustright.md)) :
    - [multiplayer games](./multipgame.md)
    - [Free to play games](./f2p.md)
  
### content creation and distribution
 
  - remuneration based on trust, see [trustright] and [ownership], a basic thing is to add an striple signed `from` a content striple `about` donation with a bitcoin address as content.
  - [crowdfounding](./crowdfunding.md)
  - P2P for [distribution](./distribution.md)

## open algorithm/protocol

  - [vote] machine : protocol for voting
  - [multi user random and share value](./itemattribution.md) : protocol example for creation of shared random content
  - shared [ownership] : multiple owner
  - [sidechaintimestamp] : usage of bitcoin chain to timestamp an striple
  - merging two striple example

## MyDHT example

Implementation consideration and performance, distributing this content is a kind of DHT (distributed hash table), with the hash being the key of the statement. Yet it may be usefull to attach more information (non striple information) or to factorize multiple striple in one object.
A pseudo reallife example should be a rust implementation of a [web of trust](./pki.md) : the model use TODO link to mydht wot, involve three roles `truster` (the ability to trust and be use as a from), `trustedval` (the abilit y to be a signed `content`), and a kind of trust TrustRel being `about`.
Yet the traits used allow a sharable objet (KeyVal) to be signed by multiple TrustRel, over multiple striples (trustedval method `get_signed_content` resolve the content to sign depending on a TrustRel type) and with possibly non signed content.

That way manage striples with technical object having more, indeed when a trusted val is signed the application (example of TrustedPeer) include the `from` and `about` id, and when key is calculated it is from the public key of the trustedval. Plus the key is derived from the publickey (hash), the signature is not include in key calculation but it is an error and should be implemented. The trusted peer also include transient technical information which could be check in real time but is not signed : the address of the peer (checked by ping). Conceptually it is a bit wrong, the address should be include in a statement with signature from the originator when he started its peer exchange, but the signature is checked when trying to ping the peer and other peer does not transmit non connected address, this is a tradeoff.

Peersign (an object with the current trust to an user (trust may change with every new trust)) object on the other hand is clearly a invalid statement as a global object : its key is the key of the TrustedUser Statement (object exchanged are typed so two identical key may be stored in different storage). The signing is done through this key. Sharing a keypair for two statement is not really an issue if the signing is include in the key. Here with peer sign we have an incomplete statement : Key pair is missing (and must be retrieve from user with same id) and statement id is missing (it could be calculated by retriving user public id and hashing with the signing), yet in the applicative context it is not an issue and in fact all is here to export this to well formed striple if needed.

In this example we see that just by signing with inclusion of `about` id in the sgined content we produce something that may be exported to striple. (`from` is implicit to the signing action and content is a struct of many field, being an arbitrary content). Yet it is nice to try to be close to the model (inclusion of many striple ids in the signed content is not a good idea : just about id and an optional content id).


# standardization proposal

Content is algebric (anything or id of striple), it is in a sense two kind of content, but some extension make sense : multiple ID in content (inference is different). 
In general any kind of content : need additional info or binary (type of binary given by `about`).

The question of the kind of algo : use a statement id, to be able to check. Thus allowing locked proprietary checked (need to be forkable)... : this kind of info could be include in id of striple but it may be clearer to have metainfo.
The problem is we may put everything in ID of striple (already hash of content (through its signing) and publickey) but we also need the ID to be easyly addressable (in this sense a hash is good, for instance for distributed hashtable).
Finaly it seems that additional metainfo is not avoidable, but those info does not need to be hashed (the hash to create id is already define in an striple).

see [frame standard proposal](./standard.md).


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

