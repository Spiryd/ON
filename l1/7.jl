# Maksymilian Neumann 2023

global f(x) = sin(x) + cos(3x)

function aprox(x_0::Float64, h::Float64)
    return (f(x_0 + h) - f(x_0)) / h
end

ex = (cos(1) - 3*sin(3))
for n in 0:54
    a = aprox(1.0, 2.0^(-n))
    println("h: ", 2.0^(-n), " aprox: ", a, " err: ", abs(a - ex) )
end

import Pkg
Pkg.add("Plots")
using Plots

x = 0:54
y = map(x -> abs(aprox(1.0, 2.0^(-x)) - ex), x)
bar(x, y, legend=false, yaxis=:log)
png("7.png")
