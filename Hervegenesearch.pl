#!/usr/bin/perl -w
#Jenny McCarthy
#Finding Herve Gene in a sequence
use strict;
my $string; #Dna file
my $Hervegene = 0; #Number of Herve Gene we are looking for
my $chr_name; #name of the current chromosome
my $chr_seq; #sequence of the current chromosome
my $hervesseq = 'TAGAGTTGTGCCTCAAGAACCAGAACTGTACGATTCATTCAATTCATCCTAAAGAACGAACGACCTACGTTCATCTAATCAACGTTCATCGATTCTTTATAAATTATAATGTGTTGAGTTGTTCATGAAAATAACCCGGGTAGGAACCCGTCGAAATGAAGAACGTCCTAGTACGCCAGGTCGTTCATTCCCCCCATACAAATATGAACGTGAATCGTATGACCAGGACGTTCACGAAAAGAACGTCATACCCGTCGAAATAAAGAACGTCCTAGCAAGCCAGGTCGTTCATTCCCCCCATTCAAAATGAACGTGAATCGTATGACCAGGACGTTCACGAAAAGAACGTCCTACCCGTCGAAATAAAGAACGTCCTAGCAAGTCAGGTCGTTCATTTTTTCCCATACAAATATGAACGTGAATCGTATGACCAGGTCGTTCATTCTCCTGATACAAAAATGCGCTGTCCCACATGATAGACATGTGTCGATGAAACAAAATCAGCATACTTTCTCACTCAGCCCAACAAAACATCCGATCTGGCATTCTGCACTGGCTTTCTGCGGAGAGCACAGTACAAGATAAGAGAGCGGATAGAATGTTTCGTTGATCTACATCGTTGATCTTCACTCTCTTTCTGATCCTCGGAGACGATGCCGCTTCTGCAATATGCGCTCTCTTTTTCTTCCCGCTGCAATACTTTCAGCTGATAGTTACCGAGAGAACGATCACAGAGATAGAGAGTCAAAAAAATGACGAGGACGGGGGGTGGTATGTGGGATGAGTTTTTTTACCTACTTGTGAGCGAGGTACAGTCAAAGTTCAATAATTGAACGAAATTTTGGTTTGTATATTTTTCGATGGATATTTGATAGTAGGTTGATAGATCAACTAAAAAGCATGCCTTTATATTAGTGAATCTAATTTCATAGAAAATCGCAAAACTGTCGCCTATAATGAAAAAAAAACTTCATTTATTTTGTGCAGGAAAGAACGTGAAAATTTATCACCAAACGTGACACTAACCAAACAGTGAGCTGCCAATCGAAGTTCAATTAGTGAGTTTGAACTGTACTAGTCGTTTTGTTTGAGAGAGAAATGACCTTCTCGCGCTTTGAGGAAGAGAGGAAAATTACACTAATACGTTTATGGTCACTAAATCCATATGATAAATACATAGATCACGTATGTTCGGTTCGTTGTTGTATAGGTGATTTTGACCGTTATTTTTGAATACGTTCGATTTCTTCAATGTGTTGTAGGCTTGTGGTAATAAACATTGCTGAAACCGTGATTGTATTGATAAATTGATCTTTGATATGCCATTTGTTGTGATCTTTTGACTTGTAAACCACAAATTGATCTACGCTCCATCGAAATAAGTGAAAATTTAATAATTGCACGGCGATCAAAGGTAACATTAGTCTTGGTAGTTAAAAACAAAAACATAAAGTGTTGTATGAAACATTTCCACAGATATGATGGCTCCAACAAACGCAACAACAAGCCCTGTCTGGGATCATTTTAGTCCGGTAGAAACTGGCGCAAAGTGCCTTTATTGTTTAAAGGTGTTTAAGTATACTAAAGGAACTACTTCGAACTTGAAGCGGCATTTGAATTTAGTGCATAAAACTGTGCCGTATTTAAAGCAAAAGCAACCAATTCCTCAAACTATTAACATAGACGATGAAGCGGGACCTTCTGCTGTAAACTTTCAGCCATCAAATCAATATTTCAATTCAAATATGAGCATACAGGGTTATCTGAAGAAACCCATTAATAGCGAGACTAAAAAGGTTTTAGATAGAATGTTGCTAGATCTAATTTGCAAAGAATGTTTGCCATTTAATTTAGTAGAAAGTGAAATTTTCAAAAAATTCGTTTATACATTAAATCCGAACTATATTATGCCTACACGAAAAAGTTTATCAAACGCCCTACTACCAAGCGTATATAATCAAGAATTTGAAAAGGCTAAAGAGAAATTATCGACCGCCAAAGCTATAGCTATTACGTCGGATGGATGGACAAACCTGAACCAAATAAGTTTTTTTGCCTTAACAGGTCATTATATCGACGAAAATTGCAAACTTAGTTCTATTTTGATAGAATGCTCGGAATTTGAAAATCCTCATAGTGGTAGGAATATAGCTAATTGGATTCAAGGTACCTTGAACAAATTTGACATAGAGGATAAGATTGTTGCAATGGTTACTGACAATGCTTCCAATATGAAAGCGGCATCAACTGAGTTGAATTTTTGTCACATACCATGTTTTGCACATACGTTAAATTTGATTGTTCGAGATGCTATAAAAAAAAGTGTGCTACCAGTTGTAGAAGAGGTAAAAAGAGTAGTAATGTTATTTAAGAAAAGTCCAAAAGCCTCACAAATGCTAGCTGATACACAAAAAAAGCTCAATTTAGATCAATTGAAAATGATACAAGAAGTGTCAACGCGATGGAATTCGGGGTATGATATGCTTAATCGATTTTATAAGAACAAAATTGCATTACTCTCCTGTGCAGATAGTTTGAAAATGAAAATATCTTTAGAATCTCATGATTGGGAAGCAATTGAACAAATTGTGAGGGTTCTAAAATATTTCTATTCTGCTACAAATATTGTATCCGCCCAAAAATACATAACCATTTCACACGTGGGATTACTATGCAATGTGCTGTTAACCAAAACATCACAGTTTAGAAATGATGAGGATATAGCAGAAAACATTCAAAATTTAGTAGCTTTGCTCATTGAAGGTCTACAAAACAAGCTAAAAATTTATCGTTCCAATGAGCAGATACTTAAATCTATGATATTAGATCCTAGGATTAAACAACTTGGCTTTCAAGACGATGTGGAAAAATTCAAAAACATATGTGAATCAATTATATCTGAGCTGCTTCCGTTGCAAAAGCCCGCAGTAGAAGTCGAAAAAGTAGTAAAAAAAGTTAGCAAGGATGTGGACATGCTTTTCGGCGATTTATTAAAAAACAAGGGAGCTCAAAACTACAAAACACCTAGACAAATAGCTGAGAATGAACTACATCAATATTTAAGCGTTGAAAATATTGATTTAGAAAATGATCCGCTTCTTTGGTGGAAAGAACATCAAGTTCTTTATCCATCATTGTATACTCTTGCCATGAGCACTTTATGCATTCCCGGAACGTCCGTTCCATGTGAAAGGCTTTTTTCTAAAGCGGGACAGATATACTCTGAAAAAAGATCTCGACTAGCGCCAAAAAAATTGCAGGAAATATTGTTTATTCAACAAAATGCATAATCAAAACGTCGTTGCAAAATTTGTAACATGGAATATATGAAATAATTGTTTTGTAATGCACTTTTTGTAATTAAGTAAGACTTGAATTATCTAGATGTAAGTGTTATTTTTGTAATATAAAAAATGAATTCAAAATGGTGTTAAAATGTGTTGGTTGCCTTAATCATAATAGATGCATCACTTAATAACATAATTAGGAATACACGAGTTTTTTAGTTCAGTGACTAAGAACTGTTATGCTTATTATATGAAACTGTTAACAAACACCCATAATATGAAACTATCGCGAAATAAGATCGATTTACCATACTGTGGTTAGTTGACGTGAACGATTGAATCGCGATTCACGCTCAGTTCATGTTAATGAAAGAACCGGTAAATTCACGTTCATGGTAATGAATCGAATTGCCCAACCCTA';
my $substrherves = substr($hervesseq, -500, 600);
my $char = 'TAGAGTTGTGCCTCAAGAACCAGAACTGTACGATTCATTCAATTCATCCTAAAGAACGAACGACCTACGTTCATCTAATCAACGTTCATCGATTCTTTATAAATTATAATGTGTTGAGTT'; #this has to be changed each time you look up a different lenght seqeunce
my $offset = 0; #start of the string
my $result = index($hervesseq, $char, $offset); #location of herves gene
my @matches = ( ); #where the matches are located
my $Chrm_seq_rev = reverse $substrherves; #reverse compliment of Herves gene
#my $revcom =~ tr/ACGTacgt/TGCAtgca/; #reverse compliment of DNA
my $Hervegenerev = 0; #number of reverse complimented of Herves gene

#open the file and stat a string

open (FILE, $ARGV[0]) or die "Cannot open $ARGV[0] : $!";

##### process the first line
$string = <FILE>;
if ($string =~ /^>/) {
	$chr_name = $string;
}
else {
	die ("first line does not start with greater than symbol");
}

##### process the rest of the file
while ($string = <FILE>) {
	chomp $string;
	if ($string =~ /^>/) {
		while ($chr_seq =~ /$substrherves/ig) {
			$Hervegene++;
		}
		print "In chromosome $chr_name there are $Hervegene instance of Herves\n";

			
		$chr_name = $string;
		$chr_seq = "";
	}
	else {
		$chr_seq .= $string;
	}
#	while ($string =~ /$substrherves/ig) {
#		$Hervegene++;
#	}
}
while ($hervesseq =~ /$substrherves/ig) {
	my $match = $1;
	my $length = length($&);
	my $pos = length ($`);
	my $start = $pos + 1;
	my $end = $pos + $length;
	my $hitpos = "$start-$end";
	push @matches, "$match found at $hitpos";	
#push @matches, [ $1, $-[0] ];
}
print "$_\n" foreach @matches;


#while ($result != -1) {
#			
#	print "found $char at $result\n";
#
#	$offset = $result + 1;
#	$result = index($hervesseq, $char, $offset);	
#	}

print "In chromosome $chr_name there are $Hervegene instance of Herves\n";
print join(',' , @matches), "\n";
close (FILE);

#print "number of Herves genes $Hervegene\n";
#print "$substrherves\n";

