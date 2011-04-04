package IUP::PPlot;
use strict;
use warnings;
use base 'IUP::Internal::Element';
use IUP::Internal::LibraryIup;
use Carp;

sub BEGIN {
  #warn "[DEBUG] IUP::PPlot::BEGIN() started\n";
  IUP::Internal::LibraryIup::_IupPPlotOpen();
}

sub _create_element {
  my ($self, $args, $firstonly) = @_;
  my $ih = IUP::Internal::LibraryIup::_IupPPlot();
  return $ih;
}

sub PPlotBegin {
  #void IupPPlotBegin(Ihandle* ih, int strXdata); [in C]
  #iup.PPlotBegin(ih: ihandle, strXdata: number) [in Lua]
  my ($self, $strXdata) = @_;
  $self->{____last_begin_param} = $strXdata;
  return IUP::Internal::LibraryIup::_IupPPlotBegin($self->ihandle, $strXdata);
}

sub PPlotEnd {
  #int IupPPlotEnd(Ihandle* ih); [in C]
  #iup.PPlotEnd(ih: ihandle) -> (index: number) [in Lua]
  my $self = shift;
  return IUP::Internal::LibraryIup::_IupPPlotEnd($self->ihandle);
}

sub PPlotAdd {
  # params: ($x, $y)
  my $self = shift;
  my $c = scalar @_;
  if ( $c>=2 && ($c%2)==0 ) {
    return IUP::Internal::LibraryIup::_IupPPlotAdd($self->ihandle, $self->{____last_begin_param}, @_);
  }
  else {
    carp "Warning: wrong number of parameters";
  }
}

sub PPlotAddPoints {
  # params: ($index, \@xylist)
  my $self = shift;
  return IUP::Internal::LibraryIup::_IupPPlotAddPoints($self->ihandle, $self->{____last_begin_param}, @_);
}

sub PPlotInsert {
  # params: ($index, $sample_index, $x, $y)
  my $self = shift;
  my $index = shift;
  my $sample_index = shift;
  my $c = scalar @_;
  if ( $c>=2 && ($c%2)==0 ) {
    return IUP::Internal::LibraryIup::_IupPPlotInsert($self->ihandle, $self->{____last_begin_param},
                                                      $index, $sample_index, @_);
  }
  else {
    carp "Warning: wrong number of parameters";
  }  
}

sub PPlotInsertPoints {
  # params: ($index, $sample_index, \@xylist)
  my $self = shift;
  return IUP::Internal::LibraryIup::_IupPPlotInsertPoints($self->ihandle, $self->{____last_begin_param}, @_);
}

sub PPlotTransform {
  #void IupPPlotTransform(Ihandle* ih, float x, float y, int *ix, int *iy); [in C]
  #iup.PPlotTransform(ih: ihandle, x, y: number) -> (ix, iy: number) [in Lua]
  my ($self, $x, $y) = @_;
  my ($new_x, $new_y) = return IUP::Internal::LibraryIup::_IupPPlotTransform($self->ihandle, $x, $y);
  return ($new_x, $new_y);
}

sub PPlotPaintTo {
  #void IupPPlotPaintTo(Ihandle* ih, cdCanvas* cnv); [in C]
  #iup.PPlotPaintTo(ih: ihandle, cnv: cdCanvas) [in Lua]
  my ($self, $cnv) = @_;
  return IUP::Internal::LibraryIup::_IupPPlotPaintTo($self->ihandle, $cnv->cnvhandle);
}

1;
