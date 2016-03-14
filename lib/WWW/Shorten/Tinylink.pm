package WWW::Shorten::Tinylink;
use strict;
use warnings;

our $VERSION = '3.090';
$VERSION = eval $VERSION;

require WWW::Shorten::_dead;

1;

=head1 NAME

WWW::Shorten::Tinylink - Perl interface to Tinylink.com

=head1 SYNOPSIS

  # No appropriate solution

=head1 DESCRIPTION

A Perl interface to the web site Tinylink.com. Tinylink.com simply
maintains a database of long URLs, each of which has a unique
identifier.

Unfortunately, at some point in the middle of 2008, Tinylink.com stopped
returning usable URLs and therefore this module is now deprecated

=cut
