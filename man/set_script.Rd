% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set.R
\name{set_script}
\alias{set_script}
\title{Set Script}
\usage{
set_script(wrp_con, script = "", consume = NULL, add = "auto")
}
\arguments{
\item{wrp_con}{\link{wrp_connect} object.}

\item{script}{A script to be set as a string.}

\item{consume}{What object(s) the warpscript is consuming from the stack.}

\item{add}{What object the warpscript is returning in the stack. If NULL,
consuming object is automatically determined by the object.}
}
\description{
Add command to a Warp 10 script.
}
\examples{
wrp_connect() \%>\%
  set_script(list(a = 1)) \%>\%
  set_script("toto")

}
