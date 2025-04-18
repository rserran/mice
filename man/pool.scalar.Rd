% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pool.scalar.R
\name{pool.scalar}
\alias{pool.scalar}
\alias{pool.scalar.syn}
\title{Multiple imputation pooling: univariate version}
\usage{
pool.scalar(Q, U, n = Inf, k = 1, rule = c("rubin1987", "reiter2003"))

pool.scalar.syn(Q, U, n = Inf, k = 1, rule = "reiter2003")
}
\arguments{
\item{Q}{A vector of univariate estimates of \code{m} repeated complete data
analyses.}

\item{U}{A vector containing the corresponding \code{m} variances of the univariate
estimates.}

\item{n}{A number providing the sample size. If nothing is specified,
an infinite sample \code{n = Inf} is assumed.}

\item{k}{A number indicating the number of parameters to be estimated.
By default, \code{k = 1} is assumed.}

\item{rule}{A string indicating the pooling rule. Currently supported are
\code{"rubin1987"} (default, for missing data) and \code{"reiter2003"}
(for synthetic data created from a complete data set).}
}
\value{
Returns a list with components.
\describe{
\item{\code{m}:}{Number of imputations.}
\item{\code{qhat}:}{The \code{m} univariate estimates of repeated complete-data analyses.}
\item{\code{u}:}{The corresponding \code{m} variances of the univariate estimates.}
\item{\code{qbar}:}{The pooled univariate estimate, formula (3.1.2) Rubin (1987).}
\item{\code{ubar}:}{The mean of the variances (i.e. the pooled within-imputation variance),
formula (3.1.3) Rubin (1987).}
\item{\code{b}:}{The between-imputation variance, formula (3.1.4) Rubin (1987).}
\item{\code{t}:}{The total variance of the pooled estimated, formula (3.1.5)
Rubin (1987).}
\item{\code{r}:}{The relative increase in variance due to nonresponse, formula
(3.1.7) Rubin (1987).}
\item{\code{df}:}{The degrees of freedom for t reference distribution by the
method of Barnard-Rubin (1999).}
\item{\code{fmi}:}{The fraction missing information due to nonresponse,
formula (3.1.10) Rubin (1987). (Not defined for synthetic data.)}
}
}
\description{
Pools univariate estimates of m repeated complete data analysis
}
\details{
The function averages the univariate estimates of the complete data model,
computes the total variance over the repeated analyses, and computes the
relative increase in variance due to missing data or data synthesisation
and the fraction of missing information.
}
\examples{
# missing data imputation with with manual pooling
imp <- mice(nhanes, maxit = 2, m = 2, print = FALSE, seed = 18210)
fit <- with(data = imp, lm(bmi ~ age))

# manual pooling
summary(fit$analyses[[1]])
summary(fit$analyses[[2]])
pool.scalar(Q = c(-1.5457, -1.428), U = c(0.9723^2, 1.041^2), n = 25, k = 2)

# check: automatic pooling using broom
pool(fit)

# manual pooling for synthetic data created from complete data
imp <- mice(cars,
  maxit = 2, m = 2, print = FALSE, seed = 18210,
  where = matrix(TRUE, nrow(cars), ncol(cars))
)
fit <- with(data = imp, lm(speed ~ dist))

# manual pooling: extract Q and U
summary(fit$analyses[[1]])
summary(fit$analyses[[2]])
pool.scalar.syn(Q = c(0.12182, 0.13209), U = c(0.02121^2, 0.02516^2), n = 50, k = 2)

# check: automatic pooling using broom
pool.syn(fit)
}
\references{
Rubin, D.B. (1987). Multiple Imputation for Nonresponse in
Surveys.  New York: John Wiley and Sons.

Reiter, J.P. (2003). Inference for Partially Synthetic,
Public Use Microdata Sets. \emph{Survey Methodology}, \bold{29}, 181-189.
}
\seealso{
\code{\link{pool}}
}
\author{
Karin Groothuis-Oudshoorn and Stef van Buuren, 2009; Thom Volker, 2021
}
