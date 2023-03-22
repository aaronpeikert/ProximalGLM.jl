function fit(::Type{R}, X::AbstractMatrix{T}, y, pen = ProximalOperators.NormL1(1.0)) where {R<:ProximalLogistic,T<:AbstractFloat}
    fit(ProximalLogistic(X, y, zeros(size(X, 2)), pen))[1]
end

function fit(model::ProximalLogistic)
    ffb = ProximalAlgorithms.FastForwardBackward()
    ffb(x0=model.β, f=β->loglik(model, β), g=model.penalty)
end

function fit!(model::ProximalLogistic)
    β, iter = fit(model)
    updateβ!(model, β)
end