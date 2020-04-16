-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


{-# LANGUAGE GADTs #-}


module Duckling.Rules.JA
  ( defaultRules
  , langRules
  , localeRules
  ) where

import Duckling.Dimensions.Types
import Duckling.Locale
import Duckling.Types
import qualified Duckling.Numeral.JA.Rules as Numeral
import qualified Duckling.Ordinal.JA.Rules as Ordinal
import qualified Duckling.Temperature.JA.Rules as Temperature
import qualified Duckling.TimeGrain.JA.Rules as TimeGrain

defaultRules :: Some Dimension -> [Rule]
defaultRules = langRules

localeRules :: Region -> Some Dimension -> [Rule]
localeRules region (This (CustomDimension dim)) = dimLocaleRules region dim
localeRules _ _ = []

langRules :: Some Dimension -> [Rule]
langRules (This AmountOfMoney) = []
langRules (This CreditCardNumber) = []
langRules (This Distance) = []
langRules (This Duration) = []
langRules (This Recurrence) = []
langRules (This Email) = []
langRules (This Numeral) = Numeral.rules
langRules (This Ordinal) = Ordinal.rules
langRules (This PhoneNumber) = []
langRules (This Quantity) = []
langRules (This RegexMatch) = []
langRules (This Temperature) = Temperature.rules
langRules (This Time) = []
langRules (This TimeGrain) = TimeGrain.rules
langRules (This Url) = []
langRules (This Volume) = []
langRules (This (CustomDimension dim)) = dimLangRules JA dim
