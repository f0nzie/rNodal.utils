library(testthat)

context("get_list_examples")

test_that("application examples in rODE match", {
    # list all R scripts under inst/examples that end in "App"
    examples <- get_list_examples(aPackage = "rNodal.utils")
    # print(examples)

    expected <- c("example01App.R", "fexample02App.R")

    # expected <- c("AdaptiveStepApp.R", "ComparisonRK45App.R", "ComparisonRK45ODEApp.R",
    #               "FallingParticleODEApp.R", "KeplerApp.R", "KeplerDormandPrince45App.R",
    # "KeplerEnergyApp.R", "KeplerEulerApp.R", "LogisticApp.R", "PendulumApp.R",
    # "PendulumEulerApp.R", "PendulumRK4App.R", "PlanetApp.R", "ProjectileApp.R",
    # "ReactionApp.R", "RigidBodyNXFApp.R", "SHOApp.R", "SpringRK4App.R",
    # "VanderpolApp.R", "VanderpolMuTimeControlApp.R")
    #
    expect_equal(examples, expected)
})
