# IupVal Example
# Creates two Valuator controls, exemplifying the two possible types.
# When manipulating the Valuator, the label's value changes.
use strict;
use warnings;

use IUP;

# xxx TODO xxx ignoring illegal parameter 'TYPE' (IUP::Label)
my $lbl_v = IUP::Label->new( TITLE=>"VALUE=   ", SIZE=>70, TYPE=>"1" );
my $lbl_h = IUP::Label->new( TITLE=>"VALUE=   ", SIZE=>70, TYPE=>"2" );

sub fbuttonpress {
  my ($self) = @_;
  if ($self->TYPE == "VERTICAL") {
    $lbl_v->FGCOLOR("255 0 0");
  }
  else {
    $lbl_h->FGCOLOR("255 0 0");
  }
  return IUP_DEFAULT;
}

sub fbuttonrelease(self) {
  my ($self) = @_;
  if ($self->TYPE == "VERTICAL") {
    $lbl_v->FGCOLOR = "0 0 0";
  }
  else {
    $lbl_h->FGCOLOR = "0 0 0";
  }
  return IUP_DEFAULT;
}

sub cb_change {
  my ($self, $elem) = @_;
  
  # xxx TODO xxx VALUECHANGED_CB should return IHandle as a param
  use Data::Dumper;
  warn Dumper($elem);
  
  my $val = -1;
  my $buffer = sprintf("VALUE=%.2f", $val);
  if ($self->TYPE eq "VERTICAL") {
    $lbl_v->TITLE($buffer);
  }
  else {
    $lbl_h->TITLE($buffer);
  }
  return IUP_DEFAULT;
}

my $val_v = IUP::Val->new( TYPE=>"VERTICAL", MIN=>0.0, MAX=>1.1, VALUE=>0.3,
                           VALUECHANGED_CB=>\&cb_change );

my $val_h = IUP::Val->new( TYPE=>"HORIZONTAL", MIN=>0, MAX=>1, VALUE=>0,
                           VALUECHANGED_CB=>\&cb_change );

my $dlg_val = IUP::Dialog->new( TITLE=>"Valuator Test", child=>
                IUP::Hbox->new( child=>[
		  IUP::Frame->new( child=>IUP::Vbox->new( child=>[$val_v, $lbl_v] ) ),
		  IUP::Frame->new( child=>IUP::Vbox->new( child=>[$val_h, $lbl_h] ) ),
                ] )
	      );

$dlg_val->Show();

if ( (IUP->MainLoopLevel == 0) ) {
  IUP->MainLoop;
}
