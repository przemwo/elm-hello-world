module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, placeholder, src, type_)
import Html.Events exposing (onClick)


type alias Model =
    { url : String
    , caption : String
    , liked : Bool
    , comments : List String
    , newComment : String
    }


baseUrl : String
baseUrl =
    "http://localhost:8000/"


initialModel : Model
initialModel =
    { url = baseUrl ++ "lorem-pic-happy.jpg"
    , caption = "Happiness!"
    , liked = True
    , comments = [ "Looks good!" ]
    , newComment = ""
    }


viewComment : String -> Html Msg
viewComment comment =
    li []
        [ strong [] [ text "Comment:" ]
        , text (" " ++ comment)
        ]


viewCommentList : List String -> Html Msg
viewCommentList comments =
    case comments of
        [] ->
            text ""

        _ ->
            div [ class "comments" ]
                [ ul [] (List.map viewComment comments) ]


viewLoveButton : Model -> Html Msg
viewLoveButton model =
    let
        button =
            if model.liked then
                div [] [ text "Liked!" ]

            else
                div [] [ text "Not liked..." ]
    in
    div [ onClick ToggleLike ] [ button ]


viewDetailedPhoto : Model -> Html Msg
viewDetailedPhoto model =
    div [ class "detailed-photo" ]
        [ img [ src model.url ] []
        , div [ class "photo-info" ]
            [ viewLoveButton model
            , h2 [ class "caption" ] [ text model.caption ]
            , viewCommentList model.comments
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
    = ToggleLike


update :
    Msg
    -> Model
    -> Model
update msg model =
    case msg of
        ToggleLike ->
            { model | liked = not model.liked }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
