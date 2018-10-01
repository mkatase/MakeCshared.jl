using MakeCshared
using Test

@testset "MakeCshared" begin

println("# printout function check")
@test printout() == nothing

println("# calc function check")
@test calc(4) == 16
@test calc(8) == 64
@test_throws MethodError calc("c")

println("# hello function check")
@test hello("Test") == "Hello Test World !!"
@test_throws MethodError hello(3)

end
