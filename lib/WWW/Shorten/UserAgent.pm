package WWW::Shorten::UserAgent;

use strict;
use warnings;

use base 'LWP::UserAgent';

sub get {
  my $self = shift;
  my $resp = $self->SUPER::get(@_);

  die $resp->status_line if $resp->is_error;

  return $resp;
}

sub post {
  my $self = shift;
  my $resp = $self->SUPER::post(@_);

  die $resp->status_line if $resp->is_error;

  return $resp;
}

1;
