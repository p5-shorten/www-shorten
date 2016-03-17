package WWW::Shorten;

use 5.006;
use strict;
use warnings;

use base qw(WWW::Shorten::generic);
use Carp ();

our $DEFAULT_SERVICE = 'TinyURL';
our @EXPORT          = qw(makeashorterlink makealongerlink);
our $VERSION         = '3.090';
$VERSION = eval $VERSION;

my $style;

sub import {
    my $class = shift;
    $style = shift;
    $style = $DEFAULT_SERVICE unless defined $style;
    my $package = "${class}::${style}";
    eval {
        my $file = $package;
        $file =~ s/::/\//g;
        require "$file.pm";
    };
    Carp::croak($@) if $@;
    $package->import(@_);
}

1;

=head1 NAME

WWW::Shorten - Interface to URL shortening sites.

=head1 SYNOPSIS

  #!/usr/bin/env perl
  use strict;
  use warnings;

  use WWW::Shorten 'TinyURL'; # Recommended
  # use WWW::Shorten 'Linkz'; # or one of the others
  # use WWW::Shorten 'Shorl';

  # Individual modules have have their own syntactic variations.
  # See the documentation for the particular module you intend to use for details

  my $url = 'https://metacpan.org/pod/WWW::Shorten';
  my $short_url = makeashorterlink($url);
  my $long_url  = makealongerlink($short_url);

  # - OR -
  # If you don't like the long function names:

  use WWW::Shorten 'TinyURL', ':short';
  my $short_url = short_link($url);
  my $long_url = long_link( $short_url );

=head1 DESCRIPTION

A Perl interface to various services that shorten URLs. These sites maintain
databases of long URLs, each of which has a unique identifier.

=head1 COMMAND LINE PROGRAM

A very simple program called F<shorten> is supplied in the
distribution's F<bin> folder. This program takes a URL and
gives you a shortened version of it.

=head1 BUGS, REQUESTS, COMMENTS

Please submit any L<issues|https://github.com/p5-shorten/www-shorten/issues> you
might have.  We appreciate all help, suggestions, noted problems, and especially patches.

Support for this module is supplied primarily via the using the
L<GitHub Issues|https://github.com/p5-shorten/www-shorten/issues> but we also
happily respond to issues submitted to the
L<CPAN RT|http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten> system via the web
or email: C<bug-www-shorten@rt.cpan.org>

* https://github.com/p5-shorten/www-shorten/issues
* http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten
* ( shorter URL: http://xrl.us/rfb )
* C<bug-www-shorten@rt.cpan.org>

=head1 AUTHOR

Iain Truskett C<spoon@cpan.org>

=head1 CONTRIBUTORS

=over

=item *

Dave Cross dave@perlhacks.com -- Authored L<WWW::MakeAShorterLink> on which this was based

=item *

Alex Page -- for the original LWP hacking on which Dave based his code.

=item *

Simon Batistoni -- giving the `makealongerlink` idea to Dave.

=item *

Eric Hammond -- writing L<WWW::Shorten::NotLong>

=item *

Shashank Tripathi C<shank@shank.com> -- for providing L<WWW::Shorten::SnipURL>

=item *

Kevin Gilbertson (Gilby) -- TinyURL API information

=item *

Matt Felsen (mattf) -- shorter function names

=item *

Ask Bjoern Hansen -- providing L<WWW::Shorten::Metamark>

=item *

Martin Thurn -- bug fixes

=item *

Jon and William (wjr) -- smlnk services

=item *

PJ Goodwin -- code for L<WWW::Shorten::OneShortLink>

=item *

Kazuhiro Osawa C<yappo@cpan.org>

=item *

Chase Whitener C<capoeirab@cpan.org>

=item *

Everyone else we might have missed.

=back

In 2004 Dave Cross took over the maintenance of this distribution
following the death of Iain Truskett.

In 2016, Chase Whitener took over the maintenance of this distribution.

=head1 LICENSE AND COPYRIGHT

This module is free software.  You can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

This program is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=head1 SEE ALSO

L<CGI::Shorten>, L<WWW::Shorten::Simple>

=cut
