module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, src)


baseUrl : String
baseUrl =
    "http://localhost:8000/"


viewDetailedPhoto : String -> String -> Html msg
viewDetailedPhoto imgUrl caption =
    div [ class "detailed-photo" ]
        [ img [ src imgUrl ] []
        , div [ class "photo-info" ]
            [ h2 [ class "caption" ] [ text caption ] ]
        ]


main : Html msg
main =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Lorem Photos" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto (baseUrl ++ "lorem-pic-happy.jpg") "Happiness"
            , viewDetailedPhoto (baseUrl ++ "lorem-pic-build.jpg") "Work"
            ]
        ]
