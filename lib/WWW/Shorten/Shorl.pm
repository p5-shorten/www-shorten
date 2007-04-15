# $Id$

=head1 NAME

WWW::Shorten::Shorl - Perl interface to shorl.com

=head1 SYNOPSIS

  use WWW::Shorten::Shorl;

  use WWW::Shorten 'Shorl';

  $short_url = makeashorterlink($long_url);
  ($short_url,$password) = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site shorl.com.  Shorl simply maintains
a database of long URLs, each of which has a unique identifier.

=cut

package WWW::Shorten::Shorl;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = '1.91';

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the Shorl web site passing it
your long URL and will return the shorter Shorl version. If used in a
list context, then it will return both the Shorl URL and the password.

Note that Shorl, unlike TinyURL and MakeAShorterLink, returns a unique code
for every submission.

=cut

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $shorl = 'http://shorl.com/create.php';
    my $resp = $ua->post($shorl, [ url => $url ]);
    return unless $resp->is_success;
    if ($resp->content =~ m!
	\QShorl:\E
	\s+
	<a \s+ href="http://shorl.com/\w+"\s+rel="nofollow">
	(\Qhttp://shorl.com/\E\w+)
	</a>.*
	<br>
	[\r\n\s]*
	\QPassword:\E
	\s+
	(\w+)
	!x) {
	return wantarray ? ($1, $2) : $1;
    }
    return;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full Shorl URL or just the
Shorl identifier.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $shorl_url = shift 
        or croak 'No Shorl key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $shorl_url = "http://shorl.com/$shorl_url"
    unless $shorl_url =~ m!^http://!i;

    my $resp = $ua->get($shorl_url);

    return if $resp->is_error;
    my ($url) = $resp->content =~ /URL=(.+)\"/;
    return $url;
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

L<WWW::Shorten>, L<perl>, L<http://shorl.com/>

=cut
