#! /bin/sh
# be sure biogadget/bin is added to your path see:add_to_your_path.txt

#ssh adamp@ixodes.bio.wvu.edu ASK FIRST

#og_extract.pl
# og_extract.pl -i FILENAME WITH OG's -s FASTA WITH AMINO ACID SEQUENCES < .end DIRECTORY
#alternative og_extract.pl OGNUMBER -s FASTA WITH AMINO ACID SEQUENES < .end DIRECTORY


#raxml command
#"-T" number of nodes
# -f the algorithm "a" rapid Bootstrap analysis
# -m type of database used protein wag the specific database
# -p -x random variable start for parsimony
# -# number of bootstraps
# -s input concatenated file
# -n output name
# raxml -T 12 -f a -m "PROTGAMMAWAG" -p 590 -x 590 -# 100 -s core80.tree.masked.afa -n core80
