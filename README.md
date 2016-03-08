# NAME

WWW::Shorten - Interface to URL shortening sites.
[![Build Status](https://travis-ci.org/p5-shorten/www-shorten.svg?branch=master)](https://travis-ci.org/p5-shorten/www-shorten)

# SYNOPSIS

```perl
use WWW::Shorten 'Linkz';
use WWW::Shorten 'MakeAShorterLink';
use WWW::Shorten 'NotLong';
use WWW::Shorten 'OneShortLink';
use WWW::Shorten 'Shorl';
use WWW::Shorten 'TinyClick';
use WWW::Shorten 'TinyLink';
use WWW::Shorten 'TinyURL';

# Individual modules have have their
# own syntactic variations.

# See the documentation for the particular
# module you intend to use for details, trips
# and traps.

$short_url = makeashorterlink($long_url);

$long_url  = makealongerlink($short_url);

# If you don't like the function names:
use WWW::Shorten 'TinyURL', ':short';
$short_url = short_link( $long_url );
$long_url = long_link( $short_url );
```

# ABSTRACT

A Perl interface to URL shortening sites. These sites maintain
databases of long URLs, each of which has a unique identifier.

# DESCRIPTION

The function `makeashorterlink` will call the relevant web site
passing it your long URL and will return the shorter version.

The function `makealongerlink` does the reverse. `makealongerlink`
will accept as an argument either the full shortened URL or just the
identifier.

If anything goes wrong, then either function will return `undef`.

# Subroutines

## import

Called when the module is `use`d. Loads the correct sub-module

## EXPORT

makeashorterlink, makealongerlink

Or, if you specify `:short` on the import line, you instead
get `short_link` and `long_link`. If you explicitly want the
default set, use `:default`.

Actually these functions are exported from the relevant subclass.

# COMMAND LINE PROGRAM

A very simple program called `shorten` is supplied in the
distribution's `bin` folder. This program takes a URL and
gives you a shortened version of it.

# EXAMPLES and PROGRAMS

Adam Kessel wrote [shorlfilter](http://adam.rosi-kessel.org/weblog/2003/09/07/shorlfilter), a program that uses [WWW::Shorten](https://metacpan.org/pod/WWW::Shorten)
to filter a file, converting long URLs to short ones.

There is also a `bin` directory in this distribution which contains a
sample program.

# NO LONGER SUPPORTED

The URL-shortening industry is pretty volatile. Many sites exist for a
while and then go away. The most famous of those is probably Make A Shorter
Link (the site that originally inspired this suite of modules). MASL has
been acquired by TinyURL.com and no longer exists.

Here is a list of sites that were once supported by this module and are no
longer with us:

- MakeAShorterLink
- BabyURL
- EkDk
- Metamark
- qURL (although the differently capitalised Qurl.com now uses their old domain)
- ShortLink
- SmLnk
- URLjr
- V3

See Joshua Schachter's blog entry at
[http://joshua.schachter.org/2009/04/on-url-shorteners.html](http://joshua.schachter.org/2009/04/on-url-shorteners.html) for some
very interesting discussion on some problems that can be caused by the
volatility of this part of the web industry.

# RELATED MODULES

## Similar Aim

[WWW::MakeAShorterLink](https://metacpan.org/pod/WWW::MakeAShorterLink) is what this module was originally based upon.
That module is obsoleted by [WWW::Shorten::MakeAShorterLink](https://metacpan.org/pod/WWW::Shorten::MakeAShorterLink), one of
the many subclasses of [WWW::Shorten](https://metacpan.org/pod/WWW::Shorten). Of course, with the demise of
Make A Shorter Link, neither the obsolete module nor its replacement are
of any use.

## Same Area, Different Purpose

[CGI::Shorten](https://metacpan.org/pod/CGI::Shorten) provides building blocks for you to create your own URL
shortening service. It provides routines to shorten a URL, lengthen one,
and it keeps a store. Nice and easy.

# THANKS

Dave Cross for [WWW::MakeAShorterLink](https://metacpan.org/pod/WWW::MakeAShorterLink)

Alex Page for the original LWP hacking on which Dave based his code.

Simon Batistoni for giving the `makealongerlink` idea to Dave.

Eric Hammond for writing the NotLong variant.

Shashank Tripathi &lt;shank@shank.com> for providing both SnipURL.com and
advice on the module.

Kevin Gilbertson (Gilby) supplied information on the TinyURL API.

Matt Felsen (mattf) wanted shorter function names.

Ask Bjoern Hansen for providing both Metamark.net and advice on the
module.

Martin Thurn for helping me notice a bug and for a suggestion regarding
`MASL.pm`.

Jon and William (jon and wjr at smlnk.com respectively) for providing
SmLnk.com.

P J Goodwin for providing the code for [WWW::Shorten::OneShortLink](https://metacpan.org/pod/WWW::Shorten::OneShortLink).

And especial thanks to all providers of these services.

# BUGS, REQUESTS, COMMENTS

Support for this module is supplied using the CPAN RT system via the web
or email:

http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten
( shorter URL: http://xrl.us/rfb )

&lt;bug-www-shorten@rt.cpan.org>

This makes it much easier for me to track things and thus means
your problem is less likely to be neglected.

# LICENCE AND COPYRIGHT

[WWW::Shorten::NotLong](https://metacpan.org/pod/WWW::Shorten::NotLong) copyright (c) Eric Hammond &lt;ehammond@thinksome.com>.

Other modules copyright (c) Magnum Solutions Ltd., 2007. All rights
reserved.

This module is free software.  You can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

This program is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

# AUTHOR

Original Iain Truskett &lt;spoon@cpan.org>

Based on WWW::MakeAShorterLink by Dave Cross &lt;dave@mag-sol.com>

In 2004 Dave Cross took over the maintenance of this distribution
following the death of Iain Truskett.

In 2016, Chase Whitener took over the maintenance of this distribution.

# SEE ALSO

[perl](https://metacpan.org/pod/perl), [CGI::Shorten](https://metacpan.org/pod/CGI::Shorten).
