# Maksymilian Neumann 2024
include("sparseblockmatrix.jl")

module blocksys
export gaussaian_elimination, gaussaian_elimination_with_partial_pivoting

using Main.SparseBlockMatrices
"""
# Opis
Funkcja używająca metodę eliminacji gaussa do rozwiązania układu równań liniowych.
# Argumenty
- `A`: macierz współczynników w postaci opisanej na liście
- `b`: wektor prawych stron
# Wyniki
- `x`: wektor rozwiązań
"""
function gaussaian_elimination(A::SparseBlockMatrix, b::Vector{Float64})::Vector{Float64}
    n = A.size
    # Elimnation Stage
    for k in 1 : n-1
        for i in k+1 : get_bottom_row(A, k)
            try
                m = A.matrix[i, k] / A.matrix[k, k]
                A.matrix[i, k] = 0.0

                for j in k+1 : get_last_column(A, k)
                    A.matrix[i, j] -= m * A.matrix[k, j]
                end

                b[i] -= m * b[k]
            catch _
                error("Zero value on the diagonal of A at index ($k, $k)")
            end            
        end
    end
    # Calculateing x
    x = zeros(n)
    x[n] = b[n] / A.matrix[n, n]
    for i in n-1 : -1 : 1
        x[i] = b[i]
        for j in i+1 : get_last_column(A, i)
            x[i] -= A.matrix[i, j] * x[j]
        end
        x[i] /= A.matrix[i, i]
    end
    return x
end
"""
# Opis
Funkcja używająca metodę eliminacji gaussa z częściowym wyborem elementu głównego do rozwiązania układu równań liniowych.
# Argumenty
- `A`: macierz współczynników w postaci opisanej na liście
- `b`: wektor prawych stron
# Wyniki
- `x`: wektor rozwiązań
"""
function gaussaian_elimination_with_partial_pivoting(A::SparseBlockMatrix, b::Vector{Float64})::Vector{Float64}
    n = A.size
    p = [1:n;]
    # Elimnation Stage
    for k in 1 : n-1
        bound = get_bottom_row(A, k)
        j = reduce((x, y) -> abs(A.matrix[p[x], k]) >= abs(A.matrix[p[y], k]) ? x : y, k : bound)
        p[k], p[j] = p[j], p[k]
        for i in k+1 : bound
            z = A.matrix[p[i], k] / A.matrix[p[k], k]
            A.matrix[p[i], k] = 0.0
            for j in k+1 : get_last_column(A, k + A.block_size)
                A.matrix[p[i], j] -= z * A.matrix[p[k], j]
            end
            b[p[i]] -= z * b[p[k]]
        end
    end
    
    # Calculateing x
    x = zeros(n)
    x[n] = b[p[n]] / A.matrix[p[n], n]
    for i in n-1 : -1 : 1
        x[i] = b[p[i]]
        for j in i+1 : get_last_column(A, i + A.block_size)
            x[i] -= A.matrix[p[i], j] * x[j]
        end
        x[i] /= A.matrix[p[i], i]
    end
    return x
end

end
