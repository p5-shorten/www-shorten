use Test::More tests => 4;

BEGIN { use_ok WWW::Shorten::BabyURL };

my $url = 'http://safari.oreilly.com/JVXSL.asp?x=1&mode=section&sortKey=inser'.
    'tDate&sortOrder=desc&view=&xmlid=0-596-00313-7/perlckbk2-CHP-19-SECT-8&o'.
    'pen=true&g=&title=New This Week&catid=itbooks.prog.perl&s=0&b=0&f=0&'.
    't=1&c=1&u=1&r=&o=0&srchText=';
my $code = 'cTxDcQ';
my $prefix = 'http://babyurl.com/';

is ( makeashorterlink($url), $prefix.$code, 'make it shorter');
is ( makealongerlink($prefix.$code), $url, 'make it longer');
is ( makealongerlink($code), $url, 'make it longer by Id',);

