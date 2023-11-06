# Maksymilian Neumann 2023
using LinearAlgebra
using Statistics
include("hilb.jl")
include("matcond.jl")

import Pkg
Pkg.add("Plots")
using Plots

# nasze rozwiązania
X = ones(20)

# funkcje pośrednie
# funkcja obliczająca wektor b
right_side_vec(a, x) = a*x
# eliminacja gaussa
gaussian_elimination(a, b) = a\b
# ta dtuga funkcja
f(a, b) = inv(a)*b

# tablice na wyniki
r11 = []
r12 = []
r21 = []
r22 = []
r31 = []
r32 = []
println("Średnie błędów w Macierze losowe: ")
for n in (5, 10, 20)
    for c in (1., 10., 10.0^3, 10.0^7, 10.0^12, 10.0^16)
        # tworzymy macierz
        local a = matcond(n, c)
        # tworzyby wektor b
        local b = right_side_vec(a, X[1:n])
        println("funkcja: f(), n: $n, c: $c, x: ",  mean([abs(x - 1) for x in f(a, b)]))
        println("funkcja: ge(), n: $n, c: $c, x: ", mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
        if n == 5
            push!(r11, mean([abs(x - 1) for x in f(a, b)]))
            push!(r12, mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
        elseif n == 10
            push!(r21, mean([abs(x - 1) for x in f(a, b)]))
            push!(r22, mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
        else
            push!(r31, mean([abs(x - 1) for x in f(a, b)]))
            push!(r32, mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
        end
    end
end
println("\nŚrednie błędów w Macierze Hilberta: ")
# tablice na wyniki
h1 = []
h2 = []
for n in 1:20
    # tworzymy macierz
    local a = hilb(n)
    # tworzyby wektor b
    local b = right_side_vec(a, X[1:n])
    println("funkcja: f(), n: $n, x: ", mean([abs(x - 1) for x in f(a, b)]))
    push!(h1, mean([abs(x - 1) for x in f(a, b)]))
    println("funkcja: ge(), n: $n, x: ", mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
    push!(h2, mean([abs(x - 1) for x in gaussian_elimination(a, b)]))
end

# tworzymy wykresy
x = 1:20
savefig(plot(x, [h1, h2], title="Hiblert", label=["f(x)" "ge(x)"], linewidth=2), "3.1.png")
x = [1, 10, 10^3, 10^7, 10^12, 10^16]
savefig(plot(x, [r11, r12], title="Random n=5", label=["f(x)" "ge(x)"], linewidth=2), "3.2.png")
savefig(plot(x, [r21, r22], title="Random n=10", label=["f(x)" "ge(x)"], linewidth=2), "3.3.png")
savefig(plot(x, [r31, r32], title="Random n=20", label=["f(x)" "ge(x)"], linewidth=2), "3.4.png")

for n in 1:20
    println("cond(H_$n) = ", cond(hilb(n)))
end

savefig(plot(1:20, [cond(hilb(n)) for n in 1:20], title="cond(H_n)", linewidth=3, legend=false, yscale=:log10), "3.5.png")
