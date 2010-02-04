#!/usr/bin/perl

use strict;
use warnings;

#use lib '/home/naveen/workspace/Twilio/';
use twilio;

my $response = new TwilioResponse();

# Using Verbs
# Writes: <Say>Works!</Say>
$response->Say('Works!');

# Some verbs don't need stuff b/w tags but can have nouns
# Writes <Pause length=5"></Pause>
$response->Pause( 'length' => 5 );

# Including extra parameters. Read twilio's documentation
# Writes: <Say voice="woman" loop="3">Works!</Say>
$response->Say(
    'Works!',
    'voice' => 'woman',
    'loop'  => 3
);

# Another example like above. 
# Writes: <SMS status="/shouldwork.php">testing</SMS>
$response->SMS( 'testing', 'status' => '/shouldwork.php' );

# What if you want to nest Twilio Verbs inside other Verbs?
# This is important for Conference calls which
# have to be nested inside <Dial>
# Writes: <Dial><Conference>1234</Conference></Dial>
$response->Dial(
    [ $response->GetVerb( TwilioResponse::V_CONFERENCE, '1234' ) ] );

# Nesting is also important for Gather verb with parameters.
# Writes: <Gather numDigits="1" action="/post_button_pressed_script.php">
# <Say>Thank you for volunteering</Say><Pause></Pause><Say>Go on.
# Press something</Say></Gather>
$response->Gather(
    [
        $response->GetVerb( TwilioResponse::V_SAY, 'Thank you for volunteering'
        ),
        $response->GetVerb(TwilioResponse::V_PAUSE),
        $response->GetVerb( TwilioResponse::V_SAY, 'Go on. Press something' )
    ],
    'action'    => '/post_button_pressed_script.php',
    'numDigits' => 1
);

# Closes the XML tag and outputs it.
$response->Respond();

1;
__END__
