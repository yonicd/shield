#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param dep PARAM_DESCRIPTION
#' @param pat PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname find_remote
#' @export
find_remote <- function(dep, pat = Sys.getenv('GITHUB_PAT')){

  repo_sha(find_repo(dep, pat))

}

#' @rdname find_remote
#' @export
#' @importFrom httr GET add_headers stop_for_status content
#' @importFrom base64enc base64decode
#' @importFrom stats setNames
find_repo <- function(dep, pat = Sys.getenv('GITHUB_PAT')){
  res_cran <- httr::GET(
    url = make_cran_uri(dep),
    httr::add_headers(
      Authorization = sprintf('token %s',pat)
    )
  )

  httr::stop_for_status(res_cran)
  desc_cran <- httr::content(res_cran)
  tf <- tempfile()
  on.exit(unlink(tf),add = TRUE)
  cat(rawToChar(base64enc::base64decode(desc_cran$content)),file = tf)

  repo <- parse_desc(tf)

  if(!length(repo))
    return(stats::setNames(NA_character_,dep))

  repo
}
