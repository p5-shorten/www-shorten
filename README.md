# NAME

WWW::Shorten - Interface to URL shortening sites.
[![Build Status](https://travis-ci.org/p5-shorten/www-shorten.svg?branch=master)](https://travis-ci.org/p5-shorten/www-shorten)

# SYNOPSIS

```perl
#!/usr/bin/env perl
use strict;
use warnings;

use WWW::Shorten 'TinyURL'; # Recommended
# use WWW::Shorten 'Linkz'; # or one of the others
# use WWW::Shorten 'Shorl';

# Individual modules have have their own syntactic variations.
# See the documentation for the particular module you intend to use for
#  details, trips and traps.

my $url = 'https://metacpan.org/pod/WWW::Shorten';
my $short_url = makeashorterlink($url);
my $long_url  = makealongerlink($short_url);


# - OR -
# If you don't like the long function names:

use WWW::Shorten 'TinyURL', ':short';
my $short_url = short_link($url);
my $long_url = long_link( $short_url );
```

# DESCRIPTION

A Perl interface to various services that shorten URLs. These sites maintain
databases of long URLs, each of which has a unique identifier.

# COMMAND LINE PROGRAM

A very simple program called `shorten` is supplied in the
distribution's `bin` folder. This program takes a URL and
gives you a shortened version of it.

# ISSUES OR CONTRIBUTIONS

Please submit any [issues](https://github.com/p5-shorten/www-shorten/issues) you
might have.  We appreciate all help, suggestions, noted problems, and especially patches.

Support for this module is supplied primarily via the using the
[GitHub Issues](https://github.com/p5-shorten/www-shorten/issues) but we also
happily respond to issues submitted to the
[CPAN RT](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten) system via the web
or email: &lt;bug-www-shorten@rt.cpan.org>

* https://github.com/p5-shorten/www-shorten/issues
* http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten
* ( shorter URL: http://xrl.us/rfb )
* &lt;bug-www-shorten@rt.cpan.org>

# AUTHOR

Iain Truskett spoon@cpan.org

# CONTRIBUTORS

- Dave Cross dave@perlhacks.com -- Authored WWW::MakeAShorterLink on which this was based
- Alex Page -- for the original LWP hacking on which Dave based his code.
- Simon Batistoni -- giving the `makealongerlink` idea to Dave.
- Eric Hammond -- writing [WWW::Shorten::NotLong](https://metacpan.org/pod/WWW::Shorten::NotLong)
- Shashank Tripathi shank@shank.com -- for providing [WWW::Shorten::SnipURL](https://metacpan.org/pod/WWW::Shorten::SnipURL)
- Kevin Gilbertson (Gilby) -- TinyURL API information
- Matt Felsen (mattf) -- shorter function names
- Ask Bjoern Hansen -- providing [WWW::Shorten::Metamark](https://metacpan.org/pod/WWW::Shorten::Metamark)
- Martin Thurn -- bug fixes
- Jon and William (wjr) -- smlnk services
- PJ Goodwin -- code for [WWW::Shorten::OneShortLink](https://metacpan.org/pod/WWW::Shorten::OneShortLink)
- Chase Whitener capoeirab@cpan.org
- Everyone else we might have missed.

In 2004 Dave Cross took over the maintenance of this distribution
following the death of Iain Truskett.

In 2016, Chase Whitener took over the maintenance of this distribution.

# LICENCE AND COPYRIGHT

This module is free software.  You can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

This program is distributed in the hope that it will be useful,
but without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

# SEE ALSO

- [See Joshua Schachter's blog](http://joshua.schachter.org/2009/04/on-url-shorteners.html)
- [shorlfilter](http://adam.rosi-kessel.org/weblog/2003/09/07/shorlfilter) by Addam Kessel
- [CGI::Shorten](https://metacpan.org/pod/CGI::Shorten)
- [WWW::Shorten::Simple](https://metacpan.org/pod/WWW::Shorten::Simple)
