# Maksymilian Neumann 2023
include("1.jl")
include("2.jl")
include("3.jl")

f(x) = sin(x) - (x/2)^2
pf(x) = cos(x) - x/2

println(mbisekcji(f, 1.5, 2., .5*10^(-5), .5*10^(-5)))
println(mstycznych(f, pf, 1.5, .5*10^(-5), .5*10^(-5), 10^7))
println(msiecznych(f, 1., 2., .5*10^(-5), .5*10^(-5), 10^7))