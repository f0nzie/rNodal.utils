
<!-- README.md is generated from README.Rmd. Please edit that file -->
rNodal.utils
============

The goal of rNodal.utils is to provide base functions for all rNodal.\* packages.

Installation
------------

You can install rNodal.utils from github with:

``` r
# install.packages("devtools")
devtools::install_github("f0nzie/rNodal.utils")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(rNodal.utils)

## temperature gradient

calc_temperature_gradient(bht = 200, wht = 80, depth.bh = 5000)
#> [1] 0.024
```

``` r
# convert API to specific gravity
api_to_specific_gravity(api = 40)
#> [1] 0.8250729
```

``` r
# named list of objects
temp.gradient <- calc_temperature_gradient(bht = 240, wht = 95, depth.bh = 9000)
oil.sg <- api_to_specific_gravity(api = 35)

rNodal.utils:::as_named_list(temp.gradient, oil.sg)
#> $temp.gradient
#> [1] 0.01611111
#> 
#> $oil.sg
#> [1] 0.8498498
```
