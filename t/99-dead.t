use strict;
use warnings;

use Test::More;
use Try::Tiny qw(try catch);

my $res;

$res = try {require WWW::Shorten::_dead; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::_dead is inactive");

$res = undef;
$res = try {require WWW::Shorten::LinkToolbot; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::LinkToolbot is inactive");

$res = undef;
$res = try {require WWW::Shorten::Metamark; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::Metamark is inactive");

$res = undef;
$res = try {require WWW::Shorten::MakeAShorterLink; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::MakeAShorterLink is inactive");

$res = undef;
$res = try {require WWW::Shorten::TinyClick; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::TinyClick is inactive");

$res = undef;
$res = try {require WWW::Shorten::Tinylink; '' } catch { "inactive service $_" };
like($res, qr/inactive/, "::Tinylink is inactive");

done_testing();
