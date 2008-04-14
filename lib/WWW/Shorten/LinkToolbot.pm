# $Id: MakeAShorterLink.pm 48 2007-04-15 15:03:55Z dave $
package WWW::Shorten::LinkToolbot;

use strict;
use warnings;

our $VERSION = '1.90';
require WWW::Shorten::_dead;

0;

__END__

=head1 NAME

WWW::Shorten::LinkToolbot - Perl interface to link.toolbot.com

=head1 SYNOPSIS

    # No appropriate synopsis.

=head1 DESCRIPTION

A Perl interface to the web site link.toolbot.com.

Unfortunately, this service became inactive at some point between 1.89
and 1.90, so this module will merely give you an error if you try to use
it. Feel free to pick a different L<service|WWW::Shorten>.

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>, Dave Cross <dave@mag-sol.com>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>

=cut
