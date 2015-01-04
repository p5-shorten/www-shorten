use Test::More;

for my $module ( qw(JSON::PP LWP::Protocol::https WWW::Shorten::Google)) {
    eval "use $module";
    plan skip_all => "$module required for testing WWW::Shorten::Google" if $@;
}

my $url = 'https://metacpan.org/release/WWW-Shorten';
my $return = makeashorterlink($url);
my ($code) = $return =~ /(\w+)$/;
my $prefix = 'http://goo.gl/';
is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);

eval { makeashorterlink() };
ok($@, 'makeashorterlink fails with no args');
eval { makealongerlink() };
ok($@, 'makealongerlink fails with no args');

done_testing;
