[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Topology in P2P striple")
[hm]: # (weight = 1)
[hm]: # (categories = ["Striple","Concept"])
[hm]: # (tags = ["topology","locality","wot","trust","value"])
[hm]: # (+++)


Any information (Striple) is valid (as long as signature is valid), yet contradictory statement exists : globally some information may be incoherent but locally it is not.

There is a topology of information ruled by :
  - global topology : connection between triplets (multi-graph structure were there is for every `about` (which potentially means every vertex) one king of graph), that is the data topology, a semantic topology. This topology is like a huge database with relation between concepts. It does not prevent invalid information as there is no rules implemented (two concept could be at the same time synonym and contrary with synonym and contrary being contradictory definitions.
Yet this topology is ruled by knowledge of Striples which is ruled by the nature of the information not being fully known at the same time (there is potentially an infinite number of Striples). 
  - local topology : The Striples connected depends on the locality of the knowledge base (and rules to access or look for other Striples (which is lead by Striples connections )) : a good example is a web of trust over some content : locality depends on trust Striples and rules for accessing others Striples given those trust Striples and other factors such as size of the knowledge base (in p2p main use case, presence of trusted peers). That is the actual topology over the semantic topology, it is a factor of :
    - applicative rules : inference algorithm, specifically merge, revoke and fork. Those rules let the local knowledge base be conform to the application purpose (had coded) or be conform with user needs (inferred through other statement). This is still deterministic.
    - sharing rules : usage of applicative rules over distribution of information : a full node access is a bit non-realist as information access tends to be a bit random (yet trusted actor like [company](./company.md) may have 24/24 server and other ways of influence).
    Promotion of data and rules to access data transmission in a dynamic network of many local database (p2p network) will converge to local p2p information topology : example acceptance of a fork as the main (an abusive [private][./ownership.md] statement is very likely to be fork to [public][./ownership.md] statement). This is non determinist when considering that access to info depends on available peers/local database and the order of consultation and a lot of random things that happen in a network.


So local topology (what is the more interesting) may totally diverge (that may be good for customization), yet it need to converge in some cases, for example a wikipedia trust is needed to have encyclopedia like info, this requires that applicative give priority (applicative and sharing rules) to some statement `from` a wikipedia owner (inferred or hard coded in for example a wikipedia application). 

The interesting point of the non deterministic aspect of a p2p knowledge database (the network of peer could not be deterministic) is that it still need to converge to some points (statistically likely to be rights one): creating a form of artificial intelligence closer to human intelligence (a lot of environmental randomness).

Distribution and sharing strategy are a major difference with [bitcoin](./sidechain.md) : bitcoin chain propagation is simple : do not propagate invalid, here all is valid but locality rules prevails. 

# Convergence of wrong info


An interesting point is that info will converge to local topology, and depending on algo to trust locality, this means :

- spam will converge to spam topology
- bot player will likely converge to bot network
- social network false user will converge to social network topology user of false user (more easy to invalid them if global network)
...
