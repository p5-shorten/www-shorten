use Test::More tests => 4;

BEGIN { use_ok WWW::Shorten::Tinylink };

my $url = 'http://search.cpan.org/~spoon/WWW-Yahoo-Groups-1.85/lib/WWW/Yahoo/Groups.pm';
my $prefix = 'http://tinylink.com/?';
my $re = qr{ ^ \Q$prefix\E (\w+) $ }x;

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
