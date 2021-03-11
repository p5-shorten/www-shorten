# NAME

WWW::Shorten - Interface to URL shortening sites.

# SYNOPSIS

```perl
#!/usr/bin/env perl
use strict;
use warnings;

use WWW::Shorten 'TinyURL'; # Recommended
# use WWW::Shorten 'Bitly'; # or one of the others

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
```

# DESCRIPTION

A Perl interface to various services that shorten URLs. These sites maintain
databases of long URLs, each of which has a unique identifier.

# DEPRECATION NOTICE

The following shorten services have been deprecated as the endpoints no longer
exist or function:

- [WWW::Shorten::LinkToolbot](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ALinkToolbot)
- [WWW::Shorten::Linkz](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ALinkz)
- [WWW::Shorten::MakeAShorterLink](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AMakeAShorterLink)
- [WWW::Shorten::Metamark](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AMetamark)
- [WWW::Shorten::TinyClick](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ATinyClick)
- [WWW::Shorten::Tinylink](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ATinylink)
- [WWW::Shorten::Qurl](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AQurl)
- [WWW::Shorten::Qwer](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AQwer)

When version `3.100` is released, these deprecated services will not be part of
the distribution.

# SHORTEN APP

A very simple program called `shorten` is supplied in the
distribution's `bin` folder. This program takes a URL and
gives you a shortened version of it.

# BUGS, REQUESTS, COMMENTS

Please submit any [issues](https://github.com/p5-shorten/www-shorten/issues) you
might have.  We appreciate all help, suggestions, noted problems, and especially patches.

\* If you know of a shorten service that we don't already have, make your own
service and release it as a separate module, like [WWW::Shorten::Googl](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AGoogl) or
[WWW::Shorten::Bitly](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ABitly).  Alternatively, you can let us know and we'll be happy
to work it up for you.

# AUTHOR

Iain Truskett `spoon@cpan.org`

# CONTRIBUTORS

- Alex Page -- for the original LWP hacking on which Dave based his code.
- Ask Bjoern Hansen -- providing [WWW::Shorten::Metamark](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AMetamark)
- Chase Whitener `capoeirab@cpan.org`
- Dave Cross dave@perlhacks.com -- Authored [WWW::MakeAShorterLink](https://metacpan.org/pod/WWW%3A%3AMakeAShorterLink) on which this was based
- Eric Hammond -- writing [WWW::Shorten::NotLong](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ANotLong)
- Jon and William (wjr) -- smlnk services
- Kazuhiro Osawa `yappo@cpan.org`
- Kevin Gilbertson (Gilby) -- TinyURL API information
- Martin Thurn -- bug fixes
- Matt Felsen (mattf) -- shorter function names
- Neil Bowers `neilb@cpan.org`
- PJ Goodwin -- code for [WWW::Shorten::OneShortLink](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3AOneShortLink)
- Shashank Tripathi `shank@shank.com` -- for providing [WWW::Shorten::SnipURL](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ASnipURL)
- Simon Batistoni -- giving the \`makealongerlink\` idea to Dave.
- Everyone else we might have missed.

In 2004 Dave Cross took over the maintenance of this distribution
following the death of Iain Truskett.

In 2016, Chase Whitener took over the maintenance of this distribution.

# LICENSE AND COPYRIGHT

Copyright (c) 2002 by Iain Truskett.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

# SEE ALSO

[CGI::Shorten](https://metacpan.org/pod/CGI%3A%3AShorten), [WWW::Shorten::Simple](https://metacpan.org/pod/WWW%3A%3AShorten%3A%3ASimple)
