use Test::More tests => 4;

BEGIN { use_ok WWW::Shorten, 'MakeAShorterLink' };

my $url = 'http://perl.dellah.org/WWW-Shorten-1.5.2.tar.gz';
my $code = 'E24154552';
my $prefix = 'http://makeashorterlink.com/?';

is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);
