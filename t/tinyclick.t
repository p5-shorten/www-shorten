use Test::More tests => 1;
eval { require WWW::Shorten::TinyClick };
like( $@,  qr/inactive/, "Service correctly reports it is inactive." );
