# Maksymilian Neumann 2023
import Pkg
Pkg.add("Polynomials")
using Polynomials

p = fromroots(1:20)

a1 = zeros(20)
a2 = zeros(20)
b1 = zeros(20)
b2 = zeros(20)
c1 = zeros(20)
c2 = zeros(20)
"""
Sprawdzamy poprawność znalesionych miejsc zerowych
# Arguments
- `polynomial`: welomian
"""
function check(polynomial)
    z = roots(polynomial)
    for k in 1:20
        println(z[k])
        println("|P(z_k)|: ", abs(polynomial(z[k])), ", |p(z_k)|: ", abs(p(z[k])), "|z_k - k|: ", abs(z[k] - k))
    end
end

# Tworzymy oba warianty danego wielomianu
P1 = [1, -210.0, 20615.0,-1256850.0, 53327946.0,-1672280820.0, 40171771630.0, -756111184500.0, 11310276995381.0, -135585182899530.0, 1307535010540395.0, -10142299865511450.0, 63030812099294896.0, -311333643161390640.0, 1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0, -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0, 2432902008176640000.0]
P2 = [1, (-210 - 2^(-23)), 20615.0,-1256850.0, 53327946.0,-1672280820.0, 40171771630.0, -756111184500.0, 11310276995381.0, -135585182899530.0, 1307535010540395.0, -10142299865511450.0, 63030812099294896.0, -311333643161390640.0, 1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0, -12870931245150988800.0, 13803759753640704000.0, -8752948036761600000.0, 2432902008176640000.0]
poly1 = Polynomial(reverse(P1)) # postać naturalna
poly2 = Polynomial(reverse(P2)) # postać naturalna ale modyfikacje

#sprawdzamy nasze wielomiany
check(poly1)
check(poly2)

#dnae do plotów
a1 = zeros(20)
a2 = zeros(20)
b1 = zeros(20)
b2 = zeros(20)
c1 = zeros(20)
c2 = zeros(20)

# pobieramy dane do plotowania
z1 = roots(poly1)
z2 = roots(poly2)
for k in 1:20
    a1[k] = abs(poly1(z1[k]))
    a2[k] = abs(poly2(z2[k]))
    b1[k] = abs(p(z1[k]))
    b2[k] = abs(p(z2[k]))
    c1[k] = abs(z1[k] - k)
    c2[k] = abs(z2[k] - k)
end

Pkg.add("Plots")
using Plots

# oś x
x = 1:20
# zapisujemy nasze ploty
png(plot(x, [a1, a2], title="|P(z_k)|", linewidth=3, label=["original" "modified"]), "4.1.png")
png(plot(x, [b1, b2], title="|p(z_k)|", linewidth=3,label=["original" "modified"]), "4.2.png")
png(plot(x, [c1, c2], title="|z_k - k|", linewidth=3,label=["original" "modified"]), "4.3.png")