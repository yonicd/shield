#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param path PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname create_map
#' @export
#' @importFrom desc desc_get desc_get_deps
create_map <- function(path = 'DESCRIPTION'){

  remote_repos <- clean_key(desc::desc_get(file = path,'Remotes'))
  rdeps <- basename(remote_repos)

  deps <- setdiff(desc::desc_get_deps(file = path)[,'package'],base_packages())

  not_remote_deps <- deps[!sapply(deps,function(x) x%in%rdeps)]

  x <- lapply(not_remote_deps,find_remote)

  if(!is.na(remote_repos)){
    y <- lapply(remote_repos,repo_sha)
    x <- append(x,y)
  }

  d <- data.frame(package = sapply(x,names),sha = as.character(x),stringsAsFactors = FALSE)

  d$type <- ifelse(!is.na(d$sha),'remotes','cran')
  d <- d[order(d$type,decreasing = TRUE),]
  d
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param obj PARAM_DESCRIPTION
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[remotes]{install_github}}, \code{\link[remotes]{install_cran}}
#' @rdname install_remotes
#' @export
#' @importFrom remotes install_github install_cran
install_remotes <- function(obj, ...){

  old_libpath <- .libPaths()
  on.exit(expr = {.libPaths(old_libpath)},add = TRUE)

  dots <- list(...)
  dots$upgrade <- TRUE

  if(!is.null(dots$lib))
    .libPaths(dots$lib)

  mapply(remotes::install_github,
         repo = obj$package[obj$type == 'remotes'],
         ref = obj$sha[obj$type == 'remotes'],
         MoreArgs = dots)

  remotes::install_cran(obj$package[obj$type == 'cran'],..., upgrade = TRUE)

}
