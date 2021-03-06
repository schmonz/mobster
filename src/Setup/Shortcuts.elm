module Setup.Shortcuts exposing (..)

import Array
import Basics.Extra exposing ((=>))
import Html exposing (..)
import Html.Attributes as Attr exposing (style)
import Keyboard.Combo
import Setup.Msg exposing (..)


letters : Array.Array String
letters =
    Array.fromList [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p" ]


hint : Int -> Html msg
hint index =
    let
        letter =
            Maybe.withDefault "?" (Array.get index letters)
    in
        span [ Attr.class "text-muted", style [ "font-size" => "0.7em" ] ] [ text " (", u [] [ text letter ], text ")" ]


numberHint : Int -> Html msg
numberHint index =
    let
        maybeHint =
            if index == 9 then
                Just 0
            else if index < 9 then
                Just (index + 1)
            else
                Nothing
    in
        case maybeHint of
            Just hintText ->
                span [ style [ "font-size" => "0.7em", "color" => "grey" ] ] [ text (" (" ++ toString hintText ++ ")") ]

            Nothing ->
                span [] []


keyboardCombos : List (Keyboard.Combo.KeyCombo Msg)
keyboardCombos =
    [ Keyboard.Combo.combo2 ( Keyboard.Combo.control, Keyboard.Combo.enter ) StartTimer
    , Keyboard.Combo.combo2 ( Keyboard.Combo.command, Keyboard.Combo.enter ) StartTimer
    , Keyboard.Combo.combo2 ( Keyboard.Combo.option, Keyboard.Combo.r ) ShowRotationScreen
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.r ) ShowRotationScreen
    , Keyboard.Combo.combo2 ( Keyboard.Combo.option, Keyboard.Combo.s ) SkipHotkey
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.s ) SkipHotkey
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.a ) (RotateInHotkey 0)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.b ) (RotateInHotkey 1)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.c ) (RotateInHotkey 2)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.d ) (RotateInHotkey 3)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.e ) (RotateInHotkey 4)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.f ) (RotateInHotkey 5)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.g ) (RotateInHotkey 6)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.h ) (RotateInHotkey 7)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.i ) (RotateInHotkey 8)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.j ) (RotateInHotkey 9)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.k ) (RotateInHotkey 10)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.l ) (RotateInHotkey 11)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.m ) (RotateInHotkey 12)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.n ) (RotateInHotkey 13)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.o ) (RotateInHotkey 14)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.p ) (RotateInHotkey 15)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.one ) (RotateOutHotkey 0)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.two ) (RotateOutHotkey 1)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.three ) (RotateOutHotkey 2)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.four ) (RotateOutHotkey 3)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.five ) (RotateOutHotkey 4)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.six ) (RotateOutHotkey 5)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.seven ) (RotateOutHotkey 6)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.eight ) (RotateOutHotkey 7)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.nine ) (RotateOutHotkey 8)
    , Keyboard.Combo.combo2 ( Keyboard.Combo.alt, Keyboard.Combo.zero ) (RotateOutHotkey 9)
    ]
