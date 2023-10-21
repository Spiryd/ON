# Maksymilian Neumann 2023

function print_next_n_floats(x::Float64, n)
    for _ in 0:5 
        println(bitstring(x))
        x = nextfloat(x)
    end
end

function print_delta_higher_n_floats(x::Float64, delta::Float64, n)
    for _ in 0:5 
        println(bitstring(x))
        x += delta
    end
end

println("Następne 5 liczb po 1: ")
print_next_n_floats(1., 5)
println("Następne 5 delta większych po 1: ")
print_delta_higher_n_floats(1., 2.0^-52, 5)

println("Następne 5 liczb po 0.5:")
print_next_n_floats(0.5, 5)
println("Następne 5 delta większych po 0.5: ")
print_delta_higher_n_floats(0.5, 2.0^-52, 5)

println("Następne 5 liczb po 2: ")
print_next_n_floats(2., 5)
println("Następne 5 delta większych po 0.5: ")
print_delta_higher_n_floats(2., 2.0^-52, 5)
