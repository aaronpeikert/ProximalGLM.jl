using ProximalGLM
using Documenter

on_ci() = get(ENV, "CI", nothing) == "true"

DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup,
    :(
        using ProximalGLM;
        import Printf;
        Base.show(io::IO, f::Float64) = Printf.@printf(io, "%1.5f", f)
    );
    recursive=true)

makedocs(;
    modules=[ProximalGLM],
    authors="Aaron Peikert",
    repo="https://github.com/aaronpeikert/ProximalGLM.jl/blob/{commit}{path}#{line}",
    sitename="ProximalGLM.jl",
    format=Documenter.HTML(;
        prettyurls=on_ci(),
        canonical="https://aaronpeikert.github.io/ProximalGLM.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
    doctest = false, # replace true with :fix to fix doctest
)

on_ci() && deploydocs(;
    repo="github.com/aaronpeikert/ProximalGLM.jl",
    devbranch="main",
)

!on_ci() && include("make_readme.jl")
