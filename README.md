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
