# qabala -- an framework for Quantom Computation
# 

##### constants
#
## States
zero1 = [1+0im, 0+0im]
one1  = [0+0im, 1+0im]
Q(φ) = [1 0; 0 ℯ^(φ*im)]

## GATE
X=[0 1;1 0]
Y=[0 -im; im 0]
Z=[1 0; 0 -1]

H = 1/sqrt(2)*[1 1;1 -1]


###### functions
#

isunitary(x) = (x ≈ x')
isprovability(x) = (sum(abs2.(x)) ≈ 1.0)

# this ket and bar is dubious
function ket(x::Number)
    x == 0 && return complex([1,0])
    x == 1 && return complex([0,1])
end
function bra(x::Number)
    x == 0 && return complex([1 0])
    x == 1 && return complex([0 1])
end

function randumqubit()
  θ = rand(0:0.01:π/2)
  φ = rand(0:0.01:π)
  cos(θ/2)*ket(0/2) + ℯ^(im*φ)*sin(θ/2)*ket(1)
end

function randumqubit(n::Number)
    map(x->randumqubit(), 1:n)
end


function qbits(α, β)
  [α, β]
end


function gate(op, ψ)
  op*ψ 
end

function observe(ψ, e)
	p = (e * e')*ψ
	p' * p
end


