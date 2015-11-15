[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "RDF and striple, a new approach to web semantic?")
[hm]: # (categories = ["Striple","Concept","Design"])
[hm]: # (tags = ["rdf","example"])
[hm]: # (+++)



TODO transcription of a triple to Striple (each of its components as self signed triple, then triple for namespace between them, then the relation between them).  

When coming from RDF or trying to manipulate proper RDF statement, we need to define/automate some RDF import/export tools.

The mapping between RDF and Striples should be define as a Striple and in fact multiple mapping should coexist this way (being a Striple a choice of the better mapping/tooling could happen).

Here is a possible mapping drafted :





TODO create a statement for it


# analogy

The similarity is quite explicit, RDF being built over 3 statement like Striple. Difference occurs that some Striple are private (owned) and their RDF equivalent may inverse `from` and `about` place relatively to RDF two first statements (`content` always the third).

Another difference is that a simple RDF statement live by itself with three different entity. An RDF Striple with three different entities involve four Striples because each entity need a representation as a Striple (if only four Striples those are likely to use recursive definition (being `from` themselves and maybe also `about`), which is needed to add RDF namespace for instance.

# namespace


Why no namespace in Striple?

RDF use namespace over all its concepts, this is a powerful feature, it allows :
- abstraction from concept name (avoid name collision)

Striple are defined by a unique abstract id (resulting from a hash of its components (bitwise identical Striples got same id but then it is the same Striple)).
The point is that two Striple using the same content can have a different id (the scheme calculating the id must include a variance), and living together, content being more defined by its known relationship and inference rules and therefore kind of polymorphic.

- domain specific categorization (really useful technically for indexing and therefore efficient inference in a same namespace).

Striple is meant to be as generic as possible and namespace should be a special kind of Striples (in [database](./database.md) it should be transversally indexed (like trust Striple).

RDF namespace representation as Striple should be :

- a namespace is a Striple, it should be referenced and have its own ID, that way it could be forked, merge, and has ownership (private namespace is a powerful concept).
+ as close as original Striple as possible = from : under this representation the usage of namespace is locked

+ a little less : about (see rep)

+ simple representation : in content

So we see that we got two coexisting representation in about : the importance a certain interoperability between `about` and `from`. Even if one should be enough (but involve fork/public variant of private namespace).

# ontology

For example an OWl ontology defining class should be a define as Striple (with parent relation Striple and property as Striple). It should lead to special indexing (like trust) for [database](./database.md).

Ontology as Striple means trusted ontology (for exemple foaf), but also dynamic ontology changing depending on topology (p2p) and trust, leading to nice collaborative building.

# Query language

Open question :
- sql like approach like Sparql
- expressive language approach like xquery

Reasonably it should be easier to go sql like (notably if trying to implement local triple store over existing RDF store).

