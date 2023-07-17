---
layout: page
title: Hypothesis Testing with BPP
permalink: /activities/BPP/
---

## Introduction


## What is a Good Model?

### In defense of the biologist

Full-likelihood method provide us a powerful tool because we can evaluate multiple competing hypotheses in a statistically sound probabilistic framework. However, it can be tempting to compare as many competing models as possible. In practice, this will be difficult due to computational burdens or our inability to explain the rational for every *possible* model. A successful application of BPP or similar full-likelihood programs relies on your knowledge of the system and their natural history, and perhaps prior analyses with a range of phylogenetic or population genetic tools.

### How to specify a network

Formatting networks correctly can be difficult, especially when we want to specify the direction of gene flow. Luckily, BPP comes with a simple program to help create network models based on simpler binary trees. Consider our backbone topology - we will add some node labels for our convenience too. We can create a simple text file `msci-create.in` that provides the backbone topology as well as the branche that gene flow goes from and the branch that gene flow goes into. Multiple gene flow events can be specified here and the branch lengths of the introgression edges can be constrained if appropriate:

```
tree ((Pmun,Pspe)s,((Dexp,Dint)u,(Dgol,(Dcel,Dlud)w)v)t)r;
hybridization v Dgol, w Dcel as i j tau=yes, yes phi=0.5
```
Here, we have allowed the branch lengths of the two introgression edges to vary and specify an initial *introgression probability* of 0.5. The *introgression probability* will be sampled by the MCMC algorithm, so this is only a starting value. We can generate the network used for our analyses with the following command:
```
~/programs/bpp-4.6.1-macos-x86_64/bin/bpp --msci-create msci-create.in > msci-create.out
````
Below is the resulting network that we can add to our control file. You should try to draw the network yourself from the text string and convince yourself this is correct.
```
((Pmun,Pspe)s, ((Dexp,Dint)u,((j[&phi=0.500000,tau-parent=yes],Dgol)i,((Dcel)j[&phi=0.500000,tau-parent=yes],Dlud)w)v)t)r;
```

## Marginal likelihoods and model probabilities
Likelihood methods are great because they often allow us to compare and rank models. But a complication of Bayesian methods is that we have a sample of likelihoods rather than a single maximum likelihood estimate. Additionally, Bayesian estimators will be influenced by the prior distributions we imposed. There has been rigorous investigation into methods for estimating the *marginal likehood* where those confounding effects of the prior are factored out. The stepping-stone method [CITE] has had good performance in a range of other phylogenetic applications and we will use it again here. 

Notes on stepping stone

dos Reis package

our results 


## Bayes factor approximation with the Savage-Dickey density ratio


## Limits to Biological Interpretations
In our *Dryopteris* test case, we are lucky such that the biology is already worked out over years of meticulous chromosome work combined with multiple molecular studies. Unknown systems do not have this advantage and the lifetime of an investigation may not be long enough for long-term experimental work. It can be tempting to use network methods to infer the process of hybridization or polyploidization, but I strongly caution against this. Processes other than hybrid speciation can explain high introgression probabilities [CITE] and inferring extant parental species can be dubious if there are sampling gaps among species.
