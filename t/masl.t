use Test::More tests => 7;

BEGIN { use_ok WWW::Shorten::MakeAShorterLink };

{
    my $url = 'http://perl.dellah.org/WWW-Shorten-1.5.2.tar.gz';
    my $code = 'E24154552';
    my $prefix = 'http://makeashorterlink.com/?';

    is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
    is ( makealongerlink($prefix.$code), $url, 'make it longer');
    is ( makealongerlink($code), $url, 'make it longer by Id',);
}

{
    my $url = 'http://cnn.com';
    my $shorter = makeashorterlink( $url );
    ok ( defined $shorter , "Short URL is defined." );
    isnt ( $shorter => "" , "Short URL is is not blank." );
    is ( $url => $shorter, "Shorl URL is the original URL." );
}
