library(testthat)
library(bazar)

context("test is.empty")

test_that("is.empty of c() yields TRUE", {
  expect_true(is.empty(c()))
})

test_that("is.empty of list() yields TRUE", {
  expect_true(is.empty(list()))
})

test_that("is.empty of integer(0) yields TRUE", {
  expect_true(is.empty(integer(0)))
})

test_that("is.empty of character(0) yields TRUE", {
  expect_true(is.empty(character(0)))
})

test_that("is.empty of data.frame()) yields TRUE", {
  expect_true(is.empty(data.frame()))
})


test_that("is.empty of c(...) yields FALSE", {
  expect_false(is.empty(c(1)))
  expect_false(is.empty(c("1")))
})

test_that("is.empty of NA yields FALSE", {
  expect_false(is.empty(NA))
  expect_false(is.empty(c(NA)))
})
