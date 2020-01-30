#' @importFrom desc desc_get_urls desc_get
parse_desc <- function(file){

  # Try Issues URL
  desc_bugs <- clean_key(desc::desc_get(file = file, keys = 'BugReports'))
  uri <- grep_github(desc_bugs)

  # Try Remotes URL
  if(!length(uri)){

    desc_remotes <- desc::desc_get_urls(file = file)
    uri <- grep_github(desc_remotes)

  }

  uri
}

clean_key <- function(key){
  trimws(strsplit(key,',')[[1]])
}

grep_github <- function(x){
  gh_raw <- grep('github\\.com',x,value = TRUE)
  gh_prefix <- gsub('^http(.*?).com/','',gh_raw)
  gh_suffix <- gsub('issues\\/$|issues$','',gh_prefix)
  gh_suffix <- gsub('\\/$','',gh_suffix)
  gh_suffix
}

#' @importFrom utils installed.packages
base_packages <- function(){
  i <- utils::installed.packages()
  ret <- i[ i[,"Priority"] %in% c("base","recommended"), c("Package","Priority")]

  c('R',rownames(ret))
}
