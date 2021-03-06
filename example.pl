#!/usr/bin/perl

use Getopt::Long;
use JSON;

# import environment varialbes & input data
my %args = extractArgs();
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

  foreach my $env_name ("OPWIRE_EDITION", "OPWIRE_REQUEST", "OPWIRE_SETTINGS") {
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

sub extractArgs {
  my $format = 'json';
  my $input_format = '';
  my $output_format = '';

  GetOptions(
      "format=s" => \$format,
      "input-format=s"   => \$input_format,
      "output-format=s"  => \$output_format
  ) or die ("ERROR: Invalid options declaration!");

  $format = "json" if (length $format == 0);
  $input_format = $format if (length $input_format == 0);
  $output_format = $format if (length $output_format == 0);

  return ("input-format" => $input_format, "output-format" => $output_format);
}
