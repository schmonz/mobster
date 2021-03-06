module TimerFlagsTests exposing (all)

import Test exposing (..)
import Expect
import Json.Decode as Decode
import Timer.Flags


all : Test
all =
    test "decoder parses same object as the encoder generates" <|
        \() ->
            let
                flags =
                    { minutes = 123, driver = "Sulu", navigator = "Kirk", isBreak = False }
            in
                flags
                    |> Timer.Flags.encode
                    |> Decode.decodeValue Timer.Flags.decoder
                    |> Expect.equal
                        (Ok
                            { minutes = 123, driver = "Sulu", navigator = "Kirk", isBreak = False, isDev = False }
                        )
