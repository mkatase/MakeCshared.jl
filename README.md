# MakeCshared

MakeCshared is a package that introduce how to build self-make C shared library and package.

## Development Environment

* Julia 0.7.0 on Fedora 28 (4.18.9-200 on x86_64)

The reason is that `BinaryBuilder.jl` and `BinaryProvider.jl` could not install on Julia 1.0.0 and 1.1-DEV on F28. On Julia 0.7.0, `BinaryProvidir.jl` is installed. (`BinaryBuiler.jl` could not installed.)  

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

## Hash Value
Hash Value outputs using `sha256sum` command.

```bash
$ sha256sum libmakec.tar.gz
6204d89072dcf42daf8f9014a052f2149492fa2e76b47f9351faa2db53d14f50  libmakec.tar.gz
```

If PyCall pacakge is not installed, ENV["PYTHON"] variable set up, build and test procedure.

```julia
v1.x> pkg> ENV["PYTHON"] = "/path/to/bin/python"
v1.x> pkg> add PyCall
v1.x> pkg> build PyCall
v1.x> pkg> test PyCall
...
   Testing PyCall tests passed 

(v1.x) pkg> 
```

## Install OdsReaders.jl

```julia
julia> using Pkg
julia> Pkg.clone("https://github.com/mkatase/OdsReaders.jl.git")
julia> Pkg.test("OdsReaders")
...
   Testing OdsReaders
 Resolving package versions...
# sheet check
Sheet3 : sheet not found
# reading sheet1 with header
# reading sheet1 without header
# reading sheet2 with header
# reading sheet4 with header
# num. of sheets
Test Summary: | Pass  Total
OdsReaders    |   38     38
   Testing OdsReaders tests passed 
```

or

```julia
(v1.x) pkg> add https://github.com/mkatase/OdsReaders.jl.git
  Updating registry at `~/.julia/registries/General`
...
  [d106bba2] + OdsReaders v0.1.0 #master (https://github.com/mkatase/OdsReaders.jl.git)

(v1.x) pkg> activate .

(OdsReaders) pkg> test
   Testing OdsReaders
 Resolving package versions...
# sheet check
Sheet3 : sheet not found
# reading sheet1 with header
# reading sheet1 without header
# reading sheet2 with header
# reading sheet4 with header
# num. of sheets
Test Summary: | Pass  Total
OdsReaders    |   38     38
   Testing OdsReaders tests passed 

(OdsReaders) pkg> 
```

## How to use OdsReaders package in Julia

At first, set up to use OdsReaders package.

```julia
julia> using OdsReaders
```

## Reading a whole sheet

```julia
julia> data = openods("Filename.ods")
```

This will return an OrderedDict with all sheet in Filename.ods.
If no file, return nothing.

## Reading a specific sheet

```julia
julia> data = readsheet("Filename.ods", "Sheet1")
```

This will return an array data with *Sheet1* sheet in Filename.ods.
If no sheet, return empty array.

## Reading a specific sheet skipping first row

First row is used header in many cases.
For skipping first row is:

```julia
julia> data = readsheet("Filename.ods", "Sheet1" ; header=true)
```

## Getting sheet lists

```julia
julia> lists = getsheets("Filename.ods")
```

This will return an array data in Filename.ods.

## For example

``example.jl`` draws a graph using ``PyPlot`` and ``test/TestData.ods``.

```bash
$ cd example
$ julia example.jl
```

## Thanks
I'm developing this package based on the following package. Thanks.

* [ExcelReaders.jl](https://github.com/queryverse/ExcelReaders.jl)
