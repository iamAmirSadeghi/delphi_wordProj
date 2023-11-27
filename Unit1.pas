unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, Vcl.ExtDlgs, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    board: TRichEdit;
    PopupMenu1: TPopupMenu;
    File2: TMenuItem;
    Open1: TMenuItem;
    Open2: TMenuItem;
    Saveas1: TMenuItem;
    Saveas2: TMenuItem;
    MainMenu1: TMainMenu;
    File3: TMenuItem;
    File4: TMenuItem;
    Open3: TMenuItem;
    Open4: TMenuItem;
    SaveAs3: TMenuItem;
    SaveAs4: TMenuItem;
    Edit1: TMenuItem;
    Edit2: TMenuItem;
    Font1: TMenuItem;
    Font2: TMenuItem;
    Font3: TMenuItem;
    Font4: TMenuItem;
    Color1: TMenuItem;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    New: TAction;
    Open: TAction;
    Save: TAction;
    Save_As: TAction;
    Font: TAction;
    Alignment: TAction;
    Color: TAction;
    Exit: TAction;
    OpenTextFileDialog1: TOpenTextFileDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    AlignmentBox: TGroupBox;
    Right_Button: TButton;
    Left_Button: TButton;
    Center_Button: TButton;
    BoxClose_Button: TButton;
    ColorDialog1: TColorDialog;
    ReplaceDialog1: TReplaceDialog;
    FindAndReplace: TAction;
    FindAndReplace1: TMenuItem;
    FindAndReplace2: TMenuItem;
    procedure NewExecute(Sender: TObject);
    procedure boardChange(Sender: TObject);
    procedure Save_AsExecute(Sender: TObject);
    procedure OpenExecute(Sender: TObject);
    procedure FontExecute(Sender: TObject);
    procedure AlignmentExecute(Sender: TObject);
    procedure Center_ButtonClick(Sender: TObject);
    procedure Left_ButtonClick(Sender: TObject);
    procedure Right_ButtonClick(Sender: TObject);
    procedure BoxClose_ButtonClick(Sender: TObject);
    procedure ColorExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure FindAndReplaceExecute(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //answer:string;
  MyText: TStringlist;
  status:byte;
  i:byte;
  address:string;
implementation

{$R *.dfm}

procedure TForm1.AlignmentExecute(Sender: TObject);
begin
    AlignmentBox.Visible:=true;
end;

procedure TForm1.boardChange(Sender: TObject);
begin
  status:=board.ActiveLineNo;
  //label1.Caption:=status.ToString;
end;

procedure TForm1.BoxClose_ButtonClick(Sender: TObject);
begin
   AlignmentBox.Visible:=false;
end;

procedure TForm1.Center_ButtonClick(Sender: TObject);
begin
  with board do
    begin
      board.Alignment:= taCenter;
      board.Paragraph.Alignment:= taCenter;
    end;
end;

procedure TForm1.ColorExecute(Sender: TObject);
begin
  if(colordialog1.Execute)then
    begin
      with board do
      begin
        selAttributes.Color:=colordialog1.Color;
      end;
    end;
end;

procedure TForm1.ExitExecute(Sender: TObject);
begin
try
  if(board.Text<>'')then
    begin
    if
      MessageDlg('Save Your Change to File?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes)=mrYes then
      begin
      actionlist1.Actions[3].Execute;  //Run Sent To Save_As Action
      end else
      Application.Terminate;
    end; finally  Application.Terminate; end;
end;
procedure TForm1.FindAndReplaceExecute(Sender: TObject);
begin
    ReplaceDialog1Replace(Sender);
end;

procedure TForm1.FontExecute(Sender: TObject);
begin
  if(fontdialog1.Execute)then
    begin
      with board do
        begin
           selAttributes.Style:=fontdialog1.Font.Style;
           selAttributes.Size:=fontdialog1.Font.Size;
        end;
    end;
end;

procedure TForm1.Left_ButtonClick(Sender: TObject);
begin
    with board do
      begin
        board.Alignment:= taleftJustify;
        board.Paragraph.Alignment:= taleftJustify;
      end;
end;

procedure TForm1.NewExecute(Sender: TObject);
begin

  if(board.Text<>'')then begin
    if
    MessageDlg('Save Your Change to File?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes)=mrYes then begin
    actionlist1.Actions[3].Execute;
    // >>Run sent to Save_As Action
    end else board.Text:=''; address:=''; form1.Caption:='Word';
  end;
end;

procedure TForm1.OpenExecute(Sender: TObject);
begin
 if(board.Text='')then begin
  try
    if(opentextfiledialog1.Execute)then  begin
    board.Lines.LoadFromFile(opentextfiledialog1.FileName,TEncoding.UTF8);
    form1.Caption:=opentextfiledialog1.FileName;
    address:=opentextfiledialog1.FileName;
    end;
  except if(opentextfiledialog1.Filter<>'Text Files (*.TXT) 1 *.TXT 1 All Files (*.*) 1 *.*') then
      MessageDlg('UnSupported File!!',mtWarning,[mbOK],0); //Unhandled ERROR here,doesn't work,check it
  end;                                                 //About Our Exception <<<==!!! ERROR DETECTED !!!==>>>
    end else begin
    if
    MessageDlg('Save Your Change to File?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes)=mrYes then begin
    actionlist1.Actions[3].Execute;
    // >>Run sent to Save As Action                                        //Run Sent To Open
    end else begin board.Text:=''; address:=''; form1.Caption:='Word'; actionlist1.Actions[1].Execute; end;
  end;
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
  pointer:integer;
begin
  if(replacedialog1.Execute)then
    begin
      with Treplacedialog(sender) do
        begin
          //pointer:=board.MaxLength;
          pointer:=POS(replacedialog1.FindText,board.Lines.Text);
          if pointer>0 then begin
          board.SelStart:=pointer-1;
          board.SelLength:=length(replacedialog1.FindText);
          board.SelText:=replacedialog1.ReplaceText;
          end;//MessageDlg('No Matches Word!',mtInformation,[mbOK],0);
        end;
    end;
end;

procedure TForm1.Right_ButtonClick(Sender: TObject);
begin
  with board do
    begin
      board.Alignment:=taRightJustify;
      board.Paragraph.Alignment:= taRightJustify;
    end;
end;

procedure TForm1.SaveExecute(Sender: TObject);
begin try
  if(form1.Caption<>'Word')then begin
      with SaveDialog1 do begin
        InitialDir:=ExtractFilePath(Application.ExeName);
        Filter:='Text Files (*.TXT) 1 *.TXT 1 All Files (*.*) 1 *.*';
        MyText:= TStringlist.create;       //String List
        try                              //////<<<<<SAVE STARTED>>>>>//////
            for i:=0 to status do begin      //status >> line's count
              MyText.Add(board.Lines[i]);     //Fix Encoding by String List
            end;                            //Fix Done
          MyText.SaveToFile(address+'.txt',TEncoding.UTF8);
          finally
          MyText.Free
        end;
      end;                                          //Run Sent To Save As
  end else if(form1.Caption='Word')then actionlist1.Actions[3].Execute;
except
    MessageDlg('sry Something went Wrong!',
    mtwarning, [mbOK], 0);
end;
end;
procedure TForm1.Save_AsExecute(Sender: TObject);
begin
      if(savedialog1.Execute)then begin

        with SaveDialog1 do begin
        InitialDir:=ExtractFilePath(Application.ExeName);
        Filter:='Text Files (*.TXT) 1 *.TXT 1 All Files (*.*) 1 *.*';
        MyText:= TStringlist.create;       //String List
          try                              //////<<<<<SAVE STARTED>>>>>//////
          for i:=0 to status do begin      //status >> line's count
          MyText.Add(board.Lines[i]);     //Fix Encoding by String List
          end;                            //Fix Done
          MyText.SaveToFile(FileName+'.txt',TEncoding.UTF8);
          finally
          MyText.Free
          end;
        end;

      end;
end;

end.
