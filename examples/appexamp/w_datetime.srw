HA$PBExportHeader$w_datetime.srw
$PBExportComments$Window to chage date/tiem for File Services example
forward
global type w_datetime from w_response
end type
type st_filedate from u_st within w_datetime
end type
type st_filetime from u_st within w_datetime
end type
type sle_date from u_sle within w_datetime
end type
type sle_time from u_sle within w_datetime
end type
type cb_ok from u_cb within w_datetime
end type
type cb_cancel from u_cb within w_datetime
end type
end forward

global type w_datetime from w_response
int X=947
int Y=697
int Width=769
int Height=517
boolean TitleBar=true
string Title="File Date/Time"
st_filedate st_filedate
st_filetime st_filetime
sle_date sle_date
sle_time sle_time
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_datetime w_datetime

event open;call super::open;String	ls_Parm

ls_Parm = Message.StringParm

sle_date.text = Left(ls_Parm, 8)
sle_time.text = String(Time(Right(ls_Parm, 8)), "hh:mm am/pm")
end event

on w_datetime.create
int iCurrent
call w_response::create
this.st_filedate=create st_filedate
this.st_filetime=create st_filetime
this.sle_date=create sle_date
this.sle_time=create sle_time
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=st_filedate
this.Control[iCurrent+2]=st_filetime
this.Control[iCurrent+3]=sle_date
this.Control[iCurrent+4]=sle_time
this.Control[iCurrent+5]=cb_ok
this.Control[iCurrent+6]=cb_cancel
end on

on w_datetime.destroy
call w_response::destroy
destroy(this.st_filedate)
destroy(this.st_filetime)
destroy(this.sle_date)
destroy(this.sle_time)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

type st_filedate from u_st within w_datetime
int X=51
int Y=37
int Width=252
string Text="File Date:"
Alignment Alignment=Right!
long TextColor=41943040
end type

type st_filetime from u_st within w_datetime
int X=51
int Y=145
int Width=252
int Height=69
boolean BringToTop=true
string Text="File Time:"
Alignment Alignment=Right!
long TextColor=41943040
end type

type sle_date from u_sle within w_datetime
int X=334
int Y=29
int Width=270
int TabOrder=10
long TextColor=41943040
long BackColor=1090519039
end type

type sle_time from u_sle within w_datetime
int X=334
int Y=141
int Width=270
int TabOrder=20
boolean BringToTop=true
long TextColor=41943040
long BackColor=1090519039
end type

type cb_ok from u_cb within w_datetime
int X=115
int Y=273
int Width=243
int TabOrder=30
string Text="OK"
boolean Default=true
end type

event clicked;call super::clicked;String	ls_Date, ls_Time

If Not IsDate(sle_date.text) Or Not IsTime(sle_Time.text) Then
	MessageBox("File Services", "Invalid Date/Time", Exclamation!)
	Return
End if

ls_Date = String(Date(sle_date.text), "mm/dd/yy")
ls_Time = String(Time(sle_time.text), "hh:mm:ss")

CloseWithReturn(Parent, ls_Date + ls_Time)
end event

type cb_cancel from u_cb within w_datetime
int X=407
int Y=273
int Width=243
int TabOrder=40
boolean BringToTop=true
string Text="Cancel"
end type

event clicked;call u_cb::clicked;CloseWithReturn(Parent, "")
end event

