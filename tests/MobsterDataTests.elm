module MobsterDataTests exposing (all)

import Test exposing (..)
import Expect
import Mobster.Data exposing (empty)
import Test exposing (..)
import Test.Extra exposing (..)
import TestHelpers exposing (toMobsters)


all : Test
all =
    describe "mobster data"
        [ describe "containsName"
            [ test "catches exact matches" <|
                \() ->
                    { empty | mobsters = [ "Jane" ] |> toMobsters }
                        |> Mobster.Data.containsName "Jane"
                        |> Expect.equal True
            , test "catches matches with different casing" <|
                \() ->
                    { empty | mobsters = [ "jane" ] |> toMobsters }
                        |> Mobster.Data.containsName "Jane"
                        |> Expect.equal True
            , test "finds matches on bench" <|
                \() ->
                    { empty | inactiveMobsters = [ "Jane" ] |> toMobsters }
                        |> Mobster.Data.containsName "Jane"
                        |> Expect.equal True
            , test "doesn't find false matches" <|
                \() ->
                    { empty | inactiveMobsters = [ "Joe" ] |> toMobsters }
                        |> Mobster.Data.containsName "Jane"
                        |> Expect.equal False
            ]
        , describeDecoder "MobsterData"
            Mobster.Data.decoder
            [ ( "", FailsToDecode )
            , ( """{
                     "mobsters": [],
                     "inactiveMobsters": [],
                     "nextDriver": 0
                   }""", DecodesTo Mobster.Data.empty )
            ]
        ]
