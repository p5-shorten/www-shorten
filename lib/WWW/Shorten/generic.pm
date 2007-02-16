# $Id$

=head1 NAME

WWW::Shorten::generic - Methods shared across all WWW::Shorten modules

=head1 SYNOPSIS

  use WWW::Shorten 'SomeSubclass';

=head1 DESCRIPTION

Contains methds that are shared across all WWW::Shorten implemenation
modules.

=cut

package WWW::Shorten::generic;

use 5.006;
use strict;
use warnings;

our $VERSION = 1.92;

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
	croak "Unknown function set - $set.";
    }
}

my $ua;

=head1 FUNCTIONS

=head2 ua

Returns the object's LWP::Useragent attribute. Creates a new one if one
doesn't already exist.

=cut

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
