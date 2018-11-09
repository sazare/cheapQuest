include("qabala.jl")

q = randumqubit()

q = gate(X, q)
q = gate(H, q)
c = observe(q, zero1)

