package IUP::Label;
use strict;
use warnings;
use base 'IUP::Internal::Element';
use IUP::Internal::LibraryIup;

sub _create_element {
  my ($self, $args, $firstonly) = @_;
  my $ih = IUP::Internal::LibraryIup::_IupLabel($args->{TITLE});
  delete $args->{TITLE};
  return $ih;
}

1;
