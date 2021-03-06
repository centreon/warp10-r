#' Coersce object to GTS tibbles
#'
#' @description
#'
#' `as_gts()` turns an existing object, such as a data frame into
#' an extended tibble with class `gts`, and attributes corresponding
#' to the GTS attributes + class.
#' A `GTS` object is basically a data frame with some information about the
#' timeserie.
#' The resulting tibble contains at least two columns: `timestamp` and `value`.
#'
#' `as_gts()` is an S3 generic.
#'
#' @inheritParams documentation
#' @param x An object that could reasoably be coerced to a gts tibble.
#' @param tz Time zone
#'
#'
#' @export
#'
#' @examples
#'
#' x <- data.frame(timestamp = 1:10, value = rnorm(10))
#' as_gts(x)
as_gts <- function(x, class = "", labels = list(), attributes = list(), tz = Sys.getenv("TZ", "UTC")) {
  x <- tibble::as_tibble(drop_na_col(x))

  if (nrow(x) > 0 && is.numeric(x[["timestamp"]]) && max(x[["timestamp"]]) > 1e6) {
    x[["timestamp"]] <- lubridate::as_datetime(x[["timestamp"]] / 1e6, tz = tz)
  } else if (lubridate::is.Date(x[["timestamp"]])) {
    x[["timestamp"]] <- lubridate::as_datetime(x[["timestamp"]])
    lubridate::tz(x[["timestamp"]]) <- tz
  }
  # When a GTS is retrieved from Warp10 database, the structure of a label is named list.
  # For consistency, if a gts object is built from a dataframe, the structure of labels must
  # also be a named list.
  if (length(labels) == 0) labels <- structure(list(), .Names = character(0))
  if (length(attributes) == 0) attributes <- structure(list(), .Names = character(0))
  new_attributes <- list(gts = list(class = class, labels = as.list(labels), attributes = as.list(attributes)))
  attributes(x)  <- c(attributes(x), new_attributes)
  class(x)       <- c("gts", class(x))
  x
}

#' @export
#'
as.data.frame.gts <- function(x, ...) {
  class(x) <- class(x)[!class(x) == "gts"]
  attr(x, "gts") <- NULL
  NextMethod()
}

#' @export
#'
as.list.gts <- function(x, ...) {
  class(x) <- class(x)[!class(x) == "gts"]
  attr(x, "gts") <- NULL
  NextMethod()
}
