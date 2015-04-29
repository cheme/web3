


# Plugins and browser evo for striple in sites

export, viewer over content : similar to debuging tools (no technical analysis)

## Firefox

### Interface

button share on right click : TODO

## Chromium

# web3 website

Not only striple but usage of striple driven website.

Similar to freenet approach in the sense that you access P2P shared info.

## hybrid decentralized http ressources

Ressources, html, js, png, svg... are striple and shared and queryable between peers.

Peers can become privilegied host.

striples coexist with standard internet ressources

You need a way to hyperlink a ressource (alternate hyperlink) : 
  - an additional attribute on hyperlink html standard tag containing the ressource abstract ID, it need an evo of html : very unlikely
  - direct use of 'ID' attribute to store striple id : seems right, yet is likely to create conflict with javascript web framework (or need to integrate in web framework)
  - javascript mapping over 'ID' attribute of link tag : a bit of hacky, and no support for non javascript mode (in this case we could switch to previous solution).
  - misuse of css to add this as : TODO

## full striple driven internet

striples describe themselves as ressource.

There is no longer way to access content without striple (striple is primary).

Hyperlink do not need alternate and are simple : simple enough striple://#stripleabstractid# and therefore it could be searchable on google.


see DNS see "moteur de recherche"

Some specific striples like website cache : all ressource of a website to allow fast p2p exchange (no lookup for every ressources), and with possible updates...


# Plugin to add information over existing content

emit striple for about other accessible striple in browser :
 - critics, for example rating (give birth to metacritics aggregator)
 TODO find existing
 - link discovery : add related link to help other users
 TDOO find existing
 - indexer plugin : to index on browse (for later usage as a distributed search engine).
 ...
 ...
