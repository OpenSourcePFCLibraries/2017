HA$PBExportHeader$pfc_w_selection.srw
$PBExportComments$PFC Selection window
forward
global type pfc_w_selection from w_response
end type
type dw_1 from u_dw within pfc_w_selection
end type
type cb_ok from u_cb within pfc_w_selection
end type
type cb_cancel from u_cb within pfc_w_selection
end type
end forward

global type pfc_w_selection from w_response
int X=261
int Y=412
int Width=841
int Height=848
boolean TitleBar=true
string Title="Open"
long BackColor=80263328
dw_1 dw_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global pfc_w_selection pfc_w_selection

type variables
Protected:
integer	ii_dwmaxwidth = 2150
integer	ii_dwmaxheight = 960
integer	ii_dwminwidth = 729
integer	ii_dwminheight = 551
n_cst_selectionattrib	inv_selectionattrib

end variables

on pfc_w_selection.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
end on

on pfc_w_selection.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  open
//
//	Description:  Initialize window based on passed-in object
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

constant string	WHITE = "16777215"
long	ll_rowcount
long	ll_width
long	ll_height
string	ls_errbuffer
string	ls_syntax
string	ls_presentation

SetPointer (hourglass!)

ib_disableclosequery = true

inv_selectionattrib = message.powerobjectparm

this.title = inv_selectionattrib.is_title

// Set the dataobject
if Lower (Left (inv_selectionattrib.is_dataobject, 7)) = "release" then
	// If DW syntax was passed
	dw_1.Create (inv_selectionattrib.is_dataobject, ls_errbuffer)
else
	if Lower (Left (inv_selectionattrib.is_dataobject, 6)) = "select" then
		// If a SQL select was passed
		if IsValid (inv_selectionattrib.itr_object) then
			if inv_selectionattrib.itr_object.of_IsConnected() then
				// Default presentation
				ls_presentation = "DataWindow (color=" + WHITE + ") " + &
					"Column (background.mode=1 border=0 color=0 edit.displayonly='yes' edit.focusrectangle='no' " + &
					"font.face='MS Sans Serif' font.height='-8' font.weight=400 font.family=2 font.pitch=2 font.charset=0) " + &
					"Text (alignment=0 border=0 color=0 background.mode=1 " + &
					"font.face='MS Sans Serif' font.height='-8' font.weight=400 font.family=2 font.pitch=2 font.charset=0) " + &
					"Style (Header_Bottom_Margin=0 Header_Top_Margin=0 Report='yes')"

				// Build syntax from sql and create DW
				ls_syntax = inv_selectionattrib.itr_object.SyntaxFromSQL (inv_selectionattrib.is_dataobject, &
					ls_presentation, ls_errbuffer)
				if Len (ls_syntax) > 0 then
					if dw_1.Create (ls_syntax, ls_errbuffer) = 1 then
						dw_1.SetSort ("#1 A")
					end if
				end if
			end if
		end if
	else
		dw_1.dataobject = inv_selectionattrib.is_dataobject
	end if
end if

dw_1.of_SetBase (true)
dw_1.inv_base.of_Modify ("protect", "1", "column", "*", true)

// Determine whether to set a transaction object for the datawindow
if IsValid (inv_selectionattrib.itr_object) then
	dw_1.of_SetTransObject (inv_selectionattrib.itr_object)
end if

// Retrieve the DataWindow if trans object is supplied
if IsValid (inv_selectionattrib.itr_object) then
	dw_1.Retrieve (inv_selectionattrib.ia_argument[1], inv_selectionattrib.ia_argument[2], &
		inv_selectionattrib.ia_argument[3], inv_selectionattrib.ia_argument[4], &
		inv_selectionattrib.ia_argument[5], inv_selectionattrib.ia_argument[6], &
		inv_selectionattrib.ia_argument[7], inv_selectionattrib.ia_argument[8], &
		inv_selectionattrib.ia_argument[9], inv_selectionattrib.ia_argument[10], &
		inv_selectionattrib.ia_argument[11], inv_selectionattrib.ia_argument[12], &
		inv_selectionattrib.ia_argument[13], inv_selectionattrib.ia_argument[14], &
		inv_selectionattrib.ia_argument[15], inv_selectionattrib.ia_argument[16], &
		inv_selectionattrib.ia_argument[17], inv_selectionattrib.ia_argument[18], &
		inv_selectionattrib.ia_argument[19], inv_selectionattrib.ia_argument[20])
// Populate the DataWindow from the data passed in if supplied
elseif UpperBound (inv_selectionattrib.ipo_data) > 0 then
	dw_1.object.data = inv_selectionattrib.ipo_data
end if

ll_rowcount = dw_1.RowCount()
if ll_rowcount > 0 then
	// Register controls for resize window service
	of_SetResize (true)
	inv_resize.of_Register (dw_1, inv_resize.SCALERIGHTBOTTOM) 
	inv_resize.of_Register (cb_ok, inv_resize.FIXEDRIGHTBOTTOM)
	inv_resize.of_Register (cb_cancel, inv_resize.FIXEDRIGHTBOTTOM)

	// Resize DW according to DW object passed in
	ll_width = dw_1.inv_base.of_GetWidth()
	ll_width = Min (ii_dwmaxwidth, ll_width)
	if ll_width = ii_dwmaxwidth then
		dw_1.hscrollbar = true
	end if
	ll_width = Max (ii_dwminwidth, ll_width) 

	ll_height = dw_1.inv_base.of_GetHeight()
	ll_height = Min (ii_dwmaxheight, ll_height)
	ll_height = Max (ii_dwminheight, ll_height)

	Resize (this.width + (ll_width - dw_1.width), this.height + (ll_height - dw_1.height))
else
	cb_ok.enabled = false
end if


end event

event pfc_default;call w_response::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Description:  
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

any		la_returnval[]
integer	li_cnt
integer	li_numcolumns
long		ll_currow

// Initialize return values
inv_selectionattrib.ia_returnval = la_returnval

// Return column data requested
ll_currow = dw_1.GetRow()
if ll_currow > 0 then
	li_numcolumns = UpperBound (inv_selectionattrib.is_columnreturn[])
	// No columns were specified, so default to column 1
	if li_numcolumns = 0 then
		li_numcolumns = Integer (dw_1.object.datawindow.column.count)
		if li_numcolumns > 0 then
			inv_selectionattrib.ia_returnval[1] = dw_1.inv_rowselect.of_GetItemAny (ll_currow, 1)
		end if
	else
		for li_cnt = 1 to li_numcolumns
			inv_selectionattrib.ia_returnval[li_cnt] = dw_1.inv_rowselect.of_GetItemAny (ll_currow, inv_selectionattrib.is_columnreturn[li_cnt])
		next
	end if
end if

CloseWithReturn (this, inv_selectionattrib)
end event

event close;call w_response::close;CloseWithReturn (this, inv_selectionattrib)
end event

event pfc_cancel;call w_response::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_cancel
//
//	Description:  
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

any	la_temp[]

// Re-initialize return values before closing
inv_selectionattrib.ia_returnval = la_temp
CloseWithReturn (this, inv_selectionattrib)
end event

type dw_1 from u_dw within pfc_w_selection
int X=41
int Y=36
int Width=727
int Height=548
int TabOrder=20
end type

event constructor;call u_dw::constructor;// Single rowselection
of_SetRowSelect (true)

// No RMB support
ib_rmbmenu = false



end event

event clicked;call u_dw::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Enable OK button if appropriate
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

if this.GetSelectedRow (0) > 0 then
	cb_ok.enabled = true
else
	cb_ok.enabled = false
end if
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Description:
//	User has selected current row
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.01   Initial version
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

if this.GetSelectedRow (0) > 0 then
	parent.event pfc_default()
end if
end event

type cb_ok from u_cb within pfc_w_selection
int X=41
int Y=628
int TabOrder=30
boolean Enabled=false
string Text="OK"
boolean Default=true
end type

event clicked;call u_cb::clicked;parent.event pfc_default()
end event

type cb_cancel from u_cb within pfc_w_selection
int X=416
int Y=628
int TabOrder=10
string Text="Cancel"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;parent.event pfc_cancel()
end event

