          seed =  552883

       seqfile = /blue/burleigh/gtiley/phasing/BotanyWorkshop/Dryopteris.bppDat
      Imapfile = /blue/burleigh/gtiley/phasing/BotanyWorkshop/Dryopteris.spmap
       outfile = 4.8.out
      mcmcfile = mcmc.txt

  speciesdelimitation = 0
         speciestree = 0

   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 5  Pmun Dint Dgol Dcel Dlud
                    1 1 1 1 1
		    (Pmun, (Dint,((j[&phi=0.200000,tau-parent=yes],Dlud)i,((Dcel)j[&phi=0.800000,tau-parent=yes],Dgol)u)t)s)r;
      phase = 0 0 0 0 0
                  
      usedata = 1  * 0: no data (prior); 1:seq like
      nloci = 30  * number of data sets in seqfile

      cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

      thetaprior = 2 0.01 e  # invgamma(a, b) for theta
      tauprior = 3 0.02    # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
      clock = 1
      model = hky
      alphaprior = 2.4 4 4
   phiprior = 1 1
      locusrate = 1 0 0 10 iid

      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0 0.3
         print = 1 0 0 0   * MCMC samples, locusrate, heredityscalars, Genetrees
        burnin = 20000
      sampfreq = 10
      nsample = 10000
      threads = 4 1 1
BayesFactorBeta = 5.129089e-01
