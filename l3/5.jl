# Maksymilian Neumann 2023
include("meth.jl")
using .Meth
# fukcje króeych przecięcia szuakamny
f(x) = 3*x
g(x) = exp(x)

# odejmujemy je od siebie bo na przecięciach będą równe 0
y(x) = g(x) - f(x)

# nasza precyzja
delta = 10^-4
epsilon = 10^-4

# znajdujemy pierwsze przecięcie
println("first:  ", mbisekcji(y, 0., 1., delta, epsilon))
# znajdujemy drugie przecięcie
println("second: ", mbisekcji(y, 1., 4., delta, epsilon))
