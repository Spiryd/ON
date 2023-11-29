# Maksymilian Neumann 2023

include("interpol.jl")
using .Interpol
using Plots

f = x -> abs(x)
g = x -> 1/(1+x^2)
for n in [5, 10, 15]
    plot_f = rysujNnfx(f, -1., 1., n)
    plot_g = rysujNnfx(g, -5., 5., n)
    savefig(plot_f, "plots/z6f1_$n.png")
    savefig(plot_g, "plots/z6f2_$n.png")
end