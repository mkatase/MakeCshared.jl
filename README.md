# MakeCshared

MakeCshared is a package that introduce how to build self-make C shared library and package.

## Development Environment

* Julia 0.7.0 on Fedora 28 (4.18.9-200 on x86_64)
* Julia 1.0.0 on Fedora 28 (4.18.9-200 on x86_64)

The reason is that `BinaryBuilder.jl` and `BinaryProvider.jl` could not install on Julia 1.1-DEV on F28. On Julia 0.7.0 and 1.0.0, `BinaryProvidir.jl` is installed. (`BinaryBuiler.jl` could not installed.)  

## About C Expansion Code
Refer to [here](https://github.com/mkatase/JuliaPractice) for more information about build and check.

```bash
$ mkdir work
$ cd work
$ curl -O https://mkatase.github.io/github-hosted/data/libmakec.tar.gz
$ tar xvfz libmakec.tar.gz 
$ cd libmakec
$ mkdir build
$ cd build/
$ cmake ..
$ make
...
$ ./a.out
Hello C World !!
-----
9
-----
Hello Momo World !!
```

VERSION 3.11 is cmake_minimum_required in original code, but this tarball is VERSION 3.7.2.

## Hash code
Hash code outputs using `sha256sum` command.

```bash
$ sha256sum libmakec.tar.gz
6204d89072dcf42daf8f9014a052f2149492fa2e76b47f9351faa2db53d14f50  libmakec.tar.gz
```

## Description about deps directory
`deps directory` supports pacakge build command.

* build.jl
    - To describe download path and hash code
* compile.jl
    - main build script for this package
    - call from build.jl
    - this script is the same as the above c expansion procedure
* deps.jl
    - auto generated by build.jl if script is passed
    - call from __init__ function in MakeCshared.jl
    - global variable `libextrac` is very important

## How to install

```julia
(v0.7) pkg> add https://github.com/mkatase/MakeCshared.jl.git
...
(v0.7) pkg> build MakeCshared
  Building CMake ──────→ `~/.julia/packages/CMake/yag1A/deps/build.log`
  Building MakeCshared → `~/.julia/packages/MakeCshared/KA7V1/deps/build.log`

(v0.7) pkg> test MakeCshared
   Testing MakeCshared
...
# printout function check
Hello C World !!
# calc function check
# hello function check
Test Summary: | Pass  Total
MakeCshared   |    6      6
   Testing MakeCshared tests passed 
```

## Usage

```julia
julia> using MakeCshared

julia> printout
printout (generic function with 1 method)

julia> printout()
Hello C World !!

julia> calc(5)
25

julia> hello("Hoe")
"Hello Hoe World !!"
```

## Thanks
Refer to the following. Thanks.

* [NLopt.jl](https://github.com/JuliaOpt/NLopt.jl)

