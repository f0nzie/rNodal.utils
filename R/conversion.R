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


#' Take objects and create a list using their names
#'
#' This avoids retyping the name of the object as in a list
#'
#' @param ... additional parameters
#' @importFrom stats setNames
#' @keywords internal
as_named_list <- function(...) {
  if (length(as.character( match.call()[-1])) < 1)
    stop("you must supply at least one object name")
  nl <- setNames( list(...), as.character( match.call()[-1]) )
  nl
}

