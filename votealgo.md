[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "An ok electronic vote protocol")
[hm]: # (+++)



Doing a vote in a group of known person involve some needed control.

Today vote is checked locally when the ballot is open by any citizen who want to check the counting process. That is a well accepted democratic control.
Electronic vote with an electronic machine/server getting vote and counting them does not allow such control (only specialist could open the machine and check electronic component and software programs) : the process is not public enough.

The point of this example protocol is to show how electronic vote could be easy (yet some possible attacks are not easy to circumvent) given some prerequisite : every participant has an electronic id (being linked to a public and private key pair), every participant as an anonymous access to the network (for example access to the service through tor).

This is seen as a distributed application, but nothing is against a more server centric approach where everything is public (anyone can reproduce server algo).

Process Overview
----------------

- a vote description is initiated, with a subject, and possible answers. It is given an Id.

It is an Striple.
It is issued for specific users (participant), this could be related to a web of trust of Striples (like being in a group of users (the group could be resident of a city signed by the city hall itself)).
Access to this Vote information (only the ID) must be restrained, as it could result to simple blocking attacks (usage of subvote to diminished those attacks also reduced effectiveness of anonymity (probability to get n identical vote where you got n participant)).

- we enter envelope period : each peer with access to the vote description will generate a Envelope (key pair, an Striple) and send it (not the private key obviously) anonymously (through tor or other safe medium) in the p2p network or on the vote server. The envelope contains a signature of the vote id by its key (another Striple).

- At the end of envelope period (no new envelope expected), every peer search for all envelope in order to check that their envelop is in the ballot and that the total number of envelope is right.

- We enter participation period : peer sign an Striples containing all the envelopes (a hash of the binary association of all envelope) and send their participation confirmation (this sign). It means that they validate the participation definition of the vote.

- end of participation period, peer vote if participant and envelope seems ok with him (number of envelope/number of participant, presence of its own envelope signed by participants, and presence of signature from over participant), if wrong he vote rejected vote with its envelope (or subvote process initialisation).

The vote ID can be send to non participant.

- anonymous sending, of reply (using own envelope pkey: id envelope + id vote + vote + envsign).

- end of vote period. Every voter can open all replies and calculate the vote results (after validaton of all replies of course (no dup... two reply for an envelope invalidate the envelope))

- synchro of vote results between participant to reach consensus : (similar process to getting participants).

When reply receive envelope is no longer needed, the fact that we do not immediately send reply is to avoid sending information in a vote where we could have a corrupt protocol and avoid participant signing envelopes depending on their content.

Multiple envelope attack
-------------------------

The most basic attack is to block the vote initialization by sending more than one envelope, this will result in a ballot with too much envelope and the vote will not enter the next step.

Subvote strategy, the attack could be isolate by splitting the vote into two subvote (aggregating the result at the end) : this kind of participant dichotomy or vote split has its limits because it reduce the anonymity (if the group is too small and everyone vote the same way there is no anonymity and it is especially bad if it is not the vote result (the result at the end is an aggregate of all subvote)).
In France, we are already in a subvote system, but the subvote (local "bureau de vote") has enough participant to avoid it (we therefore has a geographic map of opinion which give more information than random constitution of subvote).

Subvote may include some heuristic, meaning that at some point a corrupt subvote may be drop because it is not relevant in the global subvote population.

Subvote [random](./itemattribution.md) constitution is another strategy to find bad peers : instead of splitting again a subvote, we may firstly reconstitute the subvote with another random distribution and that a few time until we can deduce bad user (or a group of probably bad users).
This is allow by the fact that the attacker do not know if the ballot constitution (envelope period) will be the good one or not and will try to cheat every time.
This also explain that the ID of the vote must only be known by the participant (subvote got their own id), a participant publishing this id is the same as a participant creating two envelope because it allows others to create their envelope (the envelope does not contain the vote ID but a signature of it so we know that the emitter knew the vote id but it is not leaked).

Some heuristic may be allowed, like having a few more vote or a few less participation confirmation, in order to be more realist.
In a sense statistic may really help in this kind of case, and being a distributed application, every peer must apply the same statistic.

