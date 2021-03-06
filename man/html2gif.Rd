% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/html2gif.R
\name{html2gif}
\alias{html2gif}
\title{Export animation as GIF.}
\usage{
html2gif(file_in, fps = 10, file_out = "mygif.gif", type = "typedR",
  options = NULL)
}
\arguments{
\item{file_in}{The name of the html file which the data are to be read from.}

\item{fps}{Frames per second of the gif.}

\item{file_out}{The name of the file where the gif will be saved .}

\item{type}{\code{"typedR"} or \code{"custom"} (TODO) html files.}

\item{options}{Additional options for custom html files. A \code{list} of details which needs
to include \code{length} of animation, see below \code{Additionl Options} and \code{example}
section below for more details.}
}
\description{
Export html animation as GIF.
}
\details{
This function renders html animations into gif. It can be used to with other html files
which is not generated by \code{typedR}, by default the details of the previously genreated
\code{typedR} animation will be store,
therefore additional parameters are not required.
However, to render other html files, additional parameters will need to be provided. See above parameters.
}
\note{
A headless browser is used to capture the animation, therefore it will take approximately
the length of the animation to render it into GIF.
}
\section{Additional Options}{

Additional parameters required for custom html files. This needs to passed as a \code{list}.
\itemize{
 \item{\code{length}:  }{Length of the animation in milliseconds.}
 \item{\code{selector}:  }{CSS selector of the element in the DOM to capture.
 \code{body} will be used by default.}
}
}

\examples{
\\not
mywidget = typedR(text = "apply(matrix(1:4, nc=2), 2, mean)", theme = "mac",
       ratio = 0.8, speed = 500, background_col = "lightblue",
       width = 640, height = 480)
htmlwidgets::saveWidget(mywidget, "mywidget.html")
library(chromote)
library(magick)
html2gif("mywidget.html")
}
\author{
Charco Hui
}
