#!/usr/bin/perl

use JSON;

my $store = bootstrap();

my $encoder = JSON->new->utf8->pretty;
my $output = $encoder->encode($store);

print "$output\n";

sub bootstrap() {
  my $decoder = JSON->new->utf8;
  my %store = ();

  foreach my $env_name ("OPWIRE_REQUEST", "OPWIRE_SETTING") {
    if (exists $ENV{$env_name}) {
      $env_data = $ENV{$env_name};
      $store{$env_name} = $decoder->decode($env_data);
    }
  }

  my $input = "";
  foreach my $line (<STDIN>) {
    $input .= $line;
  }

  if (length $input > 0) {
    $store{"input"} = $decoder->decode($input);
  }

  return \%store;
}
