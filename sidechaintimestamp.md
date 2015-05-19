The idea is to write a hash (hash of a merkle tree of hash to allow minimal size in bitcoin chain) in a block of bitcoin chain and after n blocks published over the block containing this hash we can publish the content from which the hash has been calculated and say : I was in possession of this content when the hash of this content has been include in bitcoin chain (through inclusion in this merkle tree).

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


Timestamp is good but hash should also include ownership of resource : a striple containing hash to check as content, from a owned pair of key, and about a generic 'bitcoin timestamp' concept.

Content may also simply include personal information.

# Example of usage

In relation with what has been written about [git](./git.md), the hash of this git commit "" has been included in this transaction "" of this block "" of bitcoin chain, with transaction done with 15MjGXAnJzY267B76BLKrkJ5LBKtZGxurY bitcoin address. see [blockchain.info]() and to check the hash simply python this :



cat "hash_value" | openssl dgst -sha512 -binary | openssl dgst -rmd160 | cut -d' ' -f2
cat "hash_value" | openssl dgst -sha512 -binary | openssl dgst -rmd160 -binary | base64

Next more interesting use will be by using an striple ID instead of this hashing (at least there is a secret and therefore a ownership notion).

