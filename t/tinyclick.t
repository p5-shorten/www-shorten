use Test::More tests => 5;

BEGIN { use_ok WWW::Shorten::TinyClick };

my $url = 'http://books.perl.org/category/13';
my $short = makeashorterlink( $url );
ok((defined $short), 'Reasonable response');
like ( $short => qr{http://tinyclick\.com/\??..}, 'make it shorter' );

is ( makealongerlink( $short ) => $url, 'make it longer' );

my ($rs) = $short =~ /\? (.*) $/x;
is ( makealongerlink($rs) => $url, 'make it longer by Id' );
