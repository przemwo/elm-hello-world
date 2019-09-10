module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


type alias Model =
    { url : String, caption : String, liked : Bool }


baseUrl : String
baseUrl =
    "http://localhost:8000/"


initialModel : Model
initialModel =
    { url = baseUrl ++ "lorem-pic-happy.jpg", caption = "Happiness!", liked = True }


viewDetailedPhoto : Model -> Html Msg
viewDetailedPhoto model =
    let
        button =
            if model.liked then
                div [] [ text "Liked!" ]

            else
                div [] [ text "Not liked!" ]

        msg =
            if model.liked then
                Unlike

            else
                Like
    in
    div [ class "detailed-photo" ]
        [ img [ src model.url ] []
        , div [ class "photo-info" ]
            [ div [ onClick msg ] [ button ]
            , h2 [ class "caption" ] [ text model.caption ]
            ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ div [ class "header" ]
            [ h1 [] [ text "Lorem Photos" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto model ]
        ]


type Msg
    = Like
    | Unlike


update :
    Msg
    -> Model
    -> Model
update msg model =
    case msg of
        Like ->
            { model | liked = True }

        Unlike ->
            { model | liked = False }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
