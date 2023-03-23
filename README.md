
<!-- README.md is generated from docs/src/index.md. Please edit that file and rebuild with `cd docs/ && julia make_readme.jl`-->



<a id='ProximalGLM'></a>

<a id='ProximalGLM-1'></a>

# ProximalGLM


[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://aaronpeikert.github.io/ProximalGLM.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://aaronpeikert.github.io/ProximalGLM.jl/dev/) [![Build Status](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml?query=branch%3Amain)


To install `ProximalGLM.jl`:


```julia
import Pkg; Pkg.add("ProximalGLM")
```


```julia
using ProximalGLM
using DataFrames, StableRNGs
β = [0.5, 0, 0];
X, y = ProximalGLM.Simulate.binary(1000, β; rng = StableRNG(1));
data = hcat(DataFrame(y = y), DataFrame(X, :auto))
fit(ProximalLogistic, @formula(y ~ x1 + x2 + x3), data)
```


```
StatsModels.TableRegressionModel{Vector{Float64}, Matrix{Float64}}

y ~ 1 + x1 + x2 + x3

Coefficients:
[-0.03472809521371864, 0.4412037102346134, -0.021719496771036267, -0.05990555360436768]
```

- [`ProximalGLM.ProximalLogistic`](README.md#ProximalGLM.ProximalLogistic)

<a id='ProximalGLM.ProximalLogistic' href='#ProximalGLM.ProximalLogistic'>#</a>
**`ProximalGLM.ProximalLogistic`** &mdash; *Type*.



```julia
ProximalLogistic(X, y, β)
```

Fit a Logistic Regression using [`ProximalAlgorithms`](https://github.com/JuliaFirstOrder/ProximalAlgorithms.jl)

```julia-repl
# generate some data
julia> import StableRNGs

julia> X, y = ProximalGLM.Simulate.binary(1000, [0.5, 0, 0], rng = StableRNGs.StableRNG(1));

```

```julia-repl
julia> import ProximalOperators as PO

julia> penalty = PO.NormL1(1);

julia> start = zeros(size(X, 2));

julia> model = ProximalLogistic(X, y, start, penalty); # construct the model, not fitted yet

julia> fit(model) # fit a preconstructed model
([0.44086698254344586, -0.022944133242910912, -0.06161170925644434], 37)

julia> fit!(model) # fit and update parameters of preconstructed model
1339.421934824578

julia> model.β
3-element Vector{Float64}:
  0.44086698254344586
 -0.022944133242910912
 -0.06161170925644434
```


<a target='_blank' href='https://github.com/aaronpeikert/ProximalGLM.jl/blob/747d306843d616e330dde2dad4b15b5f5d02066e/src/logistic.jl#L1-L36' class='documenter-source'>source</a><br>

