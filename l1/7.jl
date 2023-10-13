# Maksymilian Neumann 2023

function aprox(x_0::Float64, h::Float64)
    return ((sin(x_0 + h) + cos(3*(x_0 + h)) - sin(x_0) + cos(3*x_0)) / h)
end

for n in 0:54
    a = aprox(1.0, 2.0^(-n))
    ex = (cos(1.0) - 3*sin(3.0))
    println("h: ", 2.0^(-n), " aprox: ", a, " err: ", abs(ex - a) )
end