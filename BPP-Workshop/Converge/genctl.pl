#!/usr/bin/perl -w

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

    for $j (1..4)
    {
	$outFile = "$i.$j.out";
	$mcmcFile = "$i.$j.mcmc";
	$r = int(rand(1000000));
	open OUT1,'>',"$i/$i.$j.ctl";
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
	close OUT1;
    }
}
exit;
