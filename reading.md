---
layout: page
title: Pre-workshop
permalink: /reading/
---

Prior to the workshop, participants are expected to install the following software:

## Networks from Gene Trees in PhyloNetworks

- Download [BUCKy](http://pages.stat.wisc.edu/~ane/bucky/index.html)
- Download [TICR](https://github.com/nstenz/TICR)
- Download [QuartetMaxCut](http://research.haifa.ac.il/%7Essagi/software/QMCN.tar.gz)
- Download [MrBayes](http://nbisweden.github.io/MrBayes/)
- [Download](https://julialang.org) julia and
  follow instructions to install julia
- Install the necessary packages: open julia then type
    ```julia
    using Pkg # to use functions that manage packages
    Pkg.add("PhyloNetworks") # to download & install package PhyloNetworks
    Pkg.add("PhyloPlots")
    Pkg.add("RCall")      # packaage to call R from within julia
    Pkg.add("CSV")        # to read from / write to text files, e.g. csv files
    Pkg.add("DataFrames") # to create & manipulate data frames
    Pkg.add("StatsModels")# for regression formulas
    using PhyloNetworks   # may take some time: pre-compiles functions in that package
    using PhyloPlots
    ```
and close julia with `exit()`.

## Split Networks in FastNet

You need to download [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

## Trait Evolution in PhyloNetworks

What you should do prior to the workshop:

- install [Julia](https://www.julialang.org/downloads/)
  and add it to your [`PATH`](https://julialang.org/downloads/platform/#optional_add_julia_to_path)
- install [VSCode](https://code.visualstudio.com/download)
  or another editor, if you don't have one already.
- install [R](https://cran.r-project.org)

