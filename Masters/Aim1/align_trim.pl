#! /bin/bash/perl
use strict;

my $progname = $0;
$progname =~ s/^.*?([^\/]+)$/$1/;

# align each set of sequences and sort alignments by taxonomy
FILES=*.fasta
for f in $FILES
do
	fbase=${f%.fasta}

  # convert the headers to taxonomy strings
	fa_headmap.pl -tax < "$f" > "$fbase.mapped.fa"

  # align the sequences
	muscle -in "$fbase.mapped.fa" -verbose -out "$fbase.unsorted.afa"
	trimal -in $fbase.unsorted.afa -out $fbase.unsorted.masked.afa -automated1

  # extract the taxonomy strings to a common file
	grep '^>' "$fbase.unsorted.afa" >> "$taxonlist"
done
