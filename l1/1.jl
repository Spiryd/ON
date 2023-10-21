# Maksymilian Neumann 2023

"""
Wyszukuje epsilon maszynowy iteracyjnie
# Arguments
- `type`: typ zmiennoprszecinkowy to przetestowania
# Returns
- `macheps`: wyszukany epsilon
"""
function macheps(type)
    one_typed = one(type)
    macheps = one_typed

    while one_typed + macheps > one_typed
        macheps /= 2
    end

    return macheps * 2
end

"""
Wyszukuje liczbe eta iteracyjnie
# Arguments
- `type`: typ zmiennoprszecinkowy to przetestowania
# Returns
- `eta`: wyszukany eta
"""
function eta(type)
    eta = one(type)

    while eta / 2 > 0.0
        eta /= 2
    end

    return eta
end

"""
Wyszukuje liczbe max danego typu iteracyjnie
# Arguments
- `type`: typ zmiennoprszecinkowy to przetestowania
# Returns
- `machmax`: wyszukany max
"""
function machmax(type)
    machmax = prevfloat(one(type))

    while isfinite(machmax * 2)
        machmax *= 2
    end

    return machmax
end

# Float16 macheps
println("Float16")
println("Epsilon from my function: ", macheps(Float16))
println("Epsilon from eps(): ", eps(Float16))
println()

# Float32 macheps
println("Float32")
println("Epsilon from my function: ", macheps(Float32))
println("Epsilon from eps(): ", eps(Float32))
println()

# Float64 macheps
println("Float64")
println("Epsilon from my function: ", macheps(Float64))
println("Epsilon from eps(): ", eps(Float64))
println()

# Float16 eta
println("Float16")
println("eta from my function: ",  eta(Float16))
println("eta from nextfloat: ", nextfloat(Float16(0.0)))
println()

# Float32 eta
println("Float32")
println("eta from my function: ",  eta(Float32))
println("eta from nextfloat: ", nextfloat(Float32(0.0)))
println()

# Float64 eta
println("Float64")
println("eta from my function: ",  eta(Float64))
println("eta from nextfloat: ", nextfloat(Float64(0.0)))
println()

# Float16 max
println("Float16")
println("max from my function: ",  machmax(Float16))
println("max from floatmax(): ", floatmax(Float16))
println()

# Float32 max
println("Float32")
println("max from my function: ",  machmax(Float32))
println("max from floatmax(): ", floatmax(Float32))
println()

# Float64 max
println("Float64")
println("max from my function: ",  machmax(Float64))
println("max from floatmax(): ", floatmax(Float64))
println()
