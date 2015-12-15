use Test::More tests => 7;

BEGIN { use_ok WWW::Shorten::TinyURL };

my $url = 'https://metacpan.org/release/WWW-Shorten';
my $return = makeashorterlink($url);
ok($return, 'not a error') or diag "\$_error_message = $_error_message";
my ($code) = $return =~ /(\w+)$/;
my $prefix = 'http://tinyurl.com/';
is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
# Slight pause to increase the chance that all of TinyURL's servers
# know about the new link
sleep(5);
is ( makealongerlink($prefix.$code), $url, 'make it longer')
    or diag "\$_error_message = $_error_message";
is ( makealongerlink($code), $url, 'make it longer by Id',)
    or diag "\$_error_message = $_error_message";

eval { makeashorterlink() };
ok($@, 'makeashorterlink fails with no args');
eval { makealongerlink() };
ok($@, 'makealongerlink fails with no args');
