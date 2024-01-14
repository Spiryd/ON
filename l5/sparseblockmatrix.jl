# Maksymilian Neumann 2024
module SparseBlockMatrices
export SparseBlockMatrix, get_first_column, get_last_column, get_bottom_row, get_top_row, sbm_zeros, mul
using SparseArrays

mutable struct SparseBlockMatrix
    matrix::SparseMatrixCSC{Float64,Int}
    size::Int
    block_size::Int
    blocks_no::Int
end

function mul(M::SparseBlockMatrix, x::Vector{Float64})
    b = zeros(Float64, M.size)
    for i in 1:M.size
        for j in get_first_column(M, i):get_last_column(M, i)
            b[i] += x[j] * M.matrix[i, j]
        end
    end
    return b
end

function sbm_zeros(size::Int, block_size::Int)
    return SparseBlockMatrix(spzeros(size, size), size, block_size, Int(size / block_size))
end

function get_first_column(M::SparseBlockMatrix, row::Int)
    return max(1, row - ((row - 1) % M.block_size) - 1)
end

function get_last_column(M::SparseBlockMatrix, row::Int)
    return min(M.size, M.block_size + row)
end

function get_bottom_row(M::SparseBlockMatrix, column::Int)
    return min(M.size, column + M.block_size - (column % M.block_size))
end

function get_top_row(M::SparseBlockMatrix, column::Int)
    return max(1, column - M.block_size)
end

end
