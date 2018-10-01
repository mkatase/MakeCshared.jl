module MakeCshared

using Printf

export printout, calc, hello

import Libdl
const depsjl_path = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("shared library not installed properly; run Pkg.build(\"MakeCshared\"), restart Julia, and try again.")
end

include(depsjl_path)


function __init__()
    check_deps()
end

function printout()
    ccall((:display, libextrac), Nothing, ())
end

function calc(x)
    ccall((:calc, libextrac), Int32, (Int32,), x)
end

function hello(s::AbstractString)
    v = ccall((:hello, libextrac), Cstring, (Cstring,), s)
    unsafe_string(v)
end

end # module
