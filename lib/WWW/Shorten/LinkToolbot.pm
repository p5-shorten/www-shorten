package WWW::Shorten::LinkToolbot;

use 5.006;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.89";

use Carp;


sub makeashorterlink  ($;$)
{
  my $remote = 'http://link.toolbot.com/index.php';
  my $url = shift or croak 'No URL provided';
  my $tag = shift || '';
  my $ua = __PACKAGE__->ua();

  my $resp = $ua->post($remote, [ url => $url, action => 'generate']);

  return unless $resp->is_success;

  if ($resp->content =~ m!stored as: <a href='(.*)' class='link'>!) {
      return $1;
  }
  return;
}

sub makealongerlink ($)
{
  my $query = shift or croak 'No key or URL provided';
  my $ua = __PACKAGE__->ua();
  my $url;
  my $redirection_count;

  $query = "http://link.toolbot.com/$query"
    unless $query =~ m!^http://!i;

  my $resp = $ua->get($query);

  ## Other modules have something like this here:
  #    return undef unless $resp->is_success;
  ## This works fine for meta-tag-type redirect. But with a 
  ## true redirect, if the target site is unreachable then 
  ## $resp->is_success will be false -- even though the link
  ## was found in the DB.  We want to give them the URL anyway
  ## so we do not return in this case.  Somebody better with 
  ## Perl could probably find a more robust solution for this.

  return undef 
    if $resp->content =~ m!Can\'t find that one!;

  $url = $resp->header('Location');
  $redirection_count = $resp->header('X-Redirection-Count');
  return wantarray ? ($url, $redirection_count) : $url;
}

1;

__END__

=head1 NAME

WWW::Shorten::LinkToolbot - Perl interface to link.toolbot.com

=head1 SYNOPSIS

  use WWW::Shorten::LinkToolbot;

  use WWW::Shorten 'LinkToolbot';

  $short_url = makeashorterlink("http://example.com/looooong");

  $long_url = makealongerlink($short_url_or_key);
  ($long_url, $hitcount) = makealongerlink($short_url_or_key);
  

=head1 DESCRIPTION

A Perl interface to link.toolbot.com, a link shortening service.

The function C<makeashorterlink> will pass link.toolbot.com your 
long URL and return a (hopefully) shorter version. Shortened links 
are of the form <http://link.toolbot.com/example.com/0000>, where
"example.com" is the target domain (or part of it) a mnemonic tag 
and "0000" is a unique numeric ID. 

The function C<makealongerlink> returns the original URL. It
expects either the full link.toolbot.com URL or just the key (the
"example.com/0000" piece in the above example).

(Note that because tags can no longer be specified manually, a
link.toolbot.com link with a domain name in it is guaranteed to redirect
to that domain -- this is a mild form of spoofing prevention.)

C<makealongerlink> normally returns just the original URL; however, if
the calling context is looking for a list (see above example), a second
value is also returned -- the number of times this URL has been requested
(including the current request).

The tool does not refuse to make multiple (unique) shortened versions
of the same URL, nor does it refuse to generate a URL that is longer
than the original.

For more information, see L<WWW::Shorten>.

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Paul Bissex <pb@toolbot.com>; based on  WWW::Shorten::MakeAShorterLink 
by Dave Cross <dave@dave.org.uk>; bits nicked from other WWW::Shorten modules

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://link.toolbot.com/>

=cut
