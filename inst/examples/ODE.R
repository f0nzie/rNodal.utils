

#' Get a new rate given a state
#'
#' @param object a class object
#' @param state current state
#' @param ... additional parameters
#' @export
setGeneric("getRate", function(object, state, ...) standardGeneric("getRate"))


#' Get current state of the system
#'
#' @param object a class object
#' @param ... additional parameters
#' @export
setGeneric("getState", function(object, ...) standardGeneric("getState"))

#
# ODE base class
#
# Inherited by: ODE solver objects

#' Defines an ODE object for any solver
#'
.ODE <- setClass("ODE", slots = c(
    state = "numeric",              # variables
    rate  = "numeric"               # derivatives
))

#' @rdname getState-method
setMethod("getState", "ODE", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

#' @rdname getRate-method
#' @example ./inst/examples/KeplerApp.R
#' @example ./inst/examples/FallingParticleODE.R
setMethod("getRate", "ODE", function(object, state, ...) {
    # Gets the rate of change using the argument's state variables.
    return(object@rate)
})

#' ODE constructor
#' @export
ODE <- function() {
    .ODE()
}

