#' Calculate the Mean
#'
#' @param x Ein numerischer Vektor.
#' @return Der Mittelwert des Vektors.
#' @examples
#' mean_calc(c(1, 2, 3, 4, 5))
mean_calc <- function(x) {
  if (!is.numeric(x)) stop("Eingabe muss numerisch sein")
  return(mean(x, na.rm = TRUE))
}
