# Maksymilian Neumann 2023

function population_growth(p, n, r)
    for _ in 1:n
        p += r*p*(1-p)
    end
    return p
end

function modified_population_growth(p::Float32, n::Float32, r::Float32)
    for i in 1:n
        p += r*p*(1-p)
        if i == 10
            p = trunc(p, digits=3)
        end
    end
    return p
end
println("subproblem: 1, method: 1")
println(population_growth(Float32(0.01), Float32(40), Float32(3)))
println("subproblem: 1, method: 2")
println(modified_population_growth(Float32(0.01), Float32(40), Float32(3)), "\n")
println("subproblem: 2, type: Float32")
println(population_growth(Float32(0.01), Float32(40), Float32(3)))
println("subproblem: 2, type: Float64")
println(population_growth(Float64(0.01), Float64(40), Float64(3)))

