
make_cran_uri <- function(dep, endpoint = 'api.github.com'){
  sprintf('https://%s/repos/cran/%s/contents/DESCRIPTION',endpoint, dep)
}

make_gh_uri <- function(dep, endpoint = 'api.github.com'){
  sprintf('https://%s/repos/%s/commits/master',endpoint,dep)
}

