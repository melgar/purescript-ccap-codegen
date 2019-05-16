module Ccap.Codegen.Types
  ( IsRequired(..)
  , Module(..)
  , Primitive(..)
  , Type(..)
  , RecordProp(..)
  , TypeOrRecord(..)
  , TypeDecl(..)
  , Variant
  ) where

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Show)
import Text.Parsing.Parser.Pos (Position)

data Module = Module String (Array TypeDecl)

data TypeDecl = TypeDecl String TypeOrRecord

data TypeOrRecord
  = Type Type
  | Record (Array RecordProp)

data Type
  = Primitive Primitive
  | Ref Position String
  | Array Type
  | Sum (Array Variant)

data RecordProp = RecordProp String Type IsRequired

type Variant = String

data IsRequired
  = Required
  | Optional

data Primitive
  = PBoolean
  | PDate
  | PDateTime
  | PInt
  | PDecimal
  | PString
  | PTime

-- Instances here to avoid cluttering the above

derive instance eqModule :: Eq Module
derive instance genericModule :: Generic Module _
instance showModule :: Show Module where
  show = genericShow

derive instance eqType :: Eq Type
derive instance genericType :: Generic Type _
instance showType :: Show Type where
  show t = genericShow t

derive instance eqTypeOrRecord :: Eq TypeOrRecord
derive instance genericTypeOrRecord :: Generic TypeOrRecord _
instance showTypeOrRecord :: Show TypeOrRecord where
  show = genericShow

derive instance eqTypeDecl :: Eq TypeDecl
derive instance genericTypeDecl :: Generic TypeDecl _
instance showTypeDecl :: Show TypeDecl where
  show = genericShow

derive instance eqRecordProp :: Eq RecordProp
derive instance genericRecordProp :: Generic RecordProp _
instance showRecordProp :: Show RecordProp where
  show = genericShow

derive instance eqIsRequired :: Eq IsRequired
derive instance genericIsRequired :: Generic IsRequired _
instance showIsRequired :: Show IsRequired where
  show = genericShow

derive instance eqPrimitive :: Eq Primitive
derive instance genericPrimitive :: Generic Primitive _
instance showPrimitive :: Show Primitive where
  show = genericShow
