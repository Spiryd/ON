#Maksymilian Neumann 2023

global x::Float64 = nextfloat(one(Float64))

while x < 2.
    if (x * ( 1 / x)) ≠ 1
        println(x)
    end
    global x = nextfloat(x)
end

println(x)
