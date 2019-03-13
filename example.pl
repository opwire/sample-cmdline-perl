#!/usr/bin/perl

use JSON;

my $decoder = JSON->new->utf8;
my $encoder = JSON->new->utf8->pretty;

my %store = ();

my $input = "";
foreach my $line (<STDIN>) {
  $input .= $line;
}

if (length $input > 0) {
  $store{"input"} = $decoder->decode($input);
}

my $json_text = $encoder->encode(\%store);

print "$json_text\n";
