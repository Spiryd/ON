# Maksymilian Neumann 2023
"""
# Description
secant method for solving f(x) = 0
# Arguments
- `f`: anonymous function
- `x0`, `x1`: starting approximations
- `delta`, `epsilon`: precision
- `maxit`: max iteration count
# Results
returns `(r, v, it, err)`
- `r`: approximation of the solution
- `v`: value f(r) 
- `it`: number of iterations
- `err`: error signal (0 - no error, 1 - did not get within precision )
"""
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for it in 1:maxit
        if abs(fa) > abs(fb)
            x0 = x1
            fa = fb
        end
        s = (x1 - x0)/(fb - fa)
        x1 = x0
        fb = fa
        x0 = x0 - fa*s
        fa = f(x0)
        if abs(x1 - x0) < delta || abs(fa) < epsilon
            return(x0, fa, it, 0)
        end
    end
    return (x0, fa, maxit, 1)
end
