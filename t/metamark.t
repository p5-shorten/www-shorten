use Test::More tests => 1;
eval { require WWW::Shorten::Metamark };
like( $@,  qr/inactive/, "Service correctly reports it is inactive." );
