First of all this sum of idea, concept, were thought by me out of boredomness the last few year. Yet it might be interesting to relate with existing definition and algorithm to reach better formalisation.
For instance, usage of triplets was something I found by trying to find the simpliest data structure to define all information (I enjoyed NoSql rising at the time), and I latter rediscover RDF when I looked at the point sometime forgotten that the '2param' is any of the RDF description param : by knowing RDF a little better I would have already got this generic triplets formulation.
So I would gladly welcome any 
Same thing, I am not an english speaker and some content might be hard to catch or even not well written, that is one of the reason why I use a github project for this material : so that anyone can create issue or propose english correction through versioning.

About the title, web3, it is a reference to the web being an network for sharing information and since all information are signed triplets web3 seems catchy. First idea was distcoin refering to bitcoin single chain of trust we got here distributed multiple trust relation with an inherent value related to its network of relation (no need for had calculus timestamp that is the network and its locality when sharing that create value).


- api for concept derived from rdf
  - simple rdf as universal description of information
    - triplets : 3 allows , 2 is not enough
    - no namespace
  - information in general semantic does not hold sense. information are relativist. information values depends upon your trust into them. info is valid or invalid in regard to others info. even the most basic concept is not given (in desencyclopedia 1 might not be additive to 1 and ) . foolishness as a right to be. Information is something without a name or a sense but an aggregate (a position) between others informations and at the end it is the observer that interprate its given its own point of view. In the middle of all that the computer should be able to give the more likely related information. nothing is false all is true (and the other way) there should be no certitude regarding information (even phylosophically who never wonder about the nature of reality (espacially when tired, depressed, and other states)). So working with our triples, every triples are defined by a key which is an abstract unique value (a private key). Two concept identical should be defined diferently (exemply two key and two concept other C int 0 value, about c value of a primitive int type) and depending on the triplets using them, have different semantic (yet in the example it will be difficult to represent in c without using a type over int in both case). 
  - Another way of saying is : information exists depending on its locality (with rdf or this triple), we are on a network, a special kind of graph where it is easy to think with reference to locality/geography/network.
  - some info are owned others are shared, owned info give only its private key, shared let everyone use both its private and publickey (or no key at all).
  - what if I lost my private key, what if someone abuse its position of private key owner. That is not an issue, the community of user must switch to a fork of this concept ('fork' is a concept and there is always a public fork concept to run this (private fork concept may exist to redirect user to more likely better fork (close to versioning).
- fork, versioning and revoking are the most fondamental aspect to include in algorithm, program using 
- no update or delete, functional inspired info, means that storage is likely to lose some info. It is distributed table where information naturally disapear when not use anymore. Some info must be stored forever by some peer especially when using
- distributed allows information to live locally, and depending upon rules, information will be shared and accepted in a way that leads to info being correct in regard to its position (information is defined by the way it is shared and inferred which is defined by algo).
- information close to a user are right for him or for his concepts, information is issued by a user or a group : it is signed by him when he is the creator : directly (through it is user concept) or indirectly (through an owned concept). Simple inference mechanism will most likely let user information be dominant over other info, except in case where an user trust authority is involved : simple case is a user trusting wikipedia signed info to be more relevant than its own info (see wikipedia case to see value of a dominant most trusted authority doing its job rightly).
- trust as a triplet, trust to infer right info, in this model everything is trust, and trust triplet allows simple geniric relationship between concepts, leading to efficient inference rules (for exemple in user trust database).
- this model is not realist : every update create a new shareable distributed triple othe network any relation betwenn two data the same, any trust cost the same and any info got its trust so this is very likely to explode. Yes, that is why it is a model and it needs to be restrained by implementation depending on usecases : the model is generic, the implementations and algorithm not really (that give real value to coding). So for some simple use case it is pretty realistic, yet interoperability means some datamining between use case and this general modelising.
- evolution and inference is central, when trust (for example) are issued everywhere, concept about concept about concept, you need to simplify the modelisation by issuing concept simplifying other concepts, for example a consolidated trust. This is true for rdf to, it is a major point, yet pretty common to data-mining.
- trust must be use to know who deserve respect for its creation
- idea that democracy (or multiple persons decisional process) does not work properly at large scale, because some stuff are related to local decision and some to global
  - local stuff decide by local people
  - global by representant of locals, or sums of locals - lack of numeric id
  - some stuff need to apply globally, when some stuff does not
- code is value
  - opensource for distributed application
    - donation
    - version control and user database
  - abusing a dominant position : some company should take possession of the most basics concepts through their dominant market position. This is especially true for closed source software like operating system : obviously forking concepts enclosed in a close os is not realistic. So applicative should no be able to use os primitive with linking concept, that means that a linker should never be allowed to enforce concept linkage (and like for any ffi implementation it should be possible to write an interface between concept) : in fact it is simply include some concept fork in interface with primitive and having algorithm that underrate such forced concepts (even if they are shared by millions).
- bitcoin revolution, bitcoin concept (the paper from Satoshi), made a great impression on many. It give a solution to 'double spending' problem aka timestamping something without a central authority. Bitcoin sidechain, is a natural extension which theoricaly allow to timestamp/decentralized any information.
  - comparing with our data : the approach when using bitcoin is an information which is true or false, therefore it is practical for its current usecase :
    - a currency
    - a dns
    - sharing storage
  - that is an approach more practical in the sense that it is simple (simple is beautiful).
  - in bitcoin a coin value is related to its position in the chain (not spend and signed by a previous timestamp as existing). Here the timestamp (in fact the hard search of double hash other current state of the chain) is not needed because every information are seen as correct depending on their locality, if they are send by a distrusted user their value is close to null for us (not for him or its network of distrusted user) : all value are related. Youtube for instance, lot of user trusting the service for referencing correctly its video, and declaring their usage as good, have a high value for announcement. That is inherently the real world thing but with better and more trustworthy indicators (and I think easier emergence and sharing with other actors).
    - a bitcoin sidechain 'timestamp/validation' over info are very usefull in some case. 
      - To simplify versioning and revokation, if a concept get out of reach of its owner, because it is to well implemented in the network and a subsequent version or revokation does not share well, adding a triplets to a sidechain locality is a way to manage versionning more efficiently.
      - In algorithm needing several step and with a final result represented in time : for example the voting algo in sample is ok without chain, yet the result may be altered with subsequent votes and redone of result calculation with false node or other (it may not be that easy). So at the end a step should register the result in bitcoin sidechain. The idea is that all produced by those triplets is locally true and using the sidechain is a good way to share it more globally.
    - in fact bitcoin chain is well fit in this model, with each 'timestamp/validation' being a triplet refered by multiple transaction and containing a proof of all of them. (the chain representation is obvious). But it is more for compatibility and sharing concepts as it will not give more efficiency. Yet the pattern is usefull.
- sample use case
  - native distributed database for this kind of informations. giving easy access to locality information, and easy inference rules (especially simplification and droping orphan and isolated content (if transient)).
  - pki with user : wot 
  - git plugin, see fork, versioning, revoking for similarity
  - wikipedia vs desencyclopedia + wiki should be git + if job done badly, distrust is more public than with centralized model.
  - obvious social network, diaspora is good, 
  - I draw this shit or give birth to this meme, please tip me
  - video game monetarization : ragnarok analogy - return to official : because clean even if you need to pay -> code as ressource
  - information discovery - dns
  - source meta info and deriving usage of shared lib (linking with trust)
  - democracy
- decentralized :
  - internet
  - chain of information (bitcoin)
  - specific programing language, here types are concept, and all is statically defined about the nature of the language : we say such type (rust u8) is such concept, such type over another type is another concept (struct NewConcept(u8)), but it is very static and not native. There is some room for inovation here.
- standardization proposal
- algorithm using it
  - vote machine
  - multi user random and share value
