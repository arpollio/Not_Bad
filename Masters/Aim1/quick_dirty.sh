#!/bin/bash

$fasta = "Flif_orgninisms.fa";
$alignment = "FliF_aligned.fa";
$masked = "FliF_masked.fa";

open FILE, "<", $fasta
or die "cannot find $fasta";
open FILE_ALIGN, ">", $alignment
or die "cannot create $alignment";

#Super basic alignment
while (<FILE>) {
  muscle
  FILE_ALIGN
}

close FILE;
close FILE_ALIGN;
