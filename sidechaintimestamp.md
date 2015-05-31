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
