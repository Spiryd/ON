# Maksymilian Neumann 2023
include("meth.jl")
using .Meth

f(x) = 3*x
g(x) = exp(x)

y(x) = g(x) - f(x)

delta = 10^-4
epsilon = 10^-4

println("first:  ", mbisekcji(y, 0., 1., delta, epsilon))
println("second:     ", mbisekcji(y, 1., 4., delta, epsilon))
