[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (update = "2016-07-19T09:48:44+01:00")
[hm]: # (updatecontent = "Words about ethereum")
[hm]: # (weight = 3)
[hm]: # (title = "Sidechain and striple")
[hm]: # (categories = ["Striple","Society","Concept"])
[hm]: # (tags = ["sidechain","value","bitcoin","ethereum"])
[hm]: # (+++)



TODO put part under right titles

# Bitcoin revolution

bitcoin revolution, bitcoin concept (the paper from Satoshi), made a great impression on many. It give a solution to 'double spending' problem aka timestamping something without a central authority. Bitcoin [sidechain], is a natural extension which theoricaly allow to timestamp/decentralized any information.
  - comparing with our data : the approach when using bitcoin is an information which is true or false, therefore it is practical for its current usecase :
    - a currency
    - a dns
    - sharing storage
  - that is an approach more practical in the sense that it is simple (simple is beautiful).
  - in bitcoin a coin value is related to its position in the chain (not spend and signed by a previous timestamp as existing). Here the timestamp (in fact the hard search of double hash other current state of the chain) is not needed because every information are seen as correct depending on their locality, if they are send by a distrusted user their value is close to null for us (not for him or its network of distrusted user) : all value are related. Youtube for instance, lot of user trusting the service for referencing correctly its video, and declaring their usage as good, have a high value for announcement. That is inherently the real world thing but with better and more trustworthy indicators (and I think easier emergence and sharing with other actors).
    - a [bitcoin sidechain](./sidechaintimestamp.md) 'timestamp/validation' over info are very usefull in some cases, like a distributed consensus where locality (global) is not used.
      - To simplify versioning and revokation, if a concept get out of reach of its owner, because it is to well implemented in the network and a subsequent version or revokation does not share well, adding a triplets to a sidechain locality is a way to manage versionning more efficiently.
      - In algorithm needing several step and with a final result represented in time : for example the voting algo in sample is ok without chain, yet the result may be altered with subsequent votes and redone of result calculation with false node or other (it may not be that easy). So at the end a step should register the result in bitcoin sidechain. The idea is that all produced by those triplets is locally true and using the sidechain is a good way to share it more globally.
    - in fact bitcoin chain is well fit in this model, with each 'timestamp/validation' being a triplet referred to by multiple transaction and containing a proof of all of them. (the chain representation is obvious). But it is more for compatibility and sharing concepts as it will not give more efficiency. For instance registered isbn services. Yet the pattern is useful.
    - sidechain to validate ownership of a resource and prevent impersonation of resource (it just prove that the resource has been firstly published as concept (it could have been an impersonation of non published resource : algo should take account of multiple parameter (obviously a database of existing licensed resources))).




# Nature of bitcoin chain

Bitcoin and sidechain could be seen as a special case of distributed statements with special propagation rules leading to globally shared statement with deterministic relation between those (the statement of the chain, not additional statement that may refer to them or be referred to from them (in case of inclusion of hash statement in the chain).

Distribution and sharing strategy are a major difference with bitcoin : bitcoin chain propagation is simple : do not propagate invalid, here all is valid but locality rules prevails. 

bitcoin chain propagation is simple : do not propagate invalid, here all is valid but locality rules prevails.

# Bitcoin like chain as statements

# Adding statement to a chain


# Help resolution for merge fork...

Find the actual value

# Still good as a [buiseness model](./company.md)

Being able to parse a merkletree hash inclusion in a sidechain for all Striples used in an inference mechanism is not realist, you need quite some indexing for all this content which is typically where big data matters, that is a potential service for new business.

The user and is local database will have access to more accurate information by having peers with such `bigdata` capabilities, like todays search engine.

But inclusion in the chain is still very important, to allow the user to fact-check what the company will say to him : parsing a block-chain and all side-chain trees of hash to lookup for info is quite impossible for a basic single user. On the other way checking that value used are indeed included is easy if enough info has been given to the user (see example of service describe in [timestamp](./sidechaintimestamp.md) example.


# Ethereum

ethereum is post-bitcoin chain, nothing to fancy (at the time of writing Proof Of Work is still use (Proof Of Stake to come later is a real change and should really change thing but everything is still unclear to me) but a really from design computation platform with a cost model to include computation (contracts) in the chain. This consensus/shared computation design lead to a ease of definition for chain application with their own rules. 

Still we keep similar principle : immutable data (in this case immutable computation), pow... Similarily, and in relation with DAO contract bad design and subsequent controversy on forking (june-jully 2016), their appear to be a real need for a web of trust forking information description (which would be somehow fine as ethereum contracts but is the kind of info that is somewhat universal and could benefit from a striple description). So having striple description of sidechain is especially relevant for chain forking too : the next question being the mining strategy on multiple chain with wot adjustment (more technical for efficiency).

