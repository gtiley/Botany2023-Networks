#!/usr/bin/perl -w

@beta = ();
open FH1,'<',"beta.txt";
while(<FH1>)
{
	$b = $_;
	chomp $b;
	push @beta, $b;	
}
close FH1;

for $i (1..7)
{
    system "mkdir $i";
    if ($i < 10)
    {
	$ip = "0" . "$i";
    }
    else
    {
	$ip = $i;
    }

    for $j (1..scalar(@beta))
    {
	$outFile = "$i.$j.out";
	$mcmcFile = "mcmc.txt";
	$r = int(rand(1000000));
	system "mkdir $i/$j";
	open OUT1,'>',"$i/$j/$i.$j.bf.ctl";
	open FH2,'<',"template.ctl";
	while (<FH2>)
	{
	    $line = $_;
	    chomp $line;
	    $line =~ s/__SEED__/$r/;
	    $line =~ s/__OUTFILE__/$outFile/;
	    $line =~ s/__MCMCFILE__/$mcmcFile/;
	    $line =~ s/\*t$ip//;
	    if ($line =~ m/^\*/)
	    {
	    }
	    else
	    {
		print OUT1 "$line\n";
	    }
	}
	print OUT1 "BayesFactorBeta = $beta[($j - 1)]\n";
	close OUT1;
    }
}
exit;
