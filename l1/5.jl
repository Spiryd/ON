# Maksymilian Neumann 2023

"""
Scalar sum of two vectors bottom up
#Arguments
-`x`: 1D vector
-`y`: 1D vector
#Returns
-`s`: Scalar sum of two vectors
"""
function a(x, y)
    s = 0.
    for i in 1:(length(x))
        s += x[i]*y[i]
    end
    return s
end

"""
Scalar sum of two vectors top down
#Arguments
-`x`: 1D vector
-`y`: 1D vector
#Returns
-`s`: Scalar sum of two vectors
"""
function b(x, y)
    s = 0.
    for i in (length(x)):1
        s += x[i]*y[i]
    end
    return s
end

"""
Scalar sum of two vectors highest to lowest
#Arguments
-`x`: 1D vector
-`y`: 1D vector
#Returns
Scalar sum of two vectors
"""
function c(x, y)
    s = zeros(length(x))

    # mnożymy elemet wektora z jego odpowiednikiem
    for i in 1:(length(x))
        s[i] = x[i]*y[i]
    end

    # znajdujemy dodatnie
    s_pos = s[s .> 0]
    #sortujemy od najwiekszego do najmniejszego
    s_pos = sort(s_pos, rev = true)
    # znajdujemy ujemne
    s_neg = s[s .<= 0]
    # sortujemy od najmniejszego do najwiekszego
    s_neg = sort(s_neg)

    # sumujemy ujemne w kolejności
    partial_neg = 0
    for i in s_neg
        partial_neg += i
    end

    # sumujemy dodatnie w kolejności
    partial_pos = 0
    for i in s_pos
        partial_pos += i
    end

    return partial_pos + partial_neg
end

"""
Scalar sum of two vectors lowest to highest
#Arguments
-`x`: 1D vector
-`y`: 1D vector
#Returns
Scalar sum of two vectors
"""
function d(x, y)
    s = zeros(length(x))
    
    # mnożymy elemet wektora z jego odpowiednikiem
    for i in 1:(length(x))
        s[i] = x[i]*y[i]
    end

    # znajdujemy dodatnie
    s_pos = s[s .> 0]
    # sortujemy od najmniejszego do najwiekszego
    s_pos = sort(s_pos)

    # znajdujemy ujemne
    s_neg = s[s .<= 0]
    # sortujemy od najwiekszego do najmniejszego
    s_neg = sort(s_neg, rev = true)

    # sumujemy ujemne w kolejności
    partial_neg = 0
    for i in s_neg
        partial_neg += i
    end

    # sumujemy dodatnie w kolejności
    partial_pos = 0
    for i in s_pos
        partial_pos += i
    end

    return partial_pos + partial_neg
end

x1::Vector{Float64} = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y1::Vector{Float64} = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

x2::Vector{Float32} = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y2::Vector{Float32} = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println(a(x1, y1))
println(b(x1, y1))
println(c(x1, y1))
println(d(x1, y1))

println(a(x2, y2))
println(b(x2, y2))
println(c(x2, y2))
println(d(x2, y2))