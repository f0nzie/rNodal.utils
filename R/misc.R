
#' Get the 'extdata' folder in a package
#'
#' @param pkgname the name of the package
#' @export
get_extdata_dir <- function(pkgname) {
  system.file("extdata", package = pkgname)
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
    source(paste(system.file(aFolder,
                             package = aPackage),
                 aClassFile,
                 sep ="/"), echo = FALSE)
}



