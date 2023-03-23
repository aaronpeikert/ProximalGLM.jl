# you really should start with a clean wordir, and comit (or at least stash everything)
using ProximalGLM, Documenter
DocMeta.setdocmeta!(ProximalGLM, :DocTestSetup, :(using ProximalGLM); recursive=true)
doctest(ProximalGLM, fix=true)
