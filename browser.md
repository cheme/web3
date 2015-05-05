
# native implementation

Or javascript/html5 only standard usage.

- javascript library primitive for striple : minimal lib with constructor, signing, checking, encoding. Supporting multischeme (encoding and signing interface and impl from struct).
- management of local storage of striple : webstorage primitive for application related striple only. (yet limited to origin so not for all case).
- persistence of striple : using external file (connection to secured webservice to database are better but not for minimalist lib implementing (another lib for that)). This could use the file api (especially on chromium), and otherwhise the html input element.

The goals of webstorage of filestorage is to keep the private keys locally. 

A major issue with javascript api is that as soon as your local application manipulate the private key (which is needed to sign and check info), it is difficult to ensure that your key will not be send to the distant server (if you trust javascript from it, it should send the key to himself : it is javascript).

# Plugins and browser evo for striple in sites

export, viewer over content : similar to debuging tools (no technical analysis)

plugin or extension. We are talking about extension.

The extension should :
- access DOM of page (see use case of web annotation, see enrich html with striple IDs).
- access local storage : file at least, key value db at best : to keep secret key and needed striple



## Firefox

Proper isolation of private key.


### Interface

Xul button on right click to allow web annotation and editing of striple over :
  - existing striple (usage in from or about or content)
  - url : usage in content (or from/about through automatic creation of an striple)

Rendering of striple should be graph like without visualisation of abstract id (when multiple hop of ids relation an indice should describe it) : see [visualisation][.visualisation.md]. 
button share on right click : TODO


### p2p access to striple

A peer to peer striple communication involves direct communication between clients, which is obviously not the purpose of a browser.

So a plugin should host an http server to allow websocket exchange between client (all js approach) or simply p2p code with normal tcp socket.
TODO see what exists, plugin or extension (extension allow more than client js), foxyproxy may be a good source.

### native extension

The browser internal code should manage private key storage the same way it manage website password.
Their is several action that should be a standard to the browser (see http ressource), but all evolution should be done progressively and extension seems to be the right first step.

And of course integration of striple p2p lookup on request.

## Chromium

# Private Key storage (and striple or at least striple id)

If using browser (no specific client) an issue is the storage of the private key for striple, its export and its import (plus its use through javascript), obviously webstorage should be fine if it was not that accessible by any receive javascript.

An idea should be to rely on webworker isolation (a web worker managing private key and possibly running signing), yet as web worker code is sent by server it is still wrong (it should be local (file access permission should be given to the worker but input usage seems not possible (need access to dom input))).
So this is needed but should be limited to public information (no private key), at least it seems very dangerous.
(lib should maybe offer webworker/fileapi implementation (file access to trusted domain for script of worker only (may not be possible if worker from another domain is not)), with possibility to be replace by clean pluging code management).

Furtermore a passphrase should be implement over key storage (model close to firefox storage of password).

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

emit striple for about other accessible striple in browser (kindof web annotation) :
 - critics, for example rating (give birth to metacritics aggregator)
 TODO find existing
 - link discovery : add related link to help other users
 TDOO find existing
 - indexer plugin : to index on browse (for later usage as a distributed search engine).
 ...
 ...
