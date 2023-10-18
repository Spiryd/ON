# Maksymilian Neumann 2023

function khan(t)
    khan = t(3.0) * ((t(4.0) / t(3.0)) - one(t)) - one(t)
    return khan
end

# Float16 macheps
println("Float16")
println("Epsilon from Khan: ", khan(Float16))
println("Epsilon from eps(): ", eps(Float16))
println()

# Float32 macheps
println("Float32")
println("Epsilon from Khan: ", khan(Float32))
println("Epsilon from eps(): ", eps(Float32))
println()

# Float64 macheps
println("Float64")
println("Epsilon from Khan: ", khan(Float64))
println("Epsilon from eps(): ", eps(Float64))
println()