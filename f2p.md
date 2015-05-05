

Free 2 play game are particularily well suited for this model (usually less real time server need than in multiplayer games).

Particularily mobile game running single player with competitive interaction with others player, where servers mostly manage user and their assets, check client correct behaviour (detect cheater) and of course sells better assets for real money.

Leading to almost no need for servers, but need for big trust peers (it is the same as a server but allows some sharing of costs).

There may be two roles, the game creator, and the game manager.

The game creator create game assets, game engine motor, and basis. He provide update

The game managor implement rules to exploit the game in a f2p model, he will do the final client build of application (so he also manage possible adds). 

In an open model you can have multiple game creator (plugin approach for instance) and multiple game managor (for different country or simply small server).

It is similar to [multiplayer game](./multipgame.md) with lower constraints.

# code base

The game creator with signed [code](./code.md).

The game manager trust over code base, to allow best user experience.

# trusted items

It is shared [valualized items](./item.md), particularily the algo for [attribution of new items](./itemattribution.md).

# trusted money

F2P got their own money (being most of the time a special kind of item which cannot be looted).

It is easily represent as striples, striples like this should be `from` an emmitter which has trust related to a game exploitant up to a certain level (most of the time only the game exploitant but their is some interesting possibility for cross game/exploitant possibilities).

Some equivalence could simplify/lighten the central place of the game managor, for example Daily login bonus being signed by exploitant only on spending and beforhand it is simply striples between other peers but seen as equivalent to a daily login.

Exchange of this for content or right to play...

Trusted money could be interoperable between game/exploitant with conditions making that exploitant still benefit from change. Nothing else than an exchange place (with real time change rate based upon striple [rate](./exchange.md)).

# daily login bonus

Incentive to keep user hooked to the game, and let you say you are free to play by providing basis for playing.

Here it becomes daily usage of the current build by a game managor, it does not require full synchro (striples showing a play with another user should be enough if the trusted money allow such equivalence). It is more driven by rules (if striples of a connection add possibility to spend one coin and others will trust this spending).
