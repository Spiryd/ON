# Maksymilian Neumann 2023
"""
# Description
Newton's method for solving f(x) = 0
# Arguments
- `f`, `pf`: anonymous function and it's derevative
- `x0`: starting approximation
- `delta`, `epsilon`: precision
- `maxit`: max iteration count
# Results
returns `(r, v, it, err)`
- `r`: approximation of the solution
- `v`: value f(r) 
- `it`: number of iterations
- `err`: error signal (0 - no error, 1 - did not get within precision, 2 - derrevative near 0)
"""
function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    if abs(v) < epsilon 
        return (x0, v, 0, 0)
    end
    for it in 1:maxit
        x1 = x0 - v/pf(x0)
        v = f(x1)
        if abs(x1 - x0) < delta || abs(v) < epsilon
            return (x1, v, it, 0)
        end
    end
    return(x0, v, maxit, 1)
end
