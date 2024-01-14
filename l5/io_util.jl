# Maksymilian Neumann 2024
include("blocksys.jl")

module IoUtil
export ingest_matrix, ingest_vector, output_result

using SparseArrays
using LinearAlgebra
using Main.SparseBlockMatrices

function ingest_matrix(file_path::String)::SparseBlockMatrix
    open(file_path) do file
        params = split(readline(file))
        size = parse(Int, params[1])
        block_size = parse(Int, params[2])
        A = sbm_zeros(size, block_size)
        while !eof(file)
            line = split(readline(file))
            i = parse(Int, line[1])
            j = parse(Int, line[2])
            v = parse(Float64, line[3])
            A.matrix[i, j] = v
        end
        return A
    end
end

function ingest_vector(file_path::String)
    open(file_path) do file
        n = parse(Int, readline(file))
        b = zeros(n)
        for i in 1:n
            b[i] = parse(Float64, readline(file))
        end
        return b
    end
end

function output_result(output_file_path::String, X::Vector{Float64}, was_calculated::Bool)
    open(output_file_path, "w") do file
        if was_calculated
            exact_x = ones(length(X))
            error = norm(X-exact_x) / norm(exact_x)
            write(file, "$error\n")
        end
        for x in X
            write(file, "$x\n")
        end
    end
end

end
