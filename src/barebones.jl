# this is a "vanilla" implementation without any overhead
# it works, but is kept purposfully simple
# it is not part of the namespace/module of the package

import ProximalAlgorithms, ProximalOperators

sigmoid(x::Number) = one(x) / (one(x) + exp(-x))
function loglik(ŷ, y)
    positiv_sum = sum(y .* log.(ŷ))
    negativ_sum = sum((1.0 .- y) .* log.(1.0 .- ŷ))
    -2(positiv_sum + negativ_sum)
end

function loglik(x, y, β)
    ŷ = sigmoid.(x * β)
    loglik(ŷ, y)
end

function pen_logreg(x, y; start = ones(size(x, 2)), method = ProximalAlgorithms.FastForwardBackward(), pen = ProximalOperators.NormL1(1), args...)
    loss(β) = loglik(x, y, β)
    method(x0=start, f=loss, g=pen, args...)
end