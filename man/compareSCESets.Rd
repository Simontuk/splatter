% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare.R
\name{compareSCESets}
\alias{compareSCESets}
\title{Compare SCESet objects}
\usage{
compareSCESets(sces)
}
\arguments{
\item{sces}{named list of SCESet objects to combine and compare.}
}
\value{
List containing the combined datasets and plots.
}
\description{
Combine the data from several SCESet objects and produce some basic plots
comparing.
}
\details{
The return list has three items:

\describe{
  \item{\code{FeatureData}}{Combined feature data from the provided SCESets.}
  \item{\code{PhenoData}}{Combined pheno data from the provided SCESets.}
  \item{\code{Plots}}{Comparison plots
    \describe{
      \item{\code{Means}}{Violin plot of mean distribution.}
      \item{\code{Variances}}{Violin plot of variance distribution.}
      \item{\code{MeanVar}}{Scatter plot with fitted lines showing the
      mean-variance relationship.}
      \item{\code{LibraySizes}}{Boxplot of the library size distribution.}
      \item{\code{ZerosGene}}{Boxplot of the percentage of each gene that is
      zero.}
      \item{\code{ZerosCell}}{Boxplot of the percentage of each cell that is
      zero.}
    }
  }
}

The plots returned by this function are created using
\code{\link[ggplot2]{ggplot}} and are only a sample of the kind of plots you
might like to consider. The data used to create these plots is also returned
and should be in the correct format to allow you to create further plots
using \code{\link[ggplot2]{ggplot}}.
}
\examples{
sim1 <- splatSimulate(nGenes = 1000, groupCells = 20)
sim2 <- simpleSimulate(nGenes = 1000, nCells = 20)
comparison <- compareSCESets(list(Splat = sim1, Simple = sim2))
names(comparison)
names(comparison$Plots)
}
