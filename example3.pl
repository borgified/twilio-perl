#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

#use lib '/home/naveen/workspace/Twilio/';
use twilio;

my $response = new TwilioResponse();

my $msg = "Works!";

if ($response->CheckSMS($msg)) {
  $response->SMS($msg);
}

$response->Respond();


1;
__END__

