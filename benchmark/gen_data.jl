using ProximalGLM
import StableRNGs
X, y = ProximalGLM.Simulate.binary(1000, [.5, .0, .1]; rng = StableRNGs.StableRNG(1))
