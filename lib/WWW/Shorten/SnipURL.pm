# $Id$

=head1 NAME

WWW::Shorten::SnipURL - Perl interface to SnipURL.com

=head1 SYNOPSIS

  use WWW::Shorten::SnipURL;

  use WWW::Shorten 'SnipURL';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web service SnipURL.com. SnipURL maintains a
database of long URLs, each of which has a unique identifier or
nickname. For more features, please visit http://snipurl.com/features

=cut

package WWW::Shorten::SnipURL;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = '1.91';

use Carp;
use URI;

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the SnipURL web site passing it
your long URL and will return the shorter SnipURL version. If used in a
list context, then it will return both the Snip URL and the password.

=cut

sub makeashorterlink ($;%)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my ($nick, $pass) = @_;
    my $snipurl = "http://snipurl.com/site/snip?r=simple&link=$url";
    $snipurl .= "&snipnick=$nick" if defined $nick;
    $snipurl .= "&snippk=$pass" if defined $pass;
    my $resp = $ua->get($snipurl);

    return unless $resp->is_success;
    return $resp->content;
}

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full Snip URL or just the
SnipURL identifier.

If anything goes wrong, then either function will return C<undef>.

=cut

sub makealongerlink ($)
{
    my $code = shift 
	or croak 'No SnipURL key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $code =~ s{^ http:// .* / }{}x;
    my $snipurl_url = URI->new('http://snipurl.com/resolveurl');
    $snipurl_url->query_form(
	id => $code,
    );

    my $resp = $ua->get($snipurl_url);
    return undef unless $resp->is_success;

    my $content = $resp->content;
    return undef if $content eq 'ERROR';
    return $content;
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

L<WWW::Shorten>, L<perl>, L<http://snipurl.com/>

=cut
