use strict;
use warnings;

use Test::More;

my $res;

$res = try_use('WWW::Shorten::_dead');
like($res, qr/inactive/, "::_dead is inactive");

$res = undef;
$res = try_use('WWW::Shorten::LinkToolbot');
like($res, qr/inactive/, "::LinkToolbot is inactive");

$res = undef;
$res = try_use('WWW::Shorten::Metamark');
like($res, qr/inactive/, "::Metamark is inactive");

$res = undef;
$res = try_use('WWW::Shorten::MakeAShorterLink');
like($res, qr/inactive/, "::MakeAShorterLink is inactive");

$res = undef;
$res = try_use('WWW::Shorten::TinyClick');
like($res, qr/inactive/, "::TinyClick is inactive");

$res = undef;
$res = try_use('WWW::Shorten::Tinylink');
like($res, qr/inactive/, "::Tinylink is inactive");

done_testing();

sub try_use {
    my $module = shift;
    return do {
        local $@;
        eval { require $module; };
        $@;
    };
}
