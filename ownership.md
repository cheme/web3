Statements are owned in the sense that their usage as `for` in other statement require the ability to sign content with the statement key.

New remuneration model of content are based upon donation (giving money after usage) and related crowd funding (giving money before creation).

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

# valuation

Everything that is owned has value. see [exchange markets](./exchange.md). And the fact that a fork could be done does not diminished its value (otherwhise big social network would not be as hegemonic as they are), because the value is **a trust value** (a fork is successful only if its trust is better than the original (for example who trust oracle for opensource project : welcome libreoffice)).

Trust allow to remunerate content easily : when buying a content in a store where does money go? I wanted it to go for the scenarist, the rest of the movie was utter shit.

# distribution of money for ressource sharing 

Use case of a movie.

## central approach

what is done today + direct donation possibility

## trust approach

### contracts for initialization 

### exception culturelle francaise en trust

### trusted result and later exploitation

with crypto money, the striples themselves got value, when the movie is exchange numerous time, it lives as a dominant asset, and its component inherit from it.
+ redefinition of movie credits in terms of goodness (some will get leverage for their future)


# striple as currency

The idea of trusted money is interesting. In bitcoin like chain, money is here, algorithmically created (hash proof), and exist for every one. You can have exchange with other money with exchange rate fix at a time t...
That is the vision of money at a large scale. It could be modelized as striple (see [bitcoin](./sidechain.md)), but technically you still need double spending protection and it has only an interest for interoperrability (as information).

When defining a money by using striple trusted rules, and striple defined money, the money value and existance is related to topology and local to trust, this define local money usable to exchange trust influence locally.
It is the same as trust monetarization but about striple defined only for that (a category of striple).

## use case as a local money

That is the most obvious case : usage as a local currency in the sense of a community currency (trust in a community is everything). Local currency are locally emitted exchange money for local economy. Money becomes trusted rule into trusted community of poeple (with possibly common usage purpose).

## use case as a game money

In [gaming](./mulipgame.md) local in-game money are more and more define for valuation of content (mmorpg, tcg...), in a vizion of trusted game support ingame trusted money is the same as in game trusted [items](./item.md).

## use case for betting

Betting is amuzing, you first define and publish your rules about wining, win rate, and at the end you got or not your money.
What is amusing is that you do not earn money but trusted money, and in a sense it is good because cheating could earn you money but untrusted money.
This could lead to a new form of betting, the end of suspended wining account on betting site. Of course this is more likely to take place in a bitcoin like contract chain, yet that is like betting with normal money 

