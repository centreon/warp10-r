#' Rename
#'
#' The RENAME function changes the name of a Geo Time Series™, an Encoder or a list thereof.
#' This operation may be required prior to using some functions.
#' If the name starts with '+', the specified name will be appended to the current name of the GTS or Encoder.
#'
#' If you want to rename a Geo Time Series or an Encoder so its name starts with a '+',
#' you must first set its name to the empty string then use rename with the desired name prefixed with an additional '+'.
#'
#' @inheritParams documentation
#'
#' @param name New name to give to the GTS.
#'
#' @examples
#' \dontrun{
#'   con <- wrp_connect()
#'   con %>%
#'     clear_script() %>%
#'     wrp_newgts() %>%
#'     wrp_rename("foo") %>%
#'     wrp_rename("+bar") %>%
#'     wrp_exec()
#'
#'   con %>%
#'     clear_script() %>%
#'     wrp_newgts() %>%
#'     wrp_rename("foo") %>%
#'     wrp_rename("") %>%
#'     wrp_rename("++bar") %>%
#'     wrp_exec()
#' }
#'
#' @export
#'
wrp_rename <- function(wrp_con, name) {
  script <- glue::glue("'{name}' RENAME")
  wrp_con$set_script(script)
}