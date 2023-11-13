# Maksymilian Neumann 2023
f(x) = 3*x
g(x) = exp(x)

function bi(a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a)
    v = f(b)
    e =  b - a
    for it in 1:10^6
        e = e/2
        c = a + e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return (c, w, it, 0)
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
    return (0, 0, 0, 1)
end