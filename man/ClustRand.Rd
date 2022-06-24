\name{ClustRand}
\alias{ClustRand}
\alias{ClustRandC}
\alias{ClustRandSingleCore}
\alias{ClustRandGLMEMR}
\alias{ClustRandGEEC}
\alias{ExportRandomClusterSize}
\title{
Simulation-based design of cluster-randomized trials
}
\description{
This function performs a simulation-based evaluation of operating characteristics for traditional cluster-randomized trials with normally distributed or binary endpoints. A two-arm clinical trial is assumed (treatment and control arms). For examples of the function call, see \link{ClustRandExample1} or \link{ClustRandExample2}.
}
\usage{
ClustRand(parameters)
}
\arguments{
  \item{parameters}{List of the trial design and other parameters. The required elements are defined below: 
  \itemize{
    \item \code{endpoint_type}{: Character value defining the primary endpoint's type. Possible values:  
     \itemize{
      \item \code{"Normal"}: Normally distributed endpoint.
      \item \code{"Binary"}: Binary endpoint.
    }
    }
    \item \code{direction}{: Character value defining the direction of favorable outcome. Possible values: \code{"Higher"} (a higher value of the endpoint indicates a more favorable outcome) and \code{"Lower"} (a lower value of the endpoint indicates a more favorable outcome).}    
    \item \code{sample_size}{: Integer vector with two elements defining the number of completers in the two trial arms (control and experimental treatment). Completers are defined as patients who complete the trial and are included in the final analysis. Each element must be positive.}
    \item \code{cluster_scheme}{: Character value defining the cluster scheme. Possible values:  
     \itemize{
      \item \code{"Fixed"}: Cluster sizes are pre-defined.
      \item \code{"Random"}: Cluster sizes are randomly generated.
    }
    }
    \item \code{control_cluster_size}{: Numeric vector defining the number of cluster sizes in the control arm. This parameter is required only if the cluster sizes are pre-defined (\code{cluster_scheme="Fixed"}).}
    \item \code{treatment_cluster_size}{: Numeric vector defining the number of cluster sizes in the treatment arm. This parameter is required only if the cluster sizes are pre-defined (\code{cluster_scheme="Fixed"}).}
    \item \code{n_clusters}{: Numeric vector with two elements defining the number of clusters in the two trial arms (control and experimental treatment). The minimum cluster size (5 patients per cluster) is required and, as a result, with random cluster sizes, the total sample size in a trial arm may exceed the target sample size if a large number of small clusters are generated. This parameter is required only if the cluster sizes are randomly generated (\code{cluster_scheme="Random"}).}
    \item \code{cluster_cv}{: Numeric value defining the coefficient of variation for the cluster size. This value must be between 0 and 0.5. This parameter is required only if the cluster sizes are randomly generated (\code{cluster_scheme="Random"}).}
    \item \code{control_mean}{: Numeric value defining the mean of the primary endpoint in the control arm. This parameter is required only with normally distributed endpoints (\code{endpoint_type="Normal"}).}
    \item \code{treatment_mean}{: Numeric value defining the mean of the primary endpoint in the experimental treatment arm. This parameter is required only with normally distributed endpoints.}
    \item \code{control_rate}{: Numeric value defining the proportion or response rate for the primary endpoint in the control arm. This value must be between 0 and 1. This parameter is required only with binary endpoints \cr (\code{endpoint_type="Binary"}).}
    \item \code{treatment_rate}{: Numeric value defining the proportion or response rate for the primary endpoint in the experimental treatment arm. This value must be between 0 and 1. This parameter is required only with binary endpoints.}
    \item \code{control_icc}{: Numeric value defining the intra-cluster correlation coefficient in the control arm. This value must be between 0 and 1.}
    \item \code{control_between_cluster_sd}{: Numeric value defining the between-cluster standard deviation in the control arm. This value must be positive.}
    \item \code{treatment_icc}{: Numeric value defining the intra-cluster correlation coefficient in the treatment arm. This value must be between 0 and 1.}
    \item \code{treatment_between_cluster_sd}{: Numeric value defining the between-cluster standard deviation in the treatment arm. This value must be positive.}
    \item{alpha}{: Numeric value defining the overall one-sided Type I error rate. The default value is 0.025.}
    \item \code{random_seed}{: Integer value defining the random number generator seed. The default value is 49283.}
    \item \code{nsims}{: Integer value defining the number of simulation runs.}
    \item \code{ncores}{: Integer value defining the number of cores for parallel calculations. The number of cores cannot exceed the maximum available number of cores. The default value is 1.} 
    }
  }
}
\value{
The function returns an object of class \samp{ClustRandResults}. This object is a list with the following components:
  \item{parameters}{List containing the user-specified parameters.}
  \item{sim_results}{Data frame containing key descriptive statistics for each simulation run.}
  \item{sim_summary}{List containing the key operating characteristics of the adaptive design.}
  A detailed summary of the simulation results can be created using the \code{\link{GenerateReport}} function.
}
\seealso{
  \code{\link{ClustRandApp}}
}
