module ProximalGLM
import ProximalOperators, ProximalAlgorithms
import Distributions
import Random: GLOBAL_RNG, AbstractRNG
import StatsModels: fit, fit!, @formula, RegressionModel
# reexport
export  fit, fit!, @formula
# own
export ProximalLogistic
include("types.jl")
include("logistic.jl")
include("simulate.jl")
include("fit.jl")
end

#xz has been here pull request test
