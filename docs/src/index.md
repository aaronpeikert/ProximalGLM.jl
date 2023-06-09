```@meta
CurrentModule = ProximalGLM
```

# ProximalGLM


[![Dev Documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://aaronpeikert.github.io/ProximalGLM.jl/dev/)
[![Build Status](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/aaronpeikert/ProximalGLM.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![codecov](https://codecov.io/github/aaronpeikert/ProximalGLM.jl/branch/main/graph/badge.svg?token=vaFzKCJIG7)](https://codecov.io/github/aaronpeikert/ProximalGLM.jl)

To install `ProximalGLM.jl`:

```julia
import Pkg; Pkg.add("ProximalGLM")
```

A simple example:

```@example
using ProximalGLM
using DataFrames, StableRNGs
β = [0.5, 0, 0];
X, y = ProximalGLM.Simulate.binary(1000, β; rng = StableRNG(1));
data = hcat(DataFrame(y = y), DataFrame(X, :auto))
fit(ProximalLogistic, @formula(y ~ x1 + x2 + x3), data)
```
