#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param repo PARAM_DESCRIPTION
#' @param pat PARAM_DESCRIPTION, Default: Sys.getenv("GITHUB_PAT")
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname repo_sha
#' @export
#' @importFrom httr GET add_headers stop_for_status content
repo_sha <- function(repo, pat = Sys.getenv('GITHUB_PAT')){

  res_repo <- httr::GET(
    url = make_gh_uri(repo),
    httr::add_headers(
      Authorization = sprintf('token %s',pat)
      )
    )

  httr::stop_for_status(res_repo)

  ret <- httr::content(res_repo)$sha
  names(ret) <- repo
  ret

}
