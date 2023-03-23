
<!-- README.md is generated from docs/src/index.md. Please edit that file and rebuild with `cd docs/ && julia make_readme.jl`-->



<a id='ProximalGLM'></a>

<a id='ProximalGLM-1'></a>

# ProximalGLM


[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://aaronpeikert.github.io/ProximalGLM.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://aaronpeikert.github.io/ProximalGLM.jl/dev/) [![Build Status](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml?query=branch%3Amain)


To install `ProximalGLM.jl`:


```julia
import Pkg; Pkg.add("ProximalGLM")
```


A simple example:


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
[-0.03473, 0.44120, -0.02172, -0.05991]
```

