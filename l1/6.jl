# Maksymilian Neumann 2023

function f(x::Float64)
    return sqrt(x^2) - 1
end

function g(x::Float64)
    return x^2 / (sqrt(x^2 + 1) + 1)
end

for i in 1:20 
    println("f(8^-$i) = ", f(8.0^(-i)))
    println("g(8^-$i) = ", g(8.0^(-i)))
end
