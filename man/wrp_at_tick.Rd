% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrp_at_tick.R
\name{wrp_at_tick}
\alias{wrp_at_tick}
\title{At tick}
\usage{
wrp_at_tick(wrp_con, timestamp)
}
\arguments{
\item{wrp_con}{\link{wrp_connect} object.}

\item{timestamp}{Timestamp at which to take the data.}
}
\description{
The ATTICK function consumes a Geo Time Series™ from the stack, looks at its tick-th tick
(the data point with a timestamp tick) and put on the stack a list with the timestamp,
longitude, latitude, elevation and value for that data point.
}
\details{
If there is no data point with tick timestamp, it return a list with timestamp, longitude,
latitude and elevation at NaN and value at null.
}
\examples{

df <- data.frame(tick = seq(100, 1000, by = 100), value = 10:1)
wrp_connect() \%>\%
  wrp_new_gts() \%>\%
  wrp_add_value_df(df) \%>\%
  wrp_at_tick(400) \%>\%
  wrp_exec()
}
\references{
\url{https://www.warp10.io/doc/ATTICK}
}
\seealso{
\code{\link[=wrp_at_index]{wrp_at_index()}}]
}
