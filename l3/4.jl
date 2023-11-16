# Maksymilian Neumann 2023
include("meth.jl")
using .Meth

f(x) = sin(x) - (x/2)^2
pf(x) = cos(x) - x/2

println(mbisekcji(f, 1.5, 2., .5*10^(-5), .5*10^(-5)))
println(mstycznych(f, pf, 1.5, .5*10^(-5), .5*10^(-5), 10^6))
println(msiecznych(f, 1., 2., .5*10^(-5), .5*10^(-5), 10^6))