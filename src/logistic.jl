"""
    ProximalLogistic(X, y, β)

Fit a Logistic Regression using [`ProximalAlgorithms`](https://github.com/JuliaFirstOrder/ProximalAlgorithms.jl)

```jldoctest 1
# generate some data
julia> import StableRNGs

julia> X, y = ProximalGLM.Simulate.binary(1000, [0.5, 0, 0], rng = StableRNGs.StableRNG(1));


```

```jldoctest 1
julia> import ProximalOperators as PO

julia> penalty = PO.NormL1(1);

julia> start = zeros(size(X, 2));


julia> model = ProximalLogistic(X, y, start, penalty); # construct the model, not fitted yet


julia> fit(model) # fit a preconstructed model
([0.44087, -0.02294, -0.06161], 37)

julia> fit!(model) # fit and update parameters of preconstructed model
1339.42193

julia> model.β
3-element Vector{Float64}:
  0.44087
 -0.02294
 -0.06161
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