package WWW::Shorten::UserAgent;

use strict;
use warnings;

use base 'LWP::UserAgent';

=head1 NAME

WWW::Shorten::UserAgent - LWP::UserAgent subclass for WWW::Shorten modules.

=head1 SYNOPSIS

  use WWW::Shorten::UserAgent;

  my $ua = WWW::Shorten::UserAgent->new;

  my $resp = eval {
    $ua->get($url);
  };

=head1 DESCRIPTION

Subclass of LWP::UserAgent which works the same way as the supoerclass
except that it throws an exception if the C<get> or C<post> method returns
an error.

See L<LWP::UserAgent> for the full documentation.

=head1 METHODS

=head2 get

Makes an HTTP GET request and throws an exception on error.

=cut

sub get {
  my $self = shift;
  my $resp = $self->SUPER::get(@_);

  die $resp->status_line if $resp->is_error;

  return $resp;
}

=head2 post

Makes an HTTP POST request and throws an exception on error.

=cut

sub post {
  my $self = shift;
  my $resp = $self->SUPER::post(@_);

  die $resp->status_line if $resp->is_error;

  return $resp;
}

1;

=head1 LICENCE AND COPYRIGHT

Copyright (c) Magnum Solutions Ltd., 2012. All rights reserved.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself, either Perl version 5.000 or, at your option,
any later version of Perl 5 you may have available.

The full text of the licences can be found in the Artistic and COPYING files
included with this module, or in perlartistic and perlgpl as supplied with
Perl 5.8.1 and later.

=head1 AUTHOR

Dave Cross <dave@mag-sol.com>

=cut
