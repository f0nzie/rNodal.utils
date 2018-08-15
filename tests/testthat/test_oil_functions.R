library(testthat)

context("Oil functions")

expect_equal(api_to_specific_gravity(40), 0.8250729)

expect_equal(specific_gravity_to_api(0.825), 40.01515, tolerance = 1e-6)

