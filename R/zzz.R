.onLoad <- function(libname, pkgname) {
  op <- options()
  op.typedR <- list(
    typedR.startDelay = 0,
    typedR.backSpeed = 0,
    typedR.backDelay = 700,
    typedR.fadeOut = FALSE,
    typedR.fadeOutDelay = 500,
    typedR.loop = FALSE,
    typedR.loopCount = 9999,
    typedR.showCursor = TRUE,
    typedR.cursorChar = "|"
  )
  toset <- !(names(op.typedR) %in% names(op))
  if(any(toset)) options(op.typedR[toset])

  invisible()
}
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Report any BUGS to https://github.com/chrk623/typedR/issues")
}
