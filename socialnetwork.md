 'I like' something is obvious. Social relation are easily represented as striple and signing role (`from`) would quite obviously be most of the time the user ID (or the user ID for this social relationship network).

# Existing approach

Striple is just a representation of what is done every day : something goes wrong with facebook, ok poeple create diaspora... It is a fork, but interroperability is hard because facebook own its info.

## Facebook and twitter like

Well known, well used model. Declined in every aspect of like, social professionel network (linkedin), find a wife ...

Two major issue :
  - ownership of data, the data send is not intended for the server owner but for the recipients : see confidentiality point, and do not forget that a free service implies some drawback (with a full P2P striple network some of the cost of the service is on the users due to the P2P network, with a hybrid striple network the alternative exists).
  - Interoperability of data, for instance I have an updated LinkedIn account, but I do not update my Viadeo account due to terribly redondant use, yet I keep my Viadeo account to keep ownership of my identity.

## Diaspora
 

Diaspora is good, because data could be open, because it allows decentralization and iteroperability.

Yet even if you can have multiple server which synchronize (xmpp like), it is still not really a peer to peer approach as user exchange with servers not with peers and therefore do not store their data (of course they could be a server themselves yet it has cost as data is not meant to be distributed).


For diaspora compatibility with striple should be a first step, a second step being P2P approach and a third to include trust in the P2P approach.

Maybe Trust could be include before, with server storing encrypted content like described bellow.

TODO is their open data format and mapping to striple

TODO so is it only synchronizable with diaspora



# Prerequisite

User with accessible key, the user definition is more related to [PKI][./pki.md] and distributed certificate authority approach : a transverse user distributed database based on trust. Yet user is striple and it does not forbid using a same striple database for user and domain specific social striples (just that it is different services).

ID of user specific to the social striples is nice to have to, it allows decorellation and a form of anonymat with yet some validation (involve a service provider to keep ther link hidden (like currently)).

Full anonnym Id usage depend on situation, for usecase like facebook it is ok since it is the trust that create the existance (id with no striple will not be trusted, botted id with lot of artificial striple will likely converge to a local topology of botted social network due to trust convergence).

# Confidentiality model

TODO shorten

Fbook is sometime criticize for removal of information being difficult, here it is almost more difficult but it is the nature of internet, the nature of information, when diffused it is copyable and therefore accessible. Yet with locality (especially when based on trust between user : groups), the resource could be diffused to limited trusted group of user without the risk that the central server keep long term copies or be pirated (user of the group are also vulnerable but less likely to be targetted).


Nowaday lot of poeple criticize buisiness using personal data as their main value.

Sending information over facebook network, give the property of info to facebook, and country (like France) try to compose with some basic principles like the possibility to forget information ("droit à l'oublie").

Who remember "TODO find reference" who intent trial to google for dereferencing info of false accusation about him.

Personaly I see it as a problem of conception, you send info to your friend so it could be seen by them : in this sense a P2P network using striples and trust is better because it is more direct and the storage (even if using external services for high availability) should be encrypted.
Still friendship is not allways forever and some info may get out of scope, then control over this info is kind of impossible but at least you should not put the blame on a company.
And the right conception is that information propagation could not be stopped, it is a lost cause.
In fact, the best way to make information disappear is to add new information, to overflow old info by new more pertinent and more valid (see shared algorithm) information.

The actual problem is that information that is not relevant except for a few is kept on servers (NSA, facebook and ...), info as striple having a more local topology is more likely to be forgot, and if encrypted for a few may be stored (in fact with good trust p2p design the info should stay in a local topology) but the key are likely to be forgotten.

Encryption for friend is easy (their should be smarter scheme), content is symetrically crypted : for example an striple `from` user key, `about` striple of signature scheme ` and `content` encrypted. 
An access to this key is needed for friend only so for each friend an striple is created : a key signature striple could be `from` the content key, `about` key scheme definition id, and content `the encrypted content key by the friend public key. An id of the friend is also needed (several possibilities depending on technical views : in about (an other striple containing reference to friend and info about the scheme), in content (mixed content with content and friend ID or another striple containing )... But to be practical using friend ID in about is the most compact form (if `from` is an striple using an `about` encrypted content and `about` is an user ID we can say that content is an encrypted key (this blocks some syntax)). The composite content approach is likely better (need to index friend id), and the `about` one more correct for native indexing (even with `content` as friend id and `about` an striple of encoded key).

# Business services

100% availability : crypted by symetric key and key send to friend (encrypted by friend private key of course) to access it. The availability of content and the send key is not easy when involved P2P nodes are not online, so using servers to publish it is added value for user.

Addvertisment : server storing content can advertise. If they stored sent key, they can have their own relationship between user database, and they can ask the user for some info about content to allow better targetted addvertisement (in a sense for better privacy a user should use this only for contents and not access key but their is always a balance between privacy and getting services).


