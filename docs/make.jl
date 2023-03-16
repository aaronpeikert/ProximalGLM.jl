using ProximalGLM
using Documenter

DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup, :(using ProximalGLM); recursive=true)

makedocs(;
    modules=[ProximalGLM],
    authors="Aaron Peikert",
    repo="https://github.com/aaronpeikert/ProximalGLM.jl/blob/{commit}{path}#{line}",
    sitename="ProximalGLM.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://aaronpeikert.github.io/ProximalGLM.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/aaronpeikert/ProximalGLM.jl",
    devbranch="main",
)
