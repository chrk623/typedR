#' Animate string typing
#'
#' @param text text to animate.
#' @param speed speed of the animation.
#' @param theme theme of the terminal. Currently only supports `mac`.
#' @param background_col background color of the panel outside the terminal UI.
#' @description
#' Animate string typing in a terminal like UI.
#' @examples
#' typedR(text = "apply(matrix(1:4, ncol = 2), 2, mean)", theme = "mac",
#'        ratio = 0.8, speed = 10, background_col = "lightblue")
#' @import htmlwidgets
#'
#' @export
typedR = function(text, speed = 20, theme = "mac",
                   ratio = 0.8,
                   background_col = "lightblue",
                   # extra_options = options("typedR.default"),
                   width = NULL, height = NULL
                   # , elementId = NULL
                   ) {

  # forward options using x
  pass_obj = list(
    ratio = ratio,
    typed_args = list(
      strings = text,
      typeSpeed = speed,
      showCursor = TRUE
    ),
    style_args = list(
      panel_background = background_col,
      theme = theme
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'typedR',
    pass_obj,
    width = width,
    height = height,
    package = 'typedR'
    # ,
    # elementId = elementId
  )
}
