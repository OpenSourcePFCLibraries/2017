HA$PBExportHeader$u_pbargeneral.sru
forward
global type u_pbargeneral from u_tabpg
end type
type cbx_autoreset from u_cbx within u_pbargeneral
end type
type ddlb_fillstyle from u_ddlb within u_pbargeneral
end type
type ddlb_displaystyle from u_ddlb within u_pbargeneral
end type
type st_1 from u_st within u_pbargeneral
end type
type st_3 from u_st within u_pbargeneral
end type
type st_4 from u_st within u_pbargeneral
end type
type ddlb_borderstyle from u_ddlb within u_pbargeneral
end type
type st_8 from u_st within u_pbargeneral
end type
type gb_2 from u_gb within u_pbargeneral
end type
type ddlb_messagetext from u_ddlb within u_pbargeneral
end type
type st_5 from u_st within u_pbargeneral
end type
type sle_minimum from u_sle within u_pbargeneral
end type
type st_6 from u_st within u_pbargeneral
end type
type sle_maximum from u_sle within u_pbargeneral
end type
type st_7 from u_st within u_pbargeneral
end type
type sle_step from u_sle within u_pbargeneral
end type
type gb_1 from u_gb within u_pbargeneral
end type
end forward

global type u_pbargeneral from u_tabpg
int Width=1381
int Height=1516
event ue_apply ( )
cbx_autoreset cbx_autoreset
ddlb_fillstyle ddlb_fillstyle
ddlb_displaystyle ddlb_displaystyle
st_1 st_1
st_3 st_3
st_4 st_4
ddlb_borderstyle ddlb_borderstyle
st_8 st_8
gb_2 gb_2
ddlb_messagetext ddlb_messagetext
st_5 st_5
sle_minimum sle_minimum
st_6 st_6
sle_maximum sle_maximum
st_7 st_7
sle_step sle_step
gb_1 gb_1
end type
global u_pbargeneral u_pbargeneral

type variables
Public:
boolean               ib_selectionchanged = false
string                    is_messages[]
string                    is_selectedmsg
u_progressbar      iuo_progbar
end variables

event ue_apply;call super::ue_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_apply
//
//	Description:
//	Applies user changes to the passed in Progress Bar.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License
 * 
 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_index

iuo_progbar = message.powerobjectparm

iuo_progbar.of_SetMessageText(is_messages)	

iuo_progbar.of_SetAutoReset(cbx_autoreset.checked)

if iuo_progbar.border = false and ddlb_borderstyle.text <> "None" then
	iuo_progbar.border = true
end if

choose case ddlb_borderstyle.text
	case "Box"
		iuo_progbar.borderstyle = stylebox!
	case "3D Lowered"
		iuo_progbar.borderstyle = stylelowered!
	case "3D Raised"
		iuo_progbar.borderstyle = styleraised!	
	case "ShadowBox"
		iuo_progbar.borderstyle = styleshadowbox!
	case "None"
		iuo_progbar.border = false
end choose

li_index = ddlb_displaystyle.FindItem(ddlb_displaystyle.text, 0)
iuo_progbar.of_SetDisplayStyle(li_index - 1)

li_index = ddlb_fillstyle.FindItem(ddlb_fillstyle.text, 0)
iuo_progbar.of_SetFillStyle(li_index - 1)

if IsNumber(sle_maximum.text) then
	iuo_progbar.of_SetMaximum(Integer(sle_maximum.text))
end if

if IsNumber(sle_minimum.text) then
	iuo_progbar.of_SetMinimum(Integer(sle_minimum.text))
end if

if IsNumber(sle_step.text) then
	iuo_progbar.of_SetStep(Integer(sle_step.text))
end if

end event

on u_pbargeneral.create
int iCurrent
call u_tabpg::create
this.cbx_autoreset=create cbx_autoreset
this.ddlb_fillstyle=create ddlb_fillstyle
this.ddlb_displaystyle=create ddlb_displaystyle
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_borderstyle=create ddlb_borderstyle
this.st_8=create st_8
this.gb_2=create gb_2
this.ddlb_messagetext=create ddlb_messagetext
this.st_5=create st_5
this.sle_minimum=create sle_minimum
this.st_6=create st_6
this.sle_maximum=create sle_maximum
this.st_7=create st_7
this.sle_step=create sle_step
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=cbx_autoreset
this.Control[iCurrent+2]=ddlb_fillstyle
this.Control[iCurrent+3]=ddlb_displaystyle
this.Control[iCurrent+4]=st_1
this.Control[iCurrent+5]=st_3
this.Control[iCurrent+6]=st_4
this.Control[iCurrent+7]=ddlb_borderstyle
this.Control[iCurrent+8]=st_8
this.Control[iCurrent+9]=gb_2
this.Control[iCurrent+10]=ddlb_messagetext
this.Control[iCurrent+11]=st_5
this.Control[iCurrent+12]=sle_minimum
this.Control[iCurrent+13]=st_6
this.Control[iCurrent+14]=sle_maximum
this.Control[iCurrent+15]=st_7
this.Control[iCurrent+16]=sle_step
this.Control[iCurrent+17]=gb_1
end on

on u_pbargeneral.destroy
call u_tabpg::destroy
destroy(this.cbx_autoreset)
destroy(this.ddlb_fillstyle)
destroy(this.ddlb_displaystyle)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_borderstyle)
destroy(this.st_8)
destroy(this.gb_2)
destroy(this.ddlb_messagetext)
destroy(this.st_5)
destroy(this.sle_minimum)
destroy(this.st_6)
destroy(this.sle_maximum)
destroy(this.st_7)
destroy(this.sle_step)
destroy(this.gb_1)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the controls on the window by polling the Progress Bar that 
// was passed in for its current settings.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License
 * 
 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_borderindex
integer	li_count
integer	li_displaystyle
integer  li_fillstyle
integer	li_msgcount
integer	li_style

iuo_progbar = message.powerobjectparm

//Initialize the controls.
li_msgcount = iuo_progbar.of_GetMessageText(is_messages[])
if li_msgcount > 0 then
	for li_count = 1 to li_msgcount
		ddlb_messagetext.AddItem(is_messages[li_count])
	next
	ddlb_messagetext.SelectItem(1)
	is_selectedmsg = ddlb_messagetext.Text(1)
else
	is_selectedmsg = ""
end if

cbx_autoreset.checked = iuo_progbar.of_IsAutoReset()

if iuo_progbar.border = true then
	choose case iuo_progbar.borderstyle
		case stylebox!
			ddlb_borderstyle.SelectItem("Box", li_borderindex)
		case stylelowered!
			ddlb_borderstyle.SelectItem("3D Lowered", li_borderindex)
		case styleraised!
			ddlb_borderstyle.SelectItem("3D Raised", li_borderindex)
		case styleshadowbox!
			ddlb_borderstyle.SelectItem("ShadowBox", li_borderindex)
	end choose
else
	ddlb_borderstyle.SelectItem("None", li_borderindex)
end if

li_displaystyle = iuo_progbar.of_GetDisplayStyle()
ddlb_displaystyle.SelectItem(li_displaystyle + 1)

li_fillstyle = iuo_progbar.of_GetFillStyle()
ddlb_fillstyle.SelectItem(li_fillstyle + 1)

sle_maximum.text = String(iuo_progbar.of_GetMaximum())
sle_minimum.text = String(iuo_progbar.of_GetMinimum())
sle_step.text = String(iuo_progbar.of_GetStep())

end event

type cbx_autoreset from u_cbx within u_pbargeneral
int X=96
int Y=1172
int Width=334
int TabOrder=80
string Text="Auto-&reset"
end type

type ddlb_fillstyle from u_ddlb within u_pbargeneral
int X=91
int Y=1000
int Width=567
int Height=388
int TabOrder=60
boolean Sorted=false
int Accelerator=102
string Item[]={"LEFTRIGHT",&
"RIGHTLEFT",&
"TOPBOTTOM",&
"BOTTOMTOP"}
end type

type ddlb_displaystyle from u_ddlb within u_pbargeneral
int X=91
int Y=780
int Width=567
int Height=428
int TabOrder=50
string Tag="ddlb_displaystyle"
boolean BringToTop=true
boolean Sorted=false
int Accelerator=100
string Item[]={"BAR",&
"PCTCOMPLETE",&
"POSITION",&
"MSGTEXT"}
end type

type st_1 from u_st within u_pbargeneral
int X=41
int Y=72
int Width=270
string Text="&Messages:"
end type

type st_3 from u_st within u_pbargeneral
int X=91
int Y=692
boolean BringToTop=true
string Text="&Display Style:"
end type

type st_4 from u_st within u_pbargeneral
int X=91
int Y=912
int Width=224
boolean BringToTop=true
string Text="&Fill Style:"
end type

type ddlb_borderstyle from u_ddlb within u_pbargeneral
int X=727
int Y=780
int Width=567
int Height=388
int TabOrder=70
boolean Sorted=false
int Accelerator=98
string Item[]={"3D Lowered",&
"3D Raised",&
"Box",&
"ShadowBox",&
"None"}
end type

type st_8 from u_st within u_pbargeneral
int X=727
int Y=692
boolean BringToTop=true
string Text="&Border Style:"
end type

type gb_2 from u_gb within u_pbargeneral
int X=41
int Y=596
int Width=1307
int Height=820
int TabOrder=0
string Text="Style Options"
end type

type ddlb_messagetext from u_ddlb within u_pbargeneral
int X=315
int Y=76
int Width=1019
int Height=380
int TabOrder=10
boolean Sorted=false
boolean AllowEdit=true
int Accelerator=109
end type

event selectionchanged;call super::selectionchanged;is_selectedmsg = this.text
ib_selectionchanged = true
end event

event modified;call super::modified;integer	li_count
integer	li_index
integer	li_msgcount
integer	li_newmessage

if ib_selectionchanged = true then
	ib_selectionchanged = false
	return 0
end if

if this.TotalItems() > 0 then
	li_index = FindItem(is_selectedmsg, 0)
	is_messages[li_index] = this.text
	is_selectedmsg = this.text
	// Reset the list box and repopulate it.
	li_msgcount = Upperbound(is_messages)
	if li_msgcount > 0 then
		Reset()
		for li_count = 1 to li_msgcount
			ddlb_messagetext.AddItem(is_messages[li_count])
		next
		if is_selectedmsg <> "" then
			li_index = FindItem(is_selectedmsg, 0)
			ddlb_messagetext.SelectItem(li_index)
		end if
	end if
else
	li_newmessage = Upperbound(is_messages) + 1
	is_messages[li_newmessage] = this.text
	is_selectedmsg = this.text
	AddItem(this.text)
end if
end event

type st_5 from u_st within u_pbargeneral
int X=137
int Y=296
int Width=347
string Text="Mi&nimum:"
end type

type sle_minimum from u_sle within u_pbargeneral
int X=137
int Y=372
int Width=338
int TabOrder=20
int Accelerator=110
end type

type st_6 from u_st within u_pbargeneral
int X=535
int Y=296
int Width=361
string Text="Ma&ximum:"
end type

type sle_maximum from u_sle within u_pbargeneral
int X=535
int Y=372
int Width=338
int TabOrder=30
int Accelerator=120
end type

type st_7 from u_st within u_pbargeneral
int X=937
int Y=296
int Width=151
string Text="Ste&p:"
end type

type sle_step from u_sle within u_pbargeneral
int X=933
int Y=372
int Width=338
int TabOrder=40
int Accelerator=112
end type

type gb_1 from u_gb within u_pbargeneral
int X=41
int Y=200
int Width=1307
int Height=312
int TabOrder=0
string Text="Increment Options"
end type

