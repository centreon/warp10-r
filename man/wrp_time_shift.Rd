% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrp_time_shift.R
\name{wrp_time_shift}
\alias{wrp_time_shift}
\title{Time shift}
\usage{
wrp_time_shift(wrp_con, offset)
}
\arguments{
\item{wrp_con}{\link{wrp_connect} object.}

\item{offset}{Offset to apply to the ticks}
}
\description{
Shifts the ticks of Geo Time Series™ instances by a given amount.
}
\examples{

df <- data.frame(tick = 1:100, value = 1:100)
wrp_connect() \%>\%
  wrp_new_gts() \%>\%
  wrp_add_value_df(df) \%>\%
  wrp_time_shift(10) \%>\%
  wrp_exec()
}
\references{
\url{https://www.warp10.io/doc/TIMESHIFT}
}
\keyword{gts}
