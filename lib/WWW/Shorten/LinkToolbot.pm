package WWW::Shorten::LinkToolbot;

use strict;
use warnings;

our $VERSION = '3.090';
$VERSION = eval $VERSION;

require WWW::Shorten::_dead;

1;

=head1 NAME

WWW::Shorten::LinkToolbot - Perl interface to link.toolbot.com

=head1 SYNOPSIS

    # No appropriate synopsis.

=head1 DESCRIPTION

A Perl interface to the web site link.toolbot.com.

Unfortunately, this service became inactive at some point between 1.89
and 1.90, so this module will merely give you an error if you try to use
it. Feel free to pick a different L<service|WWW::Shorten>.

=cut
