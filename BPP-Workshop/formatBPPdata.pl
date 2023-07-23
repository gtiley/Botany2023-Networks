#!/usr/bin/perl -w
$bpp_file = $ARGV[0];                                                                                                                             


%taxList = ();
open FH1,'<',"Dryopteris.spmap";
while(<FH1>)
{
    if (/(\S+)\s+(\S+)/)
    {
	$tax = $1;
	$sp = $2;
	if (! exists $taxList{$tax})
	{
	    $taxList{$tax} = $sp;
	}
    }
}
close FH1;

#---------------------------------------------------------------------------------------#                                                                              
###                                                                                                                                                                     
#collect fasta files from another location                                                                                                                              
@fastaFiles = glob("exampleData_30loci/*.fasta");
###                                                                                                                                                                     
$nloci = 0;

open OUT1,'>',"$bpp_file";
foreach $ff (@fastaFiles)
{
    if ($ff =~ m/exampleData_30loci\/(\S+)\.fasta/)
    {
	$og = $1;
	print "$og\n";
	$ntax = 0;
	$nsp = 0;
	%spList = ();
	$seqlen = 0;
	%seqs = ();
#	$nloci++;
	open FH1,'<',"$ff";
	while (<FH1>)
	{
	    if (/^>(\S+)/)
	    {
		$tax = $1;
#		$tax =~ s/\__\S+//;
		if (exists $taxList{$tax})
		{
		    $ntax++;
		}
		if (! exists $spList{$taxList{$tax}})
		{
		    $spList{$taxList{$tax}} = 1;
		    $nsp++;
		}
	    }
	    elsif (/(\S+)/)
	    {
		$seq = $1;
		$seqs{$tax} = $seq;
		if ($seqlen == 0)
		{
		    $seqlen = length($seq);
		}
	    }
	}
	close FH1;
	$nloci++;
	print OUT1 "$ntax\t$seqlen\n";
	foreach $tax (sort keys %seqs)
	{
		if (exists $taxList{$tax})
		{
		    print OUT1 "^$tax\t$seqs{$tax}\n";
		}
	}
	print OUT1 "\n";
    }
}
close OUT1;

print "Number of loci = $nloci\n";
exit;
