# $Id$

=head1 NAME

WWW::Shorten::Tinylink - Perl interface to Tinylink.com

=head1 SYNOPSIS

  use WWW::Shorten 'Tinylink';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);
  $long_url  = makealongerlink($nickname);

=head1 DESCRIPTION

A Perl interface to the web site Tinylink.com. Tinylink.com simply
maintains a database of long URLs, each of which has a unique
identifier.

=cut

package WWW::Shorten::Tinylink;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = sprintf "%d.%02d", '$Revision$ ' =~ /(\d+)\.(\d+)/;

use Carp;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the Tinylink.com web site
passing it your long URL and will return the shorter (tinylink) version.

Multiple submissions of the same URL will result in different codes
being returned.

=cut

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $resp = $ua->post( 'http://www.digipills.com/tinylink/ajout.php', [
        lurl => $url,
        ],
    );
    return unless $resp->is_success;
    if ($resp->content =~ m!
        \Q<a href="\E(\Qhttp://tinylink.com/?\E\w+)"
	!x) {
	return $1;
    }
    return;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full Tinylink URL or just the
Tinylink identifier/nickname.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $code = shift
	or croak 'No Tinylink nickname/URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    my $short;
    unless ( $code =~ m!^http://!i )
    {
        $short = $code;
        $code = "http://tinylink.com/?$code";
    }
    else
    {
        ($short) = $code =~ /\?(\w+)/;
    }

    my $resp = $ua->get($code);
    while ( my $location = $resp->header('Location') )
    {
        $resp = $ua->get( $location );
    }
    if ( my $refresh = $resp->header('Refresh') )
    {
        return $2 if $refresh =~ m/; *URL=(['"]?)(.*)\1$/i;
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

Iain Truskett <spoon@cpan.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://tinylink.com/>

=cut