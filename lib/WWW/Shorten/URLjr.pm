package WWW::Shorten::URLjr;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.86";

use Carp;

# POST http://urljr.com/shrink
#   txtURL=
#   Submit=Make it Jr.!             (submit)


sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $resp = $ua->post( 'http://urljr.com/shrink' , [
        txtURL => $url,
        Submit => 'Make it Jr.',
        ],
    );
    return unless $resp->is_success;
    if ($resp->content =~ m!
        \Q<a href="\E
        (http://urljr\.com/\w+)
        \Q">http://urljr.com/\E\w+</a>
	!x) {
	return $1;
    }
    return;
}

sub makealongerlink ($)
{
    my $code = shift
	or croak 'No URLjr nickname/URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $code = "http://urljr.com/$code" unless $code =~ m!^http://!i;

    my $resp = $ua->get($code);
    return unless $resp->is_success;
    my ($url) = $resp->content =~ m!
        \Qdocument.location.href = "\E
        (.*)
        \Q";\E
    !x;
    return $url if defined $url;
    return;
}

1;

__END__

=head1 NAME

WWW::Shorten::URLjr - Perl interface to URLjr.com

=head1 SYNOPSIS

  use WWW::Shorten 'URLjr';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);
  $long_url  = makealongerlink($nickname);

=head1 DESCRIPTION

A Perl interface to the web site URLjr.com.  URLjr.com simply maintains
a database of long URLs, each of which has a unique identifier.

The function C<makeashorterlink> will call the URLjr.com web site passing it
your long URL and will return the shorter (URLjr) version.

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full URLjr URL or just the
URLjr identifier/nickname.

If anything goes wrong, then either function will return C<undef>.

Multiple submissions of the same URL will result in the same code being
returned.

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://URLjr.com/>

=cut
