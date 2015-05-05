 TODO transcription of a triple to striple (each of its components as self signed triple, then triple for namespace between them, then the relation between them).  

When comming from RDF or trying to manipulate proper RDF statement, we need to define/automate some RDF import/export tools.

The mapping between RDF and striples should be define as an striple and in fact multiple mapping should coexist this way (being an striple a choice of the better mapping/tooling could happen).

Here is a possible mapping drafted :





TODO create a statement for it


# analogy

The similarity is quite explicit, RDF being built over 3 statement like striple. Difference occurs that some striple are private (owned) and their RDF equivalent may inverse `from` and `about` place relatively to RDF two first statements (`content` always the third).

Another difference is that a simple RDF statement live by itself with three different entity. An RDF striple with three different entityinvolve four striple because each entity need a representation as an striple (if only four striple those are likely to use recursive definition (being `from` themselve and maybe also `about`), which is needed to add RDF namespace for instance.

# namespace


Why no namespace in striple?

RDF use namespace over all its concepts, this is a powerfull feature, it allows :
- abstraction from concept name (avoid name collision)

striple are defined by a unique abstract id (resulting from a hash of its components (bitwise identical striple got same id but then it is the same striple)).
the point is that two striple using the same content can have a different id (the scheme calculating the id must include a variance), and living together, content being more defined by its known relationship and inference rules and and therefore kind of polymorphic.

- domain specific categorization (really usefull technically for indexing and therefore efficient inference in a same namespace).

striple is meant to be as generic as possible and namespace should be a special kind of striples (in [database](./database.md) it should be transversally indexed (like trust striple).

RDF namespace representation as striple should be :

- a namespace is an striple, it should be referenced and have its own ID, that way it could be forked, merge, and has ownership (private namespace is a powerfull concept).
+ as close as original striple as possible = from : under this representation the usage of namespace is locked

+ a little less : about (see rep)

+ simple representation : in content

So we see that we got two cohexisting representation in about : the importance a certain interoperrability between `about` and `from`. Even if one should be enough (but involve fork/public variant of private namespace).

# ontology

For example an OWl ontology defining class should be a define as striple (with parent relation striple and property as striple). It should lead to special indexing (like trust) for [database](./database.md).

Ontology as striple means trusted ontology (for exemple foaf), but also dynamic ontology changing depending on topology (p2p) and trust, leading to nice collaborative building.

# Query language

Open question :
- sql like approach like Sparql
- expressive language approach like xquery

Reasonably it should be easier to go sql like (notably if trying to implement local triple store over existing RDF store).

