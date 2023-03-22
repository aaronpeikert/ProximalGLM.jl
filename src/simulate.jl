# n = 100
# k = 3
# β = [0.0,-0.5,0.5,0.0]
module Simulate
import ProximalGLM
import Random: GLOBAL_RNG, AbstractRNG
import Distributions

function dist(n, k, distribution::Distributions.Sampleable; rng::AbstractRNG = GLOBAL_RNG)
    rand(rng, distribution, n, k)
end

function binary_prob(X::AbstractArray, β::AbstractVector)
    ProximalGLM.sigmoid.(X * β)
end

function binary_prob(n::Int, β::AbstractVector, distribution::Distributions.Sampleable = Distributions.Normal(); args...)
    k = length(β)
    X = dist(n, k, distribution; args...)
    X, binary_prob(X, β)
end
function binary(py; rng::AbstractRNG = GLOBAL_RNG)
    [rand(rng, Distributions.Bernoulli(p), 1)[1] for p in py]
end
function binary(n::Int, β::AbstractVector; rng::AbstractRNG = GLOBAL_RNG, args...)
    X, py = binary_prob(n, β; rng = rng, args...)
    y = binary(py)
    X, y
end

end