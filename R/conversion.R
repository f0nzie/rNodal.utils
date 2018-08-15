#' Convert API to specific gravity
#'
#' @param api gravity of oil or condensate in API degrees
#' @export
api_to_specific_gravity <- function(api) {
  141.5 / (api + 131.5)
}

#' Convert Specific Gravity of oil or condensate to API
#'
#' @param sg specific gravity of oil or condensate
#' @export
specific_gravity_to_api <- function(sg) {
  (141.5 / sg) - 131.5
}



