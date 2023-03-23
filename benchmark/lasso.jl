using GLM
using Lasso
import ProximalOperators as PO
using BenchmarkTools
include("gen_data.jl")
fit(LassoPath, X, y, Binomial(), LogitLink(); λ = [0.1], α=1)
fit(ProximalLogistic, X, y, PO.NormL1(0.1))
b1 = @benchmark fit(LassoPath, X, y, Binomial(), LogitLink(); λ = [0.1], α=1)
b2 = @benchmark fit(ProximalLogistic, X, y, PO.NormL1(0.1))
b3 = @benchmark fit(ProximalLogistic, X, y, PO.NormL0(2))

judge(median(b2), median(b1))
judge(median(b3), median(b2))