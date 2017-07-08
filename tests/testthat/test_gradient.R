library(testthat)

context("test temperature gradient")

test_that("calc_temperature_gradient works", {
    res <- calc_temperature_gradient(bht = 200, wht = 60, depth.bh = 5000)
    expect_equal(res, 0.028)
})

test_that("calc_temperature_gradient stops if depth = 0", {
    expect_error(calc_temperature_gradient(bht = 200, wht = 60, depth.bh = 0))
})

test_that("calc_temperature_gradient stops if depth = 0", {
    expect_error(calc_temperature_gradient(bht = 200, wht = 60, depth.bh = 0))
})

test_that("calc_temperature_gradient warning if BHT=WHT", {
    expect_warning(calc_temperature_gradient(bht = 80, wht = 80, depth.bh = 5000))
})



