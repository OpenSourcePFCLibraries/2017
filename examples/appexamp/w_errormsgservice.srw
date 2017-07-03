HA$PBExportHeader$w_errormsgservice.srw
$PBExportComments$Error messaging service example
forward
global type w_errormsgservice from w_main
end type
type cb_close from u_cb within w_errormsgservice
end type
type sle_title from u_sle within w_errormsgservice
end type
type mle_errmsg from u_mle within w_errormsgservice
end type
type rb_stop from u_rb within w_errormsgservice
end type
type rb_information from u_rb within w_errormsgservice
end type
type rb_question from u_rb within w_errormsgservice
end type
type rb_exclamation from u_rb within w_errormsgservice
end type
type rb_none from u_rb within w_errormsgservice
end type
type rb_ok from u_rb within w_errormsgservice
end type
type rb_yesno from u_rb within w_errormsgservice
end type
type rb_retrycancel from u_rb within w_errormsgservice
end type
type rb_okcancel from u_rb within w_errormsgservice
end type
type rb_yesnocancel from u_rb within w_errormsgservice
end type
type rb_abortretryignore from u_rb within w_errormsgservice
end type
type gb_button from u_gb within w_errormsgservice
end type
type gb_icon from u_gb within w_errormsgservice
end type
type cb_sendmessage from u_cb within w_errormsgservice
end type
type st_default from u_st within w_errormsgservice
end type
type sle_msg_default from singlelineedit within w_errormsgservice
end type
type st_severity from u_st within w_errormsgservice
end type
type sle_msg_severity from singlelineedit within w_errormsgservice
end type
type cbx_msg_print from u_cbx within w_errormsgservice
end type
type cbx_msg_userinput from u_cbx within w_errormsgservice
end type
type gb_other from u_gb within w_errormsgservice
end type
type st_text from u_st within w_errormsgservice
end type
type st_title from u_st within w_errormsgservice
end type
type st_rc from u_st within w_errormsgservice
end type
type gb_createmessage from u_gb within w_errormsgservice
end type
type gb_sendmessage from u_gb within w_errormsgservice
end type
type sle_msg_clickedbutton from u_sle within w_errormsgservice
end type
end forward

global type w_errormsgservice from w_main
integer x = 443
integer y = 8
integer width = 2094
integer height = 1780
string title = "PFC Example:  Error Service Example"
boolean resizable = false
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_close cb_close
sle_title sle_title
mle_errmsg mle_errmsg
rb_stop rb_stop
rb_information rb_information
rb_question rb_question
rb_exclamation rb_exclamation
rb_none rb_none
rb_ok rb_ok
rb_yesno rb_yesno
rb_retrycancel rb_retrycancel
rb_okcancel rb_okcancel
rb_yesnocancel rb_yesnocancel
rb_abortretryignore rb_abortretryignore
gb_button gb_button
gb_icon gb_icon
cb_sendmessage cb_sendmessage
st_default st_default
sle_msg_default sle_msg_default
st_severity st_severity
sle_msg_severity sle_msg_severity
cbx_msg_print cbx_msg_print
cbx_msg_userinput cbx_msg_userinput
gb_other gb_other
st_text st_text
st_title st_title
st_rc st_rc
gb_createmessage gb_createmessage
gb_sendmessage gb_sendmessage
sle_msg_clickedbutton sle_msg_clickedbutton
end type
global w_errormsgservice w_errormsgservice

type variables
Protected:
boolean	ib_errorserviceon=false
boolean 	ib_log=false
integer	ii_prevstyle

button	ie_buttons=ok!
icon	ie_icon=stopsign!


end variables

on w_errormsgservice.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.sle_title)
destroy(this.mle_errmsg)
destroy(this.rb_stop)
destroy(this.rb_information)
destroy(this.rb_question)
destroy(this.rb_exclamation)
destroy(this.rb_none)
destroy(this.rb_ok)
destroy(this.rb_yesno)
destroy(this.rb_retrycancel)
destroy(this.rb_okcancel)
destroy(this.rb_yesnocancel)
destroy(this.rb_abortretryignore)
destroy(this.gb_button)
destroy(this.gb_icon)
destroy(this.cb_sendmessage)
destroy(this.st_default)
destroy(this.sle_msg_default)
destroy(this.st_severity)
destroy(this.sle_msg_severity)
destroy(this.cbx_msg_print)
destroy(this.cbx_msg_userinput)
destroy(this.gb_other)
destroy(this.st_text)
destroy(this.st_title)
destroy(this.st_rc)
destroy(this.gb_createmessage)
destroy(this.gb_sendmessage)
destroy(this.sle_msg_clickedbutton)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
//	Initialize the window and make sure that the error service is on 
// for this example.  Store initial settings so that they can be 
// restored when the example is closed.
//
//////////////////////////////////////////////////////////////////////////////

// Make sure the Error Service is on for this example.
ib_errorserviceon = IsValid(gnv_app.inv_error)
if not ib_errorserviceon then
	gnv_app.of_SetError(true)
else
	//Store the Style prior to this example.
	ii_prevstyle = gnv_app.inv_error.of_GetStyle()
end if

// Use the service window instead of powerbuilder's.
gnv_app.inv_error.of_SetStyle(1)

end event

event close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Description:
//	Restore previous error service settings.
//
//////////////////////////////////////////////////////////////////////////////

// If appropriate, turn off the Error Service.
if not ib_errorserviceon then
	gnv_app.of_SetError(false)
else
	// Reset the style as before this example.
	gnv_app.inv_error.of_SetStyle(ii_prevstyle)
end if

end event

on w_errormsgservice.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.sle_title=create sle_title
this.mle_errmsg=create mle_errmsg
this.rb_stop=create rb_stop
this.rb_information=create rb_information
this.rb_question=create rb_question
this.rb_exclamation=create rb_exclamation
this.rb_none=create rb_none
this.rb_ok=create rb_ok
this.rb_yesno=create rb_yesno
this.rb_retrycancel=create rb_retrycancel
this.rb_okcancel=create rb_okcancel
this.rb_yesnocancel=create rb_yesnocancel
this.rb_abortretryignore=create rb_abortretryignore
this.gb_button=create gb_button
this.gb_icon=create gb_icon
this.cb_sendmessage=create cb_sendmessage
this.st_default=create st_default
this.sle_msg_default=create sle_msg_default
this.st_severity=create st_severity
this.sle_msg_severity=create sle_msg_severity
this.cbx_msg_print=create cbx_msg_print
this.cbx_msg_userinput=create cbx_msg_userinput
this.gb_other=create gb_other
this.st_text=create st_text
this.st_title=create st_title
this.st_rc=create st_rc
this.gb_createmessage=create gb_createmessage
this.gb_sendmessage=create gb_sendmessage
this.sle_msg_clickedbutton=create sle_msg_clickedbutton
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.sle_title
this.Control[iCurrent+3]=this.mle_errmsg
this.Control[iCurrent+4]=this.rb_stop
this.Control[iCurrent+5]=this.rb_information
this.Control[iCurrent+6]=this.rb_question
this.Control[iCurrent+7]=this.rb_exclamation
this.Control[iCurrent+8]=this.rb_none
this.Control[iCurrent+9]=this.rb_ok
this.Control[iCurrent+10]=this.rb_yesno
this.Control[iCurrent+11]=this.rb_retrycancel
this.Control[iCurrent+12]=this.rb_okcancel
this.Control[iCurrent+13]=this.rb_yesnocancel
this.Control[iCurrent+14]=this.rb_abortretryignore
this.Control[iCurrent+15]=this.gb_button
this.Control[iCurrent+16]=this.gb_icon
this.Control[iCurrent+17]=this.cb_sendmessage
this.Control[iCurrent+18]=this.st_default
this.Control[iCurrent+19]=this.sle_msg_default
this.Control[iCurrent+20]=this.st_severity
this.Control[iCurrent+21]=this.sle_msg_severity
this.Control[iCurrent+22]=this.cbx_msg_print
this.Control[iCurrent+23]=this.cbx_msg_userinput
this.Control[iCurrent+24]=this.gb_other
this.Control[iCurrent+25]=this.st_text
this.Control[iCurrent+26]=this.st_title
this.Control[iCurrent+27]=this.st_rc
this.Control[iCurrent+28]=this.gb_createmessage
this.Control[iCurrent+29]=this.gb_sendmessage
this.Control[iCurrent+30]=this.sle_msg_clickedbutton
end on

type cb_close from u_cb within w_errormsgservice
string text = "Close"
integer x = 1687
integer y = 1564
integer taborder = 100
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_close event on the window.
//
//////////////////////////////////////////////////////////////////////////////

parent.event pfc_close()

end event

type sle_title from u_sle within w_errormsgservice
long textcolor = 41943040
long backcolor = 1080593568
string text = "Application Name"
integer x = 87
integer y = 188
integer width = 1879
integer taborder = 10
end type

type mle_errmsg from u_mle within w_errormsgservice
long textcolor = 41943040
long backcolor = 1080593568
string text = "Invalid Data Entered."
boolean vscrollbar = true
integer x = 87
integer y = 368
integer width = 1879
integer taborder = 20
end type

type rb_stop from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "StopSign!"
boolean checked = true
integer x = 128
integer y = 744
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected icon datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_icon = stopsign!
end event

type rb_information from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "Information!"
integer x = 128
integer y = 812
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected icon datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_icon = information!
end event

type rb_question from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "Question!"
integer x = 128
integer y = 880
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected icon datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_icon = Question!
end event

type rb_exclamation from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "Exclamation!"
integer x = 128
integer y = 944
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected icon datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_icon = exclamation!
end event

type rb_none from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "None!"
integer x = 128
integer y = 1008
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected icon datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_icon = none!
end event

type rb_ok from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "OK!"
boolean checked = true
integer x = 709
integer y = 744
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = ok!
end event

type rb_yesno from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "YesNo!"
integer x = 709
integer y = 808
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = YesNo!
end event

type rb_retrycancel from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "RetryCancel!"
integer x = 709
integer y = 872
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = RetryCancel!
end event

type rb_okcancel from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "OkCancel!"
integer x = 709
integer y = 936
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = OkCancel!
end event

type rb_yesnocancel from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "YesNoCancel!"
integer x = 709
integer y = 1000
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = YesNoCancel!
end event

type rb_abortretryignore from u_rb within w_errormsgservice
event clicked pbm_bnclicked
long textcolor = 41943040
long backcolor = 79220952
string text = "AbortRetryIgnore!"
integer x = 709
integer y = 1064
integer width = 480
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the instance variable that stores the selected buttonstyle datatype.
//
//////////////////////////////////////////////////////////////////////////////

ie_buttons = abortretryignore!
end event

type gb_button from u_gb within w_errormsgservice
long textcolor = 0
long backcolor = 79741120
string text = "Select a ButtonStyle"
integer x = 672
integer y = 684
integer width = 544
integer height = 468
integer taborder = 40
end type

type gb_icon from u_gb within w_errormsgservice
long textcolor = 0
long backcolor = 79741120
string text = "Select an Icon"
integer x = 91
integer y = 684
integer width = 512
integer height = 468
integer taborder = 30
end type

type cb_sendmessage from u_cb within w_errormsgservice
event clicked pbm_bnclicked
string text = "&Run"
boolean default = true
integer x = 535
integer y = 1368
integer taborder = 90
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Create the specified MessageBox.
//
//////////////////////////////////////////////////////////////////////////////

boolean	lb_print
boolean	lb_userinput
integer	li_default
integer	li_rc
integer	li_severity
string 	ls_errmsg
string	ls_titletext

lb_print			= cbx_msg_print.checked
lb_userinput	= cbx_msg_userinput.checked
li_default 		= Integer(sle_msg_default.text)
li_severity 	= Integer(sle_msg_severity.text)
ls_errmsg 		= mle_errmsg.text	
ls_titletext 	= sle_title.text

li_rc = gnv_app.inv_error.of_Message( &
	ls_titletext, ls_errmsg, ie_icon, ie_buttons, li_default, &
	li_severity, lb_print, lb_userinput)

parent.sle_msg_clickedbutton.text = String(li_rc)

return li_rc
end event

type st_default from u_st within w_errormsgservice
long textcolor = 41943040
long backcolor = 79220952
string text = "Default Button:"
integer x = 1353
integer y = 780
end type

type sle_msg_default from singlelineedit within w_errormsgservice
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 41943040
string text = "1"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
integer x = 1737
integer y = 780
integer width = 192
integer height = 76
integer taborder = 50
end type

type st_severity from u_st within w_errormsgservice
long textcolor = 41943040
long backcolor = 79220952
string text = "Severity:"
integer x = 1353
integer y = 860
end type

type sle_msg_severity from singlelineedit within w_errormsgservice
event getfocus pbm_ensetfocus
event losefocus pbm_enkillfocus
event modified pbm_enmodified
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 41943040
string text = "1"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
integer x = 1737
integer y = 860
integer width = 192
integer height = 76
integer taborder = 60
end type

type cbx_msg_print from u_cbx within w_errormsgservice
long textcolor = 41943040
long backcolor = 79220952
string text = "Print"
integer x = 1353
integer y = 932
integer taborder = 70
end type

type cbx_msg_userinput from u_cbx within w_errormsgservice
long textcolor = 41943040
long backcolor = 79220952
string text = "User Input"
integer x = 1353
integer y = 1012
integer width = 334
integer taborder = 80
end type

type gb_other from u_gb within w_errormsgservice
long textcolor = 0
long backcolor = 79741120
string text = "Specify Other Characteristics"
integer x = 1285
integer y = 684
integer width = 704
integer height = 468
integer taborder = 0
end type

type st_text from u_st within w_errormsgservice
long backcolor = 79741120
string text = "Enter the text that you would like to see in the message box."
integer x = 87
integer y = 320
integer width = 1303
end type

type st_title from u_st within w_errormsgservice
long backcolor = 79741120
string text = "Enter a Title for the Title Bar."
integer x = 87
integer y = 128
integer width = 626
end type

type st_rc from u_st within w_errormsgservice
string text = "Return Code:"
integer x = 974
integer y = 1388
integer width = 325
end type

type gb_createmessage from u_gb within w_errormsgservice
long backcolor = 79741120
string text = "Example Options"
integer x = 32
integer y = 32
integer width = 2011
integer height = 1200
integer taborder = 0
end type

type gb_sendmessage from u_gb within w_errormsgservice
long textcolor = 0
long backcolor = 79741120
string text = "View your message box and check the return code."
integer x = 32
integer y = 1276
integer width = 2011
integer height = 252
integer taborder = 0
end type

type sle_msg_clickedbutton from u_sle within w_errormsgservice
event constructor pbm_constructor
long textcolor = 33554432
long backcolor = 79741120
boolean displayonly = true
integer x = 1312
integer y = 1380
integer width = 270
integer taborder = 0
boolean bringtotop = true
end type

