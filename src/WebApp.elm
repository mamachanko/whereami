module WebApp exposing (view, locationUnknown, locationKnown)

import Html exposing (div, text)
import Html.App exposing (beginnerProgram)


type alias Location =
    { latitude : Float
    , longitude : Float
    }


type Model
    = LocationUnknown
    | LocationKnown Location


view model =
    case model of
        LocationUnknown ->
            div [] [ text whereAmI ]

        LocationKnown location ->
            div [] [ text (youAreAt location) ]


whereAmI =
    "Where am I?"


youAreAt { latitude, longitude } =
    "You are at latitude "
        ++ (toString latitude)
        ++ " and longitude "
        ++ (toString longitude)


locationUnknown =
    LocationUnknown


locationKnown latitude longitude =
    LocationKnown (Location latitude longitude)
