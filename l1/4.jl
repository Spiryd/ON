#Maksymilian Neumann 2023

#starting number
global x::Float64 = nextfloat(one(Float64))

while x < 2
    if (x * ( 1 / x)) ≠ 1
        # occourance of such number from the bottom
        println(x)
        break
    end
    global x = nextfloat(x)
end
