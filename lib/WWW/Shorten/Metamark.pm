# $Id$

=head1 NAME

WWW::Shorten::Metamark - Perl interface to metamark.net

=head1 SYNOPSIS

  use WWW::Shorten::Metamark;

  use WWW::Shorten 'Metamark';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site metamark.net. Metamark simply maintains
a database of long URLs, each of which has a unique identifier.

=cut

package WWW::Shorten::Metamark;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = '1.91';

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the Metamark web site passing it
your long URL and will return the shorter Metamark version.

=cut

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $resp  = $ua->post( 'http://metamark.net/api/rest/simple', [
        long_url => $url,
    ] );
    return unless $resp->is_success;
    return if $resp->content =~ /^ERROR:/;
    # I love REST. It's so simple when done properly.
    return $resp->content;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full Metamark URL or just the
Metamark identifier.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $short_url = shift 
	or croak 'No Metamark key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    my $resp  = $ua->post( 'http://metamark.net/api/rest/simple', [
        short_url => $short_url,
    ] );
    return unless $resp->is_success;
    return if $resp->content =~ /^ERROR:/;
    # I love REST. It's so simple when done properly.
    return $resp->content;
}

1;

__END__

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>

Based on WWW::MakeAShorterLink by Dave Cross <dave@dave.org.uk>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://metamark.net/>

=cut
