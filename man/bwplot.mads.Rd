% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bwplot.mads.R
\name{bwplot.mads}
\alias{bwplot.mads}
\title{Box-and-whisker plot of amputed and non-amputed data}
\usage{
\method{bwplot}{mads}(
  x,
  data,
  which.pat = NULL,
  standardized = TRUE,
  descriptives = TRUE,
  layout = NULL,
  ...
)
}
\arguments{
\item{x}{A \code{mads} (\code{\link{mads}}) object, typically created by
\code{\link{ampute}}.}

\item{data}{A string or vector of variable names that needs to be plotted. As
a default, all variables will be plotted.}

\item{which.pat}{A scalar or vector indicating which patterns need to be plotted.
As a default, all patterns are plotted.}

\item{standardized}{Logical. Whether the box-and-whisker plots need to be created
from standardized data or not. Default is TRUE.}

\item{descriptives}{Logical. Whether the mean, variance and n of the variables
need to be printed. This is useful to examine the effect of the amputation.
Default is TRUE.}

\item{layout}{A vector of two values indicating how the boxplots of one pattern
should be divided over the plot. For example, \code{c(2, 3)} indicates that the
boxplots of six variables need to be placed on 3 rows and 2 columns. Default
is 1 row and an amount of columns equal to #variables. Note that for more than
6 variables, multiple plots will be created automatically.}

\item{\dots}{Not used, but for consistency with generic}
}
\value{
A list containing the box-and-whisker plots. Note that a new pattern
will always be shown in a new plot.
}
\description{
Plotting method to investigate the relation between the data variables and
the amputed data. The function shows how the amputed values are related
to the variable values.
}
\note{
The \code{mads} object contains all the information you need to
make any desired plots. Check \code{\link{mads}} or the vignette \emph{Multivariate
Amputation using Ampute} to understand the contents of class object \code{mads}.
}
\seealso{
\code{\link{ampute}}, \code{\link[lattice]{bwplot}}, \code{\link{mads}}
}
\author{
Rianne Schouten, 2016
}
