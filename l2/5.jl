# Maksymilian Neumann 2023
import Pkg
Pkg.add("DataFrames")
using DataFrames
Pkg.add("CSV")
using CSV

# funkcja modelujaąca wzrost populacji
function population_growth(p, n, r)
    #println(p)
    for _ in 1:n
        p += r*p*(1-p)
        #println(p)
    end
    return p
end

# zmodyfikowana funkcja modelujaąca wzrost populacji
function modified_population_growth(p::Float32, n::Float32, r::Float32)
    #println(p)
    for i in 1:n
        p += r*p*(1-p)
        if i == 10
            # na 10 iteracji obcinamy p do 3 liczb po przecinku
            p = trunc(p, digits=3)
        end
        #println(p)
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

# collecting data for latex table
a = []
global p = Float32(0.01)
r = Float32(3)
push!(a, p)
for _ in 1:40
    global p += r*p*(1-p)
    push!(a, p)
    #println(p)
end

b = []
global p = Float32(0.01)
r = Float32(3)
push!(b, p)
for i in 1:40
    global p += r*p*(1-p)
    if i == 10
        # na 10 iteracji obcinamy p do 3 liczb po przecinku
        global p = trunc(p, digits=3)
    end
    push!(b, p)
    #println(p)
end

c = []
global p = Float64(0.01)
r = Float64(3)
push!(c, p)
for _ in 1:40
    global p += r*p*(1-p)
    push!(c, p)
    #println(p)
end

df =  DataFrame(N=0:40, FLOAT32=a, MODIFIED=b, FLOAT64=c)

CSV.write("5.csv", df)