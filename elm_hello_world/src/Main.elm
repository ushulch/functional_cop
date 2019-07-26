module Main exposing (..)

import NewModule
import Browser
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox{init = init,
                    update = update,
                    view = view}




--Model
type alias Model = {name: String}

init: Model
init = {name = ""}


--Update
type Msg = NameChange String


update: Msg -> Model -> Model
update msg model =
    case msg of
        NameChange newName ->
            {model| name = newName}




--View
view: Model -> Html Msg
view model =
    div []
        [
         div []
             [
              text "Enter Name: ",
              input [ value model.name, onInput NameChange ] []
             ],
         div [] [text (NewModule.myFun ++  model.name)]
        ]
