
<!-- README.md is generated from README.Rmd. Please edit that file -->

# warp10r

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

R client for executing WarpScript on a Warp 10 instance.

## Fork

The original package \[<https://github.com/senx/warp10-r>\] has been
forked to make the package more concilient with current developments of
R packages :

  - Package has been moved to the root of the git repository
  - Dependancies have been added to the DESCRIPTION
  - Construct a warp 10 script with helpers function and send them to
    Warp 10 database

## Installation

``` r
remotes::install_github("centreon/warp10-r")
```

## First steps

### Hello World

``` r
library(warp10r)
library(magrittr)

# Create a connection
con <- wrp_connect(endpoint = "https://warp.senx.io/api/v0/exec")

# set_script store a script in the connection object and print the script as it is.
set_script(con, "'Hello World' NOW")
#>  'Hello World' NOW

# Execute the script
wrp_exec(con)
#>  Status: 200
#> [1] "1570111243955306" "Hello World"
```

### Example with Geo Time Series

``` r
library(tibble)

df1 <- tibble(ds = 1:10, y = rnorm(10))
df2 <- tibble(ds = 2:11, y = rnorm(10))

con %>% 
  clear_script() %>% 
  wrp_new_gts() %>% 
  wrp_rename("randGTS") %>% 
  wrp_add_value_df(df1, tick = ds, value = y) %>% 
  wrp_new_gts() %>% 
  wrp_add_value_df(df2, tick = ds, value = y) %>% 
  wrp_rename("nogeoTS") %>% 
  wrp_exec()
#>  Status: 200
#> # A tibble: 2 x 5
#>   c       l        a           la v                 
#>   <chr>   <df[,0]> <df[,0]> <int> <list>            
#> 1 nogeoTS                       0 <dbl[,2] [10 × 2]>
#> 2 randGTS                       0 <dbl[,2] [10 × 2]>
```
