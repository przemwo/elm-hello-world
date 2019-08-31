module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, src)


baseUrl : String
baseUrl =
    "http://localhost:8000/"


initialModel : { url : String, caption : String }
initialModel =
    { url = baseUrl ++ "lorem-pic-happy.jpg", caption = "Happiness!" }


viewDetailedPhoto : { url : String, caption : String } -> Html msg
viewDetailedPhoto model =
    div [ class "detailed-photo" ]
        [ img [ src model.url ] []
        , div [ class "photo-info" ]
            [ h2 [ class "caption" ] [ text model.caption ] ]
        ]


view : { url : String, caption : String } -> Html msg
view model =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Lorem Photos" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto model ]
        ]


main : Html msg
main =
    view initialModel
