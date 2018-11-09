push!(LOAD_PATH, ".")

using Qubit

using Test

@testset "Pauli Gates" begin
 @test X*ket(0) ≈ ket(1)
 @test X*ket(1) ≈ ket(0)
 @test Y*ket(0) ≈ [0,im]
 @test Y*ket(1) ≈ [-im,0]
 @test Z*ket(0) ≈ ket(0)
 @test Z*ket(1) ≈ [0, -1]
end

@testset "Hadamard" begin

@show hz=H*ket(0)
@show ho=H*ket(1)

 @test abs2.(hz) ≈ [1/2, 1/2]
 @test abs2.(hz) ≈ [1/2, 1/2]

end

@testset "randumqubit" begin
 @test all(map(x-> 1.0 ≈ sum(abs2.(randumqubit())), 1:1000))
 @test all(map(x-> 1.0 ≈ sum(abs2.(x)), randumqubit(1000)))
end

@testset "probability" begin
 for x in 1:1500
     @test isprovability(randumqubit())
 end
end

 @testset "Qubit" begin
  qbs = randumqubit(100)
  @test all(map(x->isprovability(x), qbs))
  @test all(map(x->isunitary(x), [X,Y,Z,H]))
end

