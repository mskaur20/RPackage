#' Calculate the Median
#'
#' Diese Funktion berechnet den Median eines numerischen Vektors und ignoriert NA-Werte.
#'
#' @param x Ein numerischer Vektor.
#' @return Der Median des Vektors.
#' @examples
#' median_calc(c(1, 2, 3, 4, 5))
median_calc <- function(x) {
  if (!is.numeric(x)) stop("Eingabe muss numerisch sein")
  return(median(x, na.rm = TRUE))
}
