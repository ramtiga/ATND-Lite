package ATND::Lite;

use strict;
use warnings;
use WebService::Simple;
use Encode qw/encode_utf8/;
use Data::Dumper;
use YAML;
our $VERSION = '0.01';

sub new {
  my $class = shift;
  my (%atnd) = @_;

  return bless \%atnd, $class;
}

sub get_event {
  my $self = shift;

  my $uri = WebService::Simple->new(
    base_url => "http://api.atnd.org/events/",
    response_parser => 'JSON',
  );
  $self->{count} ||= 10;

  my $res = $uri->get({
      keyword    => $self->{keyword},
      keyword_or => $self->{keyword_or},
      ym         => $self->{ym},
      ymd        => $self->{ymd},
      count      => $self->{count},
      format     => 'json'
    })->parse_response();

  my @data;
  for (@{ $res->{events} }){
    push(@data, $_);
  }
  return \@data;
}

1;
__END__

=head1 NAME

ATND::Lite -

=head1 SYNOPSIS

  use ATND::Lite;

=head1 DESCRIPTION

ATND::Lite is

=head1 AUTHOR

ramtiga E<lt>dhanegm731@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
