library(testthat)

context("rNodal.utils constants")

expect_equal(rNodal.utils:::PRES.STD, 14.7)
expect_equal(rNodal.utils:::TEMP.STD, 60)
expect_equal(rNodal.utils:::TEMP.RANKINE, 460)


