# qabala -- an framework for Quantom Computation
# 

#### utility
nyi() = println("not yet implemented")

#### elements
struct Qubit
	state  :: Array{Complex{Float64}}
	obsp   :: Bool
end

makeQubit(c) = Qubit(c, false)
makeObserved(c) = Qubit(c, true)
equalq(q1, q2) = (q1.state == q2.state)
equalqa(q1, q2) = all(map((x,y)->x≈y,q1.state,q2.state))

##### constants
#
## States
zero1 = makeQubit([1.0+0.0im, 0.0+0.0im])
one1  = makeQubit([0.0+0.0im, 1.0+0.0im])
Q(φ) = makeQubit([1.0 0.0; 0.0 ℯ^(φ*im)])

## GATE
X=[0 1;1 0]
Y=[0 -im; im 0]
Z=[1 0; 0 -1]

H = 1/sqrt(2)*[1 1;1 -1]


###### functions
# primitives on a matrix of complex
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
  makeQubit(cos(θ/2)*ket(0/2) + ℯ^(im*φ)*sin(θ/2)*ket(1))
end

function randumqubit(n::Number)
    map(x->randumqubit(), 1:n)
end


function qbits(α, β)
	makeQubit([α, β])
end

function gate(op, q)
	makeQubit(op*(q.state))
end

function observe(q::Qubit, e::Qubit)
	s = q.state
	es = e.state
	p = (e * e')*s
	makeObserved(p' * p)
end

function measure(q::Qubit, e::Qubit)
	nyi()
	if q.obsp return q end
	pe = observe(q, e)
        if rand() >= pe; return e end
end

