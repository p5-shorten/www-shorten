use Test::More tests => 1;
eval { require WWW::Shorten::V3 };
like( $@,  qr/inactive/, "Service correctly reports it is inactive." );
