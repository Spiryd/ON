# Maksymilian Neumann 2023
include("meth.jl")
using .Meth

# funkcja pomagające wpisywane wyników w latex
function print_tex_table(res)
    println(
        res[1], " & ",
        res[2], " & ",
        res[3], " & ",
        res[4], " \\\\\\hline"
    )
end

# nasze dane początkowe
f1(x) = exp(1-x) - 1
df1(x) = -exp(1-x)
f2(x) = x * exp(-x)
df2(x) = exp(-x) * (1-x)
delta = 10^-5
epsilon = 10^-5

println("\n f1")

println("\n bisekcja")
print("przedział", " & ")
print_tex_table(["\$x_0\$", "\$f_1(x_0)\$", "ilość iteracji", "kod błędu"])
for (a, b) in [(0., 2.), (-0.1, 2.), (-21.37, 37.21), (0.1, 1024.), (0.9, 1.0e6)]
    print("\$[$a, $b]\$", " & ")
    print_tex_table(mbisekcji(f1, a, b, delta, epsilon))
end

println("\n styczne")
print("\$x_0\$", " & ")
print_tex_table(["\$x_0\$", "\$f_1(x_0)\$", "ilość iteracji", "kod błędu"])
for x0 in [0., -4., 10., 1.0e6]
    print(x0, " & ")
    print_tex_table(mstycznych(f1, df1, x0, delta, epsilon, 100))
end

println("\n sieczne")
print("\$x_0\$, \$x_1\$", " & ")
print_tex_table(["\$x_0\$", "\$f_1(x_0)\$", "ilość iteracji", "kod błędu"])
for (x0, x1) in [(0.,2.), (-0.1, 2.), (-21.37, 37.21), (0.1, 1024.), (0.9, 1.0e6)]
    print("\$$x0, $x1\$", " & ")
    print_tex_table(msiecznych(f1, x0, x1, delta, epsilon, 100))
end

println("\n f2")

println("\n bisekcja")
print("przedział", " & ")
print_tex_table(["\$x_0\$", "\$f_2(x_0)\$", "ilość iteracji", "kod błędu"])
for (a, b) in [(-1., 2.), (-0.1, 2.), (-21.37, 37.21), (-2.1, 1024.), (0.9, 1.0e6)]
    print("\$[$a, $b]\$", " & ")
    print_tex_table(mbisekcji(f2, a, b, delta, epsilon))
end

println("\n styczne")
print("\$x_0\$", " & ")
print_tex_table(["\$x_0\$", "\$f_2(x_0)\$", "ilość iteracji", "kod błędu"])
for x0 in [-1., -4., 1., 10., 1.0e6]
    print(x0, " & ")
    print_tex_table(mstycznych(f2, df2, x0, delta, epsilon, 100))
end

println("\n sieczne")
print("\$x_0\$, \$x_1\$", " & ")
print_tex_table(["\$x_0\$", "\$f_2(x_0)\$", "ilość iteracji", "kod błędu"])
for (x0, x1) in [ (-0.1, 2.), (-0.7,1.5), (-21.37, 37.21), (0.1, 1024.), (0.9, 1.0e6)]
    print("\$$x0, $x1\$", " & ")
    print_tex_table(msiecznych(f2, x0, x1, delta, epsilon, 100))
end

println("\nadditional")

println("\nf1")
print("\$x_0\$", " & ")
print_tex_table(["pierwiastek r", "\$f_1(r)\$", "liczba iteracji", "kod błędu"])
for x0 in [1.1, 2., 5., 10., 1.0e4]
    print(x0, " & ")
    print_tex_table(mstycznych(f1, df1, x0, delta, epsilon, 100))
end

println("\nf2")
print("\$x_0\$", " & ")
print_tex_table(["pierwiastek r", "\$f_2(r)\$", "liczba iteracji", "kod błędu"])
for x0 in [1., 1.1, 2., 5., 10., 1.0e4]
    print(x0, " & ")
    print_tex_table(mstycznych(f2, df2, x0, delta, epsilon, 100))
end
