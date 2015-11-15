[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Timestamp on bitcoin chain with striple trust")
[hm]: # (categories = ["Striple","Design"])
[hm]: # (tags = ["sidechain","value","bitcoin","technical"])
[hm]: # (+++)




The idea is to write a hash (hash of a merkle tree of hash to allow minimal size in bitcoin chain) in a block of bitcoin chain and after n blocks published over the block containing this hash we can publish the content from which the hash has been calculated and say : I was in possession of this content when the hash of this content has been include in bitcoin chain (through inclusion in this merkle tree).

After some checking and looking for tools, this example already implement this : [link](https://github.com/petertodd/python-bitcoinlib/blob/master/examples/timestamp-op-ret.py). The point of using a merkle tree was overdoing it, for a central service, a hash of the file serializing all Striple to sign is ok (those Striple could be public and the size is certainly not an obstacle). 


Hash could be similar to bitoin OP_HASH160, but SHA-512 (for additional computation time) then RIPEMD160 (for low keysize).

Creation of this hash to include could be :
  - direct hash of the content
  - hash of multiple content, we need to communicate every content to check the hash
  - hash of this content with inclusion of other hash from other content. To check it we only need our content and the other hashes (all other hashes or only some of them if we use a merkele tree with multiple hashings).

Last point and first seems right. The last one is a good opportunity to provide an open service to get large merkle tree of hash from multiple user (from a website/service which publish everyday for instance and send mail with all info to check hash presence, plus checking hash given a key (minus other hash from tree which we know (hash plus positions in tree)), and checking hash with all info (mekle position plus hashes)).

Verification of hash presence is needed : with a merkle tree we need a clean structure to define subsequent hash calculation with hashes to include, plus a simple program/script which directly read leveldb its block the transaction registering the merkle tree hash and then check our hash is calculable through merkle tree parsing.

Technical points :
  - hash stored : the most basic way of doing it might is just to add an output script with OP_RETURN followed by the hash. (operator used by colored coin so very likely to be fine). First the invalid output containing the hash then a valid output. It still cost a transaction fee to store the hash, thus another usage for a merkle tree hash service.
  - hash definition : "hash of primary content" + hash type (the same for the merkle tree and content) + level in merkle tree (starting at 0 being the hash in chain) + list of position in all merkle levels (each level hash are simply hash of all hash cat order by position) + other hashes by level in merkle tree (list of list starting at 1) + TODO transaction id + TODO block id (use a chain crawler to see how to access it). TODO short one using a database having the merkle trees + full one which does not require using the tree -> other hashes double list will be last content
  - sample of check that hash is indeed in hash calculation of block (at least a proof on a single example).
  - script to check hash : algo and implementation (using json rpc?)
  - implement as a bitcoin service : with a request for inclusion and an automated way to send hash in chain without central website, yet it requires a dht over merkle tree, looks good (see bip-0036).

  WARNING about signature maleability (+ see bip62) - todo poc - seems do not care : yet need a confirmation/ checking of hash presence in chain before ok.


Timestamp is good but hash should also include ownership of resource : a Striple containing hash to check as content, from a owned pair of key, and about a generic 'bitcoin timestamp' concept.

Content may also simply include personal information.

# Example of usage

In relation with what has been written about [git](./git.md), the hash "ZbMmJ09CwRW5Hy65GZa7eSH2bL8=" of this git commit "9fce5c6ab6193f84bc6b237ef58b24087e15ca7e" has been included in this transaction "4518f25abd7c6a29ee790b16861b7875dfff13b3c7ca943a895aedf63577b03b" of this block "357153" of bitcoin chain, with transaction done with 15MjGXAnJzY267B76BLKrkJ5LBKtZGxurY bitcoin address. see [blockchain.info](https://blockchain.info/tx/4518f25abd7c6a29ee790b16861b7875dfff13b3c7ca943a895aedf63577b03b) : OP_RETURN 65b326274f42c115b91f2eb91996bb7921f66cbf appears (hexa) with :
```
echo -n "65b326274f42c115b91f2eb91996bb7921f66cbf"  | xxd -r -p | base64

> ZbMmJ09CwRW5Hy65GZa7eSH2bL8=
```

hash calculation was done this way (we do not use sha1 hash of commit because it is unsecure, so we hash an tar archive of the commit), and should be check this way (we choose to store base64 because tools for base58 are not common on shell (ripemd160sum to so we use openssl)  : 

```
git clone ...../web3.git
cd web3
git archive --format tar -o test.tar 9fce5c6ab
openssl dgst -sha512 -binary ./test.tar | openssl dgst -rmd160 -binary | base64
rm test.tar

```
Resulting in the stored hash "ZbMmJ09CwRW5Hy65GZa7eSH2bL8=".

Transaction in bitcoin was done using this python code (derived from dependance to [python bitcoinlib](https://github.com/petertodd/python-bitcoinlib) [example](https://github.com/petertodd/python-bitcoinlib/blob/master/examples/timestamp-op-ret.py)):

```python
"""Example of timestamping a file via OP_RETURN, modified to write directly a string (last command parameter)"""

import sys
if sys.version_info.major < 3:
    sys.stderr.write('Sorry, Python 3.x required by this example.\n')
    sys.exit(1)

import hashlib
import bitcoin.rpc
import sys

from bitcoin.core import *
from bitcoin.core.script import *
from base64 import *
from bitcoin.wallet import CBitcoinAddress

proxy = bitcoin.rpc.Proxy()

assert len(sys.argv) > 1 


address = CBitcoinAddress(sys.argv[1])

digest = sys.argv[2]

txouts = []

filtout = filter(lambda x: x['address'] == address, proxy.listunspent(0))
unspent = sorted(filtout, key=lambda x: hash(x['amount']))

txins = [CTxIn(unspent[0]['outpoint'])]

print(txins)

value_in = unspent[0]['amount']

print(value_in)

#change_addr = proxy.getnewaddress()
change_addr = address
change_pubkey = proxy.validateaddress(change_addr)['pubkey']

#FEE_PER_BYTE = 0.00025*COIN/1000
# use minimal fee : do not need to be fast (not should be 000001 but does not pass).
FEE_PER_BYTE = 0.00002*COIN/1000

change_out = CMutableTxOut(value_in, address.to_scriptPubKey())
print(change_out)
#change_out = CMutableTxOut(MAX_MONEY, CScript([change_pubkey, OP_CHECKSIG]))

digest_outs = [CMutableTxOut(0, CScript([OP_RETURN, b64decode( digest )]))]

txouts = digest_outs + [change_out]

tx = CMutableTransaction(txins, txouts)


tx.vout[1].nValue = int(value_in - len(tx.serialize()) * FEE_PER_BYTE)
print(tx.vout[1].nValue)

r = proxy.signrawtransaction(tx)
assert r['complete']
tx = r['tx']
print("--")
print(tx)
print("--")
# Display hash from transaction
print(b64encode(tx.vout[0].scriptPubKey[2:]).decode())
assert digest == b64encode(tx.vout[0].scriptPubKey[2:]).decode()
print(b2x(tx.serialize()))
print(len(tx.serialize()), 'bytes', file=sys.stderr)
print(b2lx(proxy.sendrawtransaction(tx)))
```


Next more interesting use will be by using an Striple ID instead of this hashing (at least there is a secret and therefore a ownership notion).


An other (more striple) approach to timestamp is to include the id of a striple in the bitcoin chain.
For instance the id of this striple : TODO json output of the striple : "Git commit d56fbf24d7eb4a6b924cbde3c369193685d1eb82 sha1"

is SHA512 of the RSA signing from : TODO json output of the parent "bitcoin timestamped by ECH"

So if I own this last striple, it is very likely that I do have access to the other striple and the included hash (see previous example).
Yet Sha512 is a bit long and was included in two separate transactions :
[9b987eaa715b50f4d9181acad139d328d6e1eed1663319ea946592fc52bd9786](https://blockchain.info/tx/9b987eaa715b50f4d9181acad139d328d6e1eed1663319ea946592fc52bd9786) and [07dc81d6a7782988e35efa0bad173e45e3ebdab7636cf78b1aa78f3c7e008393](https://blockchain.info/tx/07dc81d6a7782988e35efa0bad173e45e3ebdab7636cf78b1aa78f3c7e008393)



# Exemple of timestamp

In this example, the timestamp striple includes directly the tar of the git commit.

That is base64 encoding of encrypted timestamp :
```
AQfQACBawDT4KDsifkDz/xf226SJ08LNXxmbZoastlQbt60KjQEACi4vd2ViMy50YXIE0EngDWrZ
Et5kr4GOoyHJbAUjJdc2A/q+w0Okb1UgiCixaeFfo4nQrDNopi3Rz29BKmq1Vgn5mfiUmiiZbTJv
ppqoSukvj4GmdKCEnov2NjSvw/A4ToZKEIqz65xscyblA85dpRPjUX9pKYUeb0mPIz1fZd+k5nRf
4hKMJUfkvbMmohQq75c+SOII220V5h/ZpMXjyY7jm00iazlM5haJcr5b/nUN0B4dmIL4oSXLT9vA
6+NPmIxbSAkLbhnrMlBTUZDuGUXqVwDWRXHWVBZHg2g0LRhZ9xmS1gZRVXWlMOowvyicP4p9ZY1Q
lkgJGBecZjKiXZHW5apmbR0WXmc4BBA9FRu9ZL1ZYGIqzgYETkJ8sxsFvkvVAe0BX6WJGB2POuin
Gl1YFxkwwg0tLWZWxuB5BPZdd4mHfXzKyfbhtFEtW/J5kqlNv8wiRGOKMiPzsUNM3/0SSC3AqEuF
vEBPoiRLLdC2C9ndU5KIzlTW8BnQSgut46Fh6Co76uEoU/4uJD/qGIMQR6tVe/3y6HdpGageufT7
wbfh3dfuSWWKc3Xcoxp/uEBXcCdnaFvUa8DEmnpRIqUq/4Gqvbpr+JmySFIQ6LBt1Xe5k+RI+DBV
CnXeDmbaHIXFYK2mAlh5PIVt6q3K9qPuGDpFgfFfCQPTiReq7wd1R6/ALZUHroppin8MdDfe4w1G
JKxDhrPyXIkVXJzABXQIfShKa+vgQ3B5rCXFHRy0tdODQ76qUiesXajOrpdAPS3H9wT6jSNKgfvw
qQhWbXc4k8ij/tt2h8aQbLUjX0cHgXmgIyzJ/rFuW/w4k30qZNO7/f2FsCscPYLhDXu9nIYGutml
QVUuiG0rdTa2+TzuCMdT9PlTfIHT/qXgBK8smSzm1PDuVRsXW+nAUTFim1q7GRtLW2Pz3jAC20Cs
UfI/4hxIWSqGs2Cz1Nw27DcNdq9WkLxzuEWYBe+0as9GfgSCF8X9JZoo+aBNxQNe1E/xHa9bbB20
EnYL/6DDNflRH6R7aD39dpQBjNdeHyYP31sjx8zl8ULLoUtuVtCtbgeqEk7+OQ6FW4tal7crs/MM
+LWbPA5mFbZHTEwkv2wJ0A3HqkM5946dmsAZNNywIBXUVXcuanLP3eEoCJDBRJ7pP1Is+S2L9Ws/
zW0h3TaM35PMyfWwGlCidyY70FK23P8kOowIH517rehC3ksxo2nC8ldzVjQhyloza8W7Xtqh+WPV
iAr/pj1+Q3UjfI0+rO/6zXw3UsvH0THWmHmZ/fdWVgFll3HgZJjlMP0WEF8skILOwq9U9CrbJKXA
pkueVO0rtmZeaflcPcy5peNGCZJtWmAcT5jVUrc/B7kvlNgKpi+4DqHGvJeFe4bMRWV17yIIcJPG
/Di3v0vgzGq6U81eY532c+VeY6kHLorxu8aEzvOKi+723Ckj+JIyJ30lp8QBN/mYZ2mhr1uYHp6b
LYNrZwLEamlx7bPF/ziWYXluIpHDvXdGzezJgpOKqlfIiaX8xLIMNhkXpwI0PzXRfB0th5hHxux5
/aZWGB3m/z6b2/pCdQzAPvM8CxnG+R5Q5yO8ZLDVigOa+rfeTPqETN+S2I5gJNLkZ/LThnpqW2+S
oIzAknyZERX4iMSuRshgv7Qz2plJiazHymwRIQCsAAACTwBAf6ey+ECd6YseVHw4/vHSiPrIE7Wl
AGF9wWUqkhRIDAP4ggkZFFns4Y/CtsYYa15FjBE+uttJy//Qavl1w3iSCgAAABQVXlCOaRnrMb8t
pOjdn5Mp9NdxnwBAum5P7FhMk9QYITHZLwAcX2i1lAYVU9DdrUs7sqwhj92ueC90eCyCDm5dgxkI
/NNrmZPmtKhjLthCulpy9zU/6gAAAEBdkLxwceXvWYPw1CbtInrGwi3O+iAtlr2j0KLmGIm5fmSe
spodzd3TWiz3lp6qVti/buf2zLKKWxQMHXpjl10IAECX3os6ydjCBor31asb1HqEn4hXx/o4wjvA
edA6AB0reaxFTFoo1gp6ztZsPjnlccM6OPuOVf9KLwmlLr7FZZfDASYwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNyQxgl6W6Qwcoeahmupa+FOB7PZI4l5meIRVHy91yAD5JtzSMCWr0
3VCKfoNRsz5n+Zu5ua++ArYQfSFphd1NaOReZGuD2SgQvRQxkuYZtaPKLi3GXVu+FnfqMHY2Bbui
Cqw4w0IEd7XuV3Q4ztunohbc1A1PDT5bGwN71WBUm/6hCJV/3ZokO1Y620iIpJOPF22EmdNi3z5X
M56Zps2aQv8Ac8V+OkGvKwA5KQmePL7pX0DwmXCbbrcYSNHaRlb12J4G7Ao8LrMSi1Mn7IBenFlF
DdwgXOnJ8KuMsVIbtDIuvszzoJiyWtO0wnIOGG4qWNeEgrML7HjdOOVHRivbAgMBAAEAAALQAAAA
cPoQEn2mKeorofZKYk5MEYHTs8obJxb+yt5PdFrBWHvdwBoOMm7sakivnCoCQPHVhYqqmq3b8Wto
Rq90f+VI7lwXiwcupURxi55VO7kjPTurjrkDx2NfU7SiZ/ugo+B9yXU/JFTrRG7fXX+mWtjwDrUA
AAICAED7cs0uRqGrsTiqOwjM5bzgixAVOQ73WXQeYZ7sKjm3PejNlqqzSxSlJ4xTp7K8q3bpQWtZ
3Q1EGyy6XVLpr+wZAAAAQEo/ka7FqfsDRZHEXSYSnOoPWeZtsQqa7m6HQTLe5o4DncdCg9M90FEv
jcPOEc/5Wvrl7aJC5vS3Eggk2jewXLIAFBVeUI5pGesxvy2k6N2fkyn013GfAAABABQB5qp2WbO6
eMKg88GWKIpRmZc/+pxI38WjmE8mKxe32AriQol4hymzqngYNGXQ0ZRu1dEfWd8ohXY28JA3wu9M
EnNZ05Dq13gmZHaPM/3vnIcAbpCgeGlL+OegO00pkJ0JwcmvXcvlIuQ4sqta5oiscjJYwR1/9t7y
kOnmLcbWDK+3HojXT4ipNSIdQueYxdugPnQRrKIKJZtX3a9OIvjpVzEzXH2qo5aq1rEUOdXsoLJV
yrdmZVEePp13e72X9KsZuiwASLu1bbFQNciEDNYxPRyvdd0hFmyBDlVDckqfLTsnvGt9bdK2jtZQ
09L5SRt3fheW8OeSU3QklCQL1RcAAAAgF5b8N+xN53YacMSruiR6N8MdWjvG8qYDhraz9RO7egQA
AAAAOXdlYjMgZ2l0IGNvbW1pdCAxZWJiYzBhNTljYjU1YTQ2NjY5ZmExYjY1MmFlYjk1NDQ1YmZj
YjJiCg==
```

This contains both the stamp and complementary info striple emitted from this stamp.  
Obviously, the originator of the stamp is another owned striple and whoever is able to emit a new striple (a challenge of ownership) from this originator (so the originator validate both timestamp and challenge) can claim that he had access to the info at the time of the inclusion of the stamp in the bitcoin chain (unless the key of originator is compromised).

Lets decompose this timestamp :
```
echo -n "AQfQ" | base64 -d | xxd -b
> 00000001 00000111 11010000
```
First byte is PBKDF2 storage, second and third byte are xtend size of nb iter (pbkdf der) aka 200.
```
echo -n "ACBa" | base64 -d | xxd -b
> 00000000 00100000 01011010
```
First two byte for keylength (2^5 = 32 bytes), so next 32 bytes are salt, we can skip : DT4KDsifkDz/xf226SJ08LNXxmbZoastlQbt60KjQ.


First byte is last byte of salt.
```
echo -n "jQEACi4v" | base64 -d | xxd -b
> 10001101 00000001 00000000 00001010 00101110 00101111 
```
First byte is end of salt then second byte is striple tag : here 1 means that we read a striple with an attached file, next 2 byte are xtendsize of file path (here 10 bytes).
```
echo -n "Ci4vd2ViMy50YXIE" | base64 -d
./web3.tar
```
that is the attached file (plus one byte before and after (invisible here)).
Next should be encrypted pass
```
echo -n "YXIE0Eng" | base64 -d | xxd -b
>   01100001 01110010 00000100 11010000 01001001 11100000 
```
two first bytes are end of path, then next two bytes are encrypted private key length : here 1232 byte (that's bigger than expected because an IV is also stored (32 + 1200). Skipping private key (2 byte in prev content and 1230 = 1640 base64 character we can finally read our striple : 
```
echo -n "AAACTwBA" | base64 -d | xxd -b
>  00000000 00000000 00000010 01001111 00000000 01000000  
```
4 first byte is striple full length : here 591, but it does not really matter here (unless we want to skip striple parsing).
Next two bytes are ID size of algo kind : 2^6 = 64 (it was a sha512 derived key so ok), meaning that  "f6ey+ECd6YseVHw4/vHSiPrIE7WlAGF9wWUqkhRIDAP4ggkZFFns4Y/CtsYYa15FjBE+uttJy//Qavl1w3iSCgAA" is from ID plus two bytes (they are null bytes because we do not have a specific encoding define for content).
Next is our striple ID two byte size
```
echo -n "ABQV" | base64 -d | xxd -b
> 00000000 00010100 00010101 
```
2^2 + 2^4 = 20 which is the length of expected Ripemd hash size : the ID is 
```
echo -n "ABQVXlCOaRnrMb8tpOjdn5Mp9NdxnwBA" | base64 -d | xxd -b
00000000: 00000000 00010100 00010101 01011110 01010000 10001110  ...^P.
00000006: 01101001 00011001 11101011 00110001 10111111 00101101  i..1.-
0000000c: 10100100 11101000 11011101 10011111 10010011 00101001  .....)
00000012: 11110100 11010111 01110001 10011111 00000000 01000000  ..q..@
```
Our ID is all those bytes except first and two last (2^6 = 64 bytes length of about id).
if we compare with our base 64 id use to set ID in bitcoin chain "FV5QjmkZ6zG/LaTo3Z+TKfTXcZ8=" it is our id
```
echo -n "FV5QjmkZ6zG/LaTo3Z+TKfTXcZ8=" | base64 -d | xxd -b
00000000: 00010101 01011110 01010000 10001110 01101001 00011001  .^P.i.
00000006: 11101011 00110001 10111111 00101101 10100100 11101000  .1.-..
0000000c: 11011101 10011111 10010011 00101001 11110100 11010111  ...)..
00000012: 01110001 10011111                                      q.
```
skipping from id, next is the actual signature (all striple after this signature is signed content). Sig size is defined on 4 bytes : here only 64 bytes (ecdsa sign).
```
echo -n "6gAAAEBdkLxwceXvWYPw1CbtInrGwi3O+iAtlr2j0KLmGIm5fmS" | base64 -d | xxd -b
00000000: 11101010 00000000 00000000 00000000 01000000 01011101  ....@]
00000006: 10010000 10111100 01110000 01110001 11100101 11101111  ..pq..
0000000c: 01011001 10000011 11110000 11010100 00100110 11101101  Y...&.
00000012: 00100010 01111010 11000110 11000010 00101101 11001110  "z..-.
```
Skipping sig, next is about id on 2bytes  : 
```
echo -n "AECX3os6ydjCBor31asb1HqEn4hXx" | base64 -d | xxd -b
00000000: 00000000 01000000 10010111 11011110 10001011 00111010  .@...:
00000006: 11001001 11011000 11000010 00000110 10001010 11110111  ......
```
Skipping sig is pub key id on 2bytes : 294 byte :
```
echo -n "ASYwggEiMA0GCSqG" | base64 -d | xxd -b
00000000: 00000001 00100110 00110000 10000010 00000001 00100010  .&0.."
00000006: 00110000 00001101 00000110 00001001 00101010 10000110  0...*.
```
Skipping pub key, we finally arrive at our content : 1 byte for possible content IDs (here 0 (first two bytes are end of key)) and 4byte for content length (here content is not included but we can check that file ./web3.tar is actually 184320 bytes long). Next is second entry (same thing (shorter private key because not the same scheme).
```
echo -n "AAEAAALQAAAAcPoQEn2mKe" | base64 -d | xxd -b
00000000: 00000000 00000001 00000000 00000000 00000010 11010000  ......
00000006: 00000000 00000000 00000000 01110000 11111010 00010000  ...p..
```

So it was the ID of the striple timestamp before that was included in the chain :

["FV5QjmkZ6zG/LaTo3Z+TKfTXcZ8="](https://blockchain.info/tx/45b1d226c623d1c4de4c1d23871dbdd72101897a457aaafee4f5a18574d7ee2f)

Creation of striple was done with those commands (using striple rust lib command example) :
``` sh
cp ../web3.tar .
## Timestamp category and bitcoin kind : public sha512 (not own), from itself, about public category
catts=$( echo "timestamp" | base64 -w 0 )
striple create --kindfile ./base.data -x 8 --aboutfile ./base.data -x 2 --content ${catts} -o ./timestampcat.striple -c NoCipher
striple check -i ./timestampcat.striple -x 1  --fromfile ./timestampcat.striple -x 1
catkind=$( echo "bitcoin github timestamp of archive tar" | base64 -w 0 )
striple create --kindfile ./base.data -x 8 --fromfile ./timestampcat.striple -x 1 --aboutfile ./base.data -x 3 --content ${catkind} -o ./timestampcat.striple -c NoCipher
striple check -i ./timestampcat.striple -x 2  --fromfile ./timestampcat.striple -x 1
## Timestamp category of a owner (me), kind ecdsa ed25519, from my own secret root, about previous public
conttst=$( echo "bitcoin timestamped by ECH using ecdsa ED25519 of ripemd160" | base64 -w 0 )
striple create --kindfile ./base.data -x 11 --fromfile ./base.data -x 1 --aboutfile ./timestampcat.striple -x 1 --content ${conttst} -o ./timestampECH.striple -c NoCipher
striple check -i ./timestampECH.striple -x 1  --fromfile ./base.data -x 1
## Timestamp : use an own sign (not public to keep control of info from it), using another scheme for show
striple create --kindfile ./base.data -x 10 --fromfile ./timestampECH.striple -x 1 --aboutfile ./timestampcat.striple -x 2 --contentfile ./web3.tar -o ./timestampweb3.striple -c NoCipher --relative
striple check -i ./timestampweb3.striple -x 1  --fromfile ./timestampECH.striple -x 1
## Timestamp desc : additional info about the time stamp, all text here, without about, just for info, no structuration
tsdesc=$( echo "web3 git commit 1ebbc0a59cb55a46669fa1b652aeb95445bfcb2b" | base64 -w 0 )
striple create --kindfile ./base.data -x 11 --fromfile ./timestampweb3.striple -x 1 --content ${tsdesc} -o ./timestampweb3.striple -c NoCipher
striple check -i ./timestampweb3.striple -x 2  --fromfile ./timestampweb3.striple -x 1

```
With base.data -x 1 being Root (owned striple)
With base.data -x 2 being Category (public striple)
With base.data -x 3 being Kinds (public striple)
With base.data -x 8 being being sha512 kind (public)
With base.data -x 11 being ecdsaripemd160 kind (owned)
With base.data -x 10 being rsa2048_sha512 kind (owned)

Visually a diagram of striple resulting (from on top, about on side and bottom for striple id usage) is like that (that is the ID of "Attached file we...." that was store in bitcoin chain) :

```
 Category(pub)  ----------      Kind(pub)    ROOT(owned)                   
   |            v        |          |              |
   |    +-------------+  |          |              |
   |    |             |  |          |              |
   ---->|  timestamp  |  |          |              |
        |   (pub)     |  |          |              |
        +-------------+  |          |              |
         |        |-------          |              |              
         |        v                 |              |
         |  +------------------+    |              |
         |  | bitcoingithub    |    |              |
         |  | timestamp of tar |<----              |
         |  |   (pub)          |                   |
         |  +------------------+                   |
         |    |                      ---------------
         |    |                      |
         |    |                      v
         |    |      +----------------------------+
         |    |      |                            |
         |    |      |  Bitcoin timestamped by    |
         -----|----->|  ECH using ecdsa ED25519   |
              |      |  of ripemd160              |
              |      |  (owned)                   |
              |      +----------------------------+
              |             |
              |             |
              |             |
              |             v
              |   +--------------------+
              |   |  "Attached file    |
              |   |    web3tar         |
              --->|    striple"        |
                  |    (owned)         |
                  +--------------------+
                    |
                    |
                    v
    +--------------------+
    | web3 git commit    |
    | 1ebbc0a59cb55...   |<-
    |  (owned)           | |
    +--------------------+ |
                 |         |
                 -----------

```

