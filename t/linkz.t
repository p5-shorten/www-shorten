use Test::More tests => 6;

BEGIN { use_ok WWW::Shorten::Linkz };

my $url = 'http://www.bbc.co.uk/cult/doctorwho/ebooks/lungbarrow/index.shtml';
my $re = qr{ ^ http:// lin\.kz / \? (\w+) $ }x;

my $shortened;
like (
    ($shortened = makeashorterlink($url)),
    $re,
    'make it shorter'
);

is (
    makealongerlink( $shortened ),
    $url,
    'make it longer'
);

my ($code) = $shortened =~ $re;
is (
    makealongerlink($code),
    $url,
    'make it longer by Id',
);

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
