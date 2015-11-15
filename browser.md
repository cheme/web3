[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (update = "2015-11-06T12:43:26+01:00")
[hm]: # (updatecontent = "internal server")
[hm]: # (draft = true)
[hm]: # (title = "Js striple on browser")
[hm]: # (categories = ["Striple","Design"])
[hm]: # (tags = ["browser","js","client","web"])
[hm]: # (+++)


# native implementation

Or javascript/html5 only standard usage.

- javascript library primitive for Striple : minimal lib with constructor, signing, checking, encoding. Supporting multischeme (encoding and signing interface and impl from struct).
- management of local storage of Striple : webstorage primitive for application related Striple only. (yet limited to origin so not for all case).
- persistence of Striple : using external file (connection to secured webservice to database are better but not for minimalist lib implementing (another lib for that)). This could use the file api (especially on chromium), and otherwise the html input element.

The goals of webstorage of filestorage is to keep the private keys locally. 

A major issue with javascript api is that as soon as your local application manipulate the private key (which is needed to sign and check info), it is difficult to ensure that your key will not be send to the distant server (you cannot trust external javascript for it, it can send the key to himself : it is javascript).

So to manage owned striple an internal server or a plugin is needed.

# Internal server

The point is browser restriction does not allow us some action, so we can use a local webserver with a clean json rpc api to do such actions.

This is the same approach as (freedom.js)[http://www.freedomjs.org/] or others DAPPs for ethereum (augur for instance).

It involve CORS permission from distant site to your local server domain, it is both good and bad.
Bad because the user need to allow it for each site using striple, with technical message and the user need to know its local webserver port (and remember it is striple related). 
Good because the user know this is a dangerous action.
The api with local webserver must be as restrictive as possible, multiple permission level may be an idea (through different port, or manual server filtering configuring), but still no private key must be expose by the api.

Local port choice could be added, for various access permission but also for obvious config need.

# Plugins and browser evo for Striple in sites

export, viewer over content : similar to debuging tools (no technical analysis)

plugin or extension. We are talking about extension.

The extension should :
- access DOM of page (see use case of web annotation, see enrich html with Striple IDs).
- access local storage : file at least, key value db at best : to keep secret key and needed Striple



## Firefox

Proper isolation of private key.


### Interface

Xul button on right click to allow web annotation and editing of Striple over :
  - existing Striple (usage in from or about or content)
  - url : usage in content (or from/about through automatic creation of an Striple)

Rendering of Striple should be graph like without visualisation of abstract id (when multiple hop of ids relation an indice should describe it) : see [visualisation][.visualisation.md]. 
button share on right click : TODO


### p2p access to Striple

A peer to peer Striple communication involves direct communication between clients, which is obviously not the purpose of a browser.

So a plugin should host an http server to allow websocket exchange between client (all js approach) or simply p2p code with normal tcp socket.
TODO see what exists, plugin or extension (extension allow more than client js), foxyproxy may be a good source.

### native extension

The browser internal code should manage private key storage the same way it manage website password.
Their is several action that should be a standard to the browser (see http resource), but all evolution should be done progressively and extension seems to be the right first step.

And of course integration of Striple p2p lookup on request.

## Chromium

# Private Key storage (and Striple or at least Striple id)

If using browser (no specific client) an issue is the storage of the private key for Striple, its export and its import (plus its use through javascript), obviously webstorage should be fine if it was not that accessible by any receive javascript.

An idea should be to rely on webworker isolation (a web worker managing private key and possibly running signing), yet as web worker code is sent by server it is still wrong (it should be local (file access permission should be given to the worker but input usage seems not possible (need access to dom input))).
So this is needed but should be limited to public information (no private key), at least it seems very dangerous.
lib should maybe offer webworker/fileapi implementation with file access to trusted domain for script of worker only : but that is not possible (no cross domain worker for good reason), even if the script is accessed through CORS (the worker instantiated from its blob will be seen as running from the distant site and local storage permission will need to be set for the distant site).

Furtermore a passphrase should be implement over key storage (model close to firefox storage of password).

# web3 website

Not only Striple but usage of Striple driven website.

Similar to freenet approach in the sense that you access P2P shared info.

## hybrid decentralized http resources

Resources, html, js, png, svg... are Striple and shared and queryable between peers.

Peers can become privileged host.

Striples coexist with standard internet resources

You need a way to hyperlink a resource (alternate hyperlink) : 
  - an additional attribute on hyperlink html standard tag containing the resource abstract ID, it need an evo of html : very unlikely
  - direct use of 'ID' attribute to store Striple id : seems right, yet is likely to create conflict with javascript web framework (or need to integrate in web framework)
  - javascript mapping over 'ID' attribute of link tag : a bit of hacky, and no support for non javascript mode (in this case we could switch to previous solution).
  - misuse of css to add this as : TODO

## full Striple driven internet

Striples describe themselves as resource.

There is no longer way to access content without Striple (Striple is primary).

Hyperlink do not need alternate and are simple : simple enough striple://#stripleabstractid# and therefore it could be searchable on google.


see [DNS](./dns.md) see [search engine](./searchengine.md)

Some specific Striples like website cache : all resource of a website to allow fast p2p exchange (no lookup for every resources), and with possible updates...


# Plugin to add information over existing content

emit Striple for about other accessible Striple in browser (kind of web annotation) :
 - critics, for example rating (give birth to metacritics aggregator)
 TODO find existing
 - link discovery : add related link to help other users
 TODO find existing
 - indexer plugin : to index on browse (for later usage as a distributed search engine).
 ...
 ...
