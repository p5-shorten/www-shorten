use Test::More tests => 4;

BEGIN { use_ok WWW::Shorten::TinyURL };

my $url = 'http://perl.dellah.org/WWW-Shorten-1.5.2.tar.gz';
my $code = '2etu';
my $prefix = 'http://tinyurl.com/';

is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);

