#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use twilio;

# Put in your info provided by Twilio!
my $sid = 'ur sid'; 
my $token = 'ur token';

# SourcePhone is the one
my $sourcePhone = '5551112222'; # number to display on callerid, must validate w/ Twilio
my $destPhone = '5553334444'; # number to dial

my $req = new TwilioRestClient($sid, $token);

my $res = $req->request(
		'/2008-08-01/Accounts/'. $sid . '/Calls',
		'POST',
		{
		 'Caller'	=> $sourcePhone,
		 'Called'	=> $destPhone,
		 'Url'		=> 'http://demo.twilio.com/welcome'
		}
	);

print Dumper($res);

1;
__END__
