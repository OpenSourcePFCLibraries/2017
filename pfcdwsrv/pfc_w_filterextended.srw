HA$PBExportHeader$pfc_w_filterextended.srw
$PBExportComments$PFC Extended Filter dialog window
forward
global type pfc_w_filterextended from w_response
end type
type cb_ok from u_cb within pfc_w_filterextended
end type
type cb_cancel from u_cb within pfc_w_filterextended
end type
type cb_verify from u_cb within pfc_w_filterextended
end type
type mle_filter from u_mle within pfc_w_filterextended
end type
type gb_2 from u_gb within pfc_w_filterextended
end type
type gb_1 from u_gb within pfc_w_filterextended
end type
type tab_1 from tab within pfc_w_filterextended
end type
type tabpg_functions from userobject within tab_1
end type
type dw_functioncategory from u_dw within tabpg_functions
end type
type dw_function from u_dw within tabpg_functions
end type
type gb_3 from u_gb within tabpg_functions
end type
type st_help from u_st within tabpg_functions
end type
type st_syntax from u_st within tabpg_functions
end type
type tabpg_functions from userobject within tab_1
dw_functioncategory dw_functioncategory
dw_function dw_function
gb_3 gb_3
st_help st_help
st_syntax st_syntax
end type
type tabpg_columns from userobject within tab_1
end type
type dw_columns from u_dw within tabpg_columns
end type
type tabpg_columns from userobject within tab_1
dw_columns dw_columns
end type
type tabpg_operators from userobject within tab_1
end type
type lb_1 from u_lb within tabpg_operators
end type
type tabpg_operators from userobject within tab_1
lb_1 lb_1
end type
type tabpg_values from userobject within tab_1
end type
type dw_values from u_dw within tabpg_values
end type
type tabpg_values from userobject within tab_1
dw_values dw_values
end type
type tab_1 from tab within pfc_w_filterextended
tabpg_functions tabpg_functions
tabpg_columns tabpg_columns
tabpg_operators tabpg_operators
tabpg_values tabpg_values
end type
type cb_dlghelp from u_cb within pfc_w_filterextended
end type
type os_column from structure within pfc_w_filterextended
end type
end forward

type os_column from structure
	string		s_colname
	string		s_colnamedisplay
	string		s_dbname
end type

global type pfc_w_filterextended from w_response
integer x = 768
integer y = 404
integer width = 2135
integer height = 1652
string title = "Filter"
long backcolor = 80263328
event type integer pfc_verify ( )
cb_ok cb_ok
cb_cancel cb_cancel
cb_verify cb_verify
mle_filter mle_filter
gb_2 gb_2
gb_1 gb_1
tab_1 tab_1
cb_dlghelp cb_dlghelp
end type
global pfc_w_filterextended pfc_w_filterextended

type variables
Protected:
string		is_currentcolumn
n_cst_filterattrib	inv_filterattrib
n_cst_returnattrib	inv_return
end variables

event pfc_verify;call super::pfc_verify;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_verify
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Filter is valid
//	-1 = Filter is not valid
//
//	Description:
//	Verifies current filter
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

integer	li_rc = 1
string		ls_testfilter
datastore	lds_test

ls_testfilter = mle_filter.text

if Len (ls_testfilter) > 0 then
	lds_test = create datastore

	// Associate the correct dataobject to the test-filter datastore
	lds_test.dataobject = inv_filterattrib.idw_dw.dataobject

	// Test the filter
	li_rc = lds_test.SetFilter (ls_testfilter)

	destroy lds_test
end if

return li_rc
end event

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  open
//
//	Description:
//	Initialize window
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

integer	li_upper
integer	li_cnt
string	ls_filter
os_column	lstr_column[]
n_cst_string lnv_string

SetPointer (HourGlass!)
tab_1.tabpg_functions.gb_3.SetPosition (tobottom!)

inv_filterattrib = Message.PowerObjectParm

// Allow window to close without the CloseQuery checks being performed
ib_disableclosequery = true

// Start the base window service
this.of_SetBase (true)

// Center this window.
inv_base.of_Center()

// Display original filter in the filter mle.
ls_filter = inv_filterattrib.is_filter
If Pos(ls_filter, "~~~~'") > 0 And  Pos(ls_filter, "~~~~~~'") = 0 Then
	ls_filter = lnv_string.of_GlobalReplace(ls_filter, "~~~~'", "~~'", FALSE)	
End If
mle_filter.text = ls_filter
mle_filter.SelectText (1, Len (mle_filter.text))
mle_filter.SetFocus() 

// Display initial function categories
if tab_1.tabpg_functions.dw_functioncategory.RowCount() > 0 then
	tab_1.tabpg_functions.dw_functioncategory.SetRow (1)
	tab_1.tabpg_functions.dw_functioncategory.event rowfocuschanged (1)
	tab_1.tabpg_functions.dw_functioncategory.SelectRow (1, true)
end if

// Populate columns tabpage
li_upper = UpperBound (inv_filterattrib.is_columns)
for li_cnt = 1 to li_upper
	lstr_column[li_cnt].s_colname = inv_filterattrib.is_columns[li_cnt]
	lstr_column[li_cnt].s_colnamedisplay = inv_filterattrib.is_colnamedisplay[li_cnt]
	lstr_column[li_cnt].s_dbname = inv_filterattrib.is_dbnames[li_cnt]
next
tab_1.tabpg_columns.dw_columns.object.data = lstr_column
if tab_1.tabpg_columns.dw_columns.RowCount() > 0 then
	tab_1.tabpg_columns.dw_columns.SetRow (1)
	tab_1.tabpg_columns.dw_columns.event rowfocuschanged (1)
	tab_1.tabpg_columns.dw_columns.SelectRow (1, true)
end if
end event

on pfc_w_filterextended.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_verify=create cb_verify
this.mle_filter=create mle_filter
this.gb_2=create gb_2
this.gb_1=create gb_1
this.tab_1=create tab_1
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_verify
this.Control[iCurrent+4]=this.mle_filter
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.cb_dlghelp
end on

on pfc_w_filterextended.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_verify)
destroy(this.mle_filter)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.tab_1)
destroy(this.cb_dlghelp)
end on

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  close
//
//	Description:
//	Check for cancel operation
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

// If the return code matches the default value,
// then window is currently being closed as a cancel operation.
if inv_return.ii_rc=-99 then
	this.event pfc_cancel ()
end if
end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_Cancel
//
//	Description:
//	Set to the appropriate return code and close the dialog.
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

// Set the return code to mean the window was closed by a cancel operation.
inv_return.ii_rc = 0

// Clear the sort string.
inv_return.is_rs = ""

// Close the window.
CloseWithReturn (this, inv_return)
end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Description:
//	Construct the new filter string
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

// Verify that filter is valid
if this.event pfc_verify() = -1 then
	of_MessageBox ("pfc_filterextended_modifyfilter", "Filter", &
		"Filter is not valid.  Please modify the filter using the available " + &
		"functions, columns, operators, and values.  The Verify button may be "+&
		"used to determine if the filter is valid.", &
		Information!, OK!, 1)
	return
end if

// Set the return code to mean succesful operation
inv_return.ii_rc = 1

// Set the new filter string
inv_return.is_rs = mle_filter.text

// Close the window.
CloseWithReturn (this, inv_return)

end event

type cb_ok from u_cb within pfc_w_filterextended
integer x = 914
integer y = 1444
integer width = 375
integer taborder = 40
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the OK window process.
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

Parent.Event pfc_default()

end event

type cb_cancel from u_cb within pfc_w_filterextended
integer x = 1303
integer y = 1444
integer width = 375
integer taborder = 50
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the window Cancel operation.
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

Parent.Event pfc_Cancel ()

end event

type cb_verify from u_cb within pfc_w_filterextended
integer x = 1637
integer y = 96
integer width = 375
integer taborder = 20
string text = "&Verify"
boolean cancel = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Verifies that current filter is valid
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

integer	li_rc

li_rc = parent.event pfc_verify()
if li_rc = 1 then
	of_MessageBox ("pfc_filterextended_validverify", "Filter", "Filter is valid", &
		Information!, OK!, 1)
else
	of_MessageBox ("pfc_filterextended_failedverify", "Filter", "Filter is not valid", &
		Information!, OK!, 1)	
end if
end event

type mle_filter from u_mle within pfc_w_filterextended
integer x = 82
integer y = 96
integer width = 1518
integer height = 244
integer taborder = 10
long textcolor = 33554687
long backcolor = 1086381248
integer accelerator = 102
boolean hideselection = false
end type

type gb_2 from u_gb within pfc_w_filterextended
integer x = 27
integer y = 428
integer width = 2039
integer height = 992
integer taborder = 0
string text = "Build filter with"
end type

type gb_1 from u_gb within pfc_w_filterextended
integer x = 27
integer y = 16
integer width = 2039
integer height = 368
integer taborder = 0
string text = "&Filter expression"
end type

type tab_1 from tab within pfc_w_filterextended
integer x = 64
integer y = 508
integer width = 1943
integer height = 884
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
boolean showpicture = false
integer selectedtab = 1
tabpg_functions tabpg_functions
tabpg_columns tabpg_columns
tabpg_operators tabpg_operators
tabpg_values tabpg_values
end type

on tab_1.create
this.tabpg_functions=create tabpg_functions
this.tabpg_columns=create tabpg_columns
this.tabpg_operators=create tabpg_operators
this.tabpg_values=create tabpg_values
this.Control[]={this.tabpg_functions,&
this.tabpg_columns,&
this.tabpg_operators,&
this.tabpg_values}
end on

on tab_1.destroy
destroy(this.tabpg_functions)
destroy(this.tabpg_columns)
destroy(this.tabpg_operators)
destroy(this.tabpg_values)
end on

event selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  selectionchanged
//
//	Description:
//	Populate values DW for current column
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Radiobutton and checkbox edit styles should only display data values
//	5.0.03	Do not display dropdown arrows, spin controls
// 12.5.2		Use SQL statement of the associated dddw, if any
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
boolean	lb_radiobuttons
integer	li_selectedrow
long		ll_pos
long		ll_temp
long		ll_editstyle
long		ll_start
long		ll_end
long		ll_height
long		ll_column
string		ls_col
string		ls_presentation
string		ls_syntax
string		ls_errbuffer
string		ls_dbname
string		ls_table
string		ls_sql
string		ls_editstyle
string		ls_replacesyntax
string		ls_dddw
n_cst_string	lnv_string
datastore	lds

// Check for values tabpage
if newindex <> 4 then
	return
end if	

// Check for valid trans object before values can be populated
if not IsValid (inv_filterattrib.idw_dw.itr_object) or IsNull (inv_filterattrib.idw_dw.itr_object) then
	return
end if
if not inv_filterattrib.idw_dw.itr_object.of_IsConnected() then
	return
end if

// Populate values based on current column
li_selectedrow = this.tabpg_columns.dw_columns.GetSelectedRow (0)
if li_selectedrow > 0 then
	ls_col = this.tabpg_columns.dw_columns.object.columnname[li_selectedrow]
	if ls_col <> is_currentcolumn then
		// Table and column
		ls_dbname = this.tabpg_columns.dw_columns.object.db_name[li_selectedrow]
		ll_pos = Pos (ls_dbname, ".")
		ls_table = Left (ls_dbname, ll_pos - 1)
		if ls_table = "" or ls_dbname = "" then
			this.tabpg_values.dw_values.dataobject = ""
			is_currentcolumn = ""
			return
		end if

		// SQL
		// Check if a dddw is associated with the selected column
		ls_dddw = inv_filterattrib.idw_dw.describe( ls_col+".dddw.name")
		if ls_dddw <> "!" or ls_dddw <> "?" then
			// if so, extract sql from dddw dataobject
			lds = create datastore
			lds.dataobject = ls_dddw
			ls_sql = lds.object.datawindow.table.select
		else
			// otherwise, build sql based on selected column's dbname
			ls_sql = "select distinct " + ls_dbname + " from " + ls_table
		end if

		// Default presentation
		ls_presentation = "DataWindow (color=" + WHITE + ") " + &
			"Column (background.mode=1 border=0 color=0 edit.displayonly='yes' edit.focusrectangle='no' " + &
			"font.face='MS Sans Serif' font.height='-8' font.weight=400 font.family=2 font.pitch=2 font.charset=0) " + &
			"Text (alignment=0 border=0 color=0 background.mode=1 " + &
			"font.face='MS Sans Serif' font.height='-8' font.weight=400 font.family=2 font.pitch=2 font.charset=0) " + &
			"Style (Header_Bottom_Margin=0 Header_Top_Margin=0 Report='yes')"

		// Build syntax from sql and create DW
		ls_syntax = inv_filterattrib.idw_dw.itr_object.SyntaxFromSQL (ls_sql, ls_presentation, ls_errbuffer)

		// Do not allow checkbox and radiobuttons edit styles (replace with edit editstyle)
		ls_replacesyntax = " edit.limit=0 edit.autoselect=no edit.autohscroll=yes edit.autovscroll=no edit.focusrectangle=no "
		ll_editstyle = Pos (ls_syntax, "checkbox.on=")
		if ll_editstyle = 0 then
			ll_editstyle = Pos (ls_syntax, "radiobuttons.columns=")
			lb_radiobuttons = true
		end if
		if ll_editstyle > 0 then
			ll_temp = Pos (ls_syntax, "width=")
			if ll_temp > 0 then
				// For radiobuttons - first modify the height of the column
				if lb_radiobuttons then
					ll_height = lnv_string.of_LastPos (ls_syntax, "height", ll_temp)
					if ll_height > 0 then
						ls_syntax = Left (ls_syntax, ll_height - 1) + ' height="61" ' + Mid (ls_syntax, ll_temp)
						// Now modify the detail height
						ll_height = Pos (ls_syntax, "detail(height=")
						ll_column = Pos (ls_syntax, "column", ll_height)
						if ll_height > 0 and ll_column > 0 then
							ls_syntax = Left (ls_syntax, ll_height - 1) + ' detail(height=75) ' + Mid (ls_syntax, ll_column)
						end if
						ll_temp = Pos (ls_syntax, "width=")
					end if
				end if

				// Now change radiobutton & checkbox edit styles to edit edit styles
				ll_temp = Pos (ls_syntax, " ", ll_temp)
				if ll_temp > 0 then
					ll_start = ll_temp - 1
					ll_temp = Pos (ls_syntax, "alignment=", ll_start)
					if ll_temp > 0 then
						ll_end = ll_temp - 1
						ls_syntax = Left (ls_syntax, ll_start) + ls_replacesyntax + Mid (ls_syntax, ll_end)
					end if
				end if
			end if
		end if
		
		if Len (ls_syntax) > 0 then
			if this.tabpg_values.dw_values.Create (ls_syntax, ls_errbuffer) = 1 then
				
				ls_editstyle = this.tabpg_values.dw_values.Describe ("#1.edit.style")

				// DDDW & DDLB edit styles should not always display arrow for dropdown
				if ls_editstyle = "dddw" or ls_editstyle = "ddlb" then
					this.tabpg_values.dw_values.Modify ("#1." + ls_editstyle + ".UseAsBorder=no")
				end if
				
				// Editmasks should not show spin control
				if ls_editstyle = "editmask" then
					this.tabpg_values.dw_values.Modify ("#1.editmask.spin=no")
				end if
				
				this.tabpg_values.dw_values.SetSort ("#1 A")
				this.tabpg_values.dw_values.Modify ("#1.protect=1")
				this.tabpg_values.dw_values.SetTransObject (inv_filterattrib.idw_dw.itr_object)
				this.tabpg_values.dw_values.Retrieve()
				is_currentcolumn = ls_col
			end if
		else
			this.tabpg_values.dw_values.dataobject = ""
			is_currentcolumn = ""
		end if
	end if
else
	this.tabpg_values.dw_values.dataobject = ""
	is_currentcolumn = ""
end if

end event

type tabpg_functions from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1906
integer height = 768
long backcolor = 79741120
string text = "Functions"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_functioncategory dw_functioncategory
dw_function dw_function
gb_3 gb_3
st_help st_help
st_syntax st_syntax
end type

on tabpg_functions.create
this.dw_functioncategory=create dw_functioncategory
this.dw_function=create dw_function
this.gb_3=create gb_3
this.st_help=create st_help
this.st_syntax=create st_syntax
this.Control[]={this.dw_functioncategory,&
this.dw_function,&
this.gb_3,&
this.st_help,&
this.st_syntax}
end on

on tabpg_functions.destroy
destroy(this.dw_functioncategory)
destroy(this.dw_function)
destroy(this.gb_3)
destroy(this.st_help)
destroy(this.st_syntax)
end on

type dw_functioncategory from u_dw within tabpg_functions
integer x = 18
integer y = 28
integer width = 677
integer height = 408
integer taborder = 2
string dataobject = "d_dwfunctioncategory"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Description:
//	Initialize control
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

of_SetRowSelect (true)
ib_rmbmenu = false
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rowfocuschanged
//
//	Description:
//	Filter functions to the correct category
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

string	ls_category

if currentrow > 0 then
	inv_rowselect.of_RowSelect (currentrow)

	ls_category = GetItemString (currentrow, "category")
	dw_function.SetFilter ("category = '" + ls_category + "'")
	dw_function.Filter()
	if dw_function.RowCount() > 0 then
		dw_function.SetRow (1)
		dw_function.event rowfocuschanged (1)
	end if
end if
end event

type dw_function from u_dw within tabpg_functions
integer x = 713
integer y = 28
integer width = 1152
integer height = 412
integer taborder = 2
string dataobject = "d_dwfunction"
end type

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rowfocuschanged
//
//	Description:
//	Update syntax and help for the current function
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

string	ls_syntax
string	ls_help

if currentrow > 0 then
	inv_rowselect.of_RowSelect (currentrow)

	ls_syntax = this.GetItemString (currentrow, "syntax")
	ls_help = this.GetItemString (currentrow, "help")

	st_syntax.text = ls_syntax
	st_help.text = ls_help
end if
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Description:
//	Initialize control
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

of_SetRowSelect (true)
ib_rmbmenu = false
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Description:
//	Pastes the clicked function syntax into the filter expression
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

integer	li_position
long		ll_pos
long		ll_pos2
string		ls_syntax

if row > 0 then
	ls_syntax = this.object.syntax[row]
	li_position = mle_filter.Position()
	mle_filter.ReplaceText (ls_syntax)

	// Select expression between parenthesis
	if li_position > 0 then
		ll_pos = Pos (mle_filter.text, "(", li_position)
		if ll_pos > 0 then
			ll_pos2 = Pos (mle_filter.text, ")", li_position)
			if ll_pos2 > 0 then
				mle_filter.SelectText (ll_pos + 1, ll_pos2 - ll_pos - 1)
			end if
		end if
	end if	
end if
end event

type gb_3 from u_gb within tabpg_functions
integer x = 18
integer y = 448
integer width = 1847
integer height = 308
integer taborder = 2
string text = "Syntax"
end type

type st_help from u_st within tabpg_functions
integer x = 46
integer y = 584
integer width = 1792
integer height = 156
boolean bringtotop = true
end type

type st_syntax from u_st within tabpg_functions
integer x = 46
integer y = 508
integer width = 1765
integer weight = 700
long backcolor = 79741120
end type

type tabpg_columns from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1906
integer height = 768
long backcolor = 79741120
string text = "Columns"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_columns dw_columns
end type

on tabpg_columns.create
this.dw_columns=create dw_columns
this.Control[]={this.dw_columns}
end on

on tabpg_columns.destroy
destroy(this.dw_columns)
end on

type dw_columns from u_dw within tabpg_columns
integer x = 32
integer y = 56
integer width = 1838
integer height = 684
integer taborder = 2
string dataobject = "d_columnnames"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Description:
//	Initialize control
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

of_SetRowSelect (true)
ib_rmbmenu = false
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Description:
//	Pastes the clicked columnname into the filter expression
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

string	ls_colname

if row > 0 then
	ls_colname = this.object.columnname[row]
	mle_filter.ReplaceText (ls_colname)
end if
end event

type tabpg_operators from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1906
integer height = 768
long backcolor = 79741120
string text = "Operators"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
lb_1 lb_1
end type

on tabpg_operators.create
this.lb_1=create lb_1
this.Control[]={this.lb_1}
end on

on tabpg_operators.destroy
destroy(this.lb_1)
end on

type lb_1 from u_lb within tabpg_operators
integer x = 32
integer y = 56
integer width = 1838
integer height = 684
integer taborder = 2
string item[] = {"=","<",">","<=",">=","and","or","not","(",")","LIKE","NOT LIKE"}
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Description:
//	Pastes the clicked operator into the filter expression
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

string	ls_selecteditem

ls_selecteditem = this.SelectedItem()
mle_filter.ReplaceText (" " + ls_selecteditem + " ")

end event

type tabpg_values from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1906
integer height = 768
long backcolor = 79741120
string text = "Values"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_values dw_values
end type

on tabpg_values.create
this.dw_values=create dw_values
this.Control[]={this.dw_values}
end on

on tabpg_values.destroy
destroy(this.dw_values)
end on

type dw_values from u_dw within tabpg_values
integer x = 32
integer y = 56
integer width = 1838
integer height = 684
integer taborder = 2
end type

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Description:
//	Pastes the clicked columnname into the filter expression
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Corrected to check/build for all column types.
// 7.0	Added "char" datatype to case statement
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

any		la_val
string	ls_value
string	ls_coltype
string	ls_expression
n_cst_string lnv_string

if row > 0 then
	// Get the column type.
	ls_coltype = Left(this.Describe ( "#1.ColType" ), 5)
	
	// Get the value.
	la_val = inv_rowselect.of_GetItemAny (row, 1)
	ls_value = String (la_val)

	// Determine the correct expression.
	Choose Case ls_coltype
		// CHARACTER DATATYPE		
		Case "char(", "char"	
			If Pos(ls_value, '~~~"') =0 And Pos(ls_value, "~~~'") =0 Then
				// No special characters found.
				If Pos(ls_value, "'") >0 Then
					// Replace single quotes with special chars single quotes.
					ls_value = lnv_string.of_GlobalReplace(ls_value, "'", "~~~'", FALSE)				
				End If
			End If
			ls_expression = "'" + ls_value + "'"
	
		// DATE DATATYPE	
		Case "date"
			ls_expression = "Date('" + ls_value  + "')" 

		// DATETIME DATATYPE
		Case "datet"				
			ls_expression = "DateTime('" + ls_value + "')" 

		// TIME DATATYPE
		Case "time", "times"		
			ls_expression = "Time('" + ls_value + "')" 
	
		// NUMBER
		Case 	Else
			ls_expression = ls_value
	End Choose	
	
	mle_filter.ReplaceText (ls_expression)
end if


end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Description:
//	Initialize control
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

of_SetRowSelect (true)
ib_rmbmenu = false
end event

type cb_dlghelp from u_cb within pfc_w_filterextended
integer x = 1691
integer y = 1444
integer width = 375
integer taborder = 60
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

showHelp ("pfcdlg.hlp", topic!, 100)
end event

