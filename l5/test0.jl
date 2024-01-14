# Maksymilian Neumann 2024
include("io_util.jl")
include("matrixgen.jl")
using .matrixgen
using .blocksys
using .SparseBlockMatrices
using .IoUtil
using Test
using Random

blockmat(1000, 10, 10., "tmp.txt")
A = ingest_matrix("tmp.txt")
x = ones(Float64, A.size)
b0 = mul(A, x)
b1 = rand(Float64, A.size)


@testset "$(rpad("Gaussaian Elimination", 50))" begin
    @test isapprox(gaussaian_elimination(deepcopy(A), deepcopy(b0)), x)
    @test isapprox(mul(A, gaussaian_elimination(deepcopy(A), deepcopy(b1))), b1)
end

@testset "$(rpad("Gaussaian Elimination with Partial Pivoting", 50))" begin
    @test isapprox(gaussaian_elimination_with_partial_pivoting(deepcopy(A), deepcopy(b0)), x)
    @test isapprox(mul(A, gaussaian_elimination_with_partial_pivoting(deepcopy(A), deepcopy(b1))), b1)
end
