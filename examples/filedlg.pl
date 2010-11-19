# IupFileDlg Example
# Shows a typical file-saving dialog.

use IUP;

# Creates a file dialog and sets its type, title, filter and filter info;
my $filedlg = IUP::FileDlg->new( DIALOGTYPE=>"SAVE", TITLE=>"File save",
                                 FILTER=>"*.bmp", FILTERINFO=>"Bitmap files",
                                 DIRECTORY=>'c:\windows' );

# Shows file dialog in the center of the screen;
$filedlg->Popup(IUP_CENTER, IUP_CENTER);

# Gets file dialog status;
my $status = $filedlg->STATUS;

if ( $status == "1" ) {
  IUP->Message("New file", $filedlg->VALUE);
}
elsif ( $status == "0" ) {
  IUP->Message("File already exists", $filedlg->VALUE);
}
elsif ( $status == "-1" ) {
  IUP->Message("IupFileDlg", "Operation canceled");
}
