module Setup.Stylesheet exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, button, html, span, a)
import Css.Namespace exposing (namespace)


type CssClasses
    = BufferTop
    | BufferRight
    | Green
    | Orange
    | Red
    | DropAreaInactive
    | DropAreaActive
    | LargeButtonText
    | TooltipContainer
    | Tooltip
    | ShowOnParentHover
    | ShowOnParentHoverParent
    | HasHoverActions
    | DragBelow
    | HasError
    | RpgIcon1
    | RpgIcon2
    | ButtonMuted
    | HandPointer


css : Stylesheet
css =
    (stylesheet << namespace "setup")
        [ mediaQuery "screen and ( max-width: 800px )"
            [ body
                [ fontSize (px 7) ]
            ]
        , mediaQuery "screen and ( min-width: 801px ) and ( max-width: 1000px )"
            [ body
                [ fontSize (px 10) ]
            ]
        , mediaQuery "screen and ( min-width: 1001px )"
            [ body
                [ fontSize (px 15) ]
            ]
        , button [ cursor default ]
        , a [ cursor default ]
        , class HandPointer [ cursor pointer |> important ]
        , selector ".btn" [ cursor default |> important ]
        , class DragBelow [ borderBottom3 (px 2) (solid) (rgba 14 255 125 1) ]
        , class BufferTop
            [ Css.marginTop (px 20) ]
        , class BufferRight
            [ marginRight (px 10)
            ]
        , class Green (hoverButton (rgba 50 250 50 0.6))
        , class Red (hoverButton (rgba 231 76 60 0.7))
        , class Orange (hoverButton (rgba 255 133 27 1))
        , class DropAreaInactive [ borderStyle Css.dotted ]
        , class DropAreaActive [ backgroundColor (rgba 250 150 100 0.5), borderStyle Css.dotted ]
        , class LargeButtonText [ fontSize (em 2.85), padding (em 0.3) ]
        , tooltipStyle
        , class ShowOnParentHoverParent
            [ descendants [ class ShowOnParentHover [ opacity (int 0) ] ]
            , hover
                [ descendants
                    [ class ShowOnParentHover
                        [ opacity (num 1.0)
                        , hover [ opacity (num 1.0) ]
                        ]
                    ]
                ]
            ]
        , class HasHoverActions
            [ borderBottom3 (px 2) dotted (rgba 80 60 100 0.6)
            , paddingBottom (px 8)
            , hover [ borderBottom3 (px 2) dotted (rgba 80 60 100 0.0) ]
            ]
        , class HasError [ border3 (px 3) (solid) (rgba 231 76 60 0.7) |> important ]
        , class RpgIcon1 (rpgIconCss (rgb 8 133 236))
        , class RpgIcon2 (rpgIconCss (rgb 144 7 179))
        , class ButtonMuted [ backgroundColor (rgb 192 192 192), hover [ backgroundColor (rgb 112 112 112) ] ]
        ]


rpgIconCss : ColorValue compatible -> List Mixin
rpgIconCss color =
    [ descendants [ selector "g" [ fill color ] ] ]


hoverButton : ColorValue compatible -> List Mixin
hoverButton customColor =
    [ hover
        [ children
            [ span [ color customColor ]
            , selector "u" [ color customColor ]
            ]
        ]
    ]


tooltipStyle : Snippet
tooltipStyle =
    class TooltipContainer
        -- /* Tooltip CSS  - help from https://jsfiddle.net/greypants/zgCb7/ */
        [ Css.transform (translateZ (zero))
        , children
            [ class Tooltip
                [ left (Css.pct 50) |> important
                , right (auto) |> important
                , textAlign (center) |> important
                , transform (translate2 (pct -50) (zero)) |> important
                , fontSize (Css.rem 2.5)
                , Css.backgroundColor (rgba 14 255 125 1)
                , bottom (pct 100)
                , color (hex "#fff")
                , display block
                , left zero
                , marginBottom (px 15)
                , opacity zero
                , padding (px 20)
                , position absolute
                , transform (translateY (px 10))
                , Css.property "transition" "all .15s ease-out"
                , boxShadow4 (px 2) (px 2) (px 6) (rgba 0 0 0 0.28)
                , property "pointer-events" "none"
                , after
                    [ Css.property "border-left" "solid transparent 10px"
                    , Css.property "border-right" "solid transparent 10px"
                    , Css.property "border-top" "solid rgba(14, 255, 125, 1) 10px"
                    , bottom (px -10)
                    , Css.property "content" "' '"
                    , height zero
                    , left (pct 50)
                    , marginLeft (px -13)
                    , position absolute
                    , width zero
                    ]
                ]
            ]
        , hover
            [ children
                [ class Tooltip
                    [ opacity (Css.int 1)
                    , property "transition-delay" "0.5s"
                    , transform (translateY zero)
                    , property "pointer-events" "auto"
                    ]
                ]
            ]
        ]
