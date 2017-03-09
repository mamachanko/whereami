module Tests exposing (..)

import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)
import WebApp exposing (view, locationUnknown, locationKnown)


all : Test
all =
    describe "WebApp"
        [ describe "when the location is not know"
            [ test "it displays message" <|
                \() ->
                    view locationUnknown
                        |> Query.fromHtml
                        |> Query.has [ text "Where am I?" ]
            ]
        , describe "when the location is known"
            [ test "it displays the location" <|
                \() ->
                    view (locationKnown 12.34 56.78)
                        |> Query.fromHtml
                        |> Query.has [ text "You are at latitude 12.34 and longitude 56.78" ]
            ]
        ]
