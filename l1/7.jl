# Maksymilian Neumann 2023

# funkcja pierwotna
global f(x) = sin(x) + cos(3x)

"""
Funkcja aproksymująca pochodną funkcji `f()`
#Arguments
-`x_0::Float64`: punkt do aproksymacji pochodnej 
-`h::Float64`: odległość
#Returns
Zwraca aproksymacje pochodnej w punkcie 
"""
function aprox(x_0::Float64, h::Float64)
    return (f(x_0 + h) - f(x_0)) / h
end

# wartość dokładna pochodnej w punkcie x0 = 1
ex = (cos(1) - 3*sin(3))

# liczymy przybliżenia i wyliczamy błędy
for n in 0:54
    a = aprox(1.0, 2.0^(-n))
    println("h: ", 2.0^(-n), " aprox: ", a, " err: ", abs(a - ex) )
end

# dodajemy potrzebne biblioteki
import Pkg
Pkg.add("Plots")
using Plots

# oś x
x = 0:54
# oś y
y = map(x -> abs(aprox(1.0, 2.0^(-x)) - ex), x)
# tworzymy plot
bar(x, y, legend=false, yaxis=:log)
# zapisujemy go
png("7.png")
