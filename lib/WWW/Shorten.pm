package WWW::Shorten;

use 5.006;
use strict;
no strict 'refs';
use warnings;

use base qw( WWW::Shorten::generic );
our @EXPORT = qw(makeashorterlink makealongerlink);
our $VERSION = "1.88";

use Carp;

my $style;

sub import
{
    my $class = shift;
    $style = shift;
    $style = 'Metamark' unless defined $style;
    my $package = "${class}::${style}";
    eval {
	my $file = $package;
	$file =~ s/::/\//g;
	require "$file.pm";
    };
    croak $@ if $@;
    $package->import( @_ );
}

sub makeashorterlink ($;@)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    return "WWW::Shorten::${style}::makeashorterlink"->($url, @_);
}

sub makealongerlink ($) {
    my $code = shift 
	or croak 'No key / URL passed to makealongerlink';
    return "WWW::Shorten::${style}::makealongerlink"->($code);
}

1;

__END__

=head1 NAME

WWW::Shorten - Interface to URL shortening sites.

=head1 SYNOPSIS

  use WWW::Shorten 'BabyURL';
  use WWW::Shorten 'Linkz';
  use WWW::Shorten 'MakeAShorterLink';
  use WWW::Shorten 'Metamark';
  use WWW::Shorten 'NotLong';
  use WWW::Shorten 'OneShortLink';
  use WWW::Shorten 'Shorl';
  use WWW::Shorten 'SmLnk';
  use WWW::Shorten 'SnipURL';
  use WWW::Shorten 'TinyClick';
  use WWW::Shorten 'TinyLink';
  use WWW::Shorten 'TinyURL';
  use WWW::Shorten 'URLjr';
  use WWW::Shorten 'V3';

  # These 3 are now inactive and will give an
  # error if you try to use them.
  use WWW::Shorten 'EkDk';
  use WWW::Shorten 'qURL';
  use WWW::Shorten 'ShortLink';

  # Individual modules have have their
  # own syntactic varations.

  # See the documentation for the particular
  # module you intend to use for details, trips
  # and traps.

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

  # If you don't like the function names:
  use WWW::Shorten 'SnipURL', ':short';
  $short_url = short_link( $long_url );
  $long_url = long_link( $short_url );

=head1 ABSTRACT

A Perl interface to URL shortening sites. These sites maintain
databases of long URLs, each of which has a unique identifier.

=head1 DESCRIPTION

The function C<makeashorterlink> will call the relevant web site
passing it your long URL and will return the shorter version.

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full shortened URL or just the
identifier.

If anything goes wrong, then either function will return C<undef>.

=head2 EXPORT

makeashorterlink, makealongerlink

Or, if you specify C<:short> on the import line, you instead
get C<short_link> and C<long_link>. If you explicitly want the
default set, use C<:default>.

=head1 COMMAND LINE PROGRAM

A very simple program called F<shorten> is supplied in the
distribution's F<bin> folder. This program takes a URL and
gives you a shortened version of it.

=head1 EXAMPLES and PROGRAMS

Adam Kessel wrote F<shorlfilter>, a program that uses C<WWW::Shorten>
to filter a file, converting long URLs to short ones.

    http://bostoncoop.net/adam/shorlfilter

There is also a F<bin> directory in this distribution which contains a
sample program.

=head1 FURTHER INFORMATION

http://dellah.org/shorten/ has a collection of related
resources: articles, services, programs (both to use services
and to run services). It's a Wiki --- feel free to edit it.

=head1 RELATED MODULES

=head2 Similar Aim

L<WWW::MakeAShorterLink> is what this module was originally based upon.
That module is obsoleted by L<WWW::Shorten::MakeAShorterLink>, one of
the many subclasses of L<WWW::Shorten>.

=head2 Same Area, Different Purpose

L<CGI::Shorten> provides building blocks for you to create your own URL
shortening service. It provides routines to shoretn a URL, lengthen one,
and it keeps a store. Nice and easy.

=head1 THANKS

Dave Cross for L<WWW::MakeAShorterLink>

Alex Page for the original LWP hacking on which Dave based his code.

Simon Batistoni for giving the C<makealongerlink> idea to Dave.

Eric Hammond for writing the NotLong variant.

Shashank Tripathi <shank@shank.com> for providing both SnipURL.com and
advice on the module.

Kevin Gilbertson (Gilby) supplied information on the TinyURL API.

Matt Felsen (mattf) wanted shorter function names.

Ask Bjoern Hansen for providing both Metamark.net and advice on the
module.

Martin Thurn for helping me notice a bug and for a suggestion regarding
F<MASL.pm>.

Jon and William (jon and wjr at smlnk.com respectively) for providing
SmLnk.com.

P J Goodwin for providing the code for L<WWW::Shorten::OneShortLink>.

And especial thanks to all providers of these services.

=head1 BUGS, REQUESTS, COMMENTS

Support for this module is provided via the datetime@perl.org email
list. See http://lists.perl.org/ for more details.

Alternatively, log them via the CPAN RT system via the web or email:

    http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten
    ( shorter URL: http://xrl.us/rfb )

    bug-www-shorten@rt.cpan.org

This makes it much easier for me to track things and thus means
your problem is less likely to be neglected.

=head1 LICENCE AND COPYRIGHT

WWW::Shorten::NotLong copyright E<copy> Eric Hammond <ehammond@thinksome.com>.

WWW::Shorten::MakeAShorterLink copyright E<copy> Dave Cross <dave@dave.org.uk>.

Other modules copyright E<copy> Iain Truskett, 2002-2003. All rights
reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.000 or,
at your option, any later version of Perl 5 you may have available.

The full text of the licences can be found in the F<Artistic> and
F<COPYING> files included with this module, or in L<perlartistic> and
L<perlgpl> as supplied with Perl 5.8.1 and later.

=head1 AUTHOR

Iain Truskett <spoon@cpan.org>

Based on WWW::MakeAShorterLink by Dave Cross <dave@dave.org.uk>

=head1 SEE ALSO

L<perl>, L<CGI::Shorten>.

=cut
