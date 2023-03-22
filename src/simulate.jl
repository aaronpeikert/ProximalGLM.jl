# n = 100
# k = 3
# β = [0.0,-0.5,0.5,0.0]
module Simulate
import ProximalGLM
import Random: GLOBAL_RNG, AbstractRNG
import Distributions

function dist(n, k, distribution, rng::AbstractRNG = GLOBAL_RNG)
    rand(rng, distribution, n, k)
end

function normal(n, k, args...)
    dist(n, k, Distributions.Normal(), args...)
end

function binary_prob(n, β, args...)
    k = length(β)
    X = normal(n, k, args...)
    X, ProximalGLM.sigmoid.(X * β)
end
function binary(py, rng::AbstractRNG = GLOBAL_RNG)
    [rand(rng, Distributions.Bernoulli(p), 1)[1] for p in py]
end
function binary(n, β, rng::AbstractRNG = GLOBAL_RNG, args...)
    X, py = binary_prob(n, β, rng, args...)
    y = binary(py)
    X, y
end

end