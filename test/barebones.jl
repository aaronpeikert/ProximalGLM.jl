import ProximalOperators
import ProximalGLM as Pro
module Barebones
# load the super simple implementation
include("../src/barebones.jl")
end

@testset "Compare with Barebones implementation" begin
    β = [.3, .5, 0]
    X, y = Pro.Simulate.binary(100000, β)
    
    l1_bare = Barebones.pen_logreg(X, y)
    l1_prox = Pro.fit(Pro.ProximalLogistic(X, y, zero(β), ProximalOperators.NormL1(1)))
    @test isapprox(l1_bare[1], l1_prox[1], atol = .01)
end


