package WWW::Shorten::TinyClick;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.88";

use Carp;
use URI;

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $uri = URI->new('http://tinyclick.com/MakeLinkSmaller.cfm');

    $uri->query_form(
	LongLink => $url,
    );
    my $resp  = $ua->get( $uri );
    return unless $resp->is_success;
    if ($resp->content =~ m!
	(\Qhttp://tinyclick.com/?\E\w+)
	!x) {
	return $1;
    }
    return;
}

sub makealongerlink ($)
{
    my $tiny_url = shift 
	or croak 'No TinyClick key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $tiny_url =~ s{ ^\Qhttp://tinyclick.com/\E \?? }{}x;
    $tiny_url = "http://tinyclick.com/?$tiny_url"
    unless $tiny_url =~ m!^http://!i;

    my $resp = $ua->get($tiny_url);
    return undef unless $resp->is_redirect;
    my $url = $resp->header('Location');
    return $1 if $url =~ m[(http://.*$)];
    return;

}

1;

__END__

=head1 NAME

WWW::Shorten::TinyClick - Perl interface to tinyclick.com

=head1 SYNOPSIS

  use WWW::Shorten::TinyClick;

  use WWW::Shorten 'TinyClick';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site tinyclick.com.  TinyClick simply
maintains a database of long URLs, each of which has a unique
identifier.

The function C<makeashorterlink> will call the TinyClick web site
passing it your long URL and will return the shorter TinyClick version.

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full TinyClick URL or just the
TinyClick identifier.

If anything goes wrong, then either function will return C<undef>.

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://tinyclick.com/>

=cut
