using Base.Test

H = 1/sqrt(2)*[1 1;1 -1]
Q0 = [1,0]
Q1 = [0,1]

@show hz=H*Q0
@show ho=H*Q1

X=[0 1;1 0]
Y=[0 -im; im 0]
Z=[1 0; 0 -1]

@show X*Q0
@show X*Q1

@show Y*Q0
@show Y*Q1

@show Z*Q0
@show Z*Q1

@show α1 = (1/sqrt(2))*(1+im)
@show β1 = (1/sqrt(2))*(1-im)
@test_broken 1.0 ≈ abs2(α1)+abs2(β1)

# They should be same in calculation...
αβ=α1*Q0 + β1*Q1
@show αβ == [α1,β1]
@show sum(abs2.(αβ))

@show (1/sqrt(2))*Q0 + (1/sqrt(2))*im * Q1

p5=e^(im*5π/6)
p6=e^(im*π/6)

@show abs(p5)
@show abs(p6)

p56=[p5/sqrt(2), p6/sqrt(2)]
@show sum(abs2.(p56))
@test 1.0 ≈ sum(abs2.(p56))

@show H*p56
@test 1.0 ≈ sum(abs2.(H*p56))

K=8
for i in 0:K
    v1=e^(im*i*π/K)
    v2=e^(im*(K-i)π/K)
    vv = [v1/sqrt(2), v2/sqrt(2)]
    print("$i ")
    @show 1.0 ≈ sum(abs2.(vv))
end

# probability 0.5 -- superposition, to |+>
@show H*Q0
# appy H, then probability 1 of Q0
@show H*H*Q0
# shift to X, to |->, prob 0.5
@show H*X*Q0
# apply H, to |1>
@show H*H*X*Q0


function unif(size)
    map(x->1/sqrt(size),1:size)
end

u5 = unif(5)
@test 1.0 ≈ (u5' * u5)^2

u10 = unif(10)
@test 1.0 ≈ (u10' * u10)^2
