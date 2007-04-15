# $Id$

=head1 NAME

WWW::Shorten::OneShortLink - Perl interface to 1sl.net

=head1 SYNOPSIS

  use WWW::Shorten::OneShortLink;

  use WWW::Shorten 'OneShortLink';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site 1sl.net. OneShortLink simply maintains
a database of long URLs, each of which has a unique identifier.

=cut

package WWW::Shorten::OneShortLink;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = '1.93';

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the OneShortLink web site passing it
your long URL and will return the shorter OneShortLink version.

=cut

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();

    my $resp  = $ua->post( 'http://1sl.net/', [
	rurl => $url,
	] );

    return unless $resp->is_success;
    return if $resp->content =~ />Operation Failed!/;

    if ($resp->content =~ m!
	\Qyour Short Link\E
	<[^>]*> \s* <[^>]*>
	<a \s+ href="[^"]+">
	( \Qhttp://1sl.net/\E [^<]* )
	</a>
	!x) {
	return $1;
    }

    return; 
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full OneShortLink URL or just the
OneShortLink identifier.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $short_url = shift 
	or croak '1 Short Link ID / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $short_url = "http://1sl.net/$short_url"
    unless $short_url =~ m!^http://!i;

    my $resp = $ua->get($short_url);

    return unless $resp->is_success;

    if ($resp->content =~ m!<meta HTTP-EQUIV="Refresh" CONTENT="[0-9]+\; URL=(.*)"!i) {
        return $1;
    }

    return;
}
1;

__END__

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Maintained by Iain Truskett <spoon@cpan.org>

Original by P J Goodwin.

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://1sl.net/>

=cut
