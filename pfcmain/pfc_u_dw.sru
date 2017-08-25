HA$PBExportHeader$pfc_u_dw.sru
$PBExportComments$PFC DataWindow class
forward
global type pfc_u_dw from datawindow
end type
end forward

shared variables
// All Shared variables are Private.
n_cst_dwsrv_property 	snv_property
end variables

global type pfc_u_dw from datawindow
integer width = 325
integer height = 244
integer taborder = 1
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event rbuttonup pbm_dwnrbuttonup
event type integer pfc_clear ( )
event type integer pfc_copy ( )
event type integer pfc_cut ( )
event type integer pfc_deleterow ( )
event type boolean pfc_descendant ( )
event type long pfc_insertrow ( )
event type long pfc_addrow ( )
event type integer pfc_paste ( )
event type boolean pfc_printpreview ( )
event type boolean pfc_ruler ( )
event type long pfc_retrieve ( )
event type long pfc_retrievedddw ( string as_column )
event type integer pfc_selectall ( )
event type integer pfc_undo ( )
event type integer pfc_update ( boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_zoom ( )
event type integer pfc_firstpage ( )
event type long pfc_lastpage ( )
event type long pfc_nextpage ( )
event type long pfc_previouspage ( )
event type integer pfc_printimmediate ( )
event type integer pfc_print ( )
event type integer pfc_pagesetup ( )
event type integer pfc_pagesetupdlg ( ref s_pagesetupattrib astr_pagesetup )
event pfc_prepagesetupdlg ( ref s_pagesetupattrib astr_pagesetup )
event pfc_rowchanged ( )
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event pfc_prermbmenu ( ref m_dw am_dw )
event type integer pfc_updatespending ( )
event type integer pfc_validation ( )
event type long pfc_restorerow ( )
event pfc_finddlg ( )
event pfc_replacedlg ( )
event type integer pfc_filterdlg ( )
event type integer pfc_sortdlg ( )
event type integer pfc_values ( )
event type integer pfc_operators ( )
event pfc_debug ( )
event dropdown pbm_dwndropdown
event type integer pfc_ddcalendar ( )
event type integer pfc_ddcalculator ( )
event pfc_prerestorerow ( ref n_cst_restorerowattrib anv_restorerowattrib )
event type integer pfc_accepttext ( boolean ab_focusonerror )
event type integer pfc_postupdate ( )
event type integer pfc_rowvalidation ( long al_row )
event type integer pfc_preproperties ( ref n_cst_dwpropertyattrib anv_dwpropertyattrib )
event type long pfc_populatedddw ( string as_colname,  ref datawindowchild adwc_obj )
event type integer pfc_preupdate ( )
event type integer pfc_updateprep ( )
event type integer pfc_predeleterow ( )
event pfc_prefinddlg ( ref n_cst_findattrib anv_findattrib )
event pfc_prereplacedlg ( ref n_cst_findattrib anv_findattrib )
event type integer pfc_preinsertrow ( )
event type integer pfc_resetupdate ( )
event pfc_properties ( )
event pfc_prermbmenuproperty ( ref m_dw am_dw )
event type integer pfc_checkrequirederror ( long al_row,  ref string as_columnname )
event pfc_postinsertrow ( long al_row )
event pfc_postlbuttonup ( unsignedlong flags,  integer xpos,  integer ypos )
end type
global pfc_u_dw pfc_u_dw

type variables
Private:

	String							is_syntaxModified		= 'no'
	Long								il_clicked
	DWObject							idwo_clicked
	
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0

n_tr									itr_Object
n_cst_dwsrv							inv_Base
n_cst_dwsrv_rowmanager		inv_RowManager
n_cst_dwsrv_querymode			inv_QueryMode
n_cst_dwsrv_linkage				inv_Linkage
n_cst_dwsrv_report				inv_Report
n_cst_dwsrv_multitable			inv_MultiTable
n_cst_dwsrv_rowselection		inv_RowSelect
n_cst_dwsrv_sort					inv_Sort
n_cst_dwsrv_filter					inv_Filter
n_cst_dwsrv_reqcolumn			inv_ReqColumn
n_cst_dwsrv_dropdownsearch	inv_DropDownSearch
n_cst_dwsrv_find					inv_Find
n_cst_dwsrv_printpreview		inv_PrintPreview
n_cst_dwsrv_resize				inv_Resize
u_calendar 							iuo_Calendar
u_calculator 						iuo_Calculator
n_cst_dwsrv_property 			inv_Property
n_cst_dwsrv_grid					inv_Grid

Protected:
boolean			ib_IsObsolete
boolean			ib_IsUpdateable = true
boolean			ib_RMBmenu = true
boolean			ib_RMBfocuschange = true
string				is_UpdatesAllowed="IUD" // I-Inserts U-Updates D-Deletes
powerobject		ipo_UpdateRequestor
end variables

forward prototypes
public function boolean of_getupdateable ()
public function integer of_SetTransObject (n_tr atr_object)
public function integer of_GetParentWindow (ref window aw_parent)
public function integer of_SetBase (boolean ab_switch)
public function integer of_SetDropDownSearch (boolean ab_switch)
public function integer of_SetFilter (boolean ab_switch)
public function integer of_SetFind (boolean ab_switch)
public function integer of_setlinkage (boolean ab_switch)
public function integer of_SetMultiTable (boolean ab_switch)
public function integer of_SetPrintPreview (boolean ab_switch)
public function integer of_SetQueryMode (boolean ab_switch)
public function integer of_SetReport (boolean ab_switch)
public function integer of_SetRowManager (boolean ab_switch)
public function integer of_SetRowSelect (boolean ab_switch)
public function integer of_SetSort (boolean ab_switch)
public function integer of_SetUpdateable (boolean ab_isupdateable)
public function integer of_SetReqColumn (boolean ab_switch)
public function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly)
public function integer of_SetDropDownCalendar (boolean ab_switch)
public function integer of_SetDropDownCalculator (boolean ab_switch)
public function integer of_SetResize (boolean ab_switch)
public function boolean of_IsRoot ()
public function integer of_SetProperty (boolean ab_switch)
public function integer of_SetUpdateRequestor (powerobject apo_updaterequestor)
public function integer of_AcceptText (boolean ab_focusonerror)
public function integer of_Reset ()
public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor)
public function integer of_UpdatesPending ()
public function integer of_Validation ()
public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag)
public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag, boolean ab_insert, boolean ab_update, boolean ab_delete)
public function integer of_UpdatePrep ()
public function integer of_PostUpdate ()
public function boolean of_IsUpdateable ()
protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_SetSharedProperty (boolean ab_switch)
public function boolean of_IsSharedProperty ()
public function long of_Retrieve ()
public function integer of_setgrid (boolean ab_switch)
end prototypes

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:  			rbuttonup
//	Description:		Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   	Initial version
//						5.0.04 Modified script to avoid 64K segment problem with 16bit machine code executables
// 						6.0		Added DataWindow Property to the popup menu.
// 						6.0 	Added check for the new RowManager.of_GetRestoreRow() switch.
// 						6.0.01 Added call to pfc_prermbmenuproperty to isolate calls to shared variable.
// 						6.0.01 Corrected so that dwo.protect works properly for protect expressions.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean		lb_frame
boolean		lb_desired
boolean		lb_readonly
boolean		lb_editstyleattrib
integer		li_tabsequence
long			ll_getrow
string		ls_editstyle
string		ls_val
string		ls_protect
string		ls_colname
string		ls_currcolname
string		ls_type
string		ls_expression
n_cst_conversion	lnv_conversion
m_dw					lm_dw
window				lw_parent
window				lw_frame
window				lw_sheet
window				lw_childparent

// Determine if RMB popup menu should occur
if not ib_RMBmenu or IsNull (dwo) then	return 1

// No RMB support for OLE objects and graphs
ls_type = dwo.Type
if ls_type = "ole" or ls_type = "tableblob" or ls_type = "graph" then return 1

// No RMB support for print preview mode
if this.Object.DataWindow.Print.Preview = "yes" then return 1

// Determine parent window for PointerX, PointerY offset
this.of_GetParentWindow (lw_parent)
if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	do while IsValid (lw_frame)
		if lw_frame.windowtype = MDI! or lw_frame.windowtype = MDIHelp! then
			lb_frame = true
			exit
		else
			lw_frame = lw_frame.ParentWindow()
		end if
	loop
	
	if lb_frame then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		if lw_parent.windowtype = Child! then
			lw_parent = lw_frame
		else
			lw_sheet = lw_frame.GetFirstSheet()
			if IsValid (lw_sheet) then
				do
					// Use frame reference for popup menu if the parentwindow is a sheet
					if lw_sheet = lw_parent then
						lw_parent = lw_frame
						exit
					end if
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
			end if
		end if
	else
		// SDI application.  All windows except for child windows will use the parent
		// window of the control as the reference point for the popmenu
		if lw_parent.windowtype = Child! then
			lw_childparent = lw_parent.ParentWindow()
			if IsValid (lw_childparent) then
				lw_parent = lw_childparent
			end if
		end if
	end if
else
	return 1
end if

// Create popup menu
lm_dw = create m_dw
lm_dw.of_SetParent (this)

//////////////////////////////////////////////////////////////////////////////
// Main popup menu operations
//////////////////////////////////////////////////////////////////////////////
ll_getrow = this.GetRow()

ls_val = this.Object.DataWindow.ReadOnly
lb_readonly = lnv_conversion.of_Boolean (ls_val)

choose case ls_type
	case "datawindow", "column", "compute", "text", "report", &
		"bitmap", "line", "ellipse", "rectangle", "roundrectangle"

		// Row operations based on readonly status
		lm_dw.m_table.m_insert.Enabled = not lb_readonly
		lm_dw.m_table.m_addrow.Enabled = not lb_readonly
		lm_dw.m_table.m_delete.Enabled = not lb_readonly

		// Menu item enablement for current row
		if not lb_readonly then
			lb_desired = False
			if ll_getrow > 0 then lb_desired = true
			lm_dw.m_table.m_delete.Enabled = lb_desired
			lm_dw.m_table.m_insert.Enabled = lb_desired			
		end if
		
	case else
		lm_dw.m_table.m_insert.Enabled = false
		lm_dw.m_table.m_delete.Enabled = false
		lm_dw.m_table.m_addrow.Enabled = false
end choose

// Get column properties
ls_currcolname = this.GetColumnName()
if ls_type = "column" then
	ls_editstyle = dwo.Edit.Style
	ls_colname = dwo.Name
	ls_protect = dwo.Protect
	if not IsNumber(ls_protect) then
		// Since it is not a number, it must be an expression.
		ls_expression = Right(ls_protect, Len(ls_protect) - Pos(ls_protect, "~t"))
		ls_expression = "Evaluate(~""+ls_expression+","+String(row)+")"
		ls_protect = this.Describe(ls_expression)
	end if
	ls_val = dwo.TabSequence
	if IsNumber (ls_val) then
		li_tabsequence = Integer (ls_val)
	end if
end if

//////////////////////////////////////////////////////////////////////////////
// Transfer operations.  Only enable for editable column edit styles
//////////////////////////////////////////////////////////////////////////////
lm_dw.m_table.m_copy.Enabled = false
lm_dw.m_table.m_cut.Enabled = false
lm_dw.m_table.m_paste.Enabled = false
lm_dw.m_table.m_selectall.Enabled = false

// Get the column/editystyle specific editable flag.
if ls_type = "column" and not lb_readonly then
	choose case ls_editstyle
		case "edit"
			ls_val = dwo.Edit.DisplayOnly
		case "editmask"
			ls_val = dwo.EditMask.Readonly
		case "ddlb"
			ls_val = dwo.DDLB.AllowEdit
		case "dddw"
			ls_val = dwo.DDDW.AllowEdit
		case else
			ls_val = ""
	end choose
	lb_editstyleattrib = lnv_conversion.of_Boolean (ls_val)
	if IsNull(lb_editstyleattrib) then lb_editstyleattrib = false
end if

if ls_type = "column" and not lb_readonly then
	if dwo.BitmapName = "no" and ls_editstyle <> "checkbox" and ls_editstyle <> "radiobuttons" then
		
		if Len (this.SelectedText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
			// Copy
			lm_dw.m_table.m_copy.Enabled = true

			// Cut
			if li_tabsequence > 0 and ls_protect = "0" then
				lb_desired = false
				choose case ls_editstyle
					case "edit", "editmask"
						lb_desired = not lb_editstyleattrib
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib
				end choose
				lm_dw.m_table.m_cut.Enabled = lb_desired
			end if
		end if
			
		if li_tabsequence > 0 and ls_protect = "0" then
			// Paste
			if Len (ClipBoard()) > 0 then
				lb_desired = false
				choose case ls_editstyle
					case "edit", "editmask"
						lb_desired = not lb_editstyleattrib
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib
				end choose
				lm_dw.m_table.m_paste.Enabled = lb_desired
			end if

			// Select All
			if Len (this.GetText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
				choose case ls_editstyle
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib						
					case else
						lb_desired = true
				end choose
				lm_dw.m_table.m_selectall.Enabled = lb_desired				
			end if
		end if

	end if
end if

//////////////////////////////////////////////////////////////////////////////
// Services
//////////////////////////////////////////////////////////////////////////////
// Row Manager
if IsValid (inv_RowManager) then
	// Undelete capability
	if inv_RowManager.of_IsRestoreRow() then
		lm_dw.m_table.m_restorerow.Visible = true
		if this.DeletedCount() > 0 and not lb_readonly then
			lm_dw.m_table.m_restorerow.Enabled = true
		else
			lm_dw.m_table.m_restorerow.Enabled = false
		end if
	end if
else
	lm_dw.m_table.m_restorerow.Visible = false
	lm_dw.m_table.m_restorerow.Enabled = false
end if

// QueryMode
// Default to false
lm_dw.m_table.m_operators.Visible = false
lm_dw.m_table.m_operators.Enabled = false
lm_dw.m_table.m_values.Visible = false
lm_dw.m_table.m_values.Enabled = false
lm_dw.m_table.m_dash12.Visible = false

if IsValid (inv_QueryMode) then
	if inv_QueryMode.of_GetEnabled() then
		// Do not allow undelete while in querymode
		lm_dw.m_table.m_restorerow.Visible = false
		lm_dw.m_table.m_restorerow.Enabled = false		

		// Default visible to true if in querymode
		lm_dw.m_table.m_values.Visible = true
		lm_dw.m_table.m_operators.Visible = true
		lm_dw.m_table.m_dash12.Visible = true

		if ls_type = "column" and not lb_readonly then
			if dwo.bitmapname = "no" and ls_editstyle <> "checkbox" and ls_editstyle <> "radiobuttons" then
				if li_tabsequence > 0 and ls_protect = "0" then				
					lb_desired = false
					choose case ls_editstyle
						case "edit", "editmask"
							lb_desired = not lb_editstyleattrib
						case "ddlb", "dddw"
							lb_desired = lb_editstyleattrib
					end choose
					// Enablement based on column				
					lm_dw.m_table.m_values.Enabled = lb_desired
					lm_dw.m_table.m_operators.Enabled = lb_desired
				end if
			end if
		end if
	end if
end if

// DataWindow property entries. (isolate calls to shared variable)
this.event pfc_prermbmenuproperty (lm_dw)

// Allow for any other changes to the popup menu before it opens
this.event pfc_prermbmenu (lm_dw)

// Send rbuttonup notification to row selection service
if IsValid (inv_RowSelect) then inv_RowSelect.event pfc_rbuttonup (xpos, ypos, row, dwo)

// Popup menu
lm_dw.m_table.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

destroy lm_dw

return 1
end event

event pfc_clear;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_clear
//	Arguments:		None
//	Returns:			Integer - 	Return value from PowerScript Clear() function
//	Description:		Clear Text (no clipboard) functionality
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Clear()
end event

event pfc_copy;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_copy
//	Arguments:		None
//	Returns:			Integer - Return value from the PowerScript Copy function
//	Description:		Copy the text to the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Copy()
end event

event pfc_cut;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_cut
//	Arguments:		None
//	Returns:			Integer - Return value from the PowerScript Cut function
//	Description:		Cut the text to the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Cut()
end event

event pfc_deleterow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_deleterow
//	Arguments:		None
//	Returns:			Integer
//	 					1 = success
//  					0 = Row not deleted
//						-1 = error
//	Description:		Deletes the current or selected row(s)
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
// 						6.0 	Enhanced with PreDelete process.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc
long		ll_row

// Perform Pre Delete process.
if this.Event pfc_predeleterow() <= PREVENT_ACTION then return NO_ACTION

// Delete row.
if IsValid (inv_RowManager) then
	li_rc = inv_RowManager.event pfc_deleterow () 
else	
	li_rc = this.DeleteRow (0) 
end if

if li_rc > 0 then ll_row = 0 else ll_row = -1

//	Note: The deletion of multiple master rows is not supported by the linkage service.
if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_deleterow (ll_row) 

return li_rc
end event

event pfc_descendant;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_descendant
//	Arguments:		None
//	Returns:			boolean
//	Description:		Always returns true and is used to determine that this
//						class is part of the PowerBuilder Foundation Class Library.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return true
end event

event pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_insertrow
//	Arguments:		None
//	Returns:			long - number of the new row that was inserted
//	 					0 = No row was added.
//						-1 = error
//	Description:		Inserts a new row into the DataWindow before the current row
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Enhanced with Pre Insert funcitonality.
// 						7.0		Enhanced with Post Insert funcitonality.
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
long	ll_currow
long	ll_rc
boolean lb_disablelinkage

// Allow for pre functionality.
if this.Event pfc_preinsertrow() <= PREVENT_ACTION then return NO_ACTION

// Get current row
ll_currow = this.GetRow()
if ll_currow < 0 then ll_currow = 0

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()
		
if not lb_disablelinkage then		
	// Notify that a new row is about to be added.
	if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_InsertRow (0) 
end if

// Insert row.
if IsValid (inv_RowManager) then
	ll_rc = inv_RowManager.event pfc_insertrow (ll_currow)
else
	ll_rc = this.InsertRow (ll_currow) 
end if

if not lb_disablelinkage then		
	// Notify that a new row has been added.
	if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_InsertRow (ll_rc) 
end if

// Allow for post functionality.
this.Post Event pfc_postinsertrow(ll_rc)

return ll_rc
end event

event pfc_addrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_addrow
//	Arguments:		None
//	Returns:			long - number of the new row that was inserted
//	 					0 = No row was added.
//						-1 = error
//	Description:		Adds a new row to the end of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Enhanced with Pre Insert funcitonality.
// 						7.0		Enhanced with Post Insert funcitonality.
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
long	ll_rc
boolean lb_disablelinkage

// Allow for pre functionality.
if this.Event pfc_preinsertrow() <= 0 then return NO_ACTION

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	// Notify that a new row is about to be added.
	if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_InsertRow (0) 
end if

// Insert row.
if IsValid (inv_RowManager) then
	ll_rc = inv_RowManager.event pfc_addrow ()
else
	ll_rc = this.InsertRow (0) 
end if

if not lb_disablelinkage then
	// Notify that a new row has been added.
	if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_InsertRow (ll_rc) 
end if

// Allow for post functionality.
this.Post Event pfc_postinsertrow(ll_rc)

return ll_rc
end event

event pfc_paste;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_paste
//	Arguments:		None
//	Returns:			Integer - Return value from the Powerscript Paste function
//	Description:		Paste the text from the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Paste()
end event

event pfc_printpreview;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_printpreview
//	Arguments:		None
//	Returns:			boolean
//						true = DataWindow is in printpreview
//						false = DataWindow is in editmode
//	Description:		Toggles the DataWindow in printpreview/edit mode
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_rc

if IsValid (inv_PrintPreview) then
	lb_rc = inv_PrintPreview.of_GetEnabled()
	lb_rc = not lb_rc
	inv_PrintPreview.of_SetEnabled (lb_rc)
end if

return lb_rc
end event

event pfc_ruler;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_ruler
//	Arguments:		None
//	Returns:			boolean
//						true = Printpreview rulers are displayed
//						false = Printpreview rulers are not displayed
//	Description:		Toggles the ruler display in printpreview mode
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_rc

if IsValid (inv_PrintPreview) then
	if inv_PrintPreview.of_GetEnabled() then
		lb_rc = inv_PrintPreview.of_GetRuler()
		lb_rc = not lb_rc
		inv_PrintPreview.of_SetRuler (lb_rc)
	end if
end if

return lb_rc
end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrieve
//	Arguments:		None
//	Returns:			long - The return code from the Retrieve Powerscript function
//	Description:		Specific retrieve logic should be coded in descendant scripts
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event type long pfc_retrievedddw(string as_column);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_retrievedddw
//	Arguments:		None
//	Returns:			long - Can be used with Powerscript Retrieve function, to indicate
//						success/failure, or number of rows retrieved.
//	Description:		This event should be used in descendants to
//						populate any DropDownDataWindows on the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Marked obsolete Replaced by pfc_populatedddw
//	12.5	Added Metaclass Service Obsolete Tag
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return 0
end event

event pfc_selectall;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_selectall
//	Arguments:		None
//	Returns:			Integer - Return value from the Powerscript SelectText function
//	Description:		Select all text in the current row/column
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return SelectText (1, 32767)
end event

event pfc_undo;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_undo
//	Arguments:		None
//	Returns:			Integer
//	 					1 = success
//						-1 = nothing to Undo, or failure on Undo function
//	Description:		Cancels the last edit, restoring the text to the content before the last change.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Undo()
end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_update
//	Arguments:		ab_accepttext:	When applicable, specifying whether control should perform an
//											AcceptText prior to performing the update:
//						ab_resetflag:	Value specifying whether object should automatically 
//											reset its update flags.
//	Returns:			Integer
//	 					1 = The update was successful
//						-1 = The update failed
//	Description:		Specific Update logic.  Either perform a regular single dw
//						update or a Multiple table update.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
// 						6.0 	Enhanced to include PreUpdate event.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

// Verify passed arguments.
if IsNull(ab_accepttext) or IsNull(ab_resetflag) then return -1 

// Call for PreUpdate functionality.
if this.Event pfc_PreUpdate() < 0 then return -1

// Call the multi-table update if applicable.
if IsValid (inv_MultiTable) then 
	li_rc = inv_MultiTable.of_Update (ab_accepttext, ab_resetflag)
else
	li_rc = this.Update(ab_accepttext, ab_resetflag)
end if

return li_rc
end event

event pfc_zoom;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_zoom
//	Arguments:		None
//	Returns:			Integer - Zoom level chosen by the user
//	 					0 = user cancelled from zoom dialog
//						-1 = error
//	Description:		Zooms the print preview level to the user-specified amount
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_PrintPreview) then
	if inv_PrintPreview.of_GetEnabled() then
		return inv_PrintPreview.of_SetZoom()
	end if
end if

return FAILURE
end event

event pfc_firstpage;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_firstpage
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Scrolls to the first page of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.ScrollToRow (0)
end event

event pfc_lastpage;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_lastpage
//	Arguments:		None
//	Returns:			Long - Row number displayed at the top of the page scrolled to
//						-1 if an error occurs
//	Description:		Scrolls to the last page of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
long	ll_rc
string	ls_rc

ll_rc = ScrollToRow (2147483647)
if ll_rc > 0 then
	ls_rc = this.object.datawindow.firstrowonpage
	if IsNumber (ls_rc) then
		ll_rc = Long (ls_rc)
	else
		ll_rc = FAILURE
	end if
end if

return ll_rc
end event

event pfc_nextpage;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_nextpage
//	Arguments:		None
//	Returns:			Long - Row number displayed at the top of the DataWindow
//						-1 if an error occurs
//	Description:		Scrolls to the next page of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.ScrollNextPage()
end event

event pfc_previouspage;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_previouspage
//	Arguments:		None
//	Returns:			Long - Row number displayed at the top of the DataWindow
//						-1 if an error occurs
//	Description:		Scrolls to the previous page of the DW
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.ScrollPriorPage()
end event

event pfc_printimmediate;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_printimmediate
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Prints the DataWindow (without displaying a print dialog)
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Print (true)
end event

event type integer pfc_print();//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_print
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Opens the print dialog to allow user to change print settings,
//						and then prints the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0			Initial version
//						5.0.01		Modified script to avoid 64K segment problem with 16bit machine code executables
//						5.0.04		Destroy local datastore prior to returning in error condition.
//						8.0			Return code of pfc_printdlg has changed for Cancel Action.  Changed
//							 		code to test on success rather than failure.
//						8.0			Set Printer chosen in print dialog
// 						10.0 		Use new overloaded function dw.Print(canceldlg, showPrintDlg) which could display Print Dialog,
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_rowselection
integer	li_rc
long		ll_selected[]
long		ll_selectedcount
long		ll_cnt
string		ls_val
datastore				lds_selection

// Print selection
if this.Object.DataWindow.Print.Page.Range = "selection" then
	// Get selected count
	lb_rowselection = IsValid (inv_RowSelect)
	if not lb_rowselection then of_SetRowSelect (true)
	ll_selectedcount = inv_RowSelect.of_SelectedCount (ll_selected)
	if not lb_rowselection then of_SetRowSelect (false)

	if ll_selectedcount > 0 then
		// Create a datastore to print selected rows
		lds_selection = create datastore
		lds_selection.dataobject = this.DataObject

		// First discard any data in the dataobject
		lds_selection.Reset()

		// Copy selected rows
		for ll_cnt = 1 to ll_selectedcount
			if this.RowsCopy (ll_selected[ll_cnt], ll_selected[ll_cnt], primary!, &
				lds_selection, 2147483647, primary!) < 0 then
				destroy lds_selection
				return -1
			end if
		next

	end if
end if

// Print
if IsValid (lds_selection) then
	li_rc = lds_selection.Print (true, true)
	destroy lds_selection
else
	li_rc = this.Print (true, true)
end if

return li_rc
end event

event pfc_pagesetup;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_pagesetup
//	Arguments:		None
//	Returns:			Integer - 1 if successful, 0 if user cancelled from pagesetup dialog, -1 if error occured
//	Description:		Opens the pagesetup dialog to allow user to change settings
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
s_pagesetupattrib	lstr_pagesetup

return this.event pfc_pagesetupdlg (lstr_pagesetup)
end event

event pfc_pagesetupdlg;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_pagesetupdlg
//	Arguments:		astr_pagesetup:  page setup structure by ref
//	Returns:			Integer - 1 if successful, 0 if user cancelled from page setup, -1 if error occured
//	Description:		Opens the page setup dialog for this DataWindow, 
//						and sets the page setup values the user selected for the DW.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_margin
integer	li_papersize
integer	li_papersource
integer	li_units
string		ls_margin
string		ls_papersize
string		ls_papersource
string		ls_portraitorientation
string		ls_units
long		ll_rc
n_cst_platform	lnv_platform

// Initialize pagesetup structure with current values of DW
// Margin bottom
ls_margin = this.Object.DataWindow.Print.Margin.Bottom
if not IsNumber (ls_margin) then	ls_margin = "0"
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginbottom = li_margin

// Margin left
ls_margin = this.Object.DataWindow.Print.Margin.Left
if not IsNumber (ls_margin) then	ls_margin = "0"
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginleft = li_margin

// Margin right
ls_margin = this.Object.DataWindow.Print.Margin.Right
if not IsNumber (ls_margin) then	ls_margin = "0"
li_margin = Integer (ls_margin)
astr_pagesetup.i_marginright = li_margin

// Margin top
ls_margin = this.Object.DataWindow.Print.Margin.Top
if not IsNumber (ls_margin) then	ls_margin = "0"
li_margin = Integer (ls_margin)
astr_pagesetup.i_margintop = li_margin

// DataWindow units
ls_units = this.Object.DataWindow.Units
if not IsNumber (ls_units) then ls_units = "0"
li_units = Integer (ls_units)
if li_units < 2 then
	astr_pagesetup.b_disablemargins = true
end if
astr_pagesetup.i_units = li_units

// Paper Size
ls_papersize = this.Object.DataWindow.Print.Paper.Size
if not IsNumber (ls_papersize) then	ls_papersize = "0"
li_papersize = Integer (ls_papersize)
astr_pagesetup.i_papersize = li_papersize

// Paper Source
ls_papersource = this.Object.DataWindow.Print.Paper.Source
if not IsNumber (ls_papersource) then ls_papersource = "0"
li_papersource = Integer (ls_papersource)
astr_pagesetup.i_papersource = li_papersource

// Orientation
ls_portraitorientation = this.Object.DataWindow.Print.Orientation
if ls_portraitorientation = "0" then
	SetNull (astr_pagesetup.b_portraitorientation)
elseif ls_portraitorientation = "2" then
	astr_pagesetup.b_portraitorientation = true
end if

// Allow pagesetup structure to have additional values
// set before opening print dialog
this.event pfc_prepagesetupdlg (astr_pagesetup)

// Open page setup dialog
f_setplatform (lnv_platform, true)
ll_rc = lnv_platform.of_PageSetupDlg (astr_pagesetup)
f_setplatform (lnv_platform, false)

// Set page setup values based on users selection
if ll_rc > 0 then
	// Margins
	this.Object.DataWindow.Print.Margin.Bottom = astr_pagesetup.i_marginbottom
	this.Object.DataWindow.Print.Margin.Left = astr_pagesetup.i_marginleft
	this.Object.DataWindow.Print.Margin.Right = astr_pagesetup.i_marginright
	this.Object.DataWindow.Print.Margin.Top = astr_pagesetup.i_margintop

	// Paper Size
	this.Object.DataWindow.Print.Paper.Size = astr_pagesetup.i_papersize

	// Paper Source
	this.Object.DataWindow.Print.Paper.Source = astr_pagesetup.i_papersource

	// Orientation
	if IsNull (astr_pagesetup.b_portraitorientation) then
		this.Object.DataWindow.Print.Orientation = 0
	elseif not astr_pagesetup.b_portraitorientation then
		this.Object.DataWindow.Print.Orientation = 1
	elseif astr_pagesetup.b_portraitorientation then
		this.Object.DataWindow.Print.Orientation = 2
	end if
end if

return ll_rc
end event

event pfc_rowchanged;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_rowchanged
//	Arguments:		None
//	Returns:			None
//	Description:		Provides notification when the buffer has been sorted, filtered or otherwise
//						manipulated such that the current row has not changed, but the actually row
//						at that location may be different.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Changed the notification to the Linkage service.
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	if IsValid ( inv_Linkage ) then inv_Linkage.Event pfc_RowChanged () 
end if
end event

event lbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:			lbuttonup
//	Description:	Send lbuttonup notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						12.5	Need a posted lButtonUp event to draw sort order
//								indicator
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_RowSelect) then inv_RowSelect.event pfc_lbuttonup (flags, xpos, ypos)

POST EVENT pfc_postLButtonUp(flags, xPos, yPos)
end event

event lbuttondown;//////////////////////////////////////////////////////////////////////////////
//	Event:			lbuttondown
//	Description:	Send lbuttondown notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						12.5	Add logic to draw sort order indicator
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_RowSelect) then inv_RowSelect.event pfc_lbuttondown (flags, xpos, ypos)

IF Integer(Describe("DataWindow.Processing")) = 1 THEN

	//	Syntax Modified is used in post_lButtonUp in order to tell if the
	//	user has moved or resized a column.
	is_syntaxModified				= Describe("DataWindow.Syntax.Modified")
	
	Modify("DataWindow.Syntax.Modified='no'")
	
END IF
end event

event pfc_updatespending;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_UpdatesPending
//	Arguments:		None
//	Returns:			Integer
//						1 = Updates are pending.
//						0 = No updates are pending
//	Description:		Determine if any updates are pending on this datawindow
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check if DataWindow is updateable
if not of_IsUpdateable() then	return 0

// Check for any updates that may be pending
if this.ModifiedCount() + this.DeletedCount() > 0 then return 1

return 0
end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_validation
//	Arguments:		None
//	Returns:			Integer
//	 					1 = All validation passed
//						-1 = validation failed
//	Description:		Validate the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
//						8.0		Change ib_updateonly to lb_updateonly to reflect
//								proper naming conventions
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_checkcolumn = 1
integer	li_rc
long		ll_checkrow = 1
string	ls_checkcolname = ""
boolean	lb_updateonly = true

// Check for Missing Required Fields
li_rc = of_CheckRequired (primary!, ll_checkrow, li_checkcolumn, ls_checkcolname, lb_updateonly)
if (li_rc < 0) or (ll_checkrow > 0) then return FAILURE
				
return SUCCESS
end event

event pfc_restorerow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_restorerow
//	Arguments:		None
//	Returns:			Long - Number of rows restored (undeleted)
//						-1 = error
//						-2 = no rows in delete buffer to restore
//	Description:		Allows user to undelete rows
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_RowManager) then	return inv_RowManager.event pfc_restorerow()

return FAILURE
end event

event pfc_finddlg;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_finddlg
//	Arguments:		None
//	Returns:			None
//	Description:		Invokes the Find dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_Find) then	inv_Find.Event pfc_finddlg()
end event

event pfc_replacedlg;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_replacedlg
//	Arguments:		None
//	Returns:			None
//	Description:		Invokes the Find/Replace dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_Find) then	inv_Find.Event pfc_replacedlg()
end event

event pfc_filterdlg;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_filterdlg
//	Arguments:		None
//	Returns:  		Integer - 1 if successful, 0 if user cancelled from filter dialog, -1 if error occured
//	Description:		Invokes the Find dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_Filter) then return inv_Filter.Event pfc_filterdlg()

return FAILURE
end event

event pfc_sortdlg;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_SortDlg
//	Arguments:		None
//	Returns:			Integer - 1 if successful, 0 if user cancelled from sort dialog, -1 if error occured
//	Description:		Invokes the Sort dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_Sort) then	return inv_Sort.Event pfc_SortDlg()

return FAILURE
end event

event pfc_values;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_values
//	Arguments:		None
//	Returns:			Integer - 1 if successful, 0 if user cancelled, -1 if error occured
//	Description:		Allows user to select from available database values for the current column
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_QueryMode) then return inv_QueryMode.event pfc_values()

return FAILURE
end event

event pfc_operators;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_operators
//	Arguments:		None
//	Returns:			Integer - 1 if successful, 0 if user cancelled from selection window, -1 if error occured
//	Description:		Allows user to select from a list of querymode operators
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_QueryMode) then return inv_QueryMode.event pfc_operators()

return FAILURE
end event

event pfc_debug;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_debug
//	Arguments:		None
//	Returns:			None
//	Description:		Call the DataWindow property Dialog.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
this.Event pfc_properties()
end event

event dropdown;//////////////////////////////////////////////////////////////////////////////
//	Event:			dropdown
//	Arguments:		None
//	Returns:			None
//	Description:		Notification that a dropdown object has been requested.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid(iuo_Calendar) then
	// Check if this a column that has the calendar associated to it.
	if iuo_Calendar.Event pfc_dropdown() = 1 then
		// Column is a ddcalendar column.  Prevent listbox from appearing.
		return 1
	end if
end if

if IsValid(iuo_Calculator) then
	// Check if this a column that has the calculator associated to it.
	if iuo_Calculator.Event pfc_dropdown() = 1 then
		// Column is a ddcalculator column.  Prevent listbox from appearing.
		return 1
	end if
end if
end event

event pfc_ddcalendar;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_ddcalculator
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Request the dropdown calendar.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid(iuo_Calendar) then	return iuo_Calendar.Event pfc_dropdown()

return FAILURE
end event

event pfc_ddcalculator;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_ddcalculator
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Request the dropdown calculator.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid(iuo_Calculator) then return iuo_Calculator.Event pfc_dropdown()

return FAILURE
end event

event pfc_prerestorerow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_prerestorerow
//	Arguments:		anv_restorerowattrib:  Restore object by reference
//	Returns:			None
//	Description:		Populate restore object attributes before the Restore window opens.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	if IsValid (inv_Linkage) then
		if inv_Linkage.of_GetStyle() = inv_Linkage.FILTER then
			// Only display the rows that belong to the current master row.
			anv_restorerowattrib.is_filter = this.Object.DataWindow.Table.Filter
		end if
	end if
end if

// The sort to be applied prior to displaying the RestoreRow dialog.
anv_restorerowattrib.is_sort = this.Object.DataWindow.Table.Sort
end event

event pfc_accepttext;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_accepttext
//	Arguments:		ab_focusonerror Boolean which states if focus should be set in case of error.
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Perform an accepttext and set focus when requested.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer li_rc

// Do not perform AcceptText on Datawidows found on uncreated tab pages.
if this.RowCount() + this.FilteredCount() + &
	this.ModifiedCount() + this.DeletedCount() <= 0 then
	return SUCCESS
end if
	
// Perform AcceptText, check rc
li_rc = this.AcceptText()
if li_rc < 0 then 
	if ab_FocusOnError then this.SetFocus()
	return FAILURE
end if

return SUCCESS
end event

event pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_postupdate
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Perform post update processing.
//						Clear the update flags in the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.Event pfc_resetupdate()
end event

event pfc_rowvalidation;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_rowvalidation
//	Arguments:		al_row	The row to validate.
//	Returns:			Integer
//						1 Validated ok.
//						-1 An error was found.
//	Description:		Specific row validation.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return SUCCESS
end event

event pfc_populatedddw;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_populatedddw
//	Arguments:		as_colname		column name of the DDDW to populate
//						adwc_obj			DataWindowChild reference of the DDDW column
//	Returns:			Long - Indicates success/failure, or number of rows populated.
//	Description:		Populate the passed-in DropDownDataWindow.
//						This script for this event should be in descendant DataWindows.
//						The DropDownDataWindow can be populated in any manner, including
//						using the DataWindow caching service, external data, or retrieving.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version - Replaces obsoleted event pfc_retrievedddw.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return NO_ACTION
end event

event pfc_preupdate;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_preupdate
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Specific PreUpdate logic.
// 						Note: This event should be extended to provide the specific PreUpdate logic.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return SUCCESS
end event

event pfc_updateprep;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_updateprep
//	Arguments:		None
//	Returns:			Integer
//	 					1 = All preparation (if any) passed
//						-1 = preparation failed
//	Description:		Prepare the object for an update.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return SUCCESS
end event

event pfc_predeleterow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_predeleterow
//	Arguments:		None
//	Returns:			Integer
//	 					1 = Continue with delete
//  					0 = Prevent the actual delete.
//						-1 = error
//	Description:		Notification of a pending delete operation.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid ( inv_Linkage ) then
	// Notify service of the possible deletion.
	//	Note: The deletion of multiple master rows is not supported by the linkage service.
	// Note: The linkage service has the functionality to cancel the delete operation.
	if inv_Linkage.Event pfc_predeleterow (0) <> inv_Linkage.CONTINUE_ACTION then
		return PREVENT_ACTION
	end if
end if

return CONTINUE_ACTION
end event

event pfc_preinsertrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_preinsertrow
//	Arguments:		None
//	Returns:			Integer
//	 					1 if it OK to insert the row
//						0 = prevent the row from being added.
//						-1 = error
//	Description:		Determines if it is OK to insert a new row.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (inv_Linkage) then
	if inv_Linkage.event pfc_preinsertrow() <> inv_Linkage.CONTINUE_ACTION then
		return PREVENT_ACTION
	end if
end if

return CONTINUE_ACTION
end event

event pfc_resetupdate;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_postupdate
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Clear the update flags in the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return this.ResetUpdate()
end event

event pfc_properties;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_properties
//	Description:		Call the DataWindow property Dialog.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
n_cst_dwpropertyattrib lnv_dwproperty

if IsValid(snv_property) or IsValid(inv_Property) then
	// Set initial values.
	lnv_dwproperty.idw_requestor = this

	// Allow structure to have other values set before opening dialog.
	this.Event pfc_preproperties(lnv_dwproperty)

	// Open property window.
	if IsValid(inv_Property) then
		inv_Property.of_OpenProperty(lnv_dwproperty)
	else
		snv_property.of_OpenProperty(lnv_dwproperty)
	end if
end if
end event

event pfc_prermbmenuproperty(ref m_dw am_dw);//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_prermbmenuproperty
//	Description:		Event to provide isolation to the Shared variable.  
//						Used prior to displaying the popup menu.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0.01 Initial version
//						12.5	 Handle Grid service
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_desired = false

// Enable or disable the appropriate entries on the popup menu.
if IsValid(inv_Property) then
	if inv_Property.of_IsPropertyOpen() = false then lb_desired = true
elseif IsValid(snv_property) then
	if snv_property.of_IsPropertyOpen() = false then lb_desired = true		
end if	
if lb_desired then
	am_dw.m_table.m_debug.Visible = true
	am_dw.m_table.m_debug.Enabled = true	
end if

if integer(this.object.datawindow.processing) = 1 then
	am_dw.m_table.m_dash14.visible = true
	am_dw.m_table.m_gridlayout.visible = true
	if isvalid( inv_grid ) then
		am_dw.m_table.m_gridlayout.enabled = true
	end if
end if
end event

event pfc_checkrequirederror;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_checkrequirederror
// Arguments:		al_row - The row number
//						as_columnname - The column name by reference.
//	Returns:			Integer
// 						1 - Success - of_CheckRequiredError to continue with the error condition.
//						0 - Success - Error condition has been handled. of_CheckRequiredError will
//										  not handle the error condition.
// 						-1 - Error
//	Description:		The of_CheckRequiredError has found a column missing data.
//						This gives the opportunity to better handle the situation.
//						Note: If return 0 is used, you should also notify the user of the error condition.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0.01 Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return 1
end event

event pfc_postinsertrow;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_postinsertrow
//	Arguments:		al_row
//	Returns:			None
//	Description:		Posted event from pfc_insertrow, pfc_addrow
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						7.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////

end event

event pfc_postlbuttonup(unsignedlong flags, integer xpos, integer ypos);/////////////////////////////////////////////////////////////////////////
//
//	Event:			post_lButtonUp
//
//	Description:	Posted from lButtonUp in order to draw the sort order
//						indicator.  Needs to be after PowerBuilder is done
//						drawing a grid datawindow when moving/resizing columns.
//
/////////////////////////////////////////////////////////////////////////
//
//	Rev. History	Version
//						12.5	Initial version, this special logic for drawing
//								the sort order indicator is only needed for grid
//								style dataWindows.  This is because the user can
//								dragDrop columns to new positions or change their
//								widths.
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more information on
// the Open Source PowerBuilder Foundation Class Libraries see
//	http://pfc.codexchange.sybase.com
//
/////////////////////////////////////////////////////////////////////////

IF Integer(Describe("DataWindow.Processing")) = 1 THEN

	//	Did the user actually move or resize a column?  Initialized to 'no' in lButtonDown.
	IF Describe("DataWindow.Syntax.Modified") = 'yes' THEN
		//	Just redraw sort order indicator
		IF isValid(inv_sort) THEN inv_sort.of_sortIndicatorDraw()
	ELSE
		//	Apply/Change sort order indicator, il_clicked and idwo_clicked
		//	are set in the clicked event.
		IF isValid(inv_sort) THEN inv_sort.EVENT pfc_clicked(xPos, yPos, il_clicked, idwo_clicked)
	END IF

	//	Reset value to what was saved in lButtonDown
	Modify("DataWindow.Syntax.Modified='" + is_syntaxModified + "'")
	
END IF
end event

public function boolean of_getupdateable ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetUpdateable
//	Arguments:		None
//	Returns:			boolean
//						true   The dw is marked as updateable
//						false   The dw is not marked as updateable
//	Description:		Gets the value of the updateable property of the DW indicating
//						whether the DataWindow is updateable
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Marked obsolete  Replaced by of_IsUpdateable
//	12.5	Added Metaclass Service Obsolete Tag
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return of_IsUpdateable()
end function

public function integer of_SetTransObject (n_tr atr_object);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetTransObject
//	Arguments:		atr_object:  transaction object to set for the datawindow
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Sets the transaction object that the datawindow will use
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

// Check arguments
if IsNull (atr_object) or not IsValid (atr_object) then return FAILURE

// Set the transaction object
li_rc = this.SetTransObject (atr_object)
if li_rc = 1 then
	itr_Object = atr_object
end if

return li_rc
end function

public function integer of_GetParentWindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetParentWindow
//	Arguments:		aw_parent   The Parent window for this object (passed by reference).
//	   								If a parent window is not found, aw_parent is NULL
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Calculates the parent window of a window object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
powerobject	lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return FAILURE
end if

aw_parent = lpo_parent

return SUCCESS
end function

public function integer of_SetBase (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetBase
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Basic DataWindow Services.
//               		It is only necessary to start this service, if you are not using any other dw services.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Base) or not IsValid (inv_Base) then
		inv_Base = Create n_cst_dwsrv
		inv_Base.of_SetRequestor ( this ) 
		return SUCCESS
	end if
else 
	if IsValid (inv_Base) then
		Destroy inv_Base
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetDropDownSearch (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetDropDownSearch
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DropDownDataWindow search services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_DropDownSearch) or not IsValid (inv_DropDownSearch) then
		inv_DropDownSearch = Create n_cst_dwsrv_dropdownsearch
		inv_DropDownSearch.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_DropDownSearch) then
		Destroy inv_DropDownSearch
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

public function integer of_SetFilter (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetFilter
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Sort/Filter Services.  This service
//				     	provides several sort/filter dialogs and refinements.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Filter) or not IsValid (inv_Filter) then
		inv_Filter = Create n_cst_dwsrv_filter
		inv_Filter.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_Filter) then
		Destroy inv_Filter
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

public function integer of_SetFind (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetFind
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DataWindow Find/Replace services.  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Find) or not IsValid (inv_Find) then
		inv_Find = Create n_cst_dwsrv_find
		inv_Find.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_Find) then
		Destroy inv_Find
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_setlinkage (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetLinkage
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DataWindow Linkage Services.  This service
//						allows for multiple levels of master/detail style datawindows.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Linkage) or not IsValid (inv_Linkage) then
		inv_Linkage = Create n_cst_dwsrv_linkage
		inv_Linkage.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_Linkage) then
		Destroy inv_Linkage
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetMultiTable (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetMultiTable
//	Arguments:		boolean
//   					true  - Start (create) the service
//  					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Multi-Table Update Services.  This service
//				     	facilitates updating datawindows where multiple SQL tables are used.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_MultiTable) or not IsValid (inv_MultiTable) then
		inv_MultiTable = Create n_cst_dwsrv_multitable
		inv_MultiTable.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_MultiTable) then
		Destroy inv_MultiTable
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetPrintPreview (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetPrintPreview
//	Arguments:		ab_switch
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the printpreview service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_PrintPreview) or not IsValid (inv_PrintPreview) then
		inv_PrintPreview = Create n_cst_dwsrv_printpreview
		inv_PrintPreview.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_PrintPreview) then
		Destroy inv_PrintPreview
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetQueryMode (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetQueryMode
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Querymode Services.  This service
//						facilitates querymode options and includes popup help, 
//						and save-to/load-from disk queries.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_QueryMode) or not IsValid (inv_QueryMode) then
		inv_QueryMode = Create n_cst_dwsrv_querymode
		inv_QueryMode.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_QueryMode) then
		Destroy inv_QueryMode
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetReport (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetReport
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Reporting Services.  The Reporting Services
//						provide the ability to dynamically change the appearance of datawindows.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Report) or not IsValid (inv_Report) then
		inv_Report = Create n_cst_dwsrv_report
		inv_Report.of_SetRequestor(This)
		return SUCCESS
	end if
else
	if IsValid (inv_Report) then
		Destroy inv_Report
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetRowManager (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetRowManager
//	Arguments: 		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Row Management Services.  This service
//						facilitates the addition, deletion of rows in a datawindow
//						and provides an "last-change" undo.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_RowManager) or not IsValid (inv_RowManager) then
		inv_RowManager = Create n_cst_dwsrv_rowmanager
		inv_RowManager.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_RowManager) then
		Destroy inv_RowManager
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetRowSelect (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetRowSelect
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//						1 - Successful operation.
//						0 - No action taken.
//						-1 - An error was encountered.
//	Description:  	Starts or stops the Row Selection Services.  This service
//					  	provides for single, multi and extended row selection.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_RowSelect) or not IsValid (inv_RowSelect) then
		inv_RowSelect = Create n_cst_dwsrv_rowselection
		inv_RowSelect.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_RowSelect) then
		Destroy inv_RowSelect
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetSort (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetSort
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//						1 - Successful operation.
//						0 - No action taken.
//						-1 - An error was encountered.
//	Description:		Starts or stops the Sort Service.  This service
//						provides several sort dialogs and refinements.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Sort) or not IsValid (inv_Sort) then
		inv_Sort = Create n_cst_dwsrv_sort
		inv_Sort.of_SetRequestor ( this )
		return SUCCESS
	end if
else 
	if IsValid (inv_Sort) then
		Destroy inv_Sort
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetUpdateable (boolean ab_isupdateable);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetUpdateable
//	Arguments:		ab_isupdateable   Indicates whether the DW is updateable
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Sets whether the DW is updateable
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsNull (ab_isupdateable) then return FAILURE

ib_IsUpdateable =  ab_isupdateable

return SUCCESS
end function

public function integer of_SetReqColumn (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetReqColumn
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description: 	Starts or stops the Required Column Service.
//						This service allows users to Tab/Click out of Required fields without entering any data.
//
//						Through the DataWindow ItemError Event the service (if appropriate) will replace an empty
//						string with a null value and surpress the standard DataWindow "Value Required For This Item Message".
//						The one requirement for this behavior is that the RequiredField is also set to accept "empty string
//						as a null".  The end result of this action is that an user can click or Tab out of a Required field
//						without first having to enter data in it. Note: The RowStatus and ItemStatus of the field is not 
//						affected/changed by the service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_ReqColumn) or not IsValid (inv_ReqColumn) then
		inv_ReqColumn = Create n_cst_dwsrv_reqcolumn
		inv_ReqColumn.of_SetRequestor(this)
		return SUCCESS
	end if
else
	if IsValid (inv_ReqColumn) then
		Destroy inv_ReqColumn
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_CheckRequired 
//	Arguments:		adw_buffer   	The buffer to check for required fields
// 						al_row   			First row to be checked.  Also stores the number of the found row
//						ai_col   			First column to be checked.  Also stores the number of the found column
//						as_colname   	Contains the columnname in error
//	Returns:			Integer
//	 					1 = The required fields test was successful, check arguments for required fields missing
//	 					0 = The required fields test was successful and no errors were found
//  					-1 = Error
//	Description:		Calls the FindRequired function to determine if any of the required columns contain null values.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0			Initial version
// 						6.0.01		Enhanced to call stub function which allows for more flexibility and control.
//						12.5				Issue 11023 - Error Service - Use columnDisplayName for required error message
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
w_master	lw_pfcparent
window	lw_parent
boolean	lb_skipmessage=false
string	ls_msgparm[2]
integer	li_rc

// Check arguments
if IsNull (adw_buffer) or IsNull (al_row) or IsNull (ai_col) or IsNull (as_colname) then return FAILURE

SetPointer(HourGlass!) 

// Call FindRequired to locate first error, if any
if this.FindRequired (adw_buffer, al_row, ai_col, as_colname, ab_updateonly) < 0 then return FAILURE

// Double Check if failure condition was ecountered.
if al_row < 0 then return FAILURE

// Check if no missing values were found.
if al_row = 0 then return 0

// -- A Missing Value was encountered. --

// Get a reference to the window
this.of_GetParentWindow (lw_parent) 
if IsValid (lw_parent) then
	if lw_parent.TriggerEvent ("pfc_descendant") = 1 then
		lw_pfcparent = lw_parent
	end if
end if	
	
// Make sure the window is not closing.  
if IsValid (lw_pfcparent) then
	if lw_pfcparent.of_GetCloseStatus() then
		// It is closing, so don't show errors now.	
		lb_skipmessage = true
	end if
end if
	
// Skip the message if the window is closing.	
if not lb_skipmessage then
	// Call stub function to either handle condition or provide a more suitable
	// column name.
	li_rc = this.Event pfc_checkrequirederror (al_row, as_colname)
	if li_rc < 0 then return -1
	
	if li_rc >= 1 then
		
		String					ls_displayName
		
		IF isValid(inv_base) THEN
			ls_displayName		= inv_base.of_getColumnDisplayName(as_colName)
		ELSE
			IF of_setBase(TRUE) = 1 THEN
				ls_displayName	= inv_base.of_getColumnDisplayName(as_colName)
				of_setBase(FALSE)
			ELSE
				ls_displayName	= as_colName
			END IF
		END IF
		
		// Display condition.
		if IsValid(gnv_app.inv_error) then
			ls_msgparm[1] = ls_displayName
			ls_msgparm[2] = String (al_row)
			gnv_app.inv_error.of_Message("pfc_requiredmissing", ls_msgparm, &
					gnv_app.iapp_object.DisplayName)
		else
			of_MessageBox ("pfc_checkrequired_missingvalue", gnv_app.iapp_object.DisplayName, &
				"Required value missing for " + ls_displayName + " on row "  + String (al_row) + &
				".  Please enter a value.", information!, Ok!, 1)
		end if
	
		// Make sure row/column gets focus.
		this.SetRow (al_row)
		this.ScrollToRow (al_row)		
		this.SetColumn (ai_col)
		this.SetFocus () 		
	end if
end if
	
// Return that a required column does contain a null value.
return 1
end function

public function integer of_SetDropDownCalendar (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetDropDownCalendar
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DropDown Calendar visual object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						6.0.01	Enhanced so that the Message object is not overwritten by the 
//								 OpenUserObject function.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
window lw_parent
string	ls_classname
powerobject	lpo_message
n_cst_calendarattrib lnv_calendarattrib

// Check arguments
if IsNull(ab_switch) then return FAILURE

// Get parent window reference.
of_GetParentWindow(lw_parent)
if IsNull(lw_parent) or not IsValid(lw_parent) then return FAILURE

if ab_Switch then
	if not IsValid (iuo_Calendar) then
		// If using pfc_n_msg, store the Message Object (dynamic call).
		if IsValid(message) then
			ls_classname = Trim(Lower(message.ClassName()))
			if ls_classname = "n_msg" then lpo_message = Create Using "n_msg"
			if IsValid(lpo_message) then message.Dynamic of_CopyTo(lpo_message)
		end if				
		
		// Tell the object to behave as a dropdown object.
		lnv_calendarattrib.ib_dropdown = true
		lw_parent.OpenUserObjectWithParm(iuo_Calendar, lnv_calendarattrib)
		iuo_Calendar.of_SetRequestor (this)
		
		// If using pfc_n_msg, restore the Message Object (dynamic call).
		if IsValid(lpo_message) then 
			lpo_message.Dynamic of_CopyTo(message)
			Destroy lpo_message
		end if
		return SUCCESS
	end if
else 
	if IsValid (iuo_Calendar) then
		lw_parent.CloseUserObject(iuo_Calendar)
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

public function integer of_SetDropDownCalculator (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetDropDownCalculator
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DropDown Calculator visual object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0			Initial version
// 						6.0.01		Enhanced so that the Message object is not overwritten by the 
//								 	OpenUserObject function.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
window 	lw_parent
string	ls_classname
powerobject	lpo_message
n_cst_calculatorattrib lnv_calculatorattrib

// Check arguments
if IsNull(ab_switch) then return FAILURE

// Get parent window reference.
of_GetParentWindow(lw_parent)
if IsNull(lw_parent) or not IsValid(lw_parent) then return FAILURE

if ab_Switch then
	if not IsValid (iuo_Calculator) then
		// If using pfc_n_msg, store the Message Object (dynamic call).
		if IsValid(message) then
			ls_classname = Trim(Lower(message.ClassName()))
			if ls_classname = "n_msg" then lpo_message = Create Using "n_msg"
			if IsValid(lpo_message) then message.Dynamic of_CopyTo(lpo_message)
		end if		

		// Tell the object to behave as a dropdown object.
		lnv_calculatorattrib.ib_dropdown = true
		lw_parent.OpenUserObjectWithParm(iuo_Calculator, lnv_calculatorattrib)
		iuo_Calculator.of_SetRequestor (this)

		// If using pfc_n_msg, restore the Message Object (dynamic call).
		if IsValid(lpo_message) then 
			lpo_message.Dynamic of_CopyTo(message)
			Destroy lpo_message
		end if
		return SUCCESS
	end if
else 
	if IsValid (iuo_Calculator) then
		lw_parent.CloseUserObject(iuo_Calculator)
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

public function integer of_SetResize (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetResize
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DW Resize Services. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Resize) or not IsValid (inv_Resize) then
		inv_Resize = Create n_cst_dwsrv_resize
		inv_Resize.of_SetRequestor ( this )
		inv_Resize.of_SetOrigSize (this.Width, this.Height)
		return SUCCESS
	end if
else 
	if IsValid (inv_Resize) then
		Destroy inv_Resize
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function boolean of_IsRoot ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_IsRoot
//	Arguments:		None
//	Returns:			Boolean
//						true if a root datawindow (any dw not having a master dw).
//						false if not a root datawindow.
//	Description:		Determine if the datawindow is a root datawindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid(inv_Linkage) then return inv_Linkage.of_IsRoot()

return true
end function

public function integer of_SetProperty (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetProperty
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the Property Service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Property) or not IsValid (inv_Property) then
		inv_Property = Create n_cst_dwsrv_property
		inv_Property.of_SetRequestor (this)
		return SUCCESS
	end if
else 
	if IsValid (inv_Property) then
		Destroy inv_Property
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function integer of_SetUpdateRequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetUpdateRequestor
//	Arguments:		apo_updaterequestor   The object which is requesting an update within a 
//													 transaction.  Or an invalid reference to clear the reference.
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Associates the object which is requesting an update within a transaction.
//						Or clears the reference to mean there is no current object requesting an
//						update within a transaction.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check for a valid apo_updaterequestor is not desired.
ipo_UpdateRequestor = apo_updaterequestor

return SUCCESS
end function

public function integer of_AcceptText (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_AcceptText
//	Arguments:		ab_focusonerror	States if focus should be set in case of error.
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Perform an accepttext and set focus when requested.
// 						Note: Specific accepttext logic should be coded in descendant pfc_AcceptText event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0  Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_AcceptText(ab_focusonerror)
else
	li_rc = this.Event pfc_AcceptText(ab_focusonerror)
end if

return li_rc
end function

public function integer of_Reset ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Reset
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Resets the DataWindow(s).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_Reset()
else
	li_rc = this.Reset()
end if

return li_rc
end function

public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Update
//	Arguments:		ab_accepttext		When applicable, specifying whether control should perform an
//												AcceptText prior to performing the update:
//						ab_resetflag		Value specifying whether object should automatically 
//												reset its update flags.
//						apo_requestor		An object requesting the update within a transaction.
//	Returns:			Integer
//	 					1 = The update was successful
//						-1 = The update failed
//	Description:		Execute the specific Update logic.  
// 						Note: Specific Update logic should be coded in descendant pfc_Update event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer		li_rc
powerobject	lpo_notvalid

if IsValid(inv_Linkage) then
	// Set the object requesting the update.
	if inv_Linkage.of_SetUpdateRequestor(apo_requestor) <0 then return FAILURE
	
	// Perform the actual update.
	li_rc = this.of_Update(ab_accepttext, ab_resetflag)
	
	// Clear the object which requested the update.
	inv_Linkage.of_SetUpdateRequestor(lpo_notvalid)
else
	// Set the object requesting the update.
	if this.of_SetUpdateRequestor(apo_requestor) <0 then return FAILURE
	
	// Perform the actual update.	
	li_rc = this.of_Update(ab_accepttext, ab_resetflag)
	
	// Clear the object which requested the update.
	this.of_SetUpdateRequestor(lpo_notvalid)
end if

return li_rc
end function

public function integer of_UpdatesPending ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UpdatesPending
//	Arguments:		None
//	Returns:			Integer
//						1 = Updates are pending.
//						0 = No updates are pending
//	Description:		Determine if any updates are pending on this datawindow or its linked details.
// 						Note:	Specific UpdatesPending logic should be coded in descendant pfc_UpdatesPending event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_GetUpdatesPending()
else
	li_rc = this.Event pfc_UpdatesPending()
end if

return li_rc
end function

public function integer of_Validation ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Validation
//	Arguments:		None
//	Returns:			Integer
//	 					1 = All validation passed
//						-1 = validation failed
//	Description:		Perform validation logic.
// 						Note: Specific Validation logic should be coded in descendant pfc_validation event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_Validation()
else
	li_rc = this.Event pfc_Validation()
end if

return li_rc
end function

public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Update
//	Arguments:		ab_accepttext		When applicable, specifying whether control should perform an
//												AcceptText prior to performing the update:
//						ab_resetflag		Value specifying whether object should automatically 
//												reset its update flags.
//	Returns:			Integer
//	 					1 = The update was successful
//						-1 = The update failed
//	Description:		Execute the specific Update logic.  
// 						Note:	Specific Update logic should be coded in descendant pfc_Update event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer		li_rc

if IsValid(inv_Linkage) then
	// Perform a Linked Update.
	li_rc = inv_Linkage.of_Update(ab_accepttext, ab_resetflag)
else
	// Perform the Update.
	li_rc = this.Event pfc_Update(ab_accepttext, ab_resetflag)
end if

return li_rc
end function

public function integer of_Update (boolean ab_accepttext, boolean ab_resetflag, boolean ab_insert, boolean ab_update, boolean ab_delete);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Update
//	Arguments:		ab_accepttext		Value specifying whether the DataWindow control should perform an
//												AcceptText prior to performing the update:
//						ab_resetflag		Value specifying whether DWControl should automatically 
//												reset the update flags.
//						ab_insert			Boolean stating if Inserts should be performed.
//						ab_update			Boolean stating if Updates should be performed.
//						ab_delete			Boolean stating if Deletes should be performed.
//	Returns:			Integer
//	 					1 = The update was successful
//						-1 = The update failed
//	Description:		Perform the Specific Update logic, but only perform the
//						requested SQL (insert, update, delete) statements.
// 						Note: Specific Update logic should be coded in descendant pfc_Update event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

// Verify passed arguments.
if IsNull(ab_accepttext) or IsNull(ab_resetflag) &
	Or IsNull(ab_insert) or IsNull(ab_update) or IsNull(ab_delete) then return FAILURE

// Set the variable which determines which updates are allowed.
is_UpdatesAllowed = ""
if ab_insert then is_UpdatesAllowed += "I"
if ab_update then is_UpdatesAllowed += "U"
if ab_delete then is_UpdatesAllowed += "D"

// Perform the update.
li_rc = this.Event pfc_update (ab_accepttext, ab_resetflag)

// Reset the variable which determines which updates are allowed.
is_UpdatesAllowed = "IUD"

return li_rc
end function

public function integer of_UpdatePrep ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UpdatePrep
//	Arguments:		None
//	Returns:			Integer
//	 					1 = All preparation passed
//						-1 = preparation failed
//	Description:		Prepare the DataWindow(s)
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_UpdatePrep()
else
	li_rc = this.Event pfc_UpdatePrep()
end if

return li_rc
end function

public function integer of_PostUpdate ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_PostUpdate
//	Arguments:		None
//	Returns:			Integer - 1 if it succeeds and -1 if an error occurs
//	Description:		Perform post update processing.
//						Reset the update flags in the DataWindow(s).
// 						Note:	Specific PostUpdate logic should be coded in descendant pfc_PostUpdate event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc

if IsValid(inv_Linkage) then
	li_rc = inv_Linkage.of_PostUpdate()
else
	li_rc = this.Event pfc_postupdate()
end if

return li_rc
end function

public function boolean of_IsUpdateable ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_IsUpdateable
//	Arguments:		None
//	Returns:			boolean
//						true   The dw is marked as updateable
//						false   The dw is not marked as updateable
//	Description:		Gets the value of the updateable property of the DW indicating
//						whether the DataWindow is updateable
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version - Replaces obsoleted function of_GetUpdateable(...).
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return ib_IsUpdateable
end function

protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//	Protected Function: of_MessageBox
//	Arguments:		as_id			An ID for the Message.
//						as_title  	Text for title bar
//						as_text		Text for the actual message.
//						ae_icon 		The icon you want to display on the MessageBox.
//						ae_button	Set of CommandButtons you want to display on the MessageBox.
//						ai_default  The default button.
//	Returns:			Integer - Return value of the MessageBox.
//	Description:		Display a PowerScript MessageBox.  
//						Allow PFC MessageBoxes to be manipulated prior to their actual display.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

public function integer of_SetSharedProperty (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetSharedProperty
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:  		Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//	Description:		Starts or stops the Shared Property Service.
//						Note:	Do not set the requestor on the shared instance.
//						Do not execute snv_property.of_SetRequestor (this) since the object is shared
//						among many datawindows.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(snv_property) or not IsValid (snv_property) then
		snv_property = Create n_cst_dwsrv_property
		return SUCCESS
	end if
else 
	if IsValid (snv_property) then
		Destroy snv_property
		return SUCCESS
	end if	
end if

return NO_ACTION
end function

public function boolean of_IsSharedProperty ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_IsSharedProperty
//	Arguments:		None
//	Returns:			boolean
//   					true  - The service is started.
//   					false - The service is not started.
//	Description:		Determines if the DataWindow Shared Property service has been started.
//						Note:	This function is need because all Shared variables are always defined
//						as private.  This function is only needed when an outside object needs to
// 						know if the Shared service has been started or not.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
if IsValid (snv_property) then return true

return false
end function

public function long of_Retrieve ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve
//	Arguments:		None
//	Returns:			Long - The return code from the Retrieve Powerscript function
//	 					0 = No rows returned from successful retrieve
//						-1 = Retrieve was unsuccessful
//						>1 = Success.
//	Description:		Execute the specific Retrieve logic.
// 						Note:	Specific retrieve logic should be coded in descendant pfc_Retrieve event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						6.0.01	Corrected type of return variable from integer to long.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
long	ll_rc

if IsValid(inv_Linkage) then
	ll_rc = inv_Linkage.of_Retrieve()
else
	ll_rc = this.Event pfc_Retrieve()
end if

return ll_rc
end function

public function integer of_setgrid (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetGrid
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops theGrid Service.  This service
//				     	provides the ability to store/restore columns visibility, order & width.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						12.5   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
// Check arguments
if IsNull(ab_switch) then return FAILURE

if ab_Switch then
	if IsNull(inv_Grid) or not IsValid (inv_Grid) then
		inv_Grid = Create n_cst_dwsrv_Grid
		inv_Grid.of_SetRequestor ( this )
		inv_grid.of_load()
		return SUCCESS
	end if
else 
	if IsValid (inv_Grid) then
		inv_grid.of_save( )
		Destroy inv_Grid
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

event clicked;//////////////////////////////////////////////////////////////////////////////
//	Event:			clicked
//	Description:	DataWindow clicked
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0	Initial version
// 					6.0 	Added Linkage service notification
// 					6.0 	Introduced non zero return value
// 					7.0	Do not bypass processing on linkage failure.  
// 					7.0	Linkage service should not fire events when querymode
//								is enabled
//						12.5	Add logic to draw sort order indicator
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer li_rc
boolean lb_disablelinkage

// Check arguments
if IsNull(xpos) or IsNull(ypos) or IsNull(row) or IsNull(dwo) then return

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	if IsValid (inv_Linkage) then
		if inv_Linkage.Event pfc_clicked ( xpos, ypos, row, dwo ) = &
			inv_Linkage.PREVENT_ACTION then
			// The user or a service action prevents from going to the clicked row.
			return 1
		end if
	end if
end if
	
if IsValid (inv_RowSelect) then inv_RowSelect.Event pfc_clicked ( xpos, ypos, row, dwo )

IF Integer(Describe("DataWindow.Processing")) = 1 THEN
	il_clicked						= row
	idwo_clicked					= dwo
ELSE
	if IsValid (inv_Sort) then inv_Sort.Event pfc_clicked ( xpos, ypos, row, dwo )
END IF
end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			destructor
//	Arguments:		None
//	Returns:  		None
//	Description:		Destroy the instantiated datawindow services attached to this dw.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0 	Added cleanup for new 6.0 services.
//						12.5	Added cleanup for grid service
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
of_SetBase (false)
of_SetRowManager (false)
of_SetQueryMode (false)
of_SetLinkage (false)
of_SetReport (false)
of_SetMultiTable (false)
of_SetRowSelect (false)
of_SetReqColumn (false)
of_SetSort (false)
of_SetFilter (false)
of_SetFind (false)
of_SetDropDownSearch (false)
of_SetPrintPreview (false)
of_SetResize (false)
of_SetDropDownCalendar (false)
of_SetDropDownCalculator (false)
of_SetProperty (false)
of_setGrid(false)
end event

event getfocus;//////////////////////////////////////////////////////////////////////////////
//	Event:  			getfocus
//	Arguments:		None
//	Returns:  		None
//	Description:		Notify the parent window that this control got focus.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
window 	lw_parent

of_GetParentWindow(lw_parent)
if IsValid(lw_parent) then
	// Dynamic call to the parent window.
	lw_parent.dynamic event pfc_ControlGotFocus (this)
end if
end event

event rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//	Event:			rowfocuschanged
//	Description:		Send rowfocuschanged notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Added RowSelect service notification.
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage

if IsValid( inv_RowSelect ) then	inv_RowSelect.Event pfc_RowFocusChanged (currentrow) 

// Is Querymode enabled?
if IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	if IsValid ( inv_Linkage ) then
		inv_Linkage.Event pfc_RowFocusChanged (currentrow) 
	end if 
end if
end event

event sqlpreview;//////////////////////////////////////////////////////////////////////////////
//	Event:			sqlpreview
//	Description:		Allow for SQLSpy service.
//						Provide selective updates, inserts, and deletes. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
//						6.0 	Only perform the requested SQL (insert, update, delete) statements.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer					li_rc
string 					ls_sqlsyntax
sqlpreviewfunction	l_request 	
sqlpreviewtype			l_sqltype		
dwbuffer					l_buffer			

//Check the arguments.
if IsNull(sqltype) or IsNull(sqlsyntax) or IsNull(buffer) then	return

// Only perform the requested SQL (insert, update, delete) statements.
if (sqltype = PreviewSelect!) or &
	(sqltype = PreviewInsert! And Pos(is_UpdatesAllowed,"I")>0) or &
	(sqltype = PreviewUpdate! And Pos(is_UpdatesAllowed,"U")>0) or &
	(sqltype = PreviewDelete! And Pos(is_UpdatesAllowed,"D")>0) then
	// Allow the continuation of the SQL statament.	
else
	// Stop this SQL statement from being executed.
	// return 2 - Skip this request and execute the next request.
	return 2
end if

//if available trigger the SQLSpy service.
If IsValid(gnv_app.inv_debug) then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) then

		ls_sqlsyntax = sqlsyntax
		l_request = request
		l_sqltype = sqltype
		l_buffer = buffer

		//Send the information to the service for processing.
		li_rc = gnv_app.inv_debug.inv_sqlspy.of_sqlpreview &
			(this.ClassName(), l_request, l_sqltype, ls_sqlsyntax, l_buffer, row)
		If li_rc = 1 or li_rc = 2 then
			// 1 Stop processing of all entries.
			// 2 Skip this request and execute the next request.
			return li_rc
		else
			// Normal processing.
			If ls_sqlsyntax <> sqlsyntax then
				//The sqlsyntax was inspected and changed by the user.
				//Update the SQL to the new syntax.
				If this.SetSQLPreview (ls_sqlsyntax) = 1 then 
					return
				else
					// An error was encountered on the Modified SQLStatement
					of_MessageBox ("pfc_sqlpreview_error", "SQLSpy on SQLPreview", &
						"An error was encountered with the following SQL:~r~n~r~n"+ &
						ls_sqlsyntax, Information!, Ok!, 1)
				end if				
			end if
		end if
		
	end if
end if
end event

event itemerror;//////////////////////////////////////////////////////////////////////////////
//	Event:			itemerror
//	Description:		Send itemerror notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0		Enhanced to support the linkage service.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc
w_master	lw_parent

// If appropriate replace an empty string with a null value and suppress the 
//	standard DataWindow Value Required Message. 
If IsValid(inv_ReqColumn) then
	li_rc = inv_ReqColumn.of_SetToNullIfEmpty(row, String(dwo.Name), This.GetText())
	If li_rc > 0 then
		If li_rc =1 then
			// Item was changed from an Empty to a Null value.  Notify itemchanged...
			this.Event itemchanged (row, dwo, data)
		end if
		return 3		// Reject the data value but allow focus to change.
	end if
end if

// If the window is closing Suppress all Errors. 
this.of_GetParentWindow(lw_parent)
If IsValid(lw_parent) then
	If lw_parent.TriggerEvent ("pfc_descendant") = 1 then	
		If lw_parent.of_GetCloseStatus() then
			return 1   	//	Reject the data value with no message box.
		end if
	end if
end if
end event

event itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//	Event:			itemfocuschanged
//	Description: 	Send itemfocuschanged notification to DW services
//						If appropriate, display the microhelp stored in the tag value of the current column.
//						Note:  The tag value of a column can contain just the microhelp, or may 
//						contain other information as well. 
//						The format follows: MICROHELP=<microhelp to be displayed>. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
//						6.0		Added notification to the Linkage Service.
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage
string			ls_microhelp
window			lw_parent
n_cst_string 	lnv_string

If IsNull(dwo) or not IsValid (dwo) then return

//Check for microhelp requirements.
If gnv_app.of_GetMicrohelp() then
	// Check the tag for any "microhelp" information.
	ls_microhelp = lnv_string.of_GetKeyValue (dwo.tag, "microhelp", ";")
	if IsNull (ls_microhelp) or Len(Trim(ls_microhelp))=0 then ls_microhelp = ""	

	//Notify the window.
	of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) then
		// Dynamic call to the parent window.
		lw_parent.Dynamic Event pfc_microHelp (ls_microhelp)
	end if	
end if

// Is Querymode enabled?
If IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	If IsValid(inv_Linkage) then
		inv_Linkage.Event pfc_itemfocuschanged (row, dwo)
	end if
end if
end event

event rbuttondown;//////////////////////////////////////////////////////////////////////////////
//	Event:			rbuttondown
//	Description:		Allow for focus change on rbuttondown
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0		Initial version
// 						6.0 	Added Linkage service notification.
// 						12.5 	Force row change (#11003)
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
integer	li_rc
long		ll_currow
string	ls_colname
string	ls_curcolname

// Validate arguments.
if not ib_RMBfocuschange or IsNull (dwo) or row <= 0 then return

if IsValid (inv_Linkage) then
	If inv_Linkage.event pfc_rbuttondown (xpos, ypos, row, dwo) <> &
		inv_Linkage.CONTINUE_ACTION then
		// The user or an error prevents changing to a new row.
		return
	end if
end if

if IsValid (inv_RowSelect) then inv_RowSelect.event pfc_rbuttondown (xpos, ypos, row, dwo)

if dwo.type <> "column" then
	// Force row change (#11003)
	ll_currow = this.GetRow()
	if (row <> ll_currow) then this.SetRow (row)
	return	
end if

// Perform no action if already over current row/column.
ls_colname = dwo.name
ls_curcolname = this.GetColumnName()
ll_currow = this.GetRow()
if (ls_colname = ls_curcolname) and (row = ll_currow) then return

// Set row & column.
if this.SetRow (row) = 1 then	this.SetColumn (ls_colname)
end event

event dberror;//////////////////////////////////////////////////////////////////////////////
//	Event:			dberror
//	Description:		Display messagebox that a database error has occurred.
// 						If appropriate delay displaying the database error until the appropriate
// 						Rollback has been performed.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0			Initial version
// 						5.0.02		Suppress error messages until after a rollback has been performed
// 						6.0 		Enhanced to use new dberrorattrib to support all error attributes.
// 						6.0			Enhanced to support Transaction Management by other objects
// 						6.0 		Enhanced to send notification to the SqlSpy service.
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
w_master	lw_parent
string	ls_message
string	ls_sqlspyheading
string	ls_sqlspymessage
string	ls_msgparm[1]
powerobject lpo_updaterequestor
n_cst_dberrorattrib lnv_dberrorattrib

// The error message.
ls_message = "A database error has occurred.~r~n~r~n~r~n" + &
	"Database error code:  " + String (sqldbcode) + "~r~n~r~n" + &
	"Database error message:~r~n" + sqlerrtext

// Set the error attributes.
lnv_dberrorattrib.il_sqldbcode = sqldbcode
lnv_dberrorattrib.is_sqlerrtext = sqlerrtext
lnv_dberrorattrib.is_sqlsyntax = sqlsyntax
lnv_dberrorattrib.idwb_buffer = buffer
lnv_dberrorattrib.il_row = row
lnv_dberrorattrib.is_errormsg = ls_message
lnv_dberrorattrib.ipo_inerror = this

// If available trigger the SQLSpy service.
If IsValid(gnv_app.inv_debug) then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) then

		// Create the heading and message for the SQLSpy.
		ls_sqlspyheading = "DBError - " + this.ClassName() + "(" + string(row) + ")"
		ls_sqlspymessage = "Database error code:  " + String (sqldbcode) + "~r~n" + &
			"Database error message:  " + sqlerrtext
		
		// Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, "/*** " + ls_sqlspymessage + " ***/")
	end if
end if

// Determine if Transaction Management is being performed by another object.
If IsValid(ipo_UpdateRequestor) then
	lpo_updaterequestor = ipo_UpdateRequestor
else
	// Determine if the window is in the save process. 
	this.of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) then
		If lw_parent.TriggerEvent ("pfc_descendant") = 1 then	
			If lw_parent.of_GetSaveStatus() then
				lpo_updaterequestor = lw_parent
			end if
		end if
	end if
end if

If IsValid(lpo_updaterequestor) then
	// Suppress the error message (let the UpdateRequestor display it).
	// MetaClass check, Dynamic Function Call.
	lpo_updaterequestor.Dynamic Function of_SetDBErrorMsg(lnv_dberrorattrib)
else
	// Display the message immediately.
	If IsValid(gnv_app.inv_error) then
		ls_msgparm[1] = ls_message
		gnv_app.inv_error.of_Message ("pfc_dwdberror", ls_msgparm, &
					gnv_app.iapp_object.DisplayName)
	else
		of_MessageBox ("pfc_dberror", gnv_app.iapp_object.DisplayName, &
			ls_message, StopSign!, Ok!, 1)
	end if
end if

return 1
end event

event resize;//////////////////////////////////////////////////////////////////////////////
//	Event:			resize
//	Description:		Send resize notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
If IsValid (inv_Resize) then inv_Resize.Event pfc_Resize (sizetype, This.Width, This.Height)
end event

event itemchanged;//////////////////////////////////////////////////////////////////////////////
//	Event:			itemchanged
//	Description:		Send itemchanged notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage
integer li_rc

// Is Querymode enabled?
If IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	if IsValid (inv_Linkage) then
		//	*Note: If the changed value needs to be validated.  Validation needs to 
		//		occur prior to this linkage.pfc_itemchanged event.  If key syncronization is 
		//		performed, then the changed value cannot be undone. (i.e. return codes)	
		li_rc = inv_Linkage.event pfc_itemchanged (row, dwo, data)
	end if
end if
end event

event retrieveend;//////////////////////////////////////////////////////////////////////////////
//	Event:			retrieveend
//	Description:		Send retrieveend notification to services
// 						Notify the SQLSpy service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//						12.5	Add logic for sort order indicator
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
string 	ls_sqlspyheading
string	ls_sqlspymessage

//If available trigger the SQLSpy service.
If IsValid(gnv_app.inv_debug) then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) then
		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = "RetrieveEnd - " + this.ClassName() 
		ls_sqlspymessage = "Rows Retrieved = "+ string(rowcount)
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, "/*** " + ls_sqlspymessage + " ***/")
	end if
end if

If IsValid(inv_Linkage) then inv_Linkage.Event pfc_retrieveend (rowcount)

//	Because we don't know that "state" of the dataWindow for every case,
//	it is best to turn off the sort order indicator for now and let the
//	user reselect it.  Columns/Headers that were visible before the
//	retrieve, may no long be visible based on things like expressions.
IF isValid(inv_sort) THEN inv_sort.of_sortIndicatorNone()
end event

event retrievestart;//////////////////////////////////////////////////////////////////////////////
//	Event:			retrievestart
//	Description:		Send retrievestart notification to DW services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
If IsValid(inv_Linkage) then inv_Linkage.Event pfc_retrievestart ()
end event

event rowfocuschanging;//////////////////////////////////////////////////////////////////////////////
//	Event:			rowfocuschanging
//	Description:		Send rowfocuschanging notification to services
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						7.0		Linkage service should not fire events when querymode is enabled
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_disablelinkage

// Is Querymode enabled?
If IsValid(inv_QueryMode) then lb_disablelinkage = inv_QueryMode.of_GetEnabled()

if not lb_disablelinkage then
	If IsValid(inv_Linkage) then
		If inv_Linkage.Event pfc_RowFocusChanging (currentrow, newrow) <>  &
			inv_Linkage.CONTINUE_ACTION then
			// The user or a service action prevents from going to the newrow.
			return 1
		end if	
	end if
end if

return
end event

on pfc_u_dw.create
end on

on pfc_u_dw.destroy
end on

