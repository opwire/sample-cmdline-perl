#!/usr/bin/perl

use JSON;

# import environment varialbes & input data
my %args = ("input-format" => "json", "output-format" => "json");
my $store = bootstrap(\%args);

# body of program: processing something here
# .....

# suppose the $store is output in this example
my $encoder = JSON->new->utf8->pretty;
if ($args{"output-format"} eq "json") {
  my $output = $encoder->encode($store);
  print "$output";
} else {
  foreach $key (keys $store) {
    printf("%s:\n", uc $key);
    my $data = $store->{$key};
    my $type = ref($data);
    if ($type eq 'HASH' or $type eq 'ARRAY') {
      print $encoder->encode($data);
    } else {
      print $data;
    }
    print "\n\n";
  }
}

# ------------------------------------------------------ subroutines

sub bootstrap {
  my $args = @_[0];
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
    $store{"input"} = $input;
    if ($args{"input-format"} eq "json") {
      $store{"input"} = $decoder->decode($input);
    }
  }

  return \%store;
}
