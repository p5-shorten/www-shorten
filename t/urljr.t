use Test::More tests => 1;
eval { require WWW::Shorten::URLjr };
like( $@,  qr/inactive/, "Service correctly reports it is inactive." );
