HA$PBExportHeader$w_actions.srw
$PBExportComments$Window to request action for file services example
forward
global type w_actions from w_response
end type
type st_message from u_st within w_actions
end type
type sle_name from u_sle within w_actions
end type
type cb_ok from u_cb within w_actions
end type
type cb_cancel from u_cb within w_actions
end type
end forward

global type w_actions from w_response
int X=695
int Y=696
int Width=1321
int Height=496
boolean TitleBar=true
string Title="Action"
st_message st_message
sle_name sle_name
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_actions w_actions

event open;call super::open;
st_message.text = Message.StringParm
end event

on w_actions.create
int iCurrent
call super::create
this.st_message=create st_message
this.sle_name=create sle_name
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_message
this.Control[iCurrent+2]=this.sle_name
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_actions.destroy
call super::destroy
destroy(this.st_message)
destroy(this.sle_name)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

type st_message from u_st within w_actions
int X=46
int Y=40
int Width=1051
string Text=""
long TextColor=41943040
long BackColor=79219928
end type

type sle_name from u_sle within w_actions
int X=41
int Y=144
int Width=1211
int TabOrder=10
long TextColor=41943040
long BackColor=1080593568
end type

type cb_ok from u_cb within w_actions
int X=521
int Y=256
int TabOrder=20
string Text="OK"
boolean Default=true
end type

event clicked;call u_cb::clicked;CloseWithReturn(Parent, sle_name.text)
end event

type cb_cancel from u_cb within w_actions
event clicked pbm_bnclicked
int X=905
int Y=256
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
end type

event clicked;call u_cb::clicked;CloseWithReturn(Parent, "")
end event

