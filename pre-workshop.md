---
layout: page
title: Pre-workshop
permalink: /pre-workshop/
---

Prior to the workshop, participants are expected to install the software below. Prior experience using command line programs and something like R can be helpful but is not necessary for participation. Material will be delivered at an introductory level and attempt to get everyone up and running with a range of tools.

Instructors will hold an office hour on July 22nd from 16:00 to 17:00 (location TBD or via Zoom) to help troubleshoot any problems in advance.


## Some common prerequisites

If you do not already, please install the following:

- install [Julia](https://www.julialang.org/downloads/)
	- it can be helpful to add Julia to your [PATH](https://julialang.org/downloads/platform/#optional_add_julia_to_path)
- install [R](https://cran.r-project.org)
- install a text editor for editing or writing code if you do not already have one. Some free suggestions include
    - [NotePad++](https://notepad-plus-plus.org/downloads/) for Windows
    - [BBEdit](https://www.barebones.com/products/bbedit/) for Mac
    - [VSCode](https://code.visualstudio.com/download) for all systems but with some extra features for coding
- install [Python](https://www.python.org/downloads/)
	- there are now many ways to install Python and its associated package managers. If this is your first time installing Python, my honest opinion is that you want to install the version distributed through [anaconda](https://docs.anaconda.com/free/anaconda/install/index.html). This will not only get Python in the right place for you, but a lot of packages that many other Python packages are dependent on. It is not as important for the exercises here, but might be more efficient for you in the long run.
	

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


## Estimating Phylogenetic Support using RAWR

You need to download [VirtualBox](https://www.virtualbox.org/wiki/Downloads).


## Detecting Gene Flow from Site Patterns in PhyNEST

PhyNEST is installed as a Julia package. Install instructions can be found on the [PhyNEST GitHub page](https://github.com/sungsik-kong/PhyNEST.jl). Install consists of launching a Julia session and then
```julia
using Pkg
Pkg.add("PhyNEST")
```
PhyNEST was developed for Julia >=v1.7, so users with older versions might need to update their Julia.


## Hypothesis Testing in BPP

You will need to download the latest version of BPP. This can be accessed with the [release page of the BPP GitHub](https://github.com/bpp/bpp/releases/tag/v4.6.2).

Please download the correct compiled version for your operating system. The compressed file can be unpacked to find the program and manual. BPP will be accessed with the command line (Mac or Linux) or command prompt (Windows), so I suggest downloading the program to an easy-to-find location where you perhaps keep other scientific software. 

We will also use R and some R packages to analyze results from BPP. After R is installed we will install the [bppr R package](https://github.com/dosreislab/bppr). The package can be installed after launching R or Rstudio by
```R
install.packages("devtools")
devtools::install_github("dosreislab/bppr")
```

## Advanced Models in PhyNetPy

Once Python is installed, the packaged for PhyNetPy can be installed via the command line by
```Python
pip install PhyNetPy
```

## Trait Evolution in PhyloNetworks

You should generally be ready after installing Julia, R, and following the install instructions for PhyloNetworks. Full details on installing dependent packages are covered on the [workshop activity page](https://cecileane.github.io/networkPCM-workshop/).



