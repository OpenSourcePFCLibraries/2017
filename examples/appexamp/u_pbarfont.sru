HA$PBExportHeader$u_pbarfont.sru
forward
global type u_pbarfont from u_tabpg
end type
type lb_fonts from u_lb within u_pbarfont
end type
type lb_fontstyles from u_lb within u_pbarfont
end type
type lb_size from u_lb within u_pbarfont
end type
type st_1 from u_st within u_pbarfont
end type
type st_2 from u_st within u_pbarfont
end type
type st_3 from u_st within u_pbarfont
end type
type sle_fonts from u_sle within u_pbarfont
end type
type sle_fontstyles from u_sle within u_pbarfont
end type
type sle_size from u_sle within u_pbarfont
end type
type cbx_underline from u_cbx within u_pbarfont
end type
type st_textcolor from u_st within u_pbarfont
end type
type st_bkgdcolor from u_st within u_pbarfont
end type
type ddlb_textcolor from u_ddlb within u_pbarfont
end type
type ddlb_bkgdcolor from u_ddlb within u_pbarfont
end type
type ddlb_fillcolor from u_ddlb within u_pbarfont
end type
type st_fillcolor from u_st within u_pbarfont
end type
type dw_sample from u_dw within u_pbarfont
end type
type gb_1 from u_gb within u_pbarfont
end type
end forward

global type u_pbarfont from u_tabpg
int Width=1381
int Height=1469
long BackColor=77571519
event ue_apply ( )
lb_fonts lb_fonts
lb_fontstyles lb_fontstyles
lb_size lb_size
st_1 st_1
st_2 st_2
st_3 st_3
sle_fonts sle_fonts
sle_fontstyles sle_fontstyles
sle_size sle_size
cbx_underline cbx_underline
st_textcolor st_textcolor
st_bkgdcolor st_bkgdcolor
ddlb_textcolor ddlb_textcolor
ddlb_bkgdcolor ddlb_bkgdcolor
ddlb_fillcolor ddlb_fillcolor
st_fillcolor st_fillcolor
dw_sample dw_sample
gb_1 gb_1
end type
global u_pbarfont u_pbarfont

type variables
boolean                ib_dwconstructed = false
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

if not IsValid(iuo_progbar) then
	return
end if

iuo_progbar.of_SetFontFace(sle_fonts.text)
iuo_progbar.of_SetFontSize(Integer(sle_size.text))
choose case sle_fontstyles.text
	case "Regular"
		iuo_progbar.of_SetFontItalic(false)
		iuo_progbar.of_SetFontBold(false)
	case "Bold"
		iuo_progbar.of_SetFontItalic(false)
		iuo_progbar.of_SetFontBold(true)
	case "Italic"
		iuo_progbar.of_SetFontItalic(true)
		iuo_progbar.of_SetFontBold(false)
	case "Bold Italic"
		iuo_progbar.of_SetFontItalic(true)
		iuo_progbar.of_SetFontBold(true)
end choose

iuo_progbar.of_SetFontUnderline(cbx_underline.checked)

choose case ddlb_bkgdcolor.text
	case "Black"
		iuo_progbar.of_SetBackColor(RGB(0,0,0))
	case "White"
		iuo_progbar.of_SetBackColor(RGB(255,255,255))
	case "Red"
		iuo_progbar.of_SetBackColor(RGB(255,0,0))
	case "Dk. Red"
		iuo_progbar.of_SetBackColor(RGB(128,0,0))
	case "Green"
		iuo_progbar.of_SetBackColor(RGB(0,255,0))
	case "Dk. Green"
		iuo_progbar.of_SetBackColor(RGB(0,128,0))
	case "Blue"
		iuo_progbar.of_SetBackColor(RGB(0,0,255))
	case "Dk. Blue"
		iuo_progbar.of_SetBackColor(RGB(0,0,128))
	case "Yellow"
		iuo_progbar.of_SetBackColor(RGB(255,255,0))
	case "Buttonface"
		iuo_progbar.of_SetBackColor(this.backcolor)
end choose

choose case ddlb_fillcolor.text
	case "Black"
		iuo_progbar.of_SetFillColor(RGB(0,0,0))
	case "White"
		iuo_progbar.of_SetFillColor(RGB(255,255,255))
	case "Red"
		iuo_progbar.of_SetFillColor(RGB(255,0,0))
	case "Dk. Red"
		iuo_progbar.of_SetFillColor(RGB(128,0,0))
	case "Green"
		iuo_progbar.of_SetFillColor(RGB(0,255,0))
	case "Dk. Green"
		iuo_progbar.of_SetFillColor(RGB(0,128,0))
	case "Blue"
		iuo_progbar.of_SetFillColor(RGB(0,0,255))
	case "Dk. Blue"
		iuo_progbar.of_SetFillColor(RGB(0,0,128))
	case "Yellow"
		iuo_progbar.of_SetFillColor(RGB(255,255,0))
	case "Buttonface"
		iuo_progbar.of_SetFillColor(this.backcolor)
end choose

choose case ddlb_textcolor.text
	case "Black"
		iuo_progbar.of_SetTextColor(RGB(0,0,0))
	case "White"
		iuo_progbar.of_SetTextColor(RGB(255,255,255))
	case "Red"
		iuo_progbar.of_SetTextColor(RGB(255,0,0))
	case "Dk. Red"
		iuo_progbar.of_SetTextColor(RGB(128,0,0))
	case "Green"
		iuo_progbar.of_SetTextColor(RGB(0,255,0))
	case "Dk. Green"
		iuo_progbar.of_SetTextColor(RGB(0,128,0))
	case "Blue"
		iuo_progbar.of_SetTextColor(RGB(0,0,255))
	case "Dk. Blue"
		iuo_progbar.of_SetTextColor(RGB(0,0,128))
	case "Yellow"
		iuo_progbar.of_SetTextColor(RGB(255,255,0))
	case "Buttonface"
		iuo_progbar.of_SetTextColor(this.backcolor)
end choose
end event

on u_pbarfont.create
int iCurrent
call u_tabpg::create
this.lb_fonts=create lb_fonts
this.lb_fontstyles=create lb_fontstyles
this.lb_size=create lb_size
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.sle_fonts=create sle_fonts
this.sle_fontstyles=create sle_fontstyles
this.sle_size=create sle_size
this.cbx_underline=create cbx_underline
this.st_textcolor=create st_textcolor
this.st_bkgdcolor=create st_bkgdcolor
this.ddlb_textcolor=create ddlb_textcolor
this.ddlb_bkgdcolor=create ddlb_bkgdcolor
this.ddlb_fillcolor=create ddlb_fillcolor
this.st_fillcolor=create st_fillcolor
this.dw_sample=create dw_sample
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=lb_fonts
this.Control[iCurrent+2]=lb_fontstyles
this.Control[iCurrent+3]=lb_size
this.Control[iCurrent+4]=st_1
this.Control[iCurrent+5]=st_2
this.Control[iCurrent+6]=st_3
this.Control[iCurrent+7]=sle_fonts
this.Control[iCurrent+8]=sle_fontstyles
this.Control[iCurrent+9]=sle_size
this.Control[iCurrent+10]=cbx_underline
this.Control[iCurrent+11]=st_textcolor
this.Control[iCurrent+12]=st_bkgdcolor
this.Control[iCurrent+13]=ddlb_textcolor
this.Control[iCurrent+14]=ddlb_bkgdcolor
this.Control[iCurrent+15]=ddlb_fillcolor
this.Control[iCurrent+16]=st_fillcolor
this.Control[iCurrent+17]=dw_sample
this.Control[iCurrent+18]=gb_1
end on

on u_pbarfont.destroy
call u_tabpg::destroy
destroy(this.lb_fonts)
destroy(this.lb_fontstyles)
destroy(this.lb_size)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_fonts)
destroy(this.sle_fontstyles)
destroy(this.sle_size)
destroy(this.cbx_underline)
destroy(this.st_textcolor)
destroy(this.st_bkgdcolor)
destroy(this.ddlb_textcolor)
destroy(this.ddlb_bkgdcolor)
destroy(this.ddlb_fillcolor)
destroy(this.st_fillcolor)
destroy(this.dw_sample)
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

boolean	lb_bold
boolean	lb_italics
integer	li_index
integer  li_size
long		ll_black
long		ll_blue
long  	ll_buttonface
long		ll_dkblue
long		ll_dkgreen
long		ll_dkred
long		ll_green
long		ll_index
long		ll_red
long		ll_white
long		ll_yellow

// Intercept the progress bar from the message object.
iuo_progbar = message.powerobjectparm

// Construct the datawindow first.
dw_sample.TriggerEvent(constructor!)

ll_black = RGB(0,0,0)
ll_blue = RGB(0,0,255)
ll_buttonface = 78682240
ll_dkblue = RGB(0,0,128)
ll_dkgreen = RGB(0,128,0)
ll_dkred = RGB(128,0,0)
ll_green = RGB(0,255,0)
ll_red = RGB(255,0,0)
ll_white = RGB(255,255,255)
ll_yellow = RGB(255,255,0)


if iuo_progbar.dw_progress.Describe("pct.font.weight") = "700" then
	if iuo_progbar.dw_progress.Describe("pct.font.italic") = "1" then
		lb_fontstyles.SelectItem(4)
		dw_sample.object.pbar_sampler.font.weight = 700
		dw_sample.object.pbar_sampler.font.italic = true
	else
		lb_fontstyles.SelectItem(3)
		dw_sample.object.pbar_sampler.font.weight = 700
		dw_sample.object.pbar_sampler.font.italic = false
	end if
else
	if iuo_progbar.dw_progress.Describe("pct.font.italic") = "1" then
		lb_fontstyles.SelectItem(2)
		dw_sample.Object.pbar_sampler.Font.Weight = 400
		dw_sample.Object.pbar_sampler.Font.italic = true
	else
		lb_fontstyles.SelectItem(1)
		dw_sample.Object.pbar_sampler.Font.Weight = 400
		dw_sample.Object.pbar_sampler.Font.italic = false
	end if
end if
sle_fontstyles.text = lb_fontstyles.SelectedItem()
	
if iuo_progbar.dw_progress.Describe("pct.font.underline") = "1" then
	cbx_underline.checked = true
	dw_sample.Object.pbar_sampler.Font.underline = true
else
	cbx_underline.checked = false
	dw_sample.object.pbar_sampler.font.underline = false
end if

li_size = Integer(iuo_progbar.dw_progress.Describe("pct.font.height"))
sle_size.text = String(Abs(li_size))
dw_sample.Object.pbar_sampler.Font.height = Integer(li_size)
lb_size.SelectItem(sle_size.text, li_index)

sle_fonts.text = String(iuo_progbar.dw_progress.Describe("pct.font.face"))
dw_sample.object.pbar_sampler.font.face = sle_fonts.text
lb_fonts.SelectItem(sle_fonts.text, li_index)

choose case iuo_progbar.of_GetBackColor()
	case ll_black
		ddlb_bkgdcolor.SelectItem(1)
	case ll_white
		ddlb_bkgdcolor.SelectItem(2)
	case ll_red
		ddlb_bkgdcolor.SelectItem(3)
	case ll_dkred
		ddlb_bkgdcolor.SelectItem(4)
	case ll_green
		ddlb_bkgdcolor.SelectItem(5)
	case ll_dkgreen
		ddlb_bkgdcolor.SelectItem(6)
	case ll_blue
		ddlb_bkgdcolor.SelectItem(7)
	case ll_dkblue
		ddlb_bkgdcolor.SelectItem(8)
	case ll_yellow
		ddlb_bkgdcolor.SelectItem(9)
	case ll_buttonface
		ddlb_bkgdcolor.SelectItem(10)
end choose

choose case iuo_progbar.of_GetFillColor()
	case ll_black
		ddlb_fillcolor.SelectItem(1)
	case ll_white
		ddlb_fillcolor.SelectItem(2)
	case ll_red
		ddlb_fillcolor.SelectItem(3)
	case ll_dkred
		ddlb_fillcolor.SelectItem(4)
	case ll_green
		ddlb_fillcolor.SelectItem(5)
	case ll_dkgreen
		ddlb_fillcolor.SelectItem(6)
	case ll_blue
		ddlb_fillcolor.SelectItem(7)
	case ll_dkblue
		ddlb_fillcolor.SelectItem(8)
	case ll_yellow
		ddlb_fillcolor.SelectItem(9)
	case ll_buttonface
		ddlb_fillcolor.SelectItem(10)
end choose
dw_sample.object.pbar_sampler.background.color = iuo_progbar.of_GetFillColor()
dw_sample.object.datawindow.color = iuo_progbar.of_GetFillColor()

choose case iuo_progbar.of_GetTextColor()
	case ll_black
		ddlb_textcolor.SelectItem(1)
	case ll_white
		ddlb_textcolor.SelectItem(2)
	case ll_red
		ddlb_textcolor.SelectItem(3)
	case ll_dkred
		ddlb_textcolor.SelectItem(4)
	case ll_green
		ddlb_textcolor.SelectItem(5)
	case ll_dkgreen
		ddlb_textcolor.SelectItem(6)
	case ll_blue
		ddlb_textcolor.SelectItem(7)
	case ll_dkblue
		ddlb_textcolor.SelectItem(8)
	case ll_yellow
		ddlb_textcolor.SelectItem(9)
	case ll_buttonface
		ddlb_textcolor.SelectItem(10)
end choose
dw_sample.object.pbar_sampler.color = iuo_progbar.of_GetTextColor()		


end event

type lb_fonts from u_lb within u_pbarfont
int X=46
int Y=241
int Width=545
int Height=321
int TabOrder=10
boolean Sorted=false
int Accelerator=110
string Item[]={"Arial",&
"MS Sans Serif",&
"Symbol",&
"Times New Roman"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	selectionchanged
//
//	Description:
//	Changes the font of the sampler and sets the text in the
// single line edit.
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

sle_fonts.text = this.Text(index)
dw_sample.object.pbar_sampler.font.face = sle_fonts.text

end event

type lb_fontstyles from u_lb within u_pbarfont
int X=641
int Y=241
int Width=394
int Height=321
int TabOrder=20
boolean BringToTop=true
boolean Sorted=false
int Accelerator=121
string Item[]={"Regular",&
"Italic",&
"Bold",&
"Bold Italic"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	selectionchanged
//
//	Description:
//	Changes the weight and italic settings on the sampler 
// and sets the text in the single line edit.
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

sle_fontstyles.text = this.Text(index)

choose case sle_fontstyles.text
	case "Regular"
		dw_sample.Object.pbar_sampler.font.weight = 400
		dw_sample.Object.pbar_sampler.font.italic = false
	case "Bold"
		dw_sample.Object.pbar_sampler.font.weight = 700
		dw_sample.Object.pbar_sampler.font.italic = false
	case "Italic"
		dw_sample.Object.pbar_sampler.font.weight = 400
		dw_sample.Object.pbar_sampler.font.italic = true
	case "Bold Italic"
		dw_sample.Object.pbar_sampler.font.weight = 700
		dw_sample.Object.pbar_sampler.font.italic = true
end choose
end event

type lb_size from u_lb within u_pbarfont
int X=1084
int Y=241
int Width=252
int Height=321
int TabOrder=30
boolean BringToTop=true
boolean Sorted=false
int Accelerator=115
string Item[]={"8",&
"10",&
"12",&
"14",&
"18",&
"24"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	selectionchanged
//
//	Description:
//	Changes the font height setting on the sampler 
// and sets the text in the single line edit.
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

integer	li_test

sle_size.text = this.Text(index)
li_test = Integer("-" + sle_size.text)
dw_sample.object.pbar_sampler.font.height = li_test
end event

type st_1 from u_st within u_pbarfont
int X=46
int Y=61
int Width=147
string Text="Fo&nt:"
long BackColor=77571519
end type

type st_2 from u_st within u_pbarfont
int X=645
int Y=61
int Width=270
boolean BringToTop=true
string Text="Font St&yles:"
long BackColor=77571519
end type

type st_3 from u_st within u_pbarfont
int X=1089
int Y=61
int Width=124
boolean BringToTop=true
string Text="&Size:"
long BackColor=77571519
end type

type sle_fonts from u_sle within u_pbarfont
int X=46
int Y=145
int Width=545
int TabOrder=0
end type

type sle_fontstyles from u_sle within u_pbarfont
int X=645
int Y=145
int Width=385
int TabOrder=0
boolean BringToTop=true
end type

type sle_size from u_sle within u_pbarfont
int X=1089
int Y=145
int Width=247
int TabOrder=0
boolean BringToTop=true
end type

type cbx_underline from u_cbx within u_pbarfont
int X=42
int Y=685
int Width=311
int TabOrder=40
string Text="&Underline"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Changes the underline setting on the sampler. 
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

dw_sample.object.pbar_sampler.font.underline = this.checked
end event

type st_textcolor from u_st within u_pbarfont
int X=46
int Y=861
boolean BringToTop=true
string Text="&Text Color:"
long BackColor=77571519
end type

type st_bkgdcolor from u_st within u_pbarfont
int X=723
int Y=861
int Width=439
boolean BringToTop=true
string Text="&Background Color:"
long BackColor=77571519
end type

type ddlb_textcolor from u_ddlb within u_pbarfont
int X=46
int Y=937
int Width=613
int Height=517
int TabOrder=50
boolean Sorted=false
int Accelerator=116
long BackColor=1090519039
string Item[]={"Black",&
"White",&
"Red",&
"Dk. Red",&
"Green",&
"Dk. Green",&
"Blue",&
"Dk. Blue",&
"Yellow",&
"Buttonface"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	selectionchanged
//
//	Description:
//	Sets the background color on the sampler.
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

choose case this.Text(index)
	case "Black"
		dw_sample.object.pbar_sampler.color = RGB(0,0,0)
	case "White"
		dw_sample.object.pbar_sampler.color = RGB(255,255,255)
	case "Red"
		dw_sample.object.pbar_sampler.color = RGB(255,0,0)
	case "Dk. Red"
		dw_sample.object.pbar_sampler.color = RGB(128,0,0)
	case "Green"
		dw_sample.object.pbar_sampler.color = RGB(0,255,0)
	case "Dk. Green"
		dw_sample.object.pbar_sampler.color = RGB(0,128,0)
	case "Blue"
		dw_sample.object.pbar_sampler.color = RGB(0,0,255)
	case "Dk. Blue"
		dw_sample.object.pbar_sampler.color = RGB(0,0,128)
	case "Yellow"
		dw_sample.object.pbar_sampler.color = RGB(255,255,0)
	case "Buttonface"
		dw_sample.object.pbar_sampler.color = 78682240
end choose
end event

type ddlb_bkgdcolor from u_ddlb within u_pbarfont
int X=723
int Y=937
int Width=613
int Height=517
int TabOrder=60
boolean BringToTop=true
boolean Sorted=false
int Accelerator=98
string Item[]={"Black",&
"White",&
"Red",&
"Dk. Red",&
"Green",&
"Dk. Green",&
"Blue",&
"Dk. Blue",&
"Yellow",&
"Buttonface"}
end type

type ddlb_fillcolor from u_ddlb within u_pbarfont
int X=46
int Y=1125
int Width=613
int Height=321
int TabOrder=70
boolean BringToTop=true
boolean Sorted=false
int Accelerator=102
string Item[]={"Black",&
"White",&
"Red",&
"Dk. Red",&
"Green",&
"Dk. Green",&
"Blue",&
"Dk. Blue",&
"Yellow",&
"Buttonface"}
end type

event selectionchanged;call super::selectionchanged;choose case ddlb_fillcolor.Text(index)
	case "Black"
		dw_sample.object.pbar_sampler.background.color = RGB(0,0,0)
		dw_sample.object.datawindow.color = RGB(0,0,0)
	case "White"
		dw_sample.object.pbar_sampler.background.color = RGB(255,255,255)
		dw_sample.object.datawindow.color = RGB(255,255,255)
	case "Red"
		dw_sample.object.pbar_sampler.background.color = RGB(255,0,0)
		dw_sample.object.datawindow.color = RGB(255,0,0)
	case "Dk. Red"
		dw_sample.object.pbar_sampler.background.color = RGB(128,0,0)
		dw_sample.object.datawindow.color = RGB(128,0,0)
	case "Green"
		dw_sample.object.pbar_sampler.background.color = RGB(0,255,0)
		dw_sample.object.datawindow.color = RGB(0,255,0)
	case "Dk. Green"
		dw_sample.object.pbar_sampler.background.color = RGB(0,128,0)
		dw_sample.object.datawindow.color = RGB(0,128,0)
	case "Blue"
		dw_sample.object.pbar_sampler.background.color = RGB(0,0,255)
		dw_sample.object.datawindow.color = RGB(0,0,255)
	case "Dk. Blue"
		dw_sample.object.pbar_sampler.background.color = RGB(0,0,128)
		dw_sample.object.datawindow.color = RGB(0,0,128)
	case "Yellow"
		dw_sample.object.pbar_sampler.background.color = RGB(255,255,0)
		dw_sample.object.datawindow.color = RGB(255,255,0)
	case "Buttonface"
		dw_sample.object.pbar_sampler.background.color = 78682240
		dw_sample.object.datawindow.color = 78682240
end choose
end event

type st_fillcolor from u_st within u_pbarfont
int X=46
int Y=1061
boolean BringToTop=true
string Text="&Fill Color:"
long BackColor=77571519
end type

type dw_sample from u_dw within u_pbarfont
int X=490
int Y=665
int Width=810
int Height=145
int TabOrder=0
string DataObject="d_pbarsampler"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean VScrollBar=false
end type

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_retrieve
//
//	Arguments:
//	None
//
//	Returns:
//	long
//	The number of rows retrieved from the database
// -1 if it fails
// If any argument's value is NULL, pfc_retrieve returns NULL
//
//	Description:
//	Retrieves data into the DataWindow.
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

return this.Retrieve()
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Set the transaction object and retrieve the sampler DataWindow.
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

if ib_dwconstructed = true then	
	of_SetTransObject(sqlca)
	event pfc_retrieve()
end if

end event

type gb_1 from u_gb within u_pbarfont
int X=439
int Y=601
int Width=897
int TabOrder=0
string Text="Sample"
long BackColor=77571519
end type

