package WWW::Shorten::SmLnk;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.84";

use Carp;

sub _call
{
    my ($key, $value) = @_;
    my $ua = __PACKAGE__->ua();
    my $resp = $ua->post( 'http://smlnk.com/client.php', [
	$key, $value
	]);
    return unless $resp->is_success;
    chomp( my $link = $resp->content );
    return unless defined $link;
    return $link;
}

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    return _call( 'url' => $url );
}

sub makealongerlink ($)
{
    my $url = shift or croak 'No SmLnk key / URL passed to makealongerlink';
    $url =~ s{^http://(www\.)?smlnk\.com/}{};
    return _call( 'key' => $url );
}

1;

__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

WWW::Shorten::SmLnk - Perl interface to SmLnk.com

=head1 SYNOPSIS

  use WWW::Shorten::SmLnk;

  use WWW::Shorten 'SmLnk';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web service SmLnk.com. SmLnk maintains a
database of long URLs, each of which has a unique identifier or
nickname.

The function C<makeashorterlink> will call the SmLnk web site passing it
your long URL and will return the shorter SmLnk version.

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full SmLnk URL or just the SmLnk
identifier.

If anything goes wrong, then either function will return C<undef>.

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://smlnk.com/>

=cut
