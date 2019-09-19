using RootFinding
using Test: @test, @testset

function sqrt_r_f(x, r)
    return x*x - r
end

@testset "RootFinding tests" begin
    @testset "Bisection Tests" begin
        @test isapprox(bisect_root(x -> sqrt_r_f(x, 2.0), 1.0, 4.0, atol=1e-12, rtol=0), sqrt(2))

        r = rand()
        sr = sqrt(r)
        @test abs(bisect_root(x -> sqrt_r_f(x, r), 0.0, 1.0, atol=1e-6, rtol=0) - sr) < 1e-6
    end

    @testset "Secant Tests" begin
        @test isapprox(secant_root(x -> sqrt_r_f(x, 2.0), 1.0, 4.0, atol=1e-12, rtol=0), sqrt(2))

        r = rand()
        sr = sqrt(r)
        @test abs(secant_root(x -> sqrt_r_f(x, r), 0.0, 1.0, atol=1e-6, rtol=0) - sr) < 1e-6
    end
end
