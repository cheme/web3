[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Striple standard representation")
[hm]: # (+++)


A possible frame representation, the purpose is to allow :
  - multiple content : this is possible by adding an Striple reference to an encoding scheme, content is bytes and the encoding of content could be multiple. This is to allow flexibility.
  - algo in preambule (a meta info and extensible meta system)
  - multiple id in content : this is a case where content is seen as not Striple ID but we could extract Striple info when content is deserialized, for efficiency (index construction for database) the case may be seen as generic and content allow it.
  - single id in content : this is native.

IDalgo : ID of the Striple representing the algo to check validity of (one for both), this is a meta information and does not need to be include in ID construction and Striple signing (may be void).
IDcencoding : possible Striple ID to define content encoding, this is a metainformation and could be omit (most system know the content encoding from `about` Striple).
Signing key : for public Striple the key length is simply 0 (plus possible info by meta algo). For a use case where checking require connection to an external server, even if the key is not use a 0 key lenghth should be prohibited (one byte length at least).
xtensiblenbID : allow multiple ID or 0 ID
xtensiblecontentsize : when null means it is a ID only triple

xtensible size, means is define by fix length except if first bit is null (size superior to half maxsize), therefore it means that size overflow and a subsequent additional buffersize is define by this first byte minus its first bit (255/2 length).

Then this byte is skiped and new byte size is use (with same rule on first byte for possible additional size (subsequent bytes size defs are cumulative)).
For example ~2byte, first byte is drop and 4bytes are read because first byte value was (10000010).
It is the same as saying if depending on first byte double size and drop byte but keeping 7 bit of info for case where size is ok.

Size are defined in a **big endian** manner.

A frame should be :

```
IDalgoSize(2byte) | IDalgo(optional (size >0)) | IDcencodingSize(2byte) | IDcencoding(optional) | stripleIdSize(2byte) | stripleID | fromIDSize(2byte) | fromID | xtensiblesigsize(~4byte) | striplesig | aboutIDSize(2byte) | aboutID | xtensiblekeysize(~2byte) | signingkey | xtensiblenbID (~1byte) |( | contentIDSize(2byte) | contentID | )\*nbID  |xtensiblecontentsize (~4byte) | content
```

That is pretty simple and must be as simple as possible (content encoding may not be).
Signing is done over the part of the frame starting by IDaboutSize : in fact it is about ID followed by the Striple signing key and content bytes (`from` must be covered by the signing scheme : the fact that from Striple publickey do check means it is the right `from` id).

This scheme does not really give good answer for advance encoding : the fact that some Striple make only sense combined with others and for network efficiency should always be send with those (and possible lower number of ID by factorizing publickey and/or using public Striple).

It implies that ID max size if one byte (in byte) is (255/2 and most derive scheme (crypto hash of longer key) are at least 160 byte)), that is not enough so ID length use two bytes (leading to 32k byte for id).
It implies that ID do not have a fix size : this is questionable , an a size may be recomanded (better for dht if we do not want double hashing).

Two implicit rules : 
  - if `striplesig` is null, consider the stripleid as `sig` : it means there was no need to reduce the signature length. (that is the case in most public scheme where the signature is a hash of the content)
  - if `about` is null, consider `about` being the same as `from` (it allow self signing and is shorter). By extension and to avoid multiple signature on same content the bytes to sign when `from` is the same as `about` must include a zero length `about` : a Striple with `about` and `from` being the same must never be encoded with something else than 0 lenghth id for `about`. 

TODO file xtension + recursive about = if about is missing about is us.


Note that encoding is free of signing, so free of validation, it is a metadata, it should be call `metadata` (linking to Striple description possibly linking to multiple data), but at the time it is mainly use for defining encoding of content.

Note that encoding of content is meta, as the actual encoding is checkable by decoding (collision possible so not that true), and we sign bytes (encoding could be in content as a header like for many files type). So encodingid is also here for metadata extensibility.

Defined as protobuf it would be :
```
syntax = "proto3";

message STriple {
  bytes algoid = 1;
  bytes encodingid = 2;
  bytes sid = 3;
  bytes fromid = 4;
  bytes sig = 5;
  bytes aboutid = 6;
  bytes key = 7;
  repeated bytes contentid = 8;
  bytes content = 9;
}
```
Yet the dependency to lib is not suitable, and previous packing as simple as possible is what is needed (like for any protocol).


Notice that there is no enum, only reference to ids of Striple. Furthermore content is just bytes (it could be an included algebric type but this is more application specific).

Or a json like structure (ID bytes encoded as base64 and content bytes to (so costly : just for comprehension)) :
```
{
  "algoId": "...",
  "encId": "...",
  "stripleId": "...",
  "fromId": "...",
  "sig": "...",
  "tosign": {
    "aboutid": "...",
    "key": "...",
    "contentIds": [],
    "content": [],
  }
}
```

TODO implementation (including import and export for testing) : 
- javascript : a must have : a small libs with encoding and some possible scheme (RSA - ECDSA - Public) . See [browser](./browser.md).
- [rust](https://github.com/cheme/rust-striple) : TODO init primitive for easy C linking, storage in file, basic Striple use in conf
- java : standard lib to
+ in libs serialization/loading of a map of Striple


# serialization

A file containing multiple Striple must be defined, to allow saving but also export and import.

Here is needed the possibility of adding a private key (previous description of single Striple does not (private key should be transmit indepently)), because the means of this spec is export/import between different applications.

We simply xtendsize then private (or xtendsize 0 if not owned), then xtendsize of full striple, and concat this n time for n Striples.

The serialization is then :

(1bytetag | xtensiblesize(~2byte) | privatekey (not mandatory) | xtensiblesize(~4byte) | striple ) repeated n times

with first and last separators not mandatory in the file, and a first byte of the file with value 0 for extensibility (0 as an xtendsize of 1byte).

First byte is 0 for clear privatekey.

First byte (xtendsize) is 1 for private key encoded in AES-256-CBC with password derived with PBKDF2-HMAC-SHA1. Fix length iv of size (see AES256) is include as first bytes of encoded private keys (one iv per striple obviously). PBKDF2 parameter following are : first byte | nbiter (2bytes xtendsize) | keylength (2bytes xtendsize) | salt (keylength bytes).
Keylength seems useless since we use AES256, yet it may be good for future use.

# extension

A first extension could be to change xtendsize encoding to let the second byte decide if we include an internal Striple frame. That way we could have a well formed tree immediatly parseable. Yet this has not that much adding value over sending multiple Striples.

The question of referencing a file in content is a good one : for instance a file at httP://dtumy.com/csetd.pdf , we should expect to only include the link in Striple and sign the pdf, and on checking of striple : resolving the link for checking. This seems to much high level, in fact the information here is the link and the signing, and the Striple is about content, using a link means that we need to define the resolution of this link (here http) : in a special kind of about it is fine, we need to implement the checking with download of file... In fact it is to much high level, Striple should have a special kind of content being a link plus a signature (a hash should be enough since the striple sign the hash in content), and that is the information that is signed.  
This type of file reference is simply technical : it can be supported by implementation outside of striple definition, yet for serialization it means that we need to define it : an additional byte before each Striple for special serialize strategy (one byte before private key : with following value 0 normal, 1 linked content).  

