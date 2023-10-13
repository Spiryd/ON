# Maksymilian Neumann 2023

function f(x)
    return sqrt(x^2) - 1
end

function g(x)
    return x^2 / (sqrt(x^2 + 1) + 1)
end

for i in 1:100 
    println("f($i) = ", f(8.0^(-1*i)))
    println("g($i) = ", g(8.0^(-1*i)))
end
