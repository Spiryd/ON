# Maksymilian Neumann 2023
using LinearAlgebra
include("hilb.jl")
include("matcond.jl")

X = ones(20)

right_side_vec(a, x) = a*x
gaussian_elimination(a, b) = a\b
f(a, b) = inv(a)*b

println("Macierze losowe: ")
for n in (5, 10, 20)
    for c in (1., 10., 10.0^3, 10.0^7, 10.0^12, 10.0^16)
        local a = matcond(n, c)
        local b = right_side_vec(a, X[1:n])
        println("funkcja: f(), n: $n, c: $c, x: ", f(a, b))
        println("funkcja: ge(), n: $n, c: $c, x: ", gaussian_elimination(a, b)) 
    end
end
println("\nMacierze Hilberta: ")
for n in 1:20
    local a = hilb(n)
    local b = right_side_vec(a, X[1:n])
    println("funkcja: f(), n: $n, x: ", f(a, b))
    println("funkcja: ge(), n: $n, x: ", gaussian_elimination(a, b)) 
end