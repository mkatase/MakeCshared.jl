using BinaryProvider
include("compile.jl")

const verbose = ("--verbose" in ARGS)
const prefix  = Prefix(get([a for a in ARGS if a != "--verbose"], 1, joinpath(@__DIR__, "usr")))
products = [
    LibraryProduct(prefix, String["libextrac"], :libextrac),
]

src_url  = "https://mkatase.github.io/github-hosted/data/libmakec.tar.gz"
src_hash = "6204d89072dcf42daf8f9014a052f2149492fa2e76b47f9351faa2db53d14f50"

src_path = joinpath(prefix, "downloads", "libmakec.tar.gz")

libname  = "libextrac"

if !isfile(src_path) || !verify(src_path, src_hash; verbose=verbose)
    println("Go to compile")
    compile(libname, src_url, src_hash, prefix=prefix, verbose=verbose)
end

write_deps_file(joinpath(@__DIR__, "deps.jl"), products, verbose=verbose)
println("end of build.jl script")
