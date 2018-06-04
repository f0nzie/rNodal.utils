
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



#' Get a list of R scripts under examples that end in App
#'
#' @param folder folder where the examples live
#' @param aPackage package to analyze
#' @param ... additional parameters
#' @export
get_list_examples <- function(folder = "examples", aPackage, ...) {
    # this is where examples live
    examples_dir <- system.file("examples", package = aPackage)
    # print(examples_dir)

    # get all the scripts that `App` in them
    examples <- list.files(path = examples_dir, pattern = "*App", all.files = FALSE,
                           full.names = FALSE, recursive = FALSE, ignore.case = FALSE,
                           include.dirs = FALSE, no.. = FALSE)
    examples

}



#' @title
#' Test emptyness
#'
#' @description
#' These methods test if an object \code{x} is empty.
#'
#' @param x
#' An object to be tested.
#'
#' @return
#' \code{TRUE} if \code{x} is empty, \code{FALSE} otherwise.
#'
#'
#' @export
#'
#' @examples
#' is.empty(4)
#' is.empty(c())
#' is.empty(character(0))
#' is.empty(list())
#' is.empty(integer(0))
#' is.empty(data.frame())
#'
is.empty <-
    function(x)
    {
        UseMethod("is.empty")
    }


#' @export
#' @rdname is.empty
#'
is.empty.default <-
    function(x)
    {
        length(x)==0L
    }


#' @export
#' @rdname is.empty
#'
is.empty.data.frame <-
    function(x)
    {
        nrow(x) == 0L #|| ncol(x) == 0L
    }



#' @title
#' Ensure that R expressions are false
#'
#' @description
#' If any of the expressions in \code{...} are not all \code{FALSE},
#' stop is called, producing an error message indicating
#' the first of the elements of \code{...} which were not false.
#'
#' @param ...
#' Any number of (logical) R expressions,
#' which should evaluate to \code{TRUE}.
#'
#' @return
#' (\code{NULL} if all statements in \code{...} are \code{FALSE}.)
#'
#' @seealso \code{\link[base]{stopifnot}} from package \pkg{base}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' stopif(is.empty(c(2,1)), 4 < 3) # all FALSE
#' stopif(is.empty(numeric(0)))
#' }
#'
stopif <-
    function(...)
    {
        n <- length(ll <- list(...))
        if (n == 0L)
            return(invisible())
        mc <- match.call()
        for (i in 1L:n) {
            if (!(is.logical(r <- ll[[i]]) && !anyNA(r) && all(!r))) {
                ch <- deparse(mc[[i + 1]], width.cutoff = 60L)
                if (length(ch) > 1L)
                    ch <- paste(ch[1L], "....")
                stop(sprintf(ngettext(length(r), "%s is TRUE", "%s are not all FALSE"), ch),
                     call. = FALSE, domain = NA)
            }
        }
        invisible()
    }









# dotest_applications <- function(aPackage, goDebug = FALSE) {
#     examples <- get_list_examples(aPackage)
#     # loop to open each file
#     goDebug <- FALSE
#     nmax <- 0
#     if (goDebug) {
#         nmax <- 20
#         examples <- examples[1:nmax]          # reduce the list for debugging
#     }
#     i <- 1
#     for (app in examples) {
#         application <- sub("\\.R$", '', app)
#         cat(sprintf("\n %3d testing ... %30s", i, app))
#         source(paste(system.file("examples", package = "rODE"), app, sep ="/"))
#         result  <- do.call(application, list(FALSE))
#         .result <- as.list(result[nrow(result),]);
#         cat(sprintf("%30s", names(expected[application])))
#         if ((goDebug) && (names(expected[application]) == "VanderpolMuTimeControlApp")) {
#             cat("\n");
#             print(.result)}
#         last_row <- expected[[application]]$rowVector
#         expect_equal(.result, last_row, tolerance = expected[[application]]$tolerance)
#         # cat(expected[[application]]$tolerance)
#         cat("\t tested")
#         i <- i + 1
#     }
# }


#' Save an object to an rda file
#'
#' Saves the file to the project onst/extdata folder
#' @param ... any object
#' @param name the name of the dataset
#' @import rprojroot
#' @export
save_rda_to_project <- function(..., name = NULL) {
    if (is.null(name)) stop("provide a name for the rda file")
    rstudio_root <- rprojroot::find_rstudio_root_file()
    extdata <- file.path(rstudio_root, "inst", "extdata")
    if (!dir.exists(extdata)) dir.create(extdata)
    rda_fname <- file.path(extdata, paste(name, "rda", sep = "."))
    save(..., file = rda_fname)
    if(!file.exists(rda_fname)) stop("file was not created")
    cat(sprintf("File %s has been created", rda_fname))
}



#' Load an object from rda file
#'
#' Load the file to the project inst/extdata folder
#' @param name the name of the dataset
#' @import rprojroot
#' @export
load_rda_from_project <- function(name = NULL) {
    root_rstudio <- rprojroot::find_rstudio_root_file()
    rda_filename <- paste(name, "rda", sep = ".")
    rda_filename <- file.path(root_rstudio, "inst/extdata", rda_filename)
    if (!file.exists(rda_filename)) stop("rda file does not exist")
    # load to the global environment
    load(file = rda_filename, envir = parent.frame())
    cat(sprintf("File %s has just been loaded", rda_filename))
}


#' Save a CSV file to a project folder inst/extdata
#' It saves time from specifying path and everything
#'
#' @param object it is R object to save
#' @param name the name of the dataset, no extension
#' @importFrom utils write.csv
#' @export
save_csv_to_project <- function(object, name = NULL) {
    if (is.null(name)) stop("provide a name for the csv file")
    rstudio_root <- rprojroot::find_rstudio_root_file()
    extdata <- file.path(rstudio_root, "inst", "extdata")
    if (!dir.exists(extdata)) dir.create(extdata)
    csv_fname <- file.path(extdata, paste(name, "csv", sep = "."))
    write.csv(x = object, file = csv_fname, row.names = FALSE)
    if(!file.exists(csv_fname)) stop("file was not created")
    cat(sprintf("File %s has been created", csv_fname))
}


#' Read a CSV file from a project folder inst/extdata
#' It saves time from specifying path and everything
#'
#' @param name the name of the dataset, no extension
#' @export
read_csv_from_project <- function(name = NULL) {
    if (is.null(name)) stop("provide a name for the csv file")
    rstudio_root <- rprojroot::find_rstudio_root_file()
    extdata <- file.path(rstudio_root, "inst", "extdata")
    csv_fname <- file.path(extdata, paste(name, "csv", sep = "."))
    if (!file.exists(csv_fname)) stop("csv file does not exist")
    obj <- readr::read_csv(file = csv_fname)
    cat(sprintf("File %s has just been read", csv_fname))
    return(obj)
}





#' Load an object from an rda file
#'
#' Load the file to the project inst/extdata folder
#' @param name the name of the dataset
#' @import rprojroot
#' @export
load_from_project <- function(name = NULL) {
    .Deprecated("load_rda_from_project", package = "rNodal.utils")
    load_rda_from_project(name = name)
}

#' Save an object to an rda file
#'
#' Saves the file to the project onst/extdata folder
#' @param ... any object
#' @param name the name of the dataset
#' @import rprojroot
#' @export
save_to_project <- function(..., name = NULL) {
    .Deprecated("save_rda_to_project", package = "rNodal.utils")
    save_rda_to_project(..., name = name)
}
