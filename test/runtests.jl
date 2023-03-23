using ProximalGLM
using Test
using Documenter

@testset "ProximalGLM.jl" begin
    DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup, :(using ProximalGLM); recursive=true)
    doctest(ProximalGLM)
    include("barebones.jl")
end
