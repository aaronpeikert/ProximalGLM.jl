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