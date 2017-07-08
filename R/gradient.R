
#' Calculate the temperature gradient based on bottomhole and wellhead temperature
#'
#' @param bht bottomhole temperature, deg F
#' @param wht wellhead temperature, deg F
#' @param depth.bh  depth at bottohole, feet
#' @export
calc_temperature_gradient <- function(bht, wht, depth.bh) {
    stopifnot(depth.bh != 0)
    if (bht == wht)
        warning("bottomhole and wellhead temperatures are the same. \n
                Gradient will be 0")
    (bht - wht) / depth.bh
}
