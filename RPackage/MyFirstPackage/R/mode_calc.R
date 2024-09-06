#' Calculate the Mode
#'
#' Diese Funktion berechnet den Modus eines numerischen Vektors.
#'
#' @param x Ein numerischer Vektor.
#' @return Der Modus des Vektors.
#' @examples
#' mode_calc(c(1, 2, 2, 3, 3, 3, 4, 5))
mode_calc <- function(x) {
  if (!is.numeric(x)) stop("Eingabe muss numerisch sein")
  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}
