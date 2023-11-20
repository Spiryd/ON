# Maksymilian Neumann 2023
"""
# Description
Bisection method for solving f(x) = 0
# Arguments
- `f`: anonymous function
- `a`: starting point
- `b`: end point
- `delta`, `epsilon`: precision
# Results
returns `(r, v, it, err)`
- `r`: approximation of the solution
- `v`: value f(r) 
- `it`: number of iterations
- `err`: error signal (0 - no error, 1 - f does not intersect 0)
"""
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64) 
    u = f(a)
    v = f(b)
    e =  b - a
    if sign(u) == sign(v) 
        return (Nothing, Nothing, Nothing, 1)
    end
    for it in 1:10^8
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
end