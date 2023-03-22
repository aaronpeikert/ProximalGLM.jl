"""
    ProximalLogistic(X, y, β)

Fit a Logistic Regression using [`ProximalAlgorithms`](https://github.com/JuliaFirstOrder/ProximalAlgorithms.jl)

```jldoctest 1
# generate some data
import StableRNGs
X, y = ProximalGLM.Simulate.binary(1000, [0.5, 0, 0], rng = StableRNGs.StableRNG(1));
# most penalties come from
import ProximalOperators as PO

# output

```

```jldoctest 1
julia> penalty = PO.NormL1(1);
julia> start = zeros(size(X, 2));
julia> model = ProximalLogistic(X, y, start, penalty); # construct the model, not fitted yet
julia> fit(model) # fit a preconstructed model
([0.5311722129202233, 0.12916070493396065, 0.13159411511751348], 41)
julia> fit!(model) # fit and update parameters of preconstructed model
1313.2748302947948
julia> model.β
3-element Vector{Float64}:
 0.5311722129202233
 0.12916070493396065
 0.13159411511751348
```

"""
struct ProximalLogistic{T1, T2, T3, T4} <: ProximalModel
    X::T1
    y::T2
    β::T3
    penalty::T4
end

sigmoid(x::Number) = one(x) / (one(x) + exp(-x))

function predict(model::ProximalLogistic, β = model.β, X = model.X)
    sigmoid.(X * β)
end

function loglik(model::ProximalLogistic, β = model.β, X = model.X)
    ŷ = predict(model, β, X)
    y = model.y
    positiv_sum = sum(y .* log.(ŷ))
    negativ_sum = sum((1.0 .- y) .* log.(1.0 .- ŷ))
    -2(positiv_sum + negativ_sum)
end

function updateβ!(model::ProximalModel, β)
    model.β .= β
    loglik(model)
end