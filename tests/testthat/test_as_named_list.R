library(testthat)

context("as_named_list")

test_that("as_named_list return names without being explicit", {
  a = 1
  b = c(100, 200)
  c = "string"
  # named_list <- rNodal.utils:::as_named_list(a, b, c)
  named_list <- as_named_list(a, b, c)
  expect_equal(names(named_list), c("a", "b", "c"))
})


test_that("as_named_list receives at least one argument", {
  expect_error(as_named_list(), "you must supply at least one object name")
})
