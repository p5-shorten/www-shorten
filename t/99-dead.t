use strict;
use warnings;

use Test::More;

my $res;

$res = try_use('WWW::Shorten::_dead');
like($res, qr/inactive/, "::_dead is inactive");

$res = undef;
$res = try_use('WWW::Shorten::LinkToolbot');
like($res, qr/Attempt to reload/, "::LinkToolbot is inactive");

$res = undef;
$res = try_use('WWW::Shorten::Metamark');
like($res, qr/Attempt to reload/, "::Metamark is inactive");

$res = undef;
$res = try_use('WWW::Shorten::MakeAShorterLink');
like($res, qr/Attempt to reload/, "::MakeAShorterLink is inactive");

$res = undef;
$res = try_use('WWW::Shorten::TinyClick');
like($res, qr/Attempt to reload/, "::TinyClick is inactive");

$res = undef;
$res = try_use('WWW::Shorten::Tinylink');
like($res, qr/Attempt to reload/, "::Tinylink is inactive");

done_testing();

sub try_use {
    my $module = shift;
    return do {
        local $@;
        $module =~ s/::/\//g;
        eval { require "$module.pm"; };
        $@;
    };
}
