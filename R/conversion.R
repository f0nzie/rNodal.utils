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

