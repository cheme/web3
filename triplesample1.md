[hm]: # (+++)
[hm]: # (date = "2015-05-30T12:43:26+01:00")
[hm]: # (draft = true)
[hm]: # (title = "First sample of striple")
[hm]: # (categories = ["Striple","Design"])
[hm]: # (tags = ["example","technical"])
[hm]: # (weight = 6)
[hm]: # (+++)



This is sample test code from another started project which use similar concept (`entity` means `statement` and `with` means `about`) :

``` haskell

data (Binary v) => Entity f w v = Entity TrustAlgo (EntityID v) (EntityID f) (EntityID w) v (Maybe OwningProof) Signature

```

``` haskell

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DeriveGeneric #-}


module Test.Distcoin.DummyAppEntities where

import Data.ByteString.Lazy (ByteString)
import Data.Distcoin.Entity
import Data.Distcoin.EntityTypes
import Data.Distcoin.EntityBaseTypes
import Data.Distcoin.TrustAlgo(TrustAlgo(DummyAlgo, TestCat))
import Data.Distcoin.Entities
import Data.HashMap.Strict as HM


import Data.Binary
import GHC.Generics (Generic)

type SimpleMap = HM.HashMap ByteString ByteString

entities :: SimpleMap
entities = addIDEntity' masterID master
  $ addIDEntity' typeTypeID typeType
  $ addIDEntity' userTypeID userType
  $ addIDEntity' masterTypeID masterType
  $ addIDEntity' statementTypeID statementType
  $ addIDEntity' meID me
  $ addIDEntity' otherMeID otherMe
  $ addIDEntity' likeNormalID likeNormal
  $ addIDEntity' ilikeothermeID ilikeotherme
  $ HM.empty
  where addIDEntity' k v hm = addIDEntity hm k (encode v)


fromE' :: (Binary v, Binary f, Binary w, Binary ff, Binary fw) => Entity f w v -> Maybe (Entity ff fw f)
fromE' = fromE entities
withE' :: (Binary v, Binary f, Binary w, Binary wf, Binary ww) => Entity f w v -> Maybe (Entity wf ww w)
withE' = withE entities

instance Entities SimpleMap where
  getIDEntity hm (PublicKey pk) = HM.lookup pk hm
  addIDEntity hm (PublicKey pk) v = HM.insert  pk v hm


-------------------------------- Master -------------------------------
masterID :: EntityID Master
masterID = PublicKey "DummyMasterID"


{-| the master entity --}
master :: MasterEntity
master = Entity DummyAlgo masterID masterID masterTypeID Masterv (Just "DummyMasterPrivateKey") "DummyMasterSign"


-------------------------------- Types -------------------------------

userTypeID :: EntityID Type
userTypeID = PublicKey "DummyUserTypeID"

{-| a usertype entity --}
userType :: TypeEntity
userType = Entity DummyAlgo userTypeID masterID typeTypeID StandardUser (Just "DummyMasterTypePrivateKey") "DummyMasterTypeSign"

masterTypeID :: EntityID Type
masterTypeID = PublicKey "DummyMasterTypeID"

{-| a mastertype entity --}
masterType :: TypeEntity
masterType = Entity DummyAlgo masterTypeID masterID typeTypeID Master (Just "DummyMasterTypePrivateKey") "DummyMasterTypeSign"

statementTypeID :: EntityID Type
statementTypeID = PublicKey "StatementTypeID"

{-| a usertype entity --}
statementType :: TypeEntity
statementType = Entity DummyAlgo statementTypeID masterID typeTypeID Statement (Just "DummyStatementTypePrivateKey") "DummyStatementTypeSign"



{-| a typetype entity --}
typeTypeID :: EntityID Type
typeTypeID = PublicKey "DummyTypeTypeID"


typeType :: TypeEntity
typeType = Entity DummyAlgo typeTypeID masterID typeTypeID Type (Just "DummyMasterTypePrivateKey") "DummyMasterTypeSign"


-------------------------------- Users -------------------------------


meID :: EntityID User
meID = PublicKey "meID"

meValue :: User
meValue = "meName"


{-| an user : me (application user first use case for user, eg before connecting to dht we need an identity to establish dht trust based exchanges) --}
me :: UserEntity
me = Entity DummyAlgo meID masterID userTypeID meValue (Just "DummyMasterTypePrivateKey") "DummyMasterTypeSign"

otherMeID :: EntityID User
otherMeID = PublicKey "otherMeID"

otherMeValue :: User
otherMeValue = "otherMeName"

otherMe :: UserEntity
otherMe = Entity DummyAlgo otherMeID masterID userTypeID otherMeValue (Just "DummyMasterTypePrivateKey") "DummyMasterTypeSign"

-------------------------------- Statements ----------------------------

data SimpleScale = NotAtAll | Lightly | Normally | Highly | Totally
  deriving (Show, Eq, Generic)
instance Binary SimpleScale

data Like = Like SimpleScale
  deriving (Show, Eq, Generic)
instance Binary Like 

data GuessRelate = Guess Relate
  deriving (Show, Eq, Generic)
instance Binary GuessRelate

data Relate = Siblings | Lovers | FreeDef ByteString
  deriving (Show, Eq, Generic)
instance Binary Relate 



likeNormalID :: EntityID Like
likeNormalID = PublicKey "likeNormalID"

{-| a like statement as seen by otherMe user (not a master owner :Â it could be easily forked this way -}
likeNormal :: Entity User Type Like
likeNormal = Entity DummyAlgo likeNormalID otherMeID statementTypeID (Like Normally) (Just "LikeNormalPrivateKey") "LikeNormalSign"


ilikeothermeID :: EntityID (EntityID User) -- odd typing (id is only about value : i like other me is bad design entity : prefer 'welovers' design)
ilikeothermeID = PublicKey "ilikeothermeID"
{-| an own statement about someone using a statement owned by someone else --}
-- ilikeotherme' = Entity DummyAlgo ilikeothermeID meIDÂ likeNormalID otherMeID (Just "likeothermePrivateKey") "likeotherme"
ilikeotherme :: Entity User Like (EntityID User)
ilikeotherme = Entity DummyAlgo ilikeothermeID meIDÂ likeNormalID otherMeID (Just "likeothermePrivateKey") "likeotherme"


{-| TODO ilike likeTotally  and likeTotally totally like likeTotally TODO type of like totally not from user but from generic entity -}

{-| liketotally is from anything a statement -}
liketotallyID = PublicKey "ilikeliketotallyid"
liketotally :: Entity Like Type Like
liketotally = Entity DummyAlgo liketotallyID likeNormalIDÂ statementTypeID (Like Totally) (Just "likeothermePrivateKeiie,ody") "likeothermiiaÃ©e"


{-| i totally like likeTotally -}
ilikeliketotallyID = PublicKey "ilikeliketotallyid"
ilikeliketotally :: Entity User Like (EntityID Like)
ilikeliketotally = Entity DummyAlgo ilikeliketotallyID meIDÂ liketotallyID liketotallyID (Just "likeothermePriiiivateKey") "likeothermiiie"


{-| other me guess we are lover, created by me -}
guessloversID = PublicKey "guessloversID"
guesslovers :: Entity User Type GuessRelate
guesslovers = Entity DummyAlgo guessloversID meID statementTypeID (Guess Lovers) (Just "likeothermePriiiivateKeiiy") "liikeothermiiie"


weloversID = PublicKey "weloversID"
welovers :: Entity User GuessRelate (EntityID User,EntityID User)
--weloversID :: Entity User (Entity User Type GuessRelate) (User,User)
welovers = Entity DummyAlgo weloversID otherMeID guessloversID  ((meID, otherMeID)) (Just "likeothermePriiiivateKey") "likeothermiiie"



-------------------------------- TrustCat -------------------------------

initEntities :: IO (SimpleMap, Maybe (TypeEntity))
initEntities = do
 -- create a new master
 mastercatInit <- recEntity TestCat Masterv
 typeTypeCatInit <- newEntity TestCat mastercatInit (eid mastercatInit) Type 
 -- create a standard entity aka typetype and mastertype
 mTypeMasterCat <- case typeTypeCatInit of (Just ttci) -> newEntity TestCat mastercatInit (eid ttci) Master
                                           Nothing -> return Nothing
 -- finalyse master
 let typeTypecat = fmap (\ttci -> completeMasterEntity ttci (eid ttci)) typeTypeCatInit
 let mastercat = completeMasterEntity mastercatInit masterTypeID
 let sm = addIDEntity' (Just mastercat)
            $ addIDEntity' typeTypecat
            $ addIDEntity' mTypeMasterCat
            $ HM.empty 
 return (sm, mTypeMasterCat)
 where addIDEntity' (Just e) hm = addIDEntity hm (eid e) (encode e)
       addIDEntity' Nothing hm  = hm

```

The striple should be :



 striple id        | from              | about             | content    
 ----------------- | ----------------- | ----------------- | -----------------
 masterID          | masterID          | masterTypeID      | Masterv (abstract empty content)
                   |                   |                   |
 userTypeID        | masterID          | typeTypeID        | StandardUser (abstract empty content)
 masterTypeID      | masterID          | typeTypeID        | Master (abstract empty content)
 statementTypeID   | masterID          | typeTypeID        | Statement (abstract empty content)
 typeTypeID        | masterID          | typeTypeID        | Type (abstract empty content)
                   |                   |                   |
 meID              | masterID          | userTypeID        | "meName"
 otherMeID         | masterID          | userTypeID        | "otherMeName"
                   |                   |                   |
 likeNormalID      | otherMeID         | statementTypeID   | Like Normally
 ilikeothermeID    | meID              | likeNormalID      | otherMeID
 liketotallyID     | likeNormalID      | statementTypeID   | Like Totally
 iliketotallyID    | meID              | liketotallyID     | liketotallyID
 guessloversID     | meID              | statementTypeID   | Guess Lovers
 weloversID        | otherMeID         | guessloversID     | (meID, otherMeID)



Note that masterID is something like applicative signing of concept (applicative types for instance)
Note that *like normal* statement is something owned by a user statement (should be masterID for something that common, but iliketotally statement give some dynamic purpose on like).
Note that *like totally* statement is something owned by another statement (testing).

Note that we lovers design seems a bit wrong as `content` contains two statement IDs, it should be a third statement about a statement defining a relationship between both IDs (likely public statement). The haskell Pair of ID should be exportable to public statement `from` haskell pair of id type statement, `about` meID, and content `otherMeID` : but it is quite impractical when considering that it involves an additional statement, so the multi content hypothesis should be considered (possibility to have multiple content in contents (both id or abstract content).

Note that sample is overdoing it a bit, for real application, it may be more realist to include multiple information in content : for example an RDF like application with trust from users : `from` become user id, `about` the second entity id and in content the first entity id and third entity id. 
When the right way to do it should involve a lot more striples.

