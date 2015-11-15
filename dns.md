[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "DNS with striple case")
[hm]: # (categories = ["Striple","Design"])
[hm]: # (tags = ["dns","p2p","wot"])
[hm]: # (+++)




DNS use case is interesting, one approach should be bitcoin like DNS, like namecoin where the value of a domain is absolute (global dns with publication cost).

Using Striple in namecoin case is interesting for interoperability.

Using Striple in general allows another kind of DNS : a Trusted Decentralized Domain Name Server : TDDNS. Using a web of trust and Striples topology to resolve domain name.
At first glance this is a very bad idea, when trying to access google I want google not some russian fishing server, at the best my trust network will ensure that the name correspondence are the same as google dns (in fact if opendns (for example) implement an Striple compatibility I could use opendns as a full trusted peer and all will be fine (like I do today when I set opendns as my dns resolver)). So what use for Striple :
  - global DNS provider usage as trusted peer for .com, .net... With possibility of multiple DNS and name conflict management.
  - local trusted p2p dns : TTDNS, for new random domain will allow usage of intuitive internet : for example if I go to http://store.anything I will access what my web of trust leads me to (if all my friend for domain anything resolve store to amazon it will open amazon, but it could open anything else). That give DNS a kind of propositional role, in a sense local DNS define local web where we register to a keyword (since many website could use it), and the DNS take role of a kind of web search with one result.
