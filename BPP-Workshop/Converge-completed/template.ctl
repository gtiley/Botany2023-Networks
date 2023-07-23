          seed =  __SEED__

       seqfile = YOUR_PATH/BPP-Workshop/Dryopteris.bppDat
      Imapfile = YOUR_PATH/BPP-Workshop/Dryopteris.spmap
       outfile = __OUTFILE__
      mcmcfile = __MCMCFILE__

  speciesdelimitation = 0
         speciestree = 0

   speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

  species&tree = 5  Pmun Dint Dgol Dcel Dlud
                    1 1 1 1 1
*t01		    (Pmun,(Dint,(Dlud,(Dcel,Dgol)u)t)s)r;
*t02		    (Pmun,(Dint,(Dcel,(Dlud,Dgol)u)t)s)r;
*t03		    (Pmun,(Dint,(Dgol,(Dcel,Dlud)u)t)s)r;
*t04		    (Pmun, (Dint,((j[&phi=0.200000,tau-parent=yes],Dlud)i,((Dcel)j[&phi=0.800000,tau-parent=yes],Dgol)u)t)s)r;
*t05                (Pmun, (Dint,((j[&phi=0.200000,tau-parent=yes],Dcel)i,((Dlud)j[&phi=0.800000,tau-parent=yes],Dgol)u)t)s)r;
*t06                (Pmun, (Dint,((j[&phi=0.200000,tau-parent=yes],Dlud)i,((Dgol)j[&phi=0.800000,tau-parent=yes],Dcel)u)t)s)r;
*t07                (Pmun, (Dint,((j[&phi=0.200000,tau-parent=yes],(l[&phi=0.200000,tau-parent=no],Dlud)k)i,((Dcel)j[&phi=0.800000,tau-parent=yes],(Dgol)l[&phi=0.800000,tau-parent=yes])u)t)s)r;
      phase = 0 0 0 0 0
                  
      usedata = 1  * 0: no data (prior); 1:seq like
      nloci = 30  * number of data sets in seqfile

      cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

      thetaprior = 2 0.01 e  # invgamma(a, b) for theta
      tauprior = 3 0.02    # invgamma(a, b) for root tau & Dirichlet(a) for other tau's
      clock = 1
      model = hky
      alphaprior = 2.4 4 4
*t04   phiprior = 1 1
*t05   phiprior = 1 1
*t06   phiprior = 1 1
*t07   phiprior = 1 1
      locusrate = 1 0 0 10 iid

*t01      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0  # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr
*t02	 finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0
*t03	 finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0
*t04      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0 0.3
*t05      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0 0.3
*t06      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0 0.3
*t07      finetune =  1: 0.3 0.3 0.01 0.05 0.3 0.3 1.0 0.3
         print = 1 0 0 0   * MCMC samples, locusrate, heredityscalars, Genetrees
        burnin = 20000
      sampfreq = 10
      nsample = 10000
      threads = 4 1 1
