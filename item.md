[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Item/asset and striple")
[hm]: # (+++)


non material assset

- items
  - authored (picture, 3D model...), export to multiple game assets...  Payment on usage 
  - rules (relation to game...)
  - randomness : unique items : TODO speech about why unique... see [algo](./itemattribution.md)
  - achievment (trying to get an acquirement for game : incentive higher with achievment system).

- map 
  - random see [algo](./itemattribution.md)
  - authored with trust

assets shared and valualized as striples

# example

The concept is pretty abstract, and starting with an illustration is nice.
Let say we have an striple defining a sword in a multiplayer video game.
This sword statistics are defined as a range of value by the game server.
This sword existence is limited to three by the game server.
All that is resource and rules.

So with an item we may have trust from game server, users, referencing an striple saying simply I am one of the three sword with such random valid statistic.
Their is a topologic existence for those item, and ownership of those involve `from` of the ownership striple being the sword striple id (so signed by this id).

Other game server may trust those or forbid those, you could also imagine using items cross-game, there is real benefit from having a public information about abstract item existance.

# monetarization

Real world value, notably for creator : 
- striple [ownership](./ownership.md)
- game being program (code and authored asset), compilation of build or server should keep striples dependency to have a view over striples (assets) usage (plus their ownership striples rules defining remuneration condition) and being able to distribute money fairly (either through a central collecting and redistribution or a more p2p approach). It is similar to [code](./code.md) and [linker](./linker.md) approach.
- value of a random defined item is given by the trust of others in the actual random generation of the item (and trust in ownership too).

# Real life item

TODO move this part somewhere else?

Of course striple could describe a real life item, and we still need trust, for example doing a decentralized ebay imlies a transfer of responsability to every actor and therefore a web of trust over exchange and item description.

Ownership of a real life item is a concept that need validation, and is therefore well suited for striple. It also help with selling.

The electronic communication could be used to create user to user transfer of propriety is something that is still not really practical. For instance I would want a geographic web of trust of user to manage the sell of my garden salad at the door of my house : the difficulty is that I should not make the proposition to the wrong person (otherwhise it would be lost in a mass of propositions).



