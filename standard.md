
A possible frame representation, the purpose is to allow :
  - multiple content : this is possible by adding an striple reference to an encoding scheme, content is bytes and the encoding of content could be multiple. This is to allow flexibility.
  - algo in preambule (a meta info and extensible meta system)
  - multiple id in content : this is a case where content is seen as not striple ID but we could extract striple info when content is deserialized, for efficiency (index construction for database) the case may be seen as generic and content allow it.
  - single id in content : this is native.

IDalgo : ID of the striple representing the algo to check validity of (one for both), this is a meta information and does not need to be include in ID construction and striple signing (may be void).
IDcencoding : possible striple ID to define content encoding, this is a metainformation and could be omit (most system know the content encoding from `about` striple).
Signing key : for public striple the key length is simply 0 (plus possible info by meta algo). For a use case where checking require connection to an external server, even if the key is not use a 0 key lenghth should be prohibited (one byte length at least).
xtensiblenbID : allow multiple ID or 0 ID
xtensiblecontentsize : when null means it is a ID only triple

xtensible size, means is define by fix length except if first bit is null (size superior to half maxsize), therefore it means that size overflow and a subsequent buffer of the original size must be read with a 1 byte shift (for example ~2byte, first byte is drop and 4bytes are read (~4byte with same rules for extensible size)). It is the same as saying if depending on first byte double size and drop byte but keeping 7 bit of info for case where size is ok. 

A frame should be :

IDalgoSize(1byte) | IDalgo(optional (size >0)) | IDcencodingSize(1byte) | IDcencoding(optional) | contentIdSize(1byte) | fromIDSize(1byte) | fromID | aboutIDSize(1byte) | xtensiblesigsize(~4byte) | striplesig | aboutID | xtensiblekeysize(~2byte) | signingkey | xtensiblenbID (~1byte) |( | fromIDSize(1byte) | fromID | )\*nbID  |xtensiblecontentsize (~4byte) | content

That is pretty simple and must be as simple as possible (content encoding may not be).
Signing is done over the part of the frame starting by IDaboutSize : in fact it is about ID followed by the striple signing key and content bytes (`from` must be covered by the signing scheme : the fact that from striple publickey do check means it is the right `from` id).

This scheme does not really give good answer for advance encoding : the fact that some striple make only sense combined with others and for network efficiency should always be send with those (and possible lower number of ID by factorizing publickey and/or using public striple).

It implies that ID max size (in byte) is 255, that is not enough may switch to 2 byte to encode size.
It implies that ID do not have a fix size : this is questionable , an a size may be recomanded (better for dht if we do not want double hashing).
