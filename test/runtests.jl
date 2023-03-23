using ProximalGLM
using Test
using Documenter

@testset "ProximalGLM.jl" begin
    DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup,
    :(
        using ProximalGLM;
        import Printf;
        Base.show(io::IO, f::Float64) = Printf.@printf(io, "%1.5f", f)
    );
    recursive=true)
    doctest(ProximalGLM)
    include("barebones.jl")
end
