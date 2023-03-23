# you really should start with a clean wordir, and comit (or at least stash everything)
using ProximalGLM, Documenter
DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup,
    :(
        using ProximalGLM;
        import Printf;
        Base.show(io::IO, f::Float64) = Printf.@printf(io, "%1.5f", f)
    );
    recursive=true)
doctest(ProximalGLM, fix=true)
