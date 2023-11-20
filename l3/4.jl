# Maksymilian Neumann 2023
include("meth.jl")
using .Meth

# badana funcja
f(x) = sin(x) - (x/2)^2
# pochodna funkcji badanej
pf(x) = cos(x) - x/2

# używamy wszystkich metod i porównujemy
println("bisekcja")
println(mbisekcji(f, 1.5, 2., .5*10^(-5), .5*10^(-5)))
println("newton")
println(mstycznych(f, pf, 1.5, .5*10^(-5), .5*10^(-5), 10^6))
println("sieczne")
println(msiecznych(f, 1., 2., .5*10^(-5), .5*10^(-5), 10^6))