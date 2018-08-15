library(testthat)

# If any of the expressions in ... are not all FALSE, stop is called, producing
# an error message indicating the first of the elements of ... which were not
# false.

context("stopif")

test_that("stopif passes for all FALSE statements", {
  expect_null(stopif(FALSE, FALSE))
})


test_that("stopif passes if all are FALSE", {
  expect_null(stopif(1 != 1, !all.equal(pi, 3.14159265), 1 > 2)) # all FALSE

})

test_that("stopif passes if all are FALSE", {
  m <- matrix(c(1, 2, 3, 4), 2, 2)
  expect_null(stopif(all(m == t(m)), all(diag(m) == rep(1, 2)))) # all(.) |=>  FALSE
})


test_that("stopif yields error for a TRUE statement", {
  expect_error(stopif(1 > 2, 0 == 0, -9 == 9), "0 == 0 is TRUE")
})

test_that("stopif yields error for a TRUE statement", {
  expect_error(stopif(1 > 2, 0 == 1, 9 == 9), "9 == 9 is TRUE")
})
#
# arg1 <- ""
# arg2 <- " "
# arg3 <- c()
# # stopif(is.empty(arg1), is.empty(arg2), is.empty(arg3))
# expect_error(stopif(is.empty(arg1), is.empty(arg2), is.empty(arg3)), "is.empty(arg3) is TRUE")

