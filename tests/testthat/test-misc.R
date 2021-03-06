library(testthat)

context("get_extdata_dir")

test_that("folder extdata exist", {
    # expect_match(get_extdata_dir(pkgname = "rNodal.utils"), "extdata")
    x <- get_extdata_dir(pkgname = "rNodal.utils")
    pattern <- "extdata"
    m <- regexpr(pattern, x, perl = TRUE)
    expect_equal(regmatches(x, m), "extdata")
})

test_that("package name was not supplied", {
    expect_error(get_extdata_dir(), "package name not provided")
})



context("importFromExamples")

test_that("package name was not supplied", {
    expect_error(importFromExamples(), "script with classes not provided")
})


test_that("package name was not supplied", {
    expect_error(importFromExamples(aClassFile = "myFile"), "package name not provided")
})

test_that("example file name is incorrect", {
    expect_error(importFromExamples(aClassFile = "myFile",
                                    aPackage = "rNodal.utils"),
                 "incorrect example filename")
})

test_that("example file name is OK and loads file", {
    importFromExamples(aClassFile = "ODE.R",
                                    aPackage = "rNodal.utils")
})



context("showMethods2")

# expect_equal(showMethods2("data.frame"), c("$<-", "[[<-", "[<-", "slotsFromS3"))
expect_true(all(showMethods2("structure") %in% c("Math",  "Math2", "Ops")))
expect_true(all(showMethods2("array") %in% c("coerce", "initialize", "Ops" )))
