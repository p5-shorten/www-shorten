use Test::More tests => 4;

BEGIN { use_ok WWW::Shorten::SmLnk };

SKIP: {
  skip "smlnk.com seems to be missing", 3;

  my $url = 'http://books.perl.org/book/141';
  my $code = 'TRqr';
  my $prefix = 'http://smlnk.com/';

  is (
      makeashorterlink($url),
      $prefix.$code,
      'make it shorter'
  );

  is (
      makealongerlink($prefix.$code),
      $url,
      'make it longer'
  );

  is (
      makealongerlink($code),
      $url,
      'make it longer by Id',
  );
}
