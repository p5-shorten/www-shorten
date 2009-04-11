use Test::More tests => 7;

BEGIN { use_ok WWW::Shorten::Shorl };

my $url = 'http://code.mag-sol.com/WWW-Shorten/WWW-Shorten-1.98.tar.gz';

{
    my $shorl = makeashorterlink( $url );

    ok ( (defined $shorl and $shorl =~ m!^ \Qhttp://shorl.com/\E ([a-z]+) $ !x),
	    'make it shorter'
       );

    my $code = $1;

    is ( makealongerlink($shorl), $url, 'make it longer');

    is ( makealongerlink($code), $url, 'make it longer by Id' );
}


{
    my ($shorl, $password) = makeashorterlink( $url );

    ok ( (defined $shorl and $shorl =~ m!^ \Qhttp://shorl.com/\E ([a-z]+) $ !x
		and defined $password and $password =~ m!^ [a-z]+ $ !x),
	    "make it shorter, get password [$shorl, $password]"
       );
}

eval { &makeashorterlink() };
ok($@);
eval { &makealongerlink() };
ok($@);
