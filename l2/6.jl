# Maksymilian Neumann 2023

function f(x, c, n)
    for _ in 1:n
        x = x^2 + c
    end
    return x
end

for case in ((-2, 1), (-2, 2), (-2, 1.99999999999999), (-1, 1), (-1, -1), (-1, 0.75), (-1, 0.25)) 
    println("x_0: ", case[1], " c: ", case[2], " res: ", f(case[1], case[2], 40))
end
