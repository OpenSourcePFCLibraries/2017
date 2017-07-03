HA$PBExportHeader$w_statusbarframe.srw
$PBExportComments$ENHANCED FOR 6.0!  Test the PFC 6.0 Status Bar.
forward
global type w_statusbarframe from w_frame
end type
type cb_modifytext from u_cb within w_statusbarframe
end type
type sle_modifytext from u_sle within w_statusbarframe
end type
type rb_harddrive from u_rb within w_statusbarframe
end type
type rb_networkdrive from u_rb within w_statusbarframe
end type
type gb_text from u_gb within w_statusbarframe
end type
type gb_modifybitmap from u_gb within w_statusbarframe
end type
type cb_1 from u_cb within w_statusbarframe
end type
type gb_bar from u_gb within w_statusbarframe
end type
end forward

global type w_statusbarframe from w_frame
int X=315
int Y=420
int Width=2331
int Height=612
boolean TitleBar=true
string Title="PFC Example - Status Bar"
cb_modifytext cb_modifytext
sle_modifytext sle_modifytext
rb_harddrive rb_harddrive
rb_networkdrive rb_networkdrive
gb_text gb_text
gb_modifybitmap gb_modifybitmap
cb_1 cb_1
gb_bar gb_bar
end type
global w_statusbarframe w_statusbarframe

on w_statusbarframe.create
int iCurrent
call super::create
this.cb_modifytext=create cb_modifytext
this.sle_modifytext=create sle_modifytext
this.rb_harddrive=create rb_harddrive
this.rb_networkdrive=create rb_networkdrive
this.gb_text=create gb_text
this.gb_modifybitmap=create gb_modifybitmap
this.cb_1=create cb_1
this.gb_bar=create gb_bar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifytext
this.Control[iCurrent+2]=this.sle_modifytext
this.Control[iCurrent+3]=this.rb_harddrive
this.Control[iCurrent+4]=this.rb_networkdrive
this.Control[iCurrent+5]=this.gb_text
this.Control[iCurrent+6]=this.gb_modifybitmap
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.gb_bar
end on

on w_statusbarframe.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_modifytext)
destroy(this.sle_modifytext)
destroy(this.rb_harddrive)
destroy(this.rb_networkdrive)
destroy(this.gb_text)
destroy(this.gb_modifybitmap)
destroy(this.cb_1)
destroy(this.gb_bar)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Start and initialize the Status Bar Service.
//
//////////////////////////////////////////////////////////////////////////////

// Start the Status Bar Service.
of_SetStatusBar(true)
if not IsValid(inv_statusbar) then return

// In the exact order tell the service what to display.
inv_statusbar.of_Register('text_id', 'text', sle_modifytext.text, 400)
inv_statusbar.of_Register('bitmap_id', 'bitmap', 'cdromtpt.bmp', 100)

inv_statusbar.of_Setbar(true)
inv_statusbar.of_SetBarFillColor(255)
inv_statusbar.of_SetBarDisplayStyle(inv_statusbar.PCTCOMPLETE)

inv_statusbar.of_SetMem(true)
inv_statusbar.of_SetTimer(true)

end event

event pfc_premrusave;return 0
end event

type cb_modifytext from u_cb within w_statusbarframe
int X=1303
int Y=204
int Width=375
int TabOrder=40
string Text="&Modify Text"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Modify the text on the status bar.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(inv_statusbar) then
	inv_statusbar.of_Modify('text_id', sle_modifytext.text)
end if
end event

type sle_modifytext from u_sle within w_statusbarframe
int X=677
int Y=108
int Width=1006
int TabOrder=50
string Text="Any Text"
long BackColor=1086374080
end type

type rb_harddrive from u_rb within w_statusbarframe
event clicked pbm_bnclicked
int X=82
int Y=192
int Width=475
int Height=64
boolean BringToTop=true
string Text="Hard Drive"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Change the bitmap on the status bar.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(inv_statusbar) then
	inv_statusbar.of_Modify('bitmap_id', 'Harddriv.bmp')
end if

end event

type rb_networkdrive from u_rb within w_statusbarframe
int X=82
int Y=108
int Width=475
int Height=64
string Text="CD Rom Drive"
boolean Checked=true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Change the bitmap on the status bar.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(inv_statusbar) then
	inv_statusbar.of_Modify('bitmap_id', 'cdromtpt.bmp')
end if
end event

type gb_text from u_gb within w_statusbarframe
int X=626
int Y=28
int Width=1093
int Height=296
int TabOrder=20
string Text="Text"
end type

type gb_modifybitmap from u_gb within w_statusbarframe
int X=37
int Y=28
int Width=539
int Height=296
int TabOrder=30
string Text="Change the Bitmap"
end type

type cb_1 from u_cb within w_statusbarframe
int X=1838
int Y=144
int Width=375
int TabOrder=10
boolean BringToTop=true
string Text="&Start"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Start a progress bar on the status bar.
//
//////////////////////////////////////////////////////////////////////////////

integer		li_index
long			ll_complete

if IsValid(inv_statusbar) then
	SetPointer(hourglass!)
	for li_index = 1 to 10000
		if mod(li_index, 100) = 0 then
			ll_complete = inv_statusbar.of_BarIncrement(1)
			if ll_complete < 0 then exit
		end if
	next
end if
end event

type gb_bar from u_gb within w_statusbarframe
int X=1765
int Y=28
int Width=503
int Height=296
int TabOrder=11
string Text="Progress Bar"
end type

