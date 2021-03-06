#' Estimate Lun simulation parameters
#'
#' Estimate simulation parameters for the Lun simulation from a real dataset.
#'
#' @param counts either a counts matrix or an SCESet object containing count
#'        data to estimate parameters from.
#' @param params LunParams object to store estimated values in.
#'
#' @details
#' The \code{nGenes} and \code{nCells} parameters are taken from the size of the
#' input data. No other parameters are estimated. See \code{\link{LunParams}}
#' for more details on the parameters.
#'
#' @return LunParams object containing the estimated parameters.
#'
#' @examples
#' data("sc_example_counts")
#' params <- lunEstimate(sc_example_counts)
#' params
#' @export
lunEstimate <- function(counts, params = newLunParams()) {
    UseMethod("lunEstimate")
}

#' @rdname lunEstimate
#' @export
lunEstimate.SCESet <- function(counts, params = newLunParams()) {
    counts <- scater::counts(counts)
    lunEstimate(counts, params)
}

#' @rdname lunEstimate
#' @export
lunEstimate.matrix <- function(counts, params = newLunParams()) {

    checkmate::assertClass(params, "LunParams")

    params <- setParams(params, nGenes = nrow(counts),
                        groupCells = ncol(counts))

    return(params)
}