using Test

include("qabala.jl")

@testset "gate X" begin
	@test equalq(one1 , gate(X, zero1))
	@test equalq(zero1 , gate(X, one1))
end

@testset "gate H" begin
	@test equalqa(zero1, gate(H, gate(H, zero1)))

end

@testset "obserbation in progress" begin
 rr = randumqubit()
 @test equalqa(zero1, observe(rr, zero1))
end


