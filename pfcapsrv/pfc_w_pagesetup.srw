HA$PBExportHeader$pfc_w_pagesetup.srw
$PBExportComments$PFC Page Setup window
forward
global type pfc_w_pagesetup from w_response
end type
type st_size from u_st within pfc_w_pagesetup
end type
type st_source from u_st within pfc_w_pagesetup
end type
type rb_portrait from u_rb within pfc_w_pagesetup
end type
type rb_landscape from u_rb within pfc_w_pagesetup
end type
type gb_orientation from u_gb within pfc_w_pagesetup
end type
type ddlb_size from u_ddlb within pfc_w_pagesetup
end type
type ddlb_source from u_ddlb within pfc_w_pagesetup
end type
type gb_paper from u_gb within pfc_w_pagesetup
end type
type cb_ok from u_cb within pfc_w_pagesetup
end type
type cb_cancel from u_cb within pfc_w_pagesetup
end type
type st_left from u_st within pfc_w_pagesetup
end type
type st_top from u_st within pfc_w_pagesetup
end type
type em_left from u_em within pfc_w_pagesetup
end type
type em_top from u_em within pfc_w_pagesetup
end type
type st_right from u_st within pfc_w_pagesetup
end type
type st_bottom from u_st within pfc_w_pagesetup
end type
type em_right from u_em within pfc_w_pagesetup
end type
type em_bottom from u_em within pfc_w_pagesetup
end type
type cb_dlghelp from u_cb within pfc_w_pagesetup
end type
type gb_margins from u_gb within pfc_w_pagesetup
end type
end forward

global type pfc_w_pagesetup from w_response
integer x = 974
integer y = 568
integer width = 2427
integer height = 1044
string title = "Page Setup"
long backcolor = 80263328
st_size st_size
st_source st_source
rb_portrait rb_portrait
rb_landscape rb_landscape
gb_orientation gb_orientation
ddlb_size ddlb_size
ddlb_source ddlb_source
gb_paper gb_paper
cb_ok cb_ok
cb_cancel cb_cancel
st_left st_left
st_top st_top
em_left em_left
em_top em_top
st_right st_right
st_bottom st_bottom
em_right em_right
em_bottom em_bottom
cb_dlghelp cb_dlghelp
gb_margins gb_margins
end type
global pfc_w_pagesetup pfc_w_pagesetup

type variables
Protected:
s_pagesetupattrib	istr_pagesetup

end variables

on pfc_w_pagesetup.create
int iCurrent
call super::create
this.st_size=create st_size
this.st_source=create st_source
this.rb_portrait=create rb_portrait
this.rb_landscape=create rb_landscape
this.gb_orientation=create gb_orientation
this.ddlb_size=create ddlb_size
this.ddlb_source=create ddlb_source
this.gb_paper=create gb_paper
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_left=create st_left
this.st_top=create st_top
this.em_left=create em_left
this.em_top=create em_top
this.st_right=create st_right
this.st_bottom=create st_bottom
this.em_right=create em_right
this.em_bottom=create em_bottom
this.cb_dlghelp=create cb_dlghelp
this.gb_margins=create gb_margins
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_size
this.Control[iCurrent+2]=this.st_source
this.Control[iCurrent+3]=this.rb_portrait
this.Control[iCurrent+4]=this.rb_landscape
this.Control[iCurrent+5]=this.gb_orientation
this.Control[iCurrent+6]=this.ddlb_size
this.Control[iCurrent+7]=this.ddlb_source
this.Control[iCurrent+8]=this.gb_paper
this.Control[iCurrent+9]=this.cb_ok
this.Control[iCurrent+10]=this.cb_cancel
this.Control[iCurrent+11]=this.st_left
this.Control[iCurrent+12]=this.st_top
this.Control[iCurrent+13]=this.em_left
this.Control[iCurrent+14]=this.em_top
this.Control[iCurrent+15]=this.st_right
this.Control[iCurrent+16]=this.st_bottom
this.Control[iCurrent+17]=this.em_right
this.Control[iCurrent+18]=this.em_bottom
this.Control[iCurrent+19]=this.cb_dlghelp
this.Control[iCurrent+20]=this.gb_margins
end on

on pfc_w_pagesetup.destroy
call super::destroy
destroy(this.st_size)
destroy(this.st_source)
destroy(this.rb_portrait)
destroy(this.rb_landscape)
destroy(this.gb_orientation)
destroy(this.ddlb_size)
destroy(this.ddlb_source)
destroy(this.gb_paper)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_left)
destroy(this.st_top)
destroy(this.em_left)
destroy(this.em_top)
destroy(this.st_right)
destroy(this.st_bottom)
destroy(this.em_right)
destroy(this.em_bottom)
destroy(this.cb_dlghelp)
destroy(this.gb_margins)
end on

event open;call w_response::open;//////////////////////////////////////////////////////////////////////////////////////////
//
//	Event:  Open
//
//	Description:  Initialize window based on pagesetup structure passed in
//
//////////////////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

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
//////////////////////////////////////////////////////////////////////////////////////////

integer	li_papersourceupper
integer	li_papersizeupper
integer	li_cnt
integer	li_position

ib_disableclosequery = true

gb_paper.SetPosition (ToBottom!)
gb_orientation.SetPosition (ToBottom!)
gb_margins.SetPosition (ToBottom!)

// Get the passed in pagesetup structure
istr_pagesetup = Message.PowerObjectParm

// Margins
gb_margins.enabled = not istr_pagesetup.b_disablemargins
em_left.enabled = not istr_pagesetup.b_disablemargins
em_right.enabled = not istr_pagesetup.b_disablemargins
em_top.enabled = not istr_pagesetup.b_disablemargins
em_bottom.enabled = not istr_pagesetup.b_disablemargins
st_left.enabled = not istr_pagesetup.b_disablemargins
st_right.enabled = not istr_pagesetup.b_disablemargins
st_top.enabled = not istr_pagesetup.b_disablemargins
st_bottom.enabled = not istr_pagesetup.b_disablemargins

// Allow for 1/1000 inch, centimeter
if istr_pagesetup.i_units >=2 then
	istr_pagesetup.i_marginleft = istr_pagesetup.i_marginleft / 1000
	istr_pagesetup.i_marginright = istr_pagesetup.i_marginright / 1000
	istr_pagesetup.i_margintop = istr_pagesetup.i_margintop / 1000
	istr_pagesetup.i_marginbottom = istr_pagesetup.i_marginbottom / 1000

	if istr_pagesetup.i_units = 2 then
		gb_margins.text = gb_margins.text + " (inches)"
	elseif istr_pagesetup.i_units = 3 then
		gb_margins.text = gb_margins.text + " (centimeters)"
	end if
end if

em_left.text = String (istr_pagesetup.i_marginleft)
em_right.text = String (istr_pagesetup.i_marginright)
em_top.text = String (istr_pagesetup.i_margintop)
em_bottom.text = String (istr_pagesetup.i_marginbottom)

// Orientation
gb_orientation.enabled = not istr_pagesetup.b_disableorientation
rb_landscape.enabled = not istr_pagesetup.b_disableorientation
rb_portrait.enabled  = not istr_pagesetup.b_disableorientation

if IsNull (istr_pagesetup.b_portraitorientation) then
	rb_landscape.checked = false
	rb_portrait.checked = false
else
	rb_landscape.Checked = not istr_pagesetup.b_portraitorientation
	rb_portrait.Checked = istr_pagesetup.b_portraitorientation
end if

// Paper
gb_paper.enabled = not istr_pagesetup.b_disablepaper
ddlb_size.enabled = not istr_pagesetup.b_disablepaper
ddlb_source.enabled = not istr_pagesetup.b_disablepaper
st_size.enabled = not istr_pagesetup.b_disablepaper
st_source.enabled = not istr_pagesetup.b_disablepaper

// Default paper sizes
li_papersizeupper = UpperBound (istr_pagesetup.str_papersize)
if li_papersizeupper <= 0 then
	istr_pagesetup.str_papersize[1].s_type = "Default"
	istr_pagesetup.str_papersize[2].s_type = "Letter 8 1/2 x 11 in"
	istr_pagesetup.str_papersize[3].s_type = "LetterSmall 8 1/2 x 11 in"
	istr_pagesetup.str_papersize[4].s_type = "Tabloid 17 x 11 in"
	istr_pagesetup.str_papersize[5].s_type = "Ledger 17 x 11 in"
	istr_pagesetup.str_papersize[6].s_type = "Legal 8 1/2 x 14 in"
	istr_pagesetup.str_papersize[7].s_type = "Statement 5 1/2 x 8 1/2 in"
	istr_pagesetup.str_papersize[8].s_type = "Executive 7 1/4 x 10 1/2 in"
	istr_pagesetup.str_papersize[9].s_type = "A3 297 x 420 mm"
	istr_pagesetup.str_papersize[10].s_type = "A4 210 x 297 mm"
	istr_pagesetup.str_papersize[11].s_type = "A4 Small 210 x 297 mm"
	istr_pagesetup.str_papersize[12].s_type = "A5 148 x 210 mm"
	istr_pagesetup.str_papersize[13].s_type = "B4 250 x 354"
	istr_pagesetup.str_papersize[14].s_type = "B5 182 x 257 mm"
	istr_pagesetup.str_papersize[15].s_type = "Folio 8 1/2 x 13 in"
	istr_pagesetup.str_papersize[16].s_type = "Quarto 215 x 275 mm"
	istr_pagesetup.str_papersize[17].s_type = "10 x 14 in"
	istr_pagesetup.str_papersize[18].s_type = "11 x 17 in"
	istr_pagesetup.str_papersize[19].s_type = "Note 8 1/2 x 11 in"
	istr_pagesetup.str_papersize[20].s_type = "Envelope #9 3 7/8 x 8 7/8"
	istr_pagesetup.str_papersize[21].s_type = "Envelope #10 4 1/8 x 9 1/2"
	istr_pagesetup.str_papersize[22].s_type = "Envelope #11 4 1/2 x 10 3/8"
	istr_pagesetup.str_papersize[23].s_type = "Envelope #12 4 x 11 1/276"
	istr_pagesetup.str_papersize[24].s_type = "Envelope #14 5 x 11 1/2"
	istr_pagesetup.str_papersize[25].s_type = "C size sheet"
	istr_pagesetup.str_papersize[26].s_type = "D size sheet"
	istr_pagesetup.str_papersize[27].s_type = "E size sheet"
	istr_pagesetup.str_papersize[28].s_type = "Envelope DL 110 x 220 mm"
	istr_pagesetup.str_papersize[29].s_type = "Envelope C5 162 x 229 mm"
	istr_pagesetup.str_papersize[30].s_type = "Envelope C3 324 x 458 mm"
	istr_pagesetup.str_papersize[31].s_type = "Envelope C4 229 x 324 mm"
	istr_pagesetup.str_papersize[32].s_type = "Envelope C6 114 x 162 mm"
	istr_pagesetup.str_papersize[33].s_type = "Envelope C65 114 x 229 mm"
	istr_pagesetup.str_papersize[34].s_type = "Envelope B4 250 x 353 mm"
	istr_pagesetup.str_papersize[35].s_type = "Envelope B5 176 x 250 mm"
	istr_pagesetup.str_papersize[36].s_type = "Envelope B6 176 x 125 mm"
	istr_pagesetup.str_papersize[37].s_type = "Envelope 110 x 230 mm"
	istr_pagesetup.str_papersize[38].s_type = "Envelope Monarch 3.875 x 7.5 in"
	istr_pagesetup.str_papersize[39].s_type = "6 3/4 Envelope 3 5/8 x 6 1/2 in"
	istr_pagesetup.str_papersize[40].s_type = "US Std Fanfold 14 7/8 x 11 in"
	istr_pagesetup.str_papersize[41].s_type = "German Std Fanfold 8 1/2 x 12 in"
	istr_pagesetup.str_papersize[42].s_type = "German Legal Fanfold 8 1/2 x 13 in"

	for li_cnt = 1 to 42
		istr_pagesetup.str_papersize[li_cnt].i_val = li_cnt - 1
	next
end if
li_papersizeupper = UpperBound (istr_pagesetup.str_papersize)
for li_cnt = 1 to li_papersizeupper
	li_position = ddlb_size.AddItem (istr_pagesetup.str_papersize[li_cnt].s_type)
	if li_position > 0 then
		if istr_pagesetup.str_papersize[li_cnt].i_val = istr_pagesetup.i_papersize then
			ddlb_size.SelectItem (li_position)
		end if
	end if
next

// Paper source defaults
li_papersourceupper = UpperBound (istr_pagesetup.str_papersource)
if li_papersourceupper <= 0 then
	istr_pagesetup.str_papersource[1].s_type = "Default"
	istr_pagesetup.str_papersource[2].s_type = "Upper"
	istr_pagesetup.str_papersource[3].s_type = "Lower"
	istr_pagesetup.str_papersource[4].s_type = "Middle"
	istr_pagesetup.str_papersource[5].s_type = "Manual"
	istr_pagesetup.str_papersource[6].s_type = "Envelope"
	istr_pagesetup.str_papersource[7].s_type = "Envelope manual"
	istr_pagesetup.str_papersource[8].s_type = "Auto"
	istr_pagesetup.str_papersource[9].s_type = "Tractor"
	istr_pagesetup.str_papersource[10].s_type = "Smallfmt"
	istr_pagesetup.str_papersource[11].s_type = "Largefmt"
	istr_pagesetup.str_papersource[12].s_type = "Large capacity"
	istr_pagesetup.str_papersource[13].s_type = "Cassette"

	for li_cnt = 1 to 13
		istr_pagesetup.str_papersource[li_cnt].i_val = li_cnt - 1
	next
end if
li_papersourceupper = UpperBound (istr_pagesetup.str_papersource)
for li_cnt = 1 to li_papersourceupper
	li_position = ddlb_source.AddItem (istr_pagesetup.str_papersource[li_cnt].s_type)
	if li_position > 0 then
		if istr_pagesetup.str_papersource[li_cnt].i_val = istr_pagesetup.i_papersource then
			ddlb_source.SelectItem (li_position)
		end if
	end if
next




end event

event pfc_default;call w_response::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Description:	 Populate the return values and close the window.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

boolean	lb_found
integer	li_paper
integer	li_cnt = 1
integer	li_upper
string		ls_paper

istr_pagesetup.b_actiontaken = true

// Margins
if istr_pagesetup.i_units >=2 then
	istr_pagesetup.i_marginleft = Dec (em_left.text) * 1000
	istr_pagesetup.i_marginright = Dec (em_right.text) * 1000
	istr_pagesetup.i_margintop = Dec (em_top.text) * 1000
	istr_pagesetup.i_marginbottom = Dec (em_bottom.text) * 1000
else
	istr_pagesetup.i_marginleft = Integer (em_left.text)
	istr_pagesetup.i_marginright = Integer (em_right.text)
	istr_pagesetup.i_margintop = Integer (em_top.text)
	istr_pagesetup.i_marginbottom = Integer (em_bottom.text)
end if

// Orientation
if not rb_portrait.checked and not rb_landscape.checked then
	SetNull (istr_pagesetup.b_portraitorientation)
else
	istr_pagesetup.b_portraitorientation = rb_portrait.checked
end if

// Paper Size
ls_paper = ddlb_size.text
li_upper = UpperBound (istr_pagesetup.str_papersize)
do while not lb_found and li_cnt <= li_upper
	if istr_pagesetup.str_papersize[li_cnt].s_type = ls_paper then
		lb_found = true
		li_paper = istr_pagesetup.str_papersize[li_cnt].i_val
	end if
	li_cnt++
loop
if lb_found then
	istr_pagesetup.i_papersize = li_paper
end if

// Paper Source
li_cnt = 1
lb_found = false
ls_paper = ddlb_source.text
li_upper = UpperBound (istr_pagesetup.str_papersource)
do while not lb_found and li_cnt <= li_upper
	if istr_pagesetup.str_papersource[li_cnt].s_type = ls_paper then
		lb_found = true
		li_paper = istr_pagesetup.str_papersource[li_cnt].i_val
	end if
	li_cnt++
loop
if lb_found then
	istr_pagesetup.i_papersource = li_paper
end if

CloseWithReturn (this, istr_pagesetup)
end event

event pfc_cancel;call w_response::pfc_cancel;CloseWithReturn (this, istr_pagesetup)
end event

event close;call w_response::close;CloseWithReturn (this, istr_pagesetup)
end event

type st_size from u_st within pfc_w_pagesetup
integer x = 110
integer y = 136
integer width = 434
integer height = 72
string text = "Si&ze:"
alignment alignment = right!
end type

type st_source from u_st within pfc_w_pagesetup
integer x = 110
integer y = 276
integer width = 434
integer height = 72
string text = "&Source:"
alignment alignment = right!
end type

type rb_portrait from u_rb within pfc_w_pagesetup
integer x = 114
integer y = 536
integer width = 594
integer height = 72
integer taborder = 30
string text = "P&ortrait"
end type

type rb_landscape from u_rb within pfc_w_pagesetup
integer x = 114
integer y = 640
integer width = 594
integer height = 72
integer taborder = 40
string text = "L&andscape"
end type

type gb_orientation from u_gb within pfc_w_pagesetup
integer x = 46
integer y = 452
integer width = 686
integer height = 320
integer taborder = 0
string text = "Orientation"
end type

type ddlb_size from u_ddlb within pfc_w_pagesetup
integer x = 635
integer y = 136
integer width = 1559
integer height = 556
integer taborder = 10
long backcolor = 1090519039
integer accelerator = 122
end type

type ddlb_source from u_ddlb within pfc_w_pagesetup
integer x = 635
integer y = 276
integer width = 1559
integer height = 404
integer taborder = 20
long backcolor = 1090519039
integer accelerator = 115
end type

type gb_paper from u_gb within pfc_w_pagesetup
integer x = 46
integer y = 36
integer width = 2304
integer height = 388
integer taborder = 0
string text = "Paper"
end type

type cb_ok from u_cb within pfc_w_pagesetup
integer x = 1193
integer y = 808
integer width = 375
integer taborder = 90
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;parent.event pfc_default()
end event

type cb_cancel from u_cb within pfc_w_pagesetup
integer x = 1586
integer y = 808
integer width = 375
integer taborder = 100
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;parent.event pfc_cancel()
end event

type st_left from u_st within pfc_w_pagesetup
integer x = 786
integer y = 540
integer width = 411
integer height = 84
string text = "&Left:"
alignment alignment = right!
end type

type st_top from u_st within pfc_w_pagesetup
integer x = 786
integer y = 640
integer width = 411
integer height = 84
string text = "&Top:"
alignment alignment = right!
end type

type em_left from u_em within pfc_w_pagesetup
integer x = 1221
integer y = 540
integer width = 178
integer height = 84
integer taborder = 50
alignment alignment = right!
integer accelerator = 108
string mask = "##0.00#"
string displaydata = ""
double increment = 0
string minmax = ""
end type

event modified;call super::modified;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  modified
//
//	Description:	 Validate the entered value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

string	ls_leftmargin

if IsNumber (this.text) then
	if Dec (this.text) < istr_pagesetup.i_minmarginleft then
		ls_leftmargin = String (istr_pagesetup.i_minmarginleft)
		of_MessageBox ("pfc_pagesetup_leftminimum", "Page Setup", &
			"Minimum left margin is " + ls_leftmargin, exclamation!, Ok!, 1)
		this.text = ls_leftmargin
	end if
end if

end event

type em_top from u_em within pfc_w_pagesetup
integer x = 1221
integer y = 640
integer width = 178
integer height = 84
integer taborder = 70
alignment alignment = right!
integer accelerator = 116
string mask = "##0.00#"
string displaydata = ""
double increment = 0
string minmax = ""
end type

event modified;call super::modified;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  modified
//
//	Description:	 Validate the entered value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

string	ls_topmargin

if IsNumber (this.text) then
	if Dec (this.text) < istr_pagesetup.i_minmargintop then
		ls_topmargin = String (istr_pagesetup.i_minmargintop)
		of_MessageBox ("pfc_pagesetup_topminimum", "Page Setup", &
			"Minimum top margin is " + ls_topmargin, exclamation!, Ok!, 1)
		this.text = ls_topmargin
	end if
end if
end event

type st_right from u_st within pfc_w_pagesetup
integer x = 1431
integer y = 540
integer width = 411
integer height = 84
string text = "&Right:"
alignment alignment = right!
end type

type st_bottom from u_st within pfc_w_pagesetup
integer x = 1431
integer y = 640
integer width = 411
integer height = 84
string text = "&Bottom:"
alignment alignment = right!
end type

type em_right from u_em within pfc_w_pagesetup
integer x = 1865
integer y = 540
integer width = 178
integer height = 84
integer taborder = 60
alignment alignment = right!
integer accelerator = 114
string mask = "##0.00#"
string displaydata = ""
double increment = 0
string minmax = ""
end type

event modified;call super::modified;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  modified
//
//	Description:	 Validate the entered value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

string	ls_rightmargin

if IsNumber (this.text) then
	if Dec (this.text) < istr_pagesetup.i_minmarginright then
		ls_rightmargin = String (istr_pagesetup.i_minmarginright)
		of_MessageBox ("pfc_pagesetup_rightminimum", "Page Setup", &
			"Minimum right margin is " + ls_rightmargin, exclamation!, Ok!, 1)
		this.text = ls_rightmargin
	end if
end if
end event

type em_bottom from u_em within pfc_w_pagesetup
integer x = 1865
integer y = 640
integer width = 178
integer height = 84
integer taborder = 80
alignment alignment = right!
integer accelerator = 98
string mask = "##0.00#"
string displaydata = ""
double increment = 0
string minmax = ""
end type

event modified;call super::modified;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  modified
//
//	Description:	 Validate the entered value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

string	ls_bottommargin

if IsNumber (this.text) then
	if Dec (this.text) < istr_pagesetup.i_minmarginbottom then
		ls_bottommargin = String (istr_pagesetup.i_minmarginbottom)
		of_MessageBox ("pfc_pagesetup_bottomminimum", "Page Setup", &
			"Minimum bottom margin is " + ls_bottommargin, exclamation!, Ok!, 1)
		this.text = ls_bottommargin
	end if
end if
end event

type cb_dlghelp from u_cb within pfc_w_pagesetup
integer x = 1975
integer y = 808
integer width = 375
integer taborder = 110
string text = "&Help"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Display PFC dialog help
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

showHelp ("pfcdlg.hlp", topic!, 500)
end event

type gb_margins from u_gb within pfc_w_pagesetup
integer x = 750
integer y = 452
integer width = 1605
integer height = 320
integer taborder = 0
string text = "Margins"
end type

