\name{ADSSMod}
\alias{ADSSMod}
\alias{ADSSModC}
\alias{ADSSModSingleCore}
\title{
Simulation-based design of adaptive trials with data-driven sample size or event count re-estimation
}
\description{
This function performs a simulation-based evaluation of operating characteristics for adaptive trials with data-driven sample size re-estimation (normally distributed or binary endpoints) or event count re-estimation (time-to-event endpoint). A two-arm Phase III clinical trial with two interim analyses is assumed. The first interim analysis supports early stopping for futility and the second interim analysis supports an option to increase the number of patients or number of events in the trial. For examples of the function call, see \link{ADSSModExample1}, \link{ADSSModExample2} or \link{ADSSModExample3}.
}
\usage{
ADSSMod(parameters)
}
\arguments{
  \item{parameters}{List of the trial design and other parameters. The required elements are defined below: 
  \itemize{
    \item \code{endpoint_type}{: Character value defining the primary endpoint's type. Possible values:  
     \itemize{
      \item \code{"Normal"}: Normally distributed endpoint.
      \item \code{"Binary"}: Binary endpoint.
      \item \code{"Time-to-event"}: Time-to-event endpoint.
    }
    }
    \item \code{direction}{: Character value defining the direction of favorable outcome. Possible values: \code{"Higher"} (a higher value of the endpoint indicates a more favorable outcome) and \code{"Lower"} (a lower value of the endpoint indicates a more favorable outcome).}    
    \item \code{sample_size}{: Integer vector with two elements defining the number of enrolled patients in the two trial arms (control and experimental treatment). Each element must be positive.}
    \item \code{control_mean}{: Numeric value defining the mean of the primary endpoint in the control arm. This parameter is required only with normally distributed endpoints (\code{endpoint_type="Normal"}).}
    \item \code{control_sd}{: Numeric value defining the standard deviation of the primary endpoint in the control arm. This value must be positive. This parameter is required only with normally distributed endpoints.}
    \item \code{treatment_mean}{: Numeric value defining the mean of the primary endpoint in the experimental treatment arm. This parameter is required only with normally distributed endpoints.}
    \item \code{treatment_sd}{: Numeric value defining the standard deviation of the primary endpoint in the experimental treatment arm. This value must be positive. This parameter is required only with normally distributed endpoints.}
    \item \code{control_rate}{: Numeric value defining the proportion or response rate for the primary endpoint in the control arm. This value must be between 0 and 1. This parameter is required only with binary endpoints \cr (\code{endpoint_type="Binary"}).}
    \item \code{treatment_rate}{: Numeric value defining the proportion or response rate for the primary endpoint in the experimental treatment arm. This value must be between 0 and 1. This parameter is required only with binary endpoints.}
    \item \code{control_time}{: Numeric value defining the median time, e.g., the median survival time, for the exponentially distributed primary endpoint in the control arm. This value must be positive. This parameter is required only with time-to-event endpoints (\code{endpoint_type="Time-to-event"}).}
    \item \code{treatment_time}{: Numeric value defining the median time, e.g., the median survival time, for the exponentially distributed primary endpoint in the experimental treatment arm. This value must be positive. This parameter is required only with time-to-event endpoints.}
    \item \code{info_frac}{: Numeric vector with four elements defining the information fractions at the first interim analysis, at the second interim analysis, at the final analysis before sample size/event count adjustment and at the final analysis after sample size/event count adjustment adjustment. The first and second elements must be between 0 and 1, the third element must be 1 and the fourth element must be greater than 1.}
    \item \code{event_count}{: Numeric value defining the total number of events at the final analysis before event count adjustment. This value must be positive. This parameter is required only with time-to-event endpoints.}
    \item \code{futility_threshold}{: Numeric value defining the futility threshold for conditional power at the first interim analysis. This value must be positive.}
    \item \code{promising_interval}{: Numeric vector with two elements defining the promising interval for conditional power at the second interim analysis. Each element must be between 0 and 1.}
    \item \code{target_power}{: Numeric value defining the target conditional power for increasing the number of patients or events at the second interim analysis. This value must be between 0 and 1.}
    \item \code{dropout_rate}{: Numeric value defining the patient dropout rate. With normally distributed endpoints and binary endpoints, a uniform patient dropout process is assumed and thus this parameter defines the fraction of patients that will be excluded from the interim and final analyses. With time-to-event endpoints, the time to patient dropout is assumed to follow an exponential distribution and this parameter defines the annual dropout rate. This value must be between 0 and 1.}
    \item \code{enrollment_period}{: Numeric value defining the length of the patient enrollment period. This value must be positive. This parameter is required only with time-to-event endpoints.}
    \item \code{enrollment_parameter}{: Numeric value defining the median enrollment time. The patient enrollment process is assumed to be governed by a truncated exponential distribution and this parameter defines the time point by which 50\% of the patients are enrolled into the trial. This value must be between 0 and the length of the patient enrollment period. This parameter is required only with time-to-event endpoints.}.
    \item{alpha}{: Numeric value defining the overall one-sided Type I error rate. The default value is 0.025.}
    \item \code{random_seed}{: Integer value defining the random number generator seed. The default value is 49283.}
    \item \code{nsims}{: Integer value defining the number of simulation runs.}
    \item \code{ncores}{: Integer value defining the number of cores for parallel calculations. The number of cores cannot exceed the maximum available number of cores. The default value is 1.} 
    }
  }
}
\value{
The function returns an object of class \samp{ADSSModResults}. This object is a list with the following components:
  \item{parameters}{List containing the user-specified parameters.}
  \item{sim_results}{Data frame containing key descriptive statistics for each simulation run.}
  \item{sim_summary}{List containing the key operating characteristics of the adaptive design.}
  A detailed summary of the simulation results can be created using the \code{\link{GenerateReport}} function.
}
\seealso{
  \code{\link{ADSSModApp}}
}
