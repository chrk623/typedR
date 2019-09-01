
<!-- README.md is generated from README.Rmd. Please edit that file -->

# typedR

[typed.js](https://github.com/mattboldt/typed.js) is a popular
JavaScript library to generate animate string typing. This package is a
R wrapper for it.

## Installation

This packages can be installed by using the `devtools` package. It is
suggested to have the newest version of `htmlwidgets` and have a
relatively new version of Rstudio.

``` r
devtools::install_github("chrk623/typedR")
```

## Examples

``` r
library(typedR)
typedR(text = "matrix(1:4, nc=2), 2, mean)", theme = "mac",
       ratio = 0.8, speed = 10, background_col = "lightblue")
```

![example1](man/gifs/example1.gif)
# typedR
# typedR
