Statements are owned in the sense that their usage as `for` in other statement require the ability to sign content with the statement key.

Their are two kind of statement
  - public striple : the signing scheme only use public info

  - private or owned striple : classic KeyPair usage with private key not being communicated in the network.

Some would say all should be public, this is the case in application allowing fork strategy. 
But the point of this whole concept is the ownership of ressources that lead to trust over statements. It is also the main incentive for adoption, ownership of information is clearly valuable.

Shared ownership could be achieved easilly through :
  - signing algorithm : multiple key pair (a signature algorithm allowing signing from any of the pair). Their could be smarter strategy, (TODO reference to elliptic key derivation), allowing key to be define afterward and space efficiency.
  - inference applicative rule : defining a statement type for shared ownership (from original owner, about shared ownership and other owner). It involves more statement and is not as determinist (depends on network propagation (wich may ideally converge)).
  There could be smarter approach with nicer delegation with web of trust approach (applicative rules allowing equivalence of ownership depending on other concepts (trust between those one (for example between user is the easy use case))). Note that Shared ownership is not native ownership and will not be consider the same way for every peers.
  Algorithm should create statements to facilitate it (like resigning (new statement with a way to say its new (for example a version number in content)) an user trust when someone query you and the trust as change).

Loss of private key could be solve by :

  - secondary key : after some time without usage of the concept (update of the secondary key statement), the secondary key is viewed by peer as equivalent.
  - public domain : after some time without update of the keep alive statement, the concept becomes acceptable as public
  - simply fork it and fight to be the dominant fork

