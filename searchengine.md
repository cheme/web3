
Search engine are complex, with Striple the model is one of a distributed search engine with trust (trust being kind of relevance).

And of course existing search engine could be normal peer (with high trust), and regarding the difficulty to get relevant info they will likely keep a leading position.

This could be seen as a copernic on steroids (meta search engine over multiple actors).

There is many distributed search engine initiative, most of the time using a distributed hash table, here the support is more close to a trust distributed table (see [database](./database.md))

We've also seen that [DNS](./dns.md) are partly search engine (with one reply).

An interesting approach, would also be to enrich browser with indexing capability to an Striple database : that way your search engine peers is feed by other peers but also by your own browsing experience. 
This would ensure some easy ranking of pages as the more a page is visited, the more likely it would be indexed.
A major issue is that it expose in a way your browsing history, and algo must care to not show to much (a ratio between browsing indexing and peer communication indexing).
Same thing with peer query, their should be right ratio between personal query and proxied query, furthermore rules for discovery should be aware of that (otherwhise topology will converge to clearly to your profile subject). 
Maybe this issue is more a good thing, but it may require some multiple anonymous profile usage (and also anonymous transport (at least some proxied query using topologically far node in the middle).

