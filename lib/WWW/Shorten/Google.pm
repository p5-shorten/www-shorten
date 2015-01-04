=head1 NAME

WWW::Shorten::Google - Perl interface to goo.gl

=head1 SYNOPSIS

  use WWW::Shorten::Google;
  use WWW::Shorten 'Google';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site L<https://goo.gl/>.  Google simply maintains
a database of long URLs, each of which has a unique identifier.

=cut

package WWW::Shorten::Google;

use 5.006;
use strict;
use warnings;

use JSON::PP;
use LWP::Protocol::https;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );
our $VERSION = '1.90';

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the Google API passing
it your long URL and will return the shorter goo.gl version.

=cut

sub makeashorterlink
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $googleapi = 'https://www.googleapis.com/urlshortener/v1/url';
    my $resp = $ua->post($googleapi,
        'Content-Type' => 'application/json',
        'Content' => encode_json({longUrl => $url}),
	);
    return undef unless $resp->is_success;
    my $content = decode_json($resp->content);
    if ($resp->content =~ m!(\Qhttp://goo.gl/\E\w+)!x) {
	return $1;
    }
    return;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full goo.gl URL or just the
goo.gl identifier.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink
{
    my $google_url = shift 
	or croak 'No goo.gl key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $google_url = "http://goo.gl/$google_url"
    unless $google_url =~ m!^http://!i;

    my $resp = $ua->get(
        'https://www.googleapis.com/urlshortener/v1/url'
         . '?shortUrl=' . $google_url
         . '&projection=FULL'
    );

    return undef unless $resp->is_success;
    my $data = decode_json($resp->content);
    return $data->{longUrl};
}

1;

__END__

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Michiel Beijen <michiel.beijen@gmail.com>

=head1 SEE ALSO

L<WWW::Shorten>, L<https://goo.gl/>,
L<https://developers.google.com/url-shortener/>

=cut
