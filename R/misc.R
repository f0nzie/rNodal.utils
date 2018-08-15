
#' Get the 'extdata' folder in a package
#'
#' @param pkgname the name of the package
#' @export
get_extdata_dir <- function(pkgname) {
    if (missing(pkgname)) stop("package name not provided")
    if (nchar(pkgname) == 0) stop("a package name has to be entered")
    sys_file <- system.file("extdata", package = pkgname)
    if (nchar(sys_file) == 0) stop("folder does not exist")
    return(sys_file)
}



#' Get the methods in a S4 class
#'
#' But only those specific to the class
#' @param theClass class to analyze
#' @importFrom methods showMethods
#' @export
showMethods2 <- function(theClass) {
    if (!is.character(theClass)) {
        theClass <- class(theClass)[1]
    }
    # get the method printout
    mtext <-  showMethods(classes=theClass, printTo = FALSE )

    # extract only what is between "Function :" and " (pack ... .GlobalEnv)"
    fvec  <- gsub( "Function(\\:\\s|\\s\\\")(.+)(\\s\\(|\\\")(.+$)",
                   "\\2", mtext[grep("^Function: ", mtext)] )
    fvec
}




#' Source an R script from inst/examples
#'
#' This is useful when we separate an application or implementation from the
#' class. Similar to what OpenSourcePhysics does: the ODE classes in separate
#' files and the main application in classApp
#'
#' @param aClassFile a file containing one or more classes
#' @param aFolder    a folder where examples are located
#' @param aPackage   a package where the folder and class resides
#' @export
importFromExamples <- function(aClassFile, aFolder = "examples", aPackage) {
    if (missing(aClassFile)) stop("script with classes not provided")
    if (missing(aPackage)) stop("package name not provided")
    ex_dir <- system.file(aFolder, package = aPackage)
    if (nchar(ex_dir) == 0) stop("examples folder does not exist")
    # ex_file <- system.file(aFolder, aClassFile, package = aPackage)
    exfile_exists <- file.exists(paste(ex_dir, aClassFile, sep ="/"))
    if (!exfile_exists) stop("incorrect example filename")
    # if (nchar(ex_file) == 0) stop("file with classes does not exist")
    ex_file <- system.file(aFolder, aClassFile, package = aPackage)
    source(ex_file, echo = FALSE)
}



