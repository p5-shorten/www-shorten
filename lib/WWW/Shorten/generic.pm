package WWW::Shorten::generic;

use 5.006;
use strict;
use warnings;

our $VERSION = "1.81";

use LWP;
use Carp;

my %name_sets =
(
    default	=> [qw( makeashorterlink makealongerlink )],
    short	=> [qw( short_link long_link )],
);

sub import
{
    my $class = shift;
    my ($package) = caller;
    ($package) = caller(1) if $package eq 'WWW::Shorten';
    my $set = shift;
    if (defined $set and $set =~ /^ : (\w+) $/x) {
	$set = $1;
    } else {
	$set = 'default';
    }
    if ( exists $name_sets{$set} )
    {
	no strict 'refs';
	*{"${package}::$name_sets{$set}[0]"} =
	    *{ "${class}::$name_sets{default}[0]"};
	*{"${package}::$name_sets{$set}[1]"} =
	    *{ "${class}::$name_sets{default}[1]"};
    }
    else
    {
	croak "Unknown function set.";
    }
}

my $ua;

sub ua
{
    my $self = shift;
    return $ua if defined $ua; 
    my $v = $self->VERSION();
    $ua = LWP::UserAgent->new(
	env_proxy => 1,
	timeout => 30,
	agent => "$self/$v",
	requests_redirectable => [],
    );
    return $ua;
}

1;
