use Test::More tests => 5;

BEGIN { use_ok WWW::Shorten::OneShortLink };

my $url = 'http://dellah.org/';
my $short = makeashorterlink( $url );
ok((defined $short), 'Reasonable response');
like ( $short => qr{^http://1sl\.net/\w+$}, 'make it shorter' );

is ( makealongerlink( $short ) => $url, 'make it longer' );

my ($rs) = $short =~ m# / (\w+) $ #x;
is ( makealongerlink($rs) => $url, 'make it longer by Id' );
