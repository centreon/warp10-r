% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sanitize.R
\name{sanitize}
\alias{sanitize}
\alias{sanitize.numeric}
\alias{sanitize.list}
\alias{sanitize.Duration}
\alias{sanitize.POSIXct}
\alias{sanitize.Date}
\alias{sanitize.character}
\alias{sanitize.NULL}
\alias{sanitize.logical}
\alias{sanitize.data.frame}
\title{Sanitize}
\usage{
sanitize(x, ...)

\method{sanitize}{numeric}(x, ...)

\method{sanitize}{list}(x, ...)

\method{sanitize}{Duration}(x, ...)

\method{sanitize}{POSIXct}(x, return = "iso8601", ...)

\method{sanitize}{Date}(x, return = "iso8601", ...)

\method{sanitize}{character}(x, return = "iso8601", ...)

\method{sanitize}{`NULL`}(x, ...)

\method{sanitize}{logical}(x, ...)

\method{sanitize}{data.frame}(x, ...)
}
\arguments{
\item{x}{An object to be sanitized.}

\item{...}{Other parameters passed to method
All character strings starting with \verb{ws:} will be considered as valid warpscript.}

\item{return}{Type of object return, one of \code{iso8601} or \code{microsecond}.}
}
\description{
Sanitize values to be compatible with warpscript.
}
\examples{
sanitize(
  list(
    num = list(1:10),
    char = "test",
    duration = "3 days",
    date = "2020-01-01",
    boolean = "true",
    warpscript = "ws:NOW"
  )
)
}
