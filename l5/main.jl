# Maksymilian Neumann 2024
include("io_util.jl")

using .IoUtil
using .SparseBlockMatrices
using .blocksys

function Input(prompt)
    print(prompt)
    return readline()
end

matrix_file_path = Input("input matrix file path: ")
A = ingest_matrix(matrix_file_path)
println(A)

b = nothing
println("Want to input vector b (Yes/No): ")
do_we_get_b = Input("input vector file path: ") == "Yes"

if do_we_get_b
    vector_file_path = Input("input vector file path: ")
    b = ingest_vector(vector_file_path)
else
    b = mul(A, one(A.size))
end

println(b)

println("Operattion:")
println("0. Gaussaian Elimination")
println("1. Gaussaian Elimination with Partial Pivoting")
operation = Input("input the operation number: ")

if operation == "0"
    x = gaussaian_elimination(A, b)
    println(x)
    output_file_path = Input("output file path: ")
    output_result(output_file_path, x, !do_we_get_b)
elseif operation == "1"
    x = gaussaian_elimination_with_partial_pivoting(A, b)
    println(x)
    output_file_path = Input("output file path: ")
    output_result(output_file_path, x, !do_we_get_b)
else
    println("'$operation' is not an operation number dumbass")
end
