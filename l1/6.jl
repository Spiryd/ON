# Maksymilian Neumann 2023

# funkcja do porónania 1
function f(x::Float64)
    return sqrt(x^2) - 1
end

# funkcja do porónania 2
function g(x::Float64)
    return x^2 / (sqrt(x^2 + 1) + 1)
end

# porównujemy funkcje
for i in 1:20 
    println("f(8^-$i) = ", f(8.0^(-i)))
    println("g(8^-$i) = ", g(8.0^(-i)))
end
