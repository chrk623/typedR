#' Animate string typing
#'
#' @param text text to animate.
#' @param speed speed of the animation.
#' @param theme theme of the terminal. Currently only supports \code{mac}.
#' @param ratio the ratio size of the terminal UI compared to the background.
#' @param background_col background color of the panel outside the terminal UI.
#' @description
#' Animate string typing in a terminal like UI.
#' @note
#' Currently, he size of the output is generated based on the size of the viewer panel in Rstudio. If you require a different size,
#' resize your viewer and re-run your code.
#' @section Additional Options:
#' Additional options can be passed to typedR by using \code{options}. E.g \code{options(typedR.showCursor = FALSE)}
#' \itemize{
#'  \item{\code{typedR.startDelay}:  }{Time before typing starts in milliseconds. Default to \code{0}.}
#'  \item{\code{typedR.backSpeed}:  }{Backspacing speed in milliseconds. Default to \code{0}.}
#'  \item{\code{typedR.backDelay}:  }{Time before backspacing in milliseconds. Default to \code{0}.}
#'  \item{\code{typedR.fadeOut}:  }{Fade out instead of backspace. Default to \code{FALSE}.}
#'  \item{\code{typedR.fadeOutDelay}:  }{Fade out delay in milliseconds. Default to \code{500}.}
#'  \item{\code{typedR.loop}:  }{Loop strings. Default to \code{FALSE}.}
#'  \item{\code{typedR.loopCount}:  }{Times to loop string. Default to \code{9999}.}
#'  \item{\code{typedR.showCursor}:  }{Show cursor. Default to \code{TRUE}.}
#'  \item{\code{typedR.cursorChar}:  }{Character for cursor. Default to \code{"|"}.}
#' }
#' @author
#' Charco Hui
#' @examples
#' typedR(text = "apply(matrix(1:4, ncol = 2), 2, mean)", theme = "mac",
#'        ratio = 0.8, speed = 10, background_col = "lightblue")
#' @import htmlwidgets
#' @export
typedR = function(text, speed = 20, theme = "mac",
                   ratio = 0.8,
                   background_col = "lightblue",
                   width = 640, height = 480
                   # , elementId = NULL
                   ) {
  if(length(text) > 1) {
    stop("Only one string allowed at the moment.")
  }
  # forward options using x
  pass_obj = list(
    ratio = ratio,
    typed_args = list(
      strings = text,
      typeSpeed = speed,
      startDelay = getOption("typedR.startDelay"),
      backSpeed = getOption("typedR.backSpeed"),
      backDelay = getOption("typedR.backDelay"),
      fadeOut = getOption("typedR.fadeOut"),
      fadeOutDelay = getOption("typedR.fadeOutDelay"),
      loop = getOption("typedR.loop"),
      loopCount = getOption("typedR.loopCount"),
      showCursor = getOption("typedR.showCursor"),
      cursorChar = getOption("typedR.cursorChar")
    ),
    style_args = list(
      panel_background = background_col,
      theme = theme
    )
  )
  options("typedR.prev" = c(pass_obj$typed_args,
                            width = width,
                            height = height))
  # create widget
  htmlwidgets::createWidget(
    name = 'typedR',
    pass_obj,
    width = width,
    height = height,
    package = 'typedR'
  )
}
