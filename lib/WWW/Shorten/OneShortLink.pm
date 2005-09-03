# $Id$
package WWW::Shorten::OneShortLink;

use strict;
use warnings;

our $VERSION = sprintf "%d.%02d", '$Revision$ ' =~ /(\d+)\.(\d+)/;
require WWW::Shorten::_dead;

0;
__END__

=head1 NAME

WWW::Shorten::OneShortLink - Perl interface to 1sl.net

=head1 SYNOPSIS

    # No appropriate synopsis.

=head1 DESCRIPTION

A Perl interface to the web site 1sl.net.

Unfortunately, this service became inactive at some point between 1.89
and 1.90, so this module will merely give you an error if you try to use
it. Feel free to pick a different L<service|WWW::Shorten>.

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>, Dave Cross <dave@dave.org.uk>

Original by P J Goodwin.

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://1sl.net/>

=cut
