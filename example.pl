#!/usr/bin/perl

use JSON;
my $jsonHelper = JSON->new->utf8->pretty;

my %store = ();

my $input = "";
foreach my $line (<STDIN>) {
  $input .= $line;
}

$store{"input"} = $input;

my $json_text = $jsonHelper->encode(\%store);

print "$json_text\n";
