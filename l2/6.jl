# Maksymilian Neumann 2023

import Pkg
Pkg.add("Plots")
using Plots

# iteracyjna impementacja funkcji
function f(x::Float64, c::Float64, n)::Float64
    # tworzymy wykresy
    title="x=$x c=$c"
    y = zeros(n+1)
    y[1] = x
    println(x)
    for i in 1:n
        x = x^2 + c
        y[i + 1] = Float64(x)
        println(x)
    end
    # tworzymy wykresy
    png(bar(0:n, y, title=title, lengend=false), "6 $title.png")
    return x
end

# iterujemy przez nasze dane
for case in ((-2, 1), (-2, 2), (-2, 1.99999999999999), (-1, 1), (-1, -1), (-1, 0.75), (-1, 0.25)) 
    println("x_0: ", case[2], " c: ", case[1], " res: ", f(Float64(case[2]), Float64(case[1]), 40))
end
