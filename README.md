
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shield

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of shield is to create a simple workflow to install package
first level dependencies exclusively from github remote repositories
when available.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("yonicd/shield")
```

## Example

``` r
library(shield)
library(details)
```

Map the dependencies to the github remote repositories and the current
master sha

``` r
desc_map <- create_map('DESCRIPTION')
```

``` r
desc_map
#>             package                                      sha    type
#> 1        r-lib/httr 844c8c75e25eaf1e385810b6ede4aa56b70493f8 remotes
#> 3        r-lib/desc 61205f60616a90d2a9fba8241c81870ac27f3d5c remotes
#> 4     r-lib/remotes 8d8d545cb6a1725bd943522cb953c5c2755c2cf4 remotes
#> 5       yihui/knitr ab191b07223a609e7c4ba53d664d35ebfc9dcb97 remotes
#> 6 rstudio/rmarkdown 18ba267c6a0b9789c680a5b6135db910dd937e47 remotes
#> 2         base64enc                                     <NA>    cran
```

Create a temp libpath to install to

``` r
test_lib <- file.path(tempdir(),'mylib')
dir.create(test_lib)
```

Install the dependencies

``` r
install_remotes(obj = desc_map,lib = test_lib)
```

<details>

<summary>Click To See Console
    Output</summary>

    #> Downloading GitHub repo r-lib/httr@844c8c75e25eaf1e385810b6ede4aa56b70493f8
    #> 
    #>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473aaf121e7/r-lib-httr-844c8c7/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473aaf121e7/r-lib-httr-844c8c7/DESCRIPTION’
    #>   ─  preparing ‘httr’:
    #>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
    #>   ─  checking for LF line-endings in source and make files and shell scripts
    #>   ─  checking for empty or unneeded directories
    #>   ─  building ‘httr_1.4.1.9000.tar.gz’
    #>      
    #> 
    #> Skipping install of 'desc' from a github remote, the SHA1 (61205f60) has not changed since last install.
    #>   Use `force = TRUE` to force installation
    #> Downloading GitHub repo r-lib/remotes@8d8d545cb6a1725bd943522cb953c5c2755c2cf4
    #>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a5059869f/r-lib-remotes-8d8d545/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a5059869f/r-lib-remotes-8d8d545/DESCRIPTION’
    #>   ─  preparing ‘remotes’:
    #>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
    #>   ─  checking for LF line-endings in source and make files and shell scripts
    #>   ─  checking for empty or unneeded directories
    #>   ─  building ‘remotes_2.1.0.9000.tar.gz’
    #>      
    #> 
    #> Adding 'remotes_2.1.0.9000.tgz' to the cache
    #> Downloading GitHub repo yihui/knitr@ab191b07223a609e7c4ba53d664d35ebfc9dcb97
    #> xfun    (0.10         -> 0.12        ) [CRAN]
    #> glue    (b9ffe6cda... -> 3dd3d4e91...) [GitHub]
    #> stringi (1.4.3        -> 1.4.5       ) [CRAN]
    #> Installing 2 packages: xfun, stringi
    #> Installing packages into '/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/mylib'
    #> (as 'lib' is unspecified)
    #> 
    #> The downloaded binary packages are in
    #>  /var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T//RtmpezYWhD/downloaded_packages
    #> Downloading GitHub repo tidyverse/glue@master
    #>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a4b75dcff/tidyverse-glue-3dd3d4e/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a4b75dcff/tidyverse-glue-3dd3d4e/DESCRIPTION’
    #>   ─  preparing ‘glue’:
    #>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
    #>   ─  cleaning src
    #>   ─  checking for LF line-endings in source and make files and shell scripts
    #>   ─  checking for empty or unneeded directories
    #>   ─  building ‘glue_1.3.1.9000.tar.gz’
    #>      
    #> 
    #> Installing package into '/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/mylib'
    #> (as 'lib' is unspecified)
    #> Adding 'glue_1.3.1.9000.tgz' to the cache
    #>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473ae546cef/yihui-knitr-ab191b0/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473ae546cef/yihui-knitr-ab191b0/DESCRIPTION’
    #>   ─  preparing ‘knitr’:
    #>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
    #>   ─  checking for LF line-endings in source and make files and shell scripts
    #>   ─  checking for empty or unneeded directories
    #>   ─  building ‘knitr_1.27.2.tar.gz’
    #>      
    #> 
    #> Downloading GitHub repo rstudio/rmarkdown@18ba267c6a0b9789c680a5b6135db910dd937e47
    #> tinytex (0.15  -> 0.19 ) [CRAN]
    #> rlang   (0.4.2 -> 0.4.4) [CRAN]
    #> Installing 2 packages: tinytex, rlang
    #> Installing packages into '/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/mylib'
    #> (as 'lib' is unspecified)
    #> 
    #> The downloaded binary packages are in
    #>  /var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T//RtmpezYWhD/downloaded_packages
    #>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a33905f08/rstudio-rmarkdown-18ba267/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/remotes473a33905f08/rstudio-rmarkdown-18ba267/DESCRIPTION’
    #>   ─  preparing ‘rmarkdown’:
    #>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
    #>   ─  checking for LF line-endings in source and make files and shell scripts
    #>   ─  checking for empty or unneeded directories
    #>      Removed empty directory ‘rmarkdown/tools’
    #>   ─  building ‘rmarkdown_2.1.1.tar.gz’
    #>      
    #> 
    #> Adding 'rmarkdown_2.1.1.tgz' to the cache
    #> Skipping install of 'base64enc' from a cran remote, the SHA1 (0.1-3) has not changed since last install.
    #>   Use `force = TRUE` to force installation

</details>

<br>

Install the package

``` r
remotes::install_local(lib = test_lib,force = TRUE, upgrade = TRUE)
#> 
#>      checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/file473a5e861a3f/shield/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/file473a5e861a3f/shield/DESCRIPTION’
#>   ─  preparing ‘shield’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘shield_0.0.1.tar.gz’
#>      
#> 
#> Adding 'shield_0.0.1.tgz' to the cache
```

Check to see that everything was installed

``` r
list.files(test_lib)
#>  [1] "glue"      "httr"      "knitr"     "remotes"   "rlang"    
#>  [6] "rmarkdown" "shield"    "stringi"   "tinytex"   "xfun"
```

Check session\_info of the default current libpath

``` details
sessioninfo::package_info(list.files(test_lib))
```

<details closed>

``` r

 package    * version    date       lib source                         
 askpass      1.1        2019-01-13 [1] CRAN (R 3.6.0)                 
 assertthat   0.2.1      2019-03-21 [1] CRAN (R 3.6.0)                 
 backports    1.1.5      2019-10-02 [1] CRAN (R 3.6.0)                 
 base64enc    0.1-3      2015-07-28 [1] CRAN (R 3.6.0)                 
 crayon       1.3.4      2017-09-16 [1] CRAN (R 3.6.0)                 
 curl         4.3        2019-12-02 [1] CRAN (R 3.6.0)                 
 desc         1.2.0      2019-12-01 [1] Github (r-lib/desc@61205f6)    
 digest       0.6.23     2019-11-23 [1] CRAN (R 3.6.0)                 
 evaluate     0.14       2019-05-28 [1] CRAN (R 3.6.0)                 
 glue         1.3.1.9000 2020-01-07 [1] Github (tidyverse/glue@b9ffe6c)
 highr        0.8        2019-03-20 [1] CRAN (R 3.6.0)                 
 htmltools    0.4.0      2019-10-04 [1] CRAN (R 3.6.0)                 
 httr         1.4.1      2019-08-05 [1] CRAN (R 3.6.0)                 
 jsonlite     1.6        2018-12-07 [1] CRAN (R 3.6.0)                 
 knitr        1.25       2019-09-18 [1] CRAN (R 3.6.0)                 
 magrittr     1.5        2014-11-22 [1] CRAN (R 3.6.0)                 
 markdown     1.1        2019-08-07 [1] CRAN (R 3.6.0)                 
 mime         0.8        2019-12-19 [1] CRAN (R 3.6.0)                 
 openssl      1.4.1      2019-07-18 [1] CRAN (R 3.6.0)                 
 R6           2.4.1      2019-11-12 [1] CRAN (R 3.6.0)                 
 Rcpp         1.0.3      2019-11-08 [1] CRAN (R 3.6.1)                 
 remotes      2.1.0      2019-06-24 [1] CRAN (R 3.6.0)                 
 rlang        0.4.2      2019-11-23 [1] CRAN (R 3.6.0)                 
 rmarkdown    2.0        2019-12-12 [1] CRAN (R 3.6.0)                 
 rprojroot    1.3-2      2018-01-03 [1] CRAN (R 3.6.0)                 
 shield     * 0.0.1      2020-01-30 [1] local                          
 stringi      1.4.3      2019-03-12 [1] CRAN (R 3.6.0)                 
 stringr      1.4.0      2019-02-10 [1] CRAN (R 3.6.0)                 
 sys          3.3        2019-08-21 [1] CRAN (R 3.6.1)                 
 tinytex      0.15       2019-08-07 [1] CRAN (R 3.6.0)                 
 xfun         0.10       2019-10-01 [1] CRAN (R 3.6.0)                 
 yaml         2.2.0      2018-07-25 [1] CRAN (R 3.6.0)                 

[1] /Library/Frameworks/R.framework/Versions/3.6/Resources/library
```

</details>

<br>

Check session\_info of the temp
libpath

``` details
withr::with_libpaths(test_lib,sessioninfo::package_info(list.files(test_lib)))
```

<details closed>

``` r

 ! package    * version    date       lib
   askpass      1.1        2019-01-13 [2]
   assertthat   0.2.1      2019-03-21 [2]
   backports    1.1.5      2019-10-02 [2]
   base64enc    0.1-3      2015-07-28 [2]
   crayon       1.3.4      2017-09-16 [2]
   curl         4.3        2019-12-02 [2]
   desc         1.2.0      2019-12-01 [2]
   digest       0.6.23     2019-11-23 [2]
   evaluate     0.14       2019-05-28 [2]
 P glue         1.3.1.9000 2020-01-30 [2]
   highr        0.8        2019-03-20 [2]
   htmltools    0.4.0      2019-10-04 [2]
 P httr         1.4.1      2020-01-30 [2]
   jsonlite     1.6        2018-12-07 [2]
 P knitr        1.25       2020-01-30 [2]
   magrittr     1.5        2014-11-22 [2]
   markdown     1.1        2019-08-07 [2]
   mime         0.8        2019-12-19 [2]
   openssl      1.4.1      2019-07-18 [2]
   R6           2.4.1      2019-11-12 [2]
   Rcpp         1.0.3      2019-11-08 [2]
 P remotes      2.1.0      2020-01-30 [2]
 P rlang        0.4.2      2020-01-28 [2]
 P rmarkdown    2.0        2020-01-30 [2]
   rprojroot    1.3-2      2018-01-03 [2]
 P shield     * 0.0.1      2020-01-30 [2]
 P stringi      1.4.3      2020-01-11 [2]
   stringr      1.4.0      2019-02-10 [2]
   sys          3.3        2019-08-21 [2]
   tinytex      0.19       2020-01-14 [1]
 P xfun         0.10       2020-01-13 [2]
   yaml         2.2.0      2018-07-25 [2]
 source                            
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 Github (r-lib/desc@61205f6)       
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 Github (tidyverse/glue@3dd3d4e)   
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 Github (r-lib/httr@844c8c7)       
 CRAN (R 3.6.0)                    
 Github (yihui/knitr@ab191b0)      
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.1)                    
 Github (r-lib/remotes@8d8d545)    
 CRAN (R 3.6.1)                    
 Github (rstudio/rmarkdown@18ba267)
 CRAN (R 3.6.0)                    
 local                             
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.1)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    
 CRAN (R 3.6.0)                    

[1] /private/var/folders/kx/t4h_mm1910sb7vhm_gnfnx2c0000gn/T/RtmpezYWhD/mylib
[2] /Library/Frameworks/R.framework/Versions/3.6/Resources/library

 P ── Loaded and on-disk path mismatch.
```

</details>

<br>
