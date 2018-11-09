using Test

include("qabala.jl")

@testset "gate X" begin
 @test one1 == gate(X, zero1)
 @test zero1 == gate(X, one1)
end

@testset "gate H" begin
 @test zero1 ≈ gate(H, gate(H, zero1))

end


