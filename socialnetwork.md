[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Social network and striple")
[hm]: # (categories = ["Striple","Concept","Society"])
[hm]: # (tags = ["social","business"])
[hm]: # (+++)



'I like' something is obvious. Social relation are easily represented as Striple and signing role (`from`) would quite obviously be most of the time the user ID (or the user ID for this social relationship network).

# Existing approach

Striple is just a representation of what is done every day : something goes wrong with facebook, ok people create diaspora... It is a fork, but interoperability is hard because facebook own its info.

Structurally there is initiative like [activity stream](https://tools.ietf.org/html/draft-snell-activitystreams-09) that are useful and not incompatible with Striple : simply contents with possibly multi Striple ID (where triple id of course).

## Facebook and twitter like

Well known, well used model. Declined in every aspect of like, social professional network (linkedin), find a wife ...

Two major issue :
  - ownership of data, the data send is not intended for the server owner but for the recipients : see confidentiality point, and do not forget that a free service implies some drawback (with a full P2P Striple network some of the cost of the service is on the users due to the P2P network, with a hybrid Striple network the alternative exists).
  - Interoperability of data, for instance I have an updated LinkedIn account, but I do not update my Viadeo account due to terribly redundant use, yet I keep my Viadeo account to keep ownership of my identity.

Another issue is the fact that content are stored and that the company is legally responsible for it.

## Diaspora
 
### general approach

Diaspora is good, because data could be open, because it allows decentralization and interoperability.

Yet even if you can have multiple server which synchronize (xmpp like), it is still not really a peer to peer approach as user exchange with servers not with peers and therefore do not store their data (of course they could be a server themselves yet it has cost as data is not meant to be distributed).

For diaspora compatibility with Striple should be a first step, a second step being P2P approach and a third to include trust in the P2P approach.

Maybe Trust could be include before, with server storing encrypted content like described bellow.

### Data model

A nice set of rules to know which is interoperable what should be transmitted, a semantic for message to exchange.

A mapping of diaspora federation message to Striple is quite realistic, the interesting part is the signature of message between pod which involve `from` of Striple being pods keys.

Evolution of the model should involve key for every user in exchange between pod (see later remark about user signing its action instead of communication trust).

XRD usage for users, like FOAF, a mapping is easily done (especially link tag where rel maps to about the parent Striple being from and the rest content), but the real question is the user public key : it exists with the possibility of defining a scheme, that is fine.

The fact is that diaspora identification of user is a diaspora address like : alice@alice.diaspora.example.org : for Striple we need an underlying user with possible multiple diaspora address, that is a must have (it lead to inference of ownership of content through address). Therefore a diaspora address must be define by an Striple `from` an abstract user.
There is a GUID associated to user, but it cannot replace the abstract id (it could be replace by the abstract user id).

Status update model is not that easy with Striple, just new Striple but it also means that models are quite different : status update should propagate (Striple propagation rules are drastic), some info should be seen as metadata and not include in Striple 

Publicity of owner cannot but here the issue is the trust model where all trust is for server : so an Striple signed by server when it should be all trust by user : problem of role - who should sign update : obviously it should be user but in diaspora it seems to be manage by an established trust between pod).
It is a relative gap between user centric model or server centric model : user communication with server is trusted (oauth) so user action does not need to be signed, then server is trusted. A more Striple approach is that **user actions should be signed by user and server only shared them**.

To go Striple, diaspora does not need to use native Striple database, but export possibility should be added, and beforehand lot of user signing everywhere plus evo of datamodel to store those user signing (plus security concern due to the fact that the user sign from its browser and he need to load its private key without giving it to the servers or getting it from server : web storage or [plugin](./browser.md)).
TODO this is fastly written from memory and rapid wiki check: ask for review to diaspora


# Prerequisite

User with accessible key, the user definition is more related to [PKI](./pki.md) and distributed certificate authority approach : a transverse user distributed database based on trust. Yet user is Striple and it does not forbid using a same Striple database for user and domain specific social Striples (just that it is different services).

ID of user specific to the social Striples is nice to have to, it allows decorrelation and a form of anonymity with yet some validation (involve a service provider to keep others link hidden (like currently)).

Full anonymous Id usage depend on situation, for usecase like facebook it is ok since it is the trust that define the user (id with no Striple will not be trusted, botted id with lot of artificial Striple will likely converge to a local topology of bot using social network due to trust convergence).

# Confidentiality model

TODO shorten

Fbook is sometime criticize for removal of information being difficult, here it is almost more difficult but it is the nature of internet, the nature of information, when diffused it is copyable and therefore accessible. Yet with locality (especially when based on trust between user : groups), the resource could be diffused to limited trusted group of user without the risk that the central server keep long term copies or be pirated (user of the group are also vulnerable but less likely to be targeted).


Nowadays lot of people criticize business using personal data as their main value.  Sending information over facebook network, give the property of info to facebook, and country (like France) try to compose with some basic principles like the possibility to forget/remove information ("droit à l'oublie").  Who remember "TODO find reference" who intent trial to google for dereferencing info of false accusation about him.  Personally I see it as a problem of conception, you send info to your friend so it could be seen by them : in this sense a P2P network using Striples and trust is better because it is more direct and the storage (even if using external services for high availability) should be encrypted.  Still friendship is not always forever and some info may get out of scope, then control over this info is kind of impossible but at least you should not put the blame on a company.  And the right conception is that information propagation could not be stopped, it is a lost cause.
In fact, the best way to make information disappear is to add new information, to overflow old info by new more pertinent and more valid (see shared algorithm) information.

The actual problem is that information that is not relevant except for a few is kept on servers (NSA, facebook and ...), info as Striple having a more local topology is more likely to be forgot, and if encrypted for a few may be stored (in fact with good trust p2p design the info should stay in a local topology) but the key are likely to be forgotten.

Encryption for friend is easy (their should be smarter scheme), content is symmetrically encrypted : for example an Striple `from` user key, `about` Striple of signature scheme ` and `content` encrypted. 
An access to this key is needed for friend only so for each friend an Striple is created : a key signature Striple could be `from` the content key, `about` key scheme definition id, and content `the encrypted content key by the friend public key. An id of the friend is also needed (several possibilities depending on technical views : in about (an other Striple containing reference to friend and info about the scheme), in content (mixed content with content and friend ID or another Striple containing )... But to be practical using friend ID in about is the most compact form (if `from` is an Striple using an `about` encrypted content and `about` is an user ID we can say that content is an encrypted key (this blocks some syntax)). The composite content approach is likely better (need to index friend id), and the `about` one more correct for native indexing (even with `content` as friend id and `about` an Striple of encoded key).

# Business services

100% availability : encrypted with symmetric key and key send to friend (encrypted by friend private key of course) to access it. The availability of content and key sending is not easy when required P2P nodes are not online, so using servers to publish it (content and key) is added value for user.

Advertisement : server storing content can advertise. If they stored sent key, they can have their own relationship between user database, and they can ask the user for some info about content to allow better targeted advertisement (in a sense for better privacy a user should use this only for contents and not access key but their is always a balance between privacy and getting services).

For a business company, managing semi-private network (we have seen that most should be encrypted and accessible only by concerned actor) is also an advantage in the sense that you do not have access to all content, and are very likely to avoid some legal trouble and avoid big "illegal content tracking" cost.  
Yet for 100% availability content is stored but the company do not own any key. The role of the company is more neutral like an access provider with the possibility to promote and help on some aspect by being a bigger more trusted peer.

As for any business service model related to an Striple well designed distributed application, company are *well trusted highly available with better inference capability peers*.


