[hm]: # (+++)
[hm]: # (date = "2016-07-19T09:48:44+01:00")
[hm]: # (draft = true)
[hm]: # (title = "Yet Another DAO opinion, striple related")
[hm]: # (categories = ["Blog"])
[hm]: # (tags = ["blog","ethereum","fork"])
[hm]: # (weight = 1)
[hm]: # (nextweight = 90)
[hm]: # (+++)




Having not much free time currently, it has been some time since I update my [striple](../web3.md) project, yet recently the DAO unexpected behaviour (I do not like the 'hack' name has nothing seems to really misfunction), is such an interesting case (especially the fork controversy) that I need to update this site to add a few word about the usefullness of a WebOfTrust striple meta information description of blockchain and their fork


**Warning, this post is based upon which might be a misconception that the Hard Fork requires intervention on the ethereum chain and client.**


# DAO fork opinion

Either Hard Fork, Soft Fork I have two major concerns, and my view on a possible post fork system :

## classical no fork opinion : immutable contract

Contracts are no longer immutable, since a change of behaviour occurs. This was implied by platform usage, but here it is specifically targetting an application, it looks like an active attack of ethereum on the DAO contract (even if ask by majority of DAO holders).

Code is not rule, community is rule : that was not the former hypothesis for the network design : a Web Of Trust design would have been more suitable : leading to non linear blockchain (inherently design for fork and merge like wot dht informational striple).

Community driven project requires tools, an analogy with system like git involve ease of fork (plus branching) but also ease of merge, which is a particularily difficult question in blockchain technologies as closely related to mining (fork mining especially).


## Scope of Dapps

A platform directly impacted by its applications, that is somehow fine, on AWS or any webhosting there is filter for IPs related to DDos or other form of bad behaviour. But that is not autonomous platforms.

At some point, in the design of an autonomous application platform, the concern of the separation/relation between platform and its hosted application becomes really relevant : Instinctively I thought **total separation** was the only obvious possibility for a immutable 'centralized' platform (POW BlockChain, centralized in comparison to WOT info (uniqueness)).

In an autonomous, censorship resistant, platform, if an application is able to interfere with the platform the former properties of the platform could not stand.
In fact they could stand only if the applications are managed by the platform, meaning a form of control, thus not an open platform. That is the direction thing could take with a platform doing code analysis to prevent bad contract the platform start a form of censorship (not talking about black list of contract but precheck), we start slipping from gas limit and security limit to functional limitation.

The point being platform neutrality is something really needed for some, and really unneeded for others. Personnaly the point of autonomous platform is censorship resistance. 

The idea of an ethereum hard fork motivated by one of its DAPPS (even a major one) indicates that the platform do not support a separation with its application and the the forked ethereum do not maintain any form of neutrality. This is not really a bad thing (see profork opinion about getting a community AWS), but indicate a community driven platform and directly relates to Web Of Trust idea, we enter a non neutral aera where decision should be localy trust driven (thus the need of meta describing each forks).

Yet a Wot driven chain is not a short term possibility and the fork will be harmfull in my opinion as current implementation of ethereum (unique chain) requires neutrality.


## HardFork DAO

The idea of blocking transaction from part of the network should have been in the contract design like it could be seen in the most basic ethereum solidity [tutorial](https://www.ethereum.org/token).

From a point of view where we maintain a separation between platform and application (contract content), the only way to fix it would be to have a DAO2 contract, and therefore forking the DAO not ethereum.

That is obvious but certainly not possible (I can not imagine the community choose the ethereum hard fork if a DAO fork was possible (otherwhise it would be a *badbad thing*)).

The *badbad thing* from third sentence refer to a 'complot theory' where the ethereum delibiratly creates a issue (or jump on the oportunity create by the issue) to justify the big neutrality and censorship first breach and transform the neutral tech in community driven tech (which could later be bought and give a lot of power to main community actors). Just saying that if such a DAO fork was possible I would without any form of interrogation support the neutral ethereum fork (which I will anyway).
Aka showing (with proof) something less groundbreaking that bankers understand : a money own by multiple shareholder (classical stock options well suitable for aggressive speculation).

### Ideal fork

Next ideas are certainly not possible and related to my low knowledge of ethereum internals and also DAO internals (not much time right now to invalidate those points), but are the way things should be handle for me in a ideal system.

So the ideal fork is a fork of the DAO contract, creating a DAO2 contract where former DAO holders are the initial holders of the new contract (and new DAO holder could not transfer to DAO2 as DAO value is expected to go to 0), and **no change on ethereum clients**.

Validation of the new contract is reach by having the majority of former holder transfering their values to the new contract. So the new contract would be similar to the original one with possibly restriction on some holders (some filtering on future transaction) to avoid a DAO3 since it seems that DAO designer are fine with having control over their contract (I am not fine with that and should try an alternative fork if I had the knowledge), but would not include the transaction that the community  reach a consensus to invalidate (transfer from those DAO1 being impossible).

DAO2 contract would therefore shortly be validated up to the original DAO (when enough holder go to DAO2).

DAO on the otherside would see its value diminished as DAO2 interest and value goes up, the fact is that DAO2 transfer does not substract funds from original DAO (the original contract does not allow it), but implies a DAO1 lose interest and DAO1 value should drop (ideally to 0).

DAO transfer to DAO2 could be obviously done at any time and could also be implicit (DAO2 could include all transfer initially (no need for blacklist though just allow creation from contract init)).
One concern here is the cost of the new DAO contract, a black list for transfer being very costly, and every transfer from DAO to DAO2 too, guess it is the cost to pay for contract unexpected behaviour (the first contract being a success this cost should be paid).


# Striple description of blockchain

## Need for such description

At some point major community holder will choose to fork or change internal rules, that is where neutral fork will appears, yet there is a major trust issue :
even if I know that the major holder is wrong in some choices I will not follow the minor one as I do not trust easilly new commers and incentive for mining is to uncertain. That is the point where crowd funding is good as it give visibility to successfull new project, but crowdfund a simple fork is strange.

So there is the good idea to vote on the fork, yet it is only a short term decision and the actual forking is not included in the protocol. Having metadescription, based on a Web Of Trust (like striple) would be nice for an issue which involve changing chain.

- If metadescription in chain : that is ok
- If metadescription in wot : that is ok and maybe better as we use a more general/neutral way of diverging. Could be a metachain instead of a dht network, but I find it more flexible to use a dht network with information stamped in chain (metachain, actualchains, forks... depending on metarules (wot validation could involve stampvalidity of course)).


### Description in its chain

That is the most natural idea, and indeed it should be. As seen [before](../sidechain.md), a striple state should be [included](../sidechaintimestamp.md) in blockchains for the inherently different property of those blockchains. 
So why using striple : 
- as a natural description language, with its own fork decision strategy tooling (the later should be defined as contracts).
- for a DHT efficient management of information, to much information in a Proof Of Work blockchain (at this time I do not really believe in Proof Of Stake (the one in maidsafe for instance in my opinion require local wot), thus my favored WOT design), and the need for a user controlled information storage.

### Description in a WOT DHT

Getting [trust based universal info](../topology.md) is good for fork management, all was said before.


# Fork mining

**Open question but one to answer, not having to choose between eth with black list and free eth would be nice and allow a great potential for democratic decision by allowing costless fork.**

