# Maksymilian Neumann 2024
include("io_util.jl")
include("matrixgen.jl")

using .matrixgen
using .blocksys
using .IoUtil
using .SparseBlockMatrices
using LinearAlgebra
using Plots

function naive(A, b)
    return Array(A.matrix) \ b
end

sizes = [100, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 10000, 15000, 17500]
x_len = length(sizes)

data = [[m, zeros(x_len), zeros(x_len)] for m in [naive, gaussaian_elimination, gaussaian_elimination_with_partial_pivoting]]

for (i, size) in enumerate(sizes)
    blockmat(size, 10, 10.0, "tmp.txt")
    A = ingest_matrix("tmp.txt")
    b = mul(A, ones(size))
    for data_point in data
        tempA = deepcopy(A)
        tempb = deepcopy(b)
        stats = @timed data_point[1](tempA, tempb)
        println("$size $(stats.time)")
        data_point[2][i] = stats.time
        value = stats.value
        data_point[3][i] = norm(value - ones(size)) / norm(ones(size))
    end
end

plot(
    sizes,
    [data_point[2] for data_point in data],
    title="Złożoność czasowa algorytmów (sekundy)",
    legend=:topleft,
    label=["Metoda Naiwna" "Eliminacja Gauss'a" "Eliminacja Gauss'a z częściowym wyborem"]
)
savefig("time0.png")

plot(
    sizes,
    [data[i][2] for i in [2, 3]],
    title="Złożoność czasowa algorytmów (sekundy)",
    legend=:topleft,
    label=["Eliminacja Gauss'a" "Eliminacja Gauss'a z częściowym wyborem"]
)
savefig("time1.png")

plot(
    sizes,
    [data_point[3] for data_point in data],
    title="Błąd względny",
    legend=:topleft,
    label=["Metoda Naiwna" "Eliminacja Gauss'a" "Eliminacja Gauss'a z częściowym wyborem"]
)
savefig("err0.png")

plot(
    sizes,
    [data[i][3] for i in [2, 3]],
    title="Błąd względny",
    legend=:topleft,
    label=["Eliminacja Gauss'a" "Eliminacja Gauss'a z częściowym wyborem"]
)
savefig("err1.png")

