module Qubit

export ket, bra, X,Y,Z,H,isunitary, isprovability, randumqubit

function ket(x::Number)
    x == 0 && return complex([1,0])
    x == 1 && return complex([0,1])
end
function bra(x::Number)
    x == 0 && return complex([1 0])
    x == 1 && return complex([0 1])
end

X=[0 1;1 0]
Y=[0 -im; im 0]
Z=[1 0; 0 -1]

H = 1/sqrt(2)*[1 1;1 -1]
Q(φ) = [1 0; 0 ℯ^(φ*im)]

isunitary(x) = (x ≈ x')
isprovability(x) = (sum(abs2.(x)) ≈ 1.0)


function randumqubit()
  θ = rand(0:0.01:π/2)
  φ = rand(0:0.01:π)
  cos(θ/2)*ket(0/2) + ℯ^(im*φ)*sin(θ/2)*ket(1)
end

function randumqubit(n::Number)
    map(x->randumqubit(), 1:n)
end

function observe(qb, e)
  e*qb
end

end
