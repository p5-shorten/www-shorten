# $Id$

=head1 NAME

WWW::Shorten::NotLong - Perl interface to notlong.com

=head1 SYNOPSIS

  use WWW::Shorten 'NotLong';

  $short_url = makeashorterlink($long_url);
  $short_url = makeashorterlink($long_url, nickname => $nickname);
  ($short_url,$password) = makeashorterlink($long_url);
  ($short_url,$password) = makeashorterlink($long_url, nickname => $nickname);

  $long_url  = makealongerlink($short_url);
  $long_url  = makealongerlink($nickname);

=head1 DESCRIPTION

A Perl interface to the web site notlong.com.  Notlong.com simply maintains
a database of long URLs, each of which has a unique identifier.

=cut

package WWW::Shorten::NotLong;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = '1.90';

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the notlong.com web site passing it
your long URL and will return the shorter (notlong) version. If used in a
list context, then it will return both the notlong URL and the password.

If you pass a nickname, the notlong service will use your provided
(alpha-numeric) string as the unique identifier, provided that it has
not already been assigned previously.

Note that notlong.com, unlike TinyURL and MakeAShorterLink, returns a
unique code for every submission.

=cut

sub makeashorterlink ($;%)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my %args = @_;
    my $nickname = delete $args{'nickname'} || 'ws-' . $$ . int rand 100;
    my $notlong = 'http://notlong.com/';
    my $resp = $ua->post($notlong, [
	url => $url,
	nickname => $nickname,
	]);
    return unless $resp->is_success;
    if ($resp->content =~ m!
	notlong \s+ URL:
        .*?
        <a \s+ href="[^"]+">
	(http://[^.]+\.notlong\.com)
	</a>
        .*?
	Password:
	\s+
	([-\w]+)
	!xs) {
	return wantarray ? ($1, $2) : $1;
    }
    return;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full notlong URL or just the
notlong identifier/nickname.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $notlong_url = shift
	or croak 'No notlong nickname/URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $notlong_url = "http://$notlong_url.notlong.com/"
    unless $notlong_url =~ m!^http://!i;

    my $resp = $ua->get($notlong_url);

    return undef unless $resp->is_redirect;
    my $url = $resp->header('Location');
    return $url;
}

1;

__END__

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Eric Hammond <ehammond@thinksome.com>

Based almost entirely on WWW::Shorten::Shorl by Iain Truskett <spoon@cpan.org>
which was based on WWW::MakeAShorterLink by Dave Cross <dave@dave.org.uk>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://notlong.com/>

=cut
