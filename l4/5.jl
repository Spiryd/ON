# Maksymilian Neumann 2023

include("interpol.jl")
using .Interpol
using Plots

# nasze funkcje
f(x) = exp(x)
g(x) = x^2 * sin(x)

# kożystamy z naszych implementacji
for n in [5, 10, 15]
    plot_f = rysujNnfx(f, 0., 1., n)
    plot_g = rysujNnfx(g, -1., 1., n)
    savefig(plot_f, "plots/z5f1_$n.png")
    savefig(plot_g, "plots/z5f2_$n.png")
end