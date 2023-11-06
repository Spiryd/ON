# Maksymilian Neumann
import Pkg
Pkg.add("Plots")
using Plots

# oś x
x = range(-18, 18, length=200)
# oś y
y = map(x -> exp(x)*log(1+exp(-x)), x)
# tworzymy plot
plot(x, y)
# zapisujemy go
png("2.1.png")

# oś x
x = range(-18, 45, length=2000)
# oś y
y = map(x -> exp(x)*log(1+exp(-x)), x)
# tworzymy plot
plot(x, y)
# zapisujemy go
png("2.2.png")

