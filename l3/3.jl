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
    A = f(x0)
    B = f(x1)
    for it in 1:maxit
        if abs(A) < abs(B)
            x0, x1 = x1, x0
            A, B = B, A
        end
        s = (x1 - x0)/(B - A)
        x0 = x1
        A = B
        x1 = x1 - A * s
        B = f(x1)
        if abs(x1 - x0) < delta || abs(B) < epsilon
            return x1, B, it, 0
        end
    end
    return x1, B, maxit, 1
end
