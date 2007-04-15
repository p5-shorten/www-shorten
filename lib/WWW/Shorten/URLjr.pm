# $Id$
package WWW::Shorten::URLjr;

use strict;
use warnings;

our $VERSION = '1.91';
require WWW::Shorten::_dead;

0;

__END__

=head1 NAME

WWW::Shorten::URLjr - Perl interface to URLjr.com

=head1 SYNOPSIS

  # No appropriate synopsis

=head1 DESCRIPTION

A Perl interface to the web site URLjr.com.

Unfortunately, this service became inactive at some point between 1.88
and 1.91, so this module will merely give you an error if you try to use
it. Feel free to pick a different L<service|WWW::Shorten>.

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Dave Cross <dave@dave.org.uk> (Previously Iain Truskett <spoon@cpan.org>)

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://URLjr.com/>

=cut
