package WWW::Shorten::BabyURL;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.86";

use Carp;

# POST http://babyurl.com/index.php?bu_op=createurl
#   bu_url=                         (textarea)
#   Submit=Make BabyURL             (submit)

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $resp = $ua->post( 'http://babyurl.com/index.php?bu_op=createurl' , [
        bu_url => $url,
        Submit => 'Make BabyURL',
        ],
    );
    return unless $resp->is_success;
    if ($resp->content =~ m!
        \Q<input type="hidden" name="babyurl" value="\E
        (http://babyurl\.com/\w+)
        \Q">\E
	!x) {
	return $1;
    }
    return;
}

sub makealongerlink ($)
{
    my $code = shift
	or croak 'No BabyURL nickname/URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $code = "http://babyurl.com/$code" unless $code =~ m!^http://!i;

    my $resp = $ua->get($code);
    my $location = $resp->header('Location');
    return $location if defined $location;
    return;
}

1;

__END__

=head1 NAME

WWW::Shorten::BabyURL - Perl interface to BabyURL.com

=head1 SYNOPSIS

  use WWW::Shorten 'BabyURL';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);
  $long_url  = makealongerlink($nickname);

=head1 DESCRIPTION

A Perl interface to the web site BabyURL.com.  BabyURL.com simply maintains
a database of long URLs, each of which has a unique identifier.

The function C<makeashorterlink> will call the BabyURL.com web site passing it
your long URL and will return the shorter (BabyURL) version.

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full BabyURL URL or just the
BabyURL identifier/nickname.

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

L<WWW::Shorten>, L<perl>, L<http://BabyURL.com/>

=cut
