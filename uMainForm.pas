unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Controls.Presentation, MyPaintBox, FMX.Objects, FMX.Colors,
  FMX.ListBox, FMX.Layouts, FMX.DialogService.Async, FMX.Edit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  REST.Types, REST.Client, REST.Response.Adapter, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, FMX.ExtCtrls,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FireDAC.Stan.StorageBin,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.DBScope;

type
  TMainForm = class(TForm)
    MaterialOxfordBlueSB: TStyleBook;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    ScreenshotButton: TButton;
    DragImage: TImage;
    IconsListBox: TListBox;
    PanelMenu: TPanel;
    Rectangle1: TRectangle;
    DrawListBox: TListBox;
    inonedraw: TListBoxItem;
    idrawpen: TListBoxItem;
    idrawline: TListBoxItem;
    idrawrectangle: TListBoxItem;
    idrawlinerectangle: TListBoxItem;
    idrawellipse: TListBoxItem;
    idrawlineellipse: TListBoxItem;
    idrawerase: TListBoxItem;
    idrawfill: TListBoxItem;
    Toolbar: TToolBar;
    ForegroundColorBox: TComboColorBox;
    BackgroundColorBox: TComboColorBox;
    ImageMenu: TImage;
    LineThicknessTB: TTrackBar;
    LineWidthText: TText;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    SaveDialog1: TSaveDialog;
    ListBoxItem9: TListBoxItem;
    APIKeyEdit: TEdit;
    APIKeyButton: TButton;
    GenerateButton: TButton;
    Timer1: TTimer;
    FDMemTable2: TFDMemTable;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    FDMemTable1: TFDMemTable;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    ProgressBar: TProgressBar;
    TemplateMemo: TMemo;
    Layout1: TLayout;
    Label2: TLabel;
    PromptMemo: TMemo;
    Label5: TLabel;
    NegativePromptEdit: TEdit;
    NetHTTPClient1: TNetHTTPClient;
    Timer2: TTimer;
    TabControl: TTabControl;
    PaintTabItem: TTabItem;
    ViewTabItem: TTabItem;
    ImageViewer: TImageViewer;
    PreviewImage: TImage;
    Layout2: TLayout;
    ListView1: TListView;
    FileMemTable: TFDMemTable;
    ImagePathEdit: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    StatusBar1: TStatusBar;
    Img2ImgLayout: TLayout;
    Layout3: TLayout;
    ImageEdit: TEdit;
    OpenButton: TButton;
    Label6: TLabel;
    StrengthLabel: TLabel;
    StrengthTB: TTrackBar;
    SourceImage: TImage;
    OpenDialog: TOpenDialog;
    Label7: TLabel;
    Layout7: TLayout;
    Label16: TLabel;
    WidthEdit: TEdit;
    HeightEdit: TEdit;
    PaintLayout: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BackgroundColorBoxChange(Sender: TObject);
    procedure ForegroundColorBoxChange(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure IconsListBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure IconsListBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ImageMenuClick(Sender: TObject);
    procedure LineThicknessTBChange(Sender: TObject);
    procedure DrawListBoxChange(Sender: TObject);
    procedure DrawListBoxClick(Sender: TObject);
    procedure ListBoxItem1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ScreenshotButtonClick(Sender: TObject);
    procedure GenerateButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure APIKeyButtonClick(Sender: TObject);
    procedure TabControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure OpenButtonClick(Sender: TObject);
    procedure StrengthTBChange(Sender: TObject);
  private
    { Private declarations }
    FOriginalFGColor: TColor;
    FOriginalBGColor: TColor;
    FPaintBox: TMyPaintBox;
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItemMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  public
    { Public declarations }
    function MemoryStreamToBase64(const MemoryStream: TMemoryStream): string;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  System.Hash, System.NetEncoding, System.Net.Mime, System.JSON, System.Generics.Collections,
  System.IOUtils;

function TMainForm.MemoryStreamToBase64(const MemoryStream: TMemoryStream): string;
var
  OutputStringStream: TStringStream;
  Base64Encoder: TBase64Encoding;
  MimeType: string;
begin
  MemoryStream.Position := 0;
  OutputStringStream := TStringStream.Create('', TEncoding.ASCII);
  try
    Base64Encoder := TBase64Encoding.Create;
    try
      Base64Encoder.Encode(MemoryStream, OutputStringStream);
      MimeType := 'image/png';
      Result := 'data:' + MimeType + ';base64,' + OutputStringStream.DataString;
    finally
      Base64Encoder.Free;
    end;
  finally
    OutputStringStream.Free;
  end;
end;

procedure TMainForm.OpenButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    ImageEdit.Text := OpenDialog.FileName;
    SourceImage.Bitmap.LoadFromFile(ImageEdit.Text);
    PaintLayout.Width := SourceImage.Bitmap.Width;
    PaintLayout.Height := SourceImage.Bitmap.Height;
    WidthEdit.Text := SourceImage.Bitmap.Width.ToString;
    HeightEdit.Text := SourceImage.Bitmap.Height.ToString;
  end;
end;

procedure TMainForm.APIKeyButtonClick(Sender: TObject);
begin
  APIKeyEdit.Visible := not APIKeyEdit.Visible;
end;

procedure TMainForm.BackgroundColorBoxChange(Sender: TObject);
begin
  FPaintBox.BackgroundColor := BackgroundColorBox.Color;
end;

function EncodeJSONStr(const S: String): String;
var
  JSONValue: TJSONString;
begin
  JSONValue := TJSONString.Create(S);
  try
    Result := JSONValue.ToJSON;
  finally
    JSONValue.Free;
  end;
end;

procedure TMainForm.GenerateButtonClick(Sender: TObject);
begin
  if APIKeyEdit.Text='' then
  begin
    ShowMessage('Enter a Replicate.com API key.');
    Exit;
  end;

  ProgressBar.Value := 0;
  ProgressBar.Visible := True;
  GenerateButton.Enabled := False;

  Application.ProcessMessages;

  var LMaskStream := TMemoryStream.Create;
  FPaintBox.SaveToStream(LMaskStream);

  var LSourceStream := TMemoryStream.Create;
  if ImageEdit.Text.Substring(0,4)<>'http' then
  begin
    if ImageEdit.Text<>'' then
    begin
      LSourceStream.LoadFromFile(ImageEdit.Text);
    end
    else
      SourceImage.Bitmap.SaveToStream(LSourceStream);
  end;

  RestRequest1.Params[0].Value := 'Token ' + APIKeyEdit.Text;
  RestRequest1.Params[1].Value := TemplateMemo.Lines.Text.Replace('%prompt%',PromptMemo.Lines.Text)
  .Replace('%base64mask%','"'+MemoryStreamToBase64(LMaskStream)+'"')
  .Replace('%base64source%','"'+MemoryStreamToBase64(LSourceStream)+'"')
  .Replace('%negative_prompt%',NegativePromptEdit.Text).Replace(#13#10,'')
  .Replace('%width%',WidthEdit.Text)
  .Replace('%height%',HeightEdit.Text)
  .Replace('%prompt_strength%',Format('%.2f',[StrengthTB.Value]).Replace(',','.'));

  RESTRequest1.Execute;

  LMaskStream.Free;
  LSourceStream.Free;

  var F := FDMemTable1.FindField('status');
  if F<>nil then
  begin
    if F.AsWideString='starting' then
    begin
      RESTRequest2.Resource := FDMemTable1.FieldByName('id').AsWideString;

      Timer1.Enabled := True;
    end
    else
    begin
      ProgressBar.Visible := False;
      GenerateButton.Enabled := True;
      ShowMessage(F.AsWideString);
    end;
  end;
end;

procedure TMainForm.DrawListBoxChange(Sender: TObject);
begin
  if Assigned(ImageMenu) then
    ImageMenu.Bitmap := DrawListBox.Selected.ItemData.Bitmap;
  PanelMenu.Visible := False;
  if Assigned(FPaintBox) then
    begin
      FPaintBox.NoFill := False;

      if FOriginalBGColor<>TAlphaColorRec.Null then
        begin
          BackgroundColorBox.Color := FOriginalBGColor;
          FOriginalBGColor := TAlphaColorRec.Null;
        end;

      if FOriginalFGColor<>TAlphaColorRec.Null then
        begin
          ForegroundColorBox.Color := FOriginalFGColor;
          FOriginalFGColor := TAlphaColorRec.Null;
        end;


      case DrawListBox.ItemIndex of
       0: FPaintBox.FuncDraw := TFunctionDraw(DrawListBox.ItemIndex);
       1: FPaintBox.FuncDraw := TFunctionDraw(DrawListBox.ItemIndex);
       2: FPaintBox.FuncDraw := TFunctionDraw(DrawListBox.ItemIndex);
       3: begin
           FPaintBox.FuncDraw := TFunctionDraw(DrawListBox.ItemIndex);
          end;
       4: begin
           FPaintBox.NoFill := True;
           FPaintBox.FuncDraw := TFunctionDraw(3);
          end;
       5: begin
           FPaintBox.FuncDraw := TFunctionDraw(4);
          end;
       6: begin
           FPaintBox.NoFill := True;
           FPaintBox.FuncDraw := TFunctionDraw(4);
          end;
       7: begin
           FOriginalBGColor := BackgroundColorBox.Color;
           FOriginalFGColor := ForegroundColorBox.Color;
           BackgroundColorBox.Color := TAlphaColorRec.Black;
           ForegroundColorBox.Color := TAlphaColorRec.Black;
           FPaintBox.FuncDraw := TFunctionDraw(3);
          end;
       8: FPaintBox.FuncDraw := TFunctionDraw(5);
      end;
    end;
end;

procedure TMainForm.DrawListBoxClick(Sender: TObject);
begin
  PanelMenu.Visible := False;
end;

procedure TMainForm.ForegroundColorBoxChange(Sender: TObject);
begin
  if Assigned(FPaintBox) then
    FPaintBox.ForegroundColor := ForegroundColorBox.Color;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  var LDataFile := ExtractFilePath(ParamStr(0)) + 'sdxli_database.fds';
  if TFile.Exists(LDataFile) then
    FileMemTable.LoadFromFile(LDataFile);

  FPaintBox := TMyPaintBox.Create(Self);
  FPaintBox.Parent := PaintLayout;
  FPaintBox.SendToBack;

  FOriginalBGColor := TAlphaColorRec.Null;
  FOriginalFGColor := TAlphaColorRec.Null;

  FPaintBox.ForegroundColor := ForegroundColorBox.Color;
  FPaintBox.BackgroundColor := BackgroundColorBox.Color;
  FPaintBox.Align := TAlignLayout.Client;
  FPaintBox.OnMouseDown := PaintBoxMouseDown;

  LineThicknessTBChange(LineThicknessTB);
  ImageMenu.Bitmap := DrawListBox.Selected.ItemData.Bitmap;
  PanelMenu.BringToFront;
  Toolbar.BringToFront;

  PaintLayout.Width := SourceImage.Bitmap.Width;
  PaintLayout.Height := SourceImage.Bitmap.Height;
  WidthEdit.Text := SourceImage.Bitmap.Width.ToString;
  HeightEdit.Text := SourceImage.Bitmap.Height.ToString;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FPaintBox.DisposeOf;
end;

procedure TMainForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if Assigned(FPaintBox) then
    begin
      FPaintBox.MouseLeave;
    end;
end;

procedure TMainForm.IconsListBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if Assigned(FPaintBox) then
  begin
    if DragImage.Visible then
     begin
      DragImage.Position.X := X+IconsListBox.Position.X-(DragImage.Width/2);
      DragImage.Position.Y := Y+IconsListBox.Position.Y-(DragImage.Height/2);
     end;
  end;
end;

procedure TMainForm.IconsListBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FPaintBox) then
  begin
    TThread.Queue(nil,procedure begin
    if DragImage.Visible=True then
     begin
      if DragImage.Tag=1 then
       begin
         TDialogServiceAsync.InputQuery('Enter your text', ['Text:'], [''],
            procedure(const AResult: TModalResult; const AValues: array of string)
             begin
               case AResult of
                mrOk: begin
                        FPaintBox.StampText(X-IconsListBox.Width,Y,LineWidthText.TextSettings.Font,AValues[0]);
                      end;
               end;
             end);
         DragImage.Tag := 0;
       end
      else
        FPaintBox.StampBitmap(X-IconsListBox.Width,Y,DragImage.Bitmap);
      DragImage.Visible := False;
      FPaintBox.MouseLeave;
     end;
    end);
  end;

end;

procedure TMainForm.ImageMenuClick(Sender: TObject);
begin
  PanelMenu.Visible := not PanelMenu.Visible;
end;

procedure TMainForm.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FPaintBox) then
  begin
   if PanelMenu.Visible=True then
    begin
      PanelMenu.Visible := False;
    end;
  end;
end;

procedure TMainForm.ScreenshotButtonClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    begin
      FPaintBox.SaveToFile(SaveDialog1.FileName);
    end;
end;

procedure TMainForm.StrengthTBChange(Sender: TObject);
begin
  StrengthLabel.Text := 'Strength: ' + Format('%.2f',[StrengthTB.Value]).Replace(',','.');
end;

function ParseJSONStrArray(const JSONStr: String): TArray<String>;
var
  JSONArray: TJSONArray;
  I: Integer;
begin
  JSONArray := TJSONObject.ParseJSONValue(JSONStr) as TJSONArray;
  try
    SetLength(Result, JSONArray.Count);
    for I := 0 to JSONArray.Count - 1 do
      Result[I] := JSONArray.Items[I].Value;
  finally
    JSONArray.Free;
  end;
end;

procedure TMainForm.TabControlMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if Assigned(FPaintBox) then
    begin
      FPaintBox.MouseLeave;
    end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  RestRequest2.Params[0].Value := 'Token ' + APIKeyEdit.Text;
  RESTRequest2.Execute;

  var F := FDMemTable2.FindField('status');
  if F<>nil then
  begin
    if F.AsWideString='succeeded' then
    begin
      Timer1.Enabled := False;

      var OutputArray := ParseJSONStrArray(FDMemTable2.FieldByName('output').AsWideString);
      var LImageURL := OutputArray[0];

      var LMS := TMemoryStream.Create;

      NetHTTPClient1.Get(LImageURL,LMS);

      var LHash := THashMD5.GetHashString(LImageURL);

      var LFilename := ExtractFilePath(ParamStr(0)) + LHash + '.png';
      LMS.SaveToFile(LFilename);
      LMS.Free;

      var LMaskFilename := ExtractFilePath(ParamStr(0)) + LHash + '_mask.png';
      FPaintBox.SaveToFile(LMaskFileName);

      var LOriginalFilename := ExtractFilePath(ParamStr(0)) + LHash + '_original.png';
      SourceImage.Bitmap.SaveToFile(LOriginalFileName);


      PreviewImage.Bitmap.LoadFromFile(LFilename);
      ImageViewer.Bitmap.LoadFromFile(LFilename);

      TabControl.ActiveTab := ViewTabItem;
      FileMemTable.AppendRecord([LFilename,PromptMemo.Lines.Text]);
      FileMemTable.SaveToFile(ExtractFilePath(ParamStr(0)) + 'sdxli_database.fds');
      ProgressBar.Visible := False;
      GenerateButton.Enabled := True;
    end
    else
    if F.AsWideString='failed' then
    begin
      Timer1.Enabled := False;
      ProgressBar.Visible := False;
      GenerateButton.Enabled := True;
      ShowMessage(FDMemTable2.FieldByName('error').AsWideString);
    end;
  end;
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
    if ProgressBar.Value=ProgressBar.Max then
      ProgressBar.Value := ProgressBar.Min
    else
      ProgressBar.Value := ProgressBar.Value+5;
end;

procedure TMainForm.LineThicknessTBChange(Sender: TObject);
begin
  if Assigned(FPaintBox) then
    FPaintBox.Thickness := TTrackBar(Sender).Value;
end;

procedure TMainForm.ListBoxItem1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  ListBoxItemMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TMainForm.ListBoxItemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Assigned(FPaintBox) then
  begin
    DragImage.Bitmap.Assign(TListBoxItem(Sender).ItemData.Bitmap);
    DragImage.Bitmap.Resize(50,50);
    DragImage.Position.X := X+IconsListBox.Position.X-Trunc(DragImage.Bitmap.Width/2);
    DragImage.Position.Y := TListBoxItem(Sender).Position.Y+Y+IconsListBox.Position.Y-Trunc(DragImage.Bitmap.Height/2);
    DragImage.Tag := TListBoxItem(Sender).Tag;
    DragImage.Visible := True;
    DragImage.BringToFront;
  end;
end;

procedure TMainForm.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if TFile.Exists(ImagePathEdit.Text) then
  begin
    ImageViewer.Bitmap.LoadFromFile(ImagePathEdit.Text);
    PreviewImage.Bitmap.LoadFromFile(ImagePathEdit.Text);
  end;

  var LMaskImage := ImagePathEdit.Text.Replace('.png','_mask.png');
  if TFile.Exists(LMaskImage) then
  begin
    FPaintBox.LoadFromFile(LMaskImage);
  end;

  var LOriginalImage := ImagePathEdit.Text.Replace('.png','_original.png');
  if TFile.Exists(LOriginalImage) then
  begin
    SourceImage.Bitmap.LoadFromFile(LOriginalImage);
  end;

  PromptMemo.Lines.Text := FileMemTable.FieldByName('prompt').AsWideString;

  TabControl.ActiveTab := ViewTabItem;
end;

end.
