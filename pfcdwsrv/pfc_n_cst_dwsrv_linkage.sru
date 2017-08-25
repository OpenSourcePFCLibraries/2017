HA$PBExportHeader$pfc_n_cst_dwsrv_linkage.sru
$PBExportComments$PFC DataWindow Linkage service
forward
global type pfc_n_cst_dwsrv_linkage from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_linkage from n_cst_dwsrv
event type integer pfc_rowfocuschanged ( long al_row )
event type integer pfc_insertrow ( long al_row )
event type integer pfc_deleterow ( long al_row )
event type long pfc_predeleterow ( long al_row )
event type integer pfc_itemchanged ( long al_row,  dwobject adwo_object,  string as_data )
event type integer pfc_itemfocuschanged ( long al_row,  dwobject adwo_object )
event type integer pfc_retrieveend ( long al_rowcount )
event type integer pfc_rowfocuschanging ( long al_prevrow,  long al_newrow )
event type integer pfc_preinsertrow ( )
event type integer pfc_clicked ( integer ai_xpos,  integer ai_ypos,  long al_row,  dwobject adwo_obj )
event type integer pfc_rbuttondown ( integer ai_xpos,  integer ai_ypos,  long al_row,  dwobject adwo_obj )
event type integer pfc_retrievestart ( )
event type integer pfc_rowchanged ( )
end type
global pfc_n_cst_dwsrv_linkage pfc_n_cst_dwsrv_linkage

type variables
Public:
//- LinkageStyle Constants:
  constant  integer FILTER =1
  constant  integer RETRIEVE =2
  constant  integer SCROLL =3
//- UpdateStyle Constants:
  constant  integer TOPDOWN =1
  constant  integer BOTTOMUP =2
  constant  integer TOPDOWN_BOTTOMUP =3
  constant  integer BOTTOMUP_TOPDOWN =4
  constant  integer CUSTOM =101
//- DetailDelete Style Constants:
// defined in ancestor constant  integer DEFAULT =0
  constant  integer DELETE_ROWS =1
  constant  integer DISCARD_ROWS =2

Protected:

boolean		ib_statusoninsertrow=FALSE
boolean		ib_insertingrow
boolean		ib_allowfocuschange
boolean		ib_preventfocuschanged
boolean		ib_cascadingdelete
string 		is_keycols[]
string		is_keycolsvalue[]		// For Deletion use.
string 		is_filterexp			// Internal
string		is_focuscol		// Last column to get focus
string		is_focusval		// Last value to get focus (in Find exp.)
integer 		ii_collinkuse=FILTER 	// Default
boolean		ib_synconkeychange=FALSE	// Default	
integer		ii_keysync=DEFAULT  	// Default
long		il_priorrow			// Internal only
integer		ii_customupdate=1		// Used for the CUSTOM Update.
boolean		ib_updatebottomup=FALSE	// Obsoleted.
integer		ii_updatestyle=TOPDOWN	// Default
integer		ii_deletestyle=DEFAULT	// Default
boolean		ib_retrieving = False		// Internal only
boolean		ib_updateonrowchange=False // Used on Retrieval style only.
string		is_savesound = ''		// Used on Retrieval style and ib_updateonrowchange=True  only.
boolean		ib_confirmondelete=False	// Used on Retrieval style and ib_updateonrowchange=True  only.
boolean		ib_confirmonrowchange=False // Used on Retrieval style and ib_updateonrowchange=True  only.

powerobject	ipo_othersaveobjects[]	// Used on Retrieval style and ib_updateonrowchange=True  only.
u_dw 		idw_master		// If populated this is a detail dw. (can be both a master and detail dw)
u_dw 		idw_details[]		// If populated this is a master dw. (can be both master and detail dw)
n_cst_linkageattrib 	inv_linkargs
n_cst_platform	inv_platform
end variables

forward prototypes
public function integer of_createupdatesequence (ref u_dw adw_sequence[])
public function integer of_findroot (ref u_dw adw_root)
public function integer of_getdetails (ref u_dw adw_details[])
public function integer of_getupdatespending ()
public function integer of_getusecollinks ()
public function boolean of_islinked ()
public function boolean of_isroot ()
public function integer of_linkdetail (u_dw adw_detail)
public function integer of_linkto (u_dw adw_master)
public function integer of_reset ()
public function integer of_resetarguments ()
public function integer of_resetupdate ()
public function integer of_retrieve ()
protected function integer of_retrievedetails (long al_row)
protected function integer of_scrolldetails (long al_row)
public function integer of_setarguments (string as_masterarg, string as_detailarg)
public function integer of_settransobject (n_tr atr_trans)
public function integer of_setupdatebottomup (boolean ab_direction)
public function integer of_setusecollinks (integer ai_use)
public function integer of_triggerevent (string as_event)
public function integer of_unlink ()
public function integer of_unlinkdetail (u_dw adw_detail)
public function integer of_update ()
public function integer of_update (boolean ab_accepttext)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflags)
public function integer of_updatebottomup ()
public function integer of_updatetopdown ()
public function integer of_validation ()
public function integer of_accepttext (boolean ab_focusonerror)
protected function integer of_filterdetails (long al_row)
public function integer of_getarguments (ref n_cst_linkageattrib anv_linkargs)
public function integer of_refresh (long al_row)
public function integer of_setkeycols (string as_column)
public function integer of_setkeyvalues (long al_row)
public function integer of_setupdatestyle (integer ai_style)
public function integer of_updatetopdownandbottomup ()
public function integer of_getupdatestyle ()
public function integer of_setdeletestyle (integer ai_style)
public function integer of_setstyle (integer ai_style)
public function integer of_getstyle ()
public function integer of_setredraw (boolean ab_switch)
public function boolean of_iskey (string as_column)
public function integer of_deletedetailrows ()
public function integer of_deleterows (boolean ab_delete, string as_masterkeys[], string as_mastervalues[])
public function integer of_itemfocuschanged (long al_row, string as_column)
public function integer of_keychanged (long al_row, string as_column, string as_prevvalue, any aa_newvalue)
protected function boolean of_getupdatebottomup ()
public function integer of_updatebottomupandtopdown ()
public function integer of_setsavesound (string as_soundfile)
public function string of_GetSaveSound ()
public function integer of_setconfirmondelete (boolean ab_switch)
public function integer of_setconfirmonrowchange (boolean ab_switch)
public function boolean of_isconfirmonrowchange ()
public function boolean of_isconfirmondelete ()
public function integer of_keysync (long al_row, string as_column, string as_prevvalue, any aa_newvalue)
public function integer of_setmaster (u_dw adw_master)
public function integer of_resetmaster ()
public function integer of_unregister ()
public function integer of_setothersaveobjects (powerobject apo_objects[])
public function integer of_getothersaveobjects (ref powerobject apo_objects[])
public function integer of_updatecustom (integer ai_custom)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_GetDeleteStyle ()
public function integer of_setupdaterequestor (powerobject apo_updaterequestor)
public function integer of_updateprep ()
public function integer of_setcustomupdate (integer ai_custom)
public function integer of_GetCustomUpdate ()
public function boolean of_confirmonrowchange ()
protected function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly)
protected function integer of_save (long al_validaterow, boolean ab_prompt)
public function integer of_postupdate ()
public function boolean of_IsUpdateOnRowChange ()
public function integer of_setupdateonrowchange (boolean ab_switch)
public function boolean of_updateonrowchange ()
public function integer of_setsynconkeychange (boolean ab_switch)
public function boolean of_issynconkeychange ()
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public function integer of_getmaster (ref u_dw adw_master)
public function integer of_getregistered (ref n_cst_linkageattrib anv_linkargs)
public function boolean of_confirmondelete ()
protected function integer of_undomodified ()
public function integer of_SetStatusOnInsertRow (boolean ab_switch)
public function boolean of_isstatusoninsertrow ()
public function integer of_register (string as_masterarg, string as_detailarg)
public function integer of_accepttext ()
protected function string of_getvalue (long al_row, string as_column)
public function integer of_undomodified (boolean ab_all)
end prototypes

event pfc_rowfocuschanged;call super::pfc_rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_rowfocuschanged
//	Arguments: 		None
//	Returns:  		Integer: 1 if it succeeds and -1 if an error occurs. 
//	Description:  	Notify each of the detail datawindows attached to the requestor that rowfocus
//						has changed.  Contents of the current row requires the datawindows to refresh
//						themselves.  Details are refresh based on values on the requestor's current row.
//						This event is fired automatically from pfc_u_dw's RowFocusChanged
//						and pfc_rowchanged events.   You may call this event, from other situations
// 						where you want details refreshed.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0			Initial version
// 						5.0.02		Check the detail's style instead of assuming the detail style matches the master's style.
//						6.0			Changed to use service Constants and not to use obsoleted functions.
// 						6.0 		Enhanced with Prevent focus changed functionality.
//						8.0			Fix problem with extra retrieves in parent-child-grandchild
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
Integer	li_numdetails
Integer	li_detail
Integer	li_rc
boolean	lb_preventfocuschanged

//If IsValid(gnv_app.inv_debug) Then 
//	gnv_app.inv_debug.of_message(idw_requestor.ClassName()+ '.Linkage.PFC_RowFocusChanged'+&
//		' al_row='+string(al_row)+ ' RowCount='+string(idw_requestor.RowCount()))
//End If

// Reset the Prevent focus funtionality.
lb_preventfocuschanged = ib_preventfocuschanged
ib_preventfocuschanged = False

// Check the arguments.
al_row = idw_Requestor.GetRow()
If IsNull(al_row) Then Return -1

// Check for the prevent focus changed functionality.
If lb_preventfocuschanged Then Return 1

// Determine how many details are subordinate to the requestor. (if none stop processing).
li_numdetails = UpperBound ( idw_details ) 
If li_numdetails = 0 Then Return 1

// Loop through the valid details and Refresh each detail.
For li_detail = 1 to li_numdetails 
	
	If IsNull(idw_details[li_detail]) Or &
		Not IsValid (idw_details[li_detail]) Then Continue //Continue with next detail dw.
	If IsNull(idw_details[li_detail].inv_Linkage) Or &
		Not IsValid (idw_details[li_detail].inv_Linkage) Then Return -1

	// Check the style of the detail datawindow.  (if using retrieval arguments to refresh.)
	If idw_details[li_detail].inv_linkage.of_GetStyle() = RETRIEVE Then
		If al_row <= 0 Then
			// If the requestor's has no rows, then clear the detail dws. 
			li_rc = idw_details[li_detail].inv_Linkage.of_Reset()
			Continue		
		End If
		If idw_requestor.GetItemStatus (al_row, 0, Primary!) = New! &
			or idw_requestor.GetItemStatus (al_row, 0, Primary!) = NewModified! Then
			// If the requestor's or row is new, then clear the detail dws.
			li_rc = idw_details[li_detail].inv_Linkage.of_Reset()
			Continue
		End If
	End If
	
	// Refresh the data.
	li_rc = idw_details[li_detail].inv_Linkage.of_Refresh (al_row) 
	If li_rc < 0 Then
		idw_Requestor.ScrollToRow(il_priorrow)
		idw_Requestor.SetRow(il_priorrow) 		
		Return li_rc
	ElseIf li_rc = 1 Then
		il_priorrow = idw_Requestor.GetRow() 
		//  The following code is commented because it may
		//   create extra chain of retrieve in the parent-child-grand child linkage service.
		//   li_rc = idw_details[li_detail].inv_Linkage.Event pfc_rowfocuschanged (idw_details[li_detail].GetRow() ) 			
	End If
Next

Return li_rc
end event

event pfc_insertrow;call super::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_insertrow
//
//	(Arguments:
//	 al_row: 		A long identifying the row that has just been inserted.
//
//	(Returns:  		Integer
//   					 1 If sucessful.
//						-1 If an error is encountered.
//
//	Description:  
//	Notification that a new row has been added.  
//	Performs all required actions for a new row.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Make sure detail dws linked through dwShareData are synchronized.
// 6.0	Added setrow and scrolling to the new added row.
// 6.0 	Added notification of row about to be added for the UpdateOnRowChange.
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
Integer	li_rc

If al_row = 0 Then
	// Capture notification of new row about to be added.
	ib_insertingrow = True
	Return 1
End If

// Reset flag that keeps tracks of new rows being added.
ib_insertingrow = False

// Set focus to the new row.
If al_row > 0 And al_row <> idw_requestor.GetRow() Then
	idw_requestor.SetRow (al_row)
	idw_requestor.ScrollToRow (al_row)
End If

// Make sure detail dws linked through dwShareData are synchronized.
this.Event pfc_RowFocusChanged(al_row)

// Set the Key values for the new row.
li_rc = of_SetKeyValues(al_row) 

Return li_rc
end event

event pfc_deleterow;call super::pfc_deleterow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_deleterow
//
//	Arguments:
//	al_row: 		A long identifying the deleted row
//
//	Returns:  		Integer
//  1 If sucessful.
//	-1 If an error is encountered.
//
//	Description:  	
//	Notification that a row has been deleted.  The pfc_predeleterow should have 
//	been called prior to the actual deletion.   The save operation may be
// performed.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Added support for the DeleteStyle and RowUpdate functionality.
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
integer	li_numdetails
integer	li_detail
integer	li_rc
string	ls_reset[]
integer	li_option
string	ls_option
u_dw		ldw_root

SetPointer(HourGlass!)

// Reset the prevent focus change functionality.
ib_preventfocuschanged = False

// Validate the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Make sure a row was deleted.
If al_row <= -1 Then Return 1

//	Get the current row that has focus.
if IsNull(al_row) or al_row = 0 then
	al_row = idw_requestor.GetRow()
end if

// Disable linkage redrawing starting with this dw (prevent flicker).
of_SetRedraw(False)

// Start the Delete operation.
li_rc = of_DeleteDetailRows()

of_SetRedraw(True)

If li_rc < 0 Then
	// Notify the service about the row which currently has focus.
	this.Event pfc_RowFocusChanged(al_row)
	Return li_rc
End If

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange.
If of_UpdateOnRowChange() Then 
	// If appropriate Save the data.  (Do not prompt.)
	li_rc = of_Save(0, False)
	If li_rc <= -1 or li_rc >=2 Then
		// Notify the service about the row which currently has focus.
		this.Event pfc_RowFocusChanged(al_row)
		Return -1
	End If
	
End If

// Notify the service about the row which currently has focus.
this.Event pfc_RowFocusChanged(al_row)

Return 1
end event

event pfc_predeleterow;call super::pfc_predeleterow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_predeleterow
//
//	Arguments:
//	 al_row: 		A long identifying the row which may be being deleted.
//						If no row is passed in, use the current row.
//
//	Returns:  		Integer
//	 1 if it succeeds and the deleterow should continue.
//	 0 if the delete should be prevented.
//	-1 If an error is encountered.
//
//	Description:  
//	Notification that the row may be deleted.  Depending on the attributes,
//	a cancel of the delete operation is possible through the dialog window.
//
//	Note:
//	This is a Continue or Prevent event.
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
integer	li_i
integer	li_upperbound
string	ls_reset[]
string	ls_msgparm[]
integer 	li_option

// Validate required references.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then 
	Return FAILURE
End If

// If no row is passed in, use the current row.
if IsNull(al_row) or al_row = 0 then
	al_row = idw_requestor.GetRow()
end if

// Reset the key value information.
is_keycolsvalue = ls_reset

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange. Do not perform the check if this
// is a cascading delete.
If Not ib_cascadingdelete And of_UpdateOnRowChange() Then 
	If of_ConfirmOnDelete() Then
		If IsValid(gnv_app.inv_error) Then
			li_option = gnv_app.inv_error.of_Message('pfc_dwlinkage_predelete', ls_msgparm, &
							gnv_app.iapp_object.DisplayName)
		Else
			li_option = of_MessageBox('pfc_linkage_deleterow', &
							gnv_app.iapp_object.DisplayName, &
							'Delete row(s)?', Exclamation!, OkCancel!, 1)
		End If
		If li_option <> 1 Then
			// Prevent the delete from taking place.
			Return PREVENT_ACTION
		End If
	End If	
End If

// Store key value information about the row which is being considered
// for deletion.
li_upperbound = UpperBound(is_keycols)
for li_i = 1 to li_upperbound
	is_keycolsvalue[li_i] = of_BuildComparison (al_row, is_keycols[li_i] )
Next

If al_row = idw_requestor.RowCount() Then
	// Set the prevent focus change functionality.
	// This will delay the rowfocuschanged until all desired action can be
	// completed.
	ib_preventfocuschanged = True
End If

// Allow delete to take place.
Return CONTINUE_ACTION
end event

event pfc_itemchanged;call super::pfc_itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_itemchanged
//
//	(Arguments: 	
//	  al_row
//	  adwo_object
//	  as_data)
//
//	(Returns:  		Integer
// 				  	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description:  	Notification that a value has been changed on the requestor
//						datawindow.  If the column changed is key column, the 
//						appropriate action will be taken.
//					  	This event is fired automatically from pfc_u_dw's ItemChanged.
//
//		*Note:	If the changed value needs to be validated.  Validation needs to 
//					occur prior to this linkage.pfc_itemchanged event 
//					(i.e. u_dw.itemchanged event).  If key syncronization is 
//					performed, then the changed value cannot be undone. (i.e. return codes)
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
integer	li_rc
string	ls_colname
any		la_newvalue

if IsNull(al_row) Or IsNull(adwo_object) then
	return -1
end if

// Determine if Syncronization of Key Changes is desired.
if of_IsSyncOnKeyChange() then

	// Get the name of the column which just changed.
	ls_colname = adwo_object.Name 

	// Only worry about key column value changes.
	if of_IsKey(ls_colname) then
		// Confirm that the previous value was captured.
		if ls_colname <> is_focuscol then
			beep(1)
			return -1
		end if
	
		// Set the value so that it cannot be undone.
		li_rc = of_SetItem (al_row, ls_colname, as_data)
		If li_rc <> 1 Then Return -1
	
		// Get the new value into an 'any' variable.
		la_newvalue = of_GetItemAny (al_row, ls_colname)
		
		// Disable linkage redrawing starting with this dw (prevent flicker)
		of_SetRedraw(False)
	
		// Cascade the changed key value.
		of_KeyChanged (al_row, ls_colname, is_focusval, la_newvalue)		
	
		// ReApply filters.
		If of_GetStyle() = FILTER Then
			this.Event pfc_rowfocuschanged(idw_requestor.GetRow())
		End If
	
		of_SetRedraw(True)
	end if
end if

return 1
end event

event pfc_itemfocuschanged;call super::pfc_itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_itemfocuschanged
//
//	(Arguments: 	
//	  al_row
//	  adwo_object)
//
//	(Returns:  		Integer
// 				  	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description:  	Notification that item focus has changed on the requestor dw.
//					  	This event is fired automatically from pfc_u_dw's ItemFocusChanged.
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
if IsNull(al_row) Or IsNull(adwo_object) then
	return -1
end if

// Update the last column to receive focus.
of_ItemFocusChanged (al_row, adwo_object.Name)

Return 1
end event

event pfc_retrieveend;call super::pfc_retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_retrieveend
//
//	(Arguments:
//	 al_rowcount: 	A long identifying the row count just retrieved.
//
//	(Returns:  		Integer
//   					 1 If sucessful.
//						-1 If an error is encountered.
//
//	Description:  Notification that the datawindow is ended retrieving data.
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
long ll_row
string ls_column

// Get the current row and current column.
ll_row = idw_requestor.GetRow()
ls_column = idw_requestor.GetColumnName()

// Update the item which has focus.
of_ItemFocusChanged (ll_row, ls_column)

// No longer retrieving data.
ib_retrieving = False
Return 1
end event

event pfc_rowfocuschanging;call super::pfc_rowfocuschanging;//////////////////////////////////////////////////////////////////////////////
//	Event:		pfc_rowfocuschanging
//	Arguments:	al_prevrow	The previous row.
//					al_newrow	The new row.
//	Returns:		integer -  1 if the rowchange functionality should continue.
//	 							0 if the rowchange functionality should be prevented.
//								-1 error
//	Description:	Notification that row focus is changing.  Determine if focus going to another
//					row should continue or be stopped.  If appropriate, perform an update of the
//					current data prior to allowing focus to change to a new row.
//					Note:	This is a Continue or Prevent event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//						8.0	   Change to cause UndoModified to walk the linked chain of DWs
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
integer	li_fnrc
boolean	lb_allowfocuschange

//If IsValid(gnv_app.inv_debug) Then 
//	gnv_app.inv_debug.of_message(idw_requestor.ClassName()+ '.Linkage.PFC_RowFocusChanging'+&
//		' al_prevrow='+string(al_prevrow)+ ' al_newrow='+string(al_newrow) +&
//		' RowCount='+string(idw_requestor.RowCount()))
//End If

// Reset the retrieve flag.
lb_allowfocuschange = ib_allowfocuschange
ib_allowfocuschange = False

// Validate the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return FAILURE
End If

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange.
If of_UpdateOnRowChange() Then 

	// Allow focus changes due to the insertion of new rows.
	If ib_insertingrow Then Return CONTINUE_ACTION
	
	// Allow row focus changes due to retrieval operations.
	If ib_retrieving Then Return CONTINUE_ACTION
	
	// Allow delete operations to be serviced by the appropriate notification.
	If idw_requestor.DeletedCount() >0 Then Return CONTINUE_ACTION

	// If user prompt (if any) has already been performed, allow the focus change.
	If lb_allowfocuschange Then Return CONTINUE_ACTION

	// Disregard if there are no rows.
	If idw_requestor.RowCount() + idw_requestor.FilteredCount() <= 0 Then
		Return CONTINUE_ACTION
	End If

	// If appropriate Save the data. (if applicable, perform prompt.)
	li_rc = of_Save(idw_requestor.GetRow(), True)
	If li_rc = 2 Then
		// -- The user wants to loose all pending updates starting with this
		//    datawindow and down the chain. -- 
		// Loose all pending changes from this datawindow.
		li_fnrc = of_UndoModified ( True )
	ElseIf  li_rc <= -1 or li_rc >= 3 Then 
		// There was either an error or the user requested not to go to the
		// clicked row.
		Return PREVENT_ACTION
	End If
	
End If

Return CONTINUE_ACTION
end event

event pfc_preinsertrow;call super::pfc_preinsertrow;//////////////////////////////////////////////////////////////////////////////
//	Event:		pfc_preinsertrow
//	Arguments:	None
//	Returns:		integer - 1 if it succeeds and the insertrow should continue.
//								0 if the insertrow should be prevented.
//								-1 if an error occurs
//	Description:	Notification that a row is about to be inserted.
//					Determine if the Row that is about to be added should be stopped or cancelled.
// 					When desired, perform an update of the current data prior to allowing a new row.
//					Note: This is a Continue or Prevent event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0   Initial version
//						8.0	   Change to cause UndoModified to walk the linked chain of DWs
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
Integer 	li_rc = 1
Integer	li_fnrc

// Validate the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return FAILURE
End If

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange.
If of_UpdateOnRowChange() Then 
	// If appropriate Save the data.  (if applicable, perform prompt.)
	li_rc = of_Save(idw_requestor.GetRow(), True)
	If li_rc = 2 Then
		// -- The user wants to loose all pending updates starting with this
		//    datawindow and down the chain. -- 
		// Loose all pending changes from this datawindow.
		li_fnrc = of_UndoModified ( True )

	ElseIf  li_rc <= -1 or li_rc >= 3 Then 	
		Return PREVENT_ACTION
	End If
End If

Return CONTINUE_ACTION
end event

event pfc_clicked;call super::pfc_clicked;//////////////////////////////////////////////////////////////////////////////
//	Event:		pfc_clicked
//	Arguments:	ai_xpos:  	x position clicked
//					ai_ypos:  	y position clicked
//					al_row:  		row clicked
//					adwo_obj:  	DWobject clicked
//	Returns:  	Integer		1	Continue processing to another row
//	 								0	Prevent the focus from changing to another row
//									-1 if an error occurs
//	Description:	Determine if focus going to another row should continue or be stopped.
// 					If appropriate, perform an update of the current data prior to allowing focus
//					to change to a new row.
//					Note:	This is a Continue or Prevent event.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
//						8.0	   Change to cause UndoModified to walk the linked chain of DWs
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
integer	li_i
integer 	li_rc = 0
integer	li_fnrc
long		ll_currrow

// Make sure request is valid.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return FAILURE
If IsNull(adwo_obj) Then Return FAILURE
If IsNull(al_row) or al_row <=0 Then Return FAILURE

//If IsValid(gnv_app.inv_debug) Then 
//	gnv_app.inv_debug.of_message(idw_requestor.ClassName()+ '.Linkage.PFC_Clicked'+&
//		' al_row='+string(al_row)+ ' RowCount='+string(idw_requestor.RowCount()))
//End If

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange.
If of_UpdateOnRowChange() Then 

	// Get the current row.
	ll_currrow = idw_requestor.GetRow()

	// No action needed if the clicked is on the current row.
	If ll_currrow = al_row Then
		Return CONTINUE_ACTION
	End If
	
	// If appropriate Save the data. (if applicable, perform prompt.)
	li_rc = of_Save(ll_currrow, True)
	If li_rc = 2 Then
		// -- The user wants to loose all pending updates starting with this
		//    datawindow and down the chain. -- 
		// Loose all pending changes from this datawindow.
		li_fnrc = of_UndoModified ( True )
		
		// For this same action, prevent the rowfocuschanging 
		//	event from prompting the user again.
		ib_allowfocuschange = True
		
	ElseIf  li_rc <= -1 or li_rc >= 3 Then
		// There was either an error or the user requested not to go to the
		// clicked row.
		Return PREVENT_ACTION
	End If
	
End If

Return CONTINUE_ACTION
end event

event pfc_rbuttondown;call super::pfc_rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_rbuttondown
//
//	Arguments:
//	ai_xpos:  	x position clicked
//	ai_ypos:  	y position clicked
//	al_row:  	row clicked
//	adwo_obj:  	DWobject clicked
//
//	Returns:  		Integer
//	 0	Continue processing to another row
//	 1	Prevent the focus from changing to another row
//	-1 if an error occurs
//
//	Description:  
//	Determine if focus going to another row should continue or be stopped.
// If appropriate, perform an update of the current data prior to allowing focus
//	to change to a new row.
//
//	Note:
//	This is a Continue or Prevent event.
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

Return this.Event pfc_clicked(ai_xpos, ai_ypos, al_row, adwo_obj)

end event

event pfc_retrievestart;call super::pfc_retrievestart;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_retrievestart
//
//	Arguments:	None
//
//	Returns:  		Integer
//	1 if it succeeds
//
//	Description:  Notification that the datawindow is starting to retrieve data.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
ib_retrieving = True
Return 1
end event

event pfc_rowchanged;call super::pfc_rowchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_rowchanged
//
//	Arguments:		None
//
//	Returns:  		Integer
//  1 success
//	-1 error
//
//	Description:  
//	Notification when the buffer has been sorted, filtered or otherwise
//	manipulated such that the current row has not changed, but the actually row
//	at that location may be different.
//
//	Note:
//	This event could be triggered without the benefit of a RowFocusChanging
//	notification.  With the Retrieve Style and updateonrowchange = True there
//	is the possibility of data requiring updates prior to going to the new row.
//	The developer needs to prevent this event from being fired when required
//	updates are not valid updates. 
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
Integer	li_rc

// Determine by looking at the linked dws, if current dw requires
//	Updates to occur on RowChange.
If of_UpdateOnRowChange() Then
	// If Updates are pending save them.  This is usually not requested via
	// user interaction so there is no notification.
	li_rc = of_Save(0, False)
	If li_rc <0 or li_rc > 1 Then 
		//	The developer needs to prevent this event from being fired when required 
		//	updates are not be valid updates.		
		Return -1
	End If
End If

li_rc = this.Event pfc_RowFocusChanged (idw_requestor.GetRow()) 

Return li_rc
end event

public function integer of_createupdatesequence (ref u_dw adw_sequence[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CreateUpdateSequence
//
//	Access:    		Public
//
//	Arguments:
//	 adw_sequence	An array of u_dw (passed by reference) to hold the update sequence.
//	
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Returns an array holding the Default Update Sequence.
//						To determine the Default TopBottom sequence, then traverse the 
//						array from 1 to the array upperbound.
//						To determine the Default BottomUp sequence, then traverse the
//						array from the upperbound to 1.
//
//	   Note: This function is not typically called by the developer.  
//          Used internally to create the sequence of datawindow updates.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Validate references.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return FAILURE

// Bypass the datawindow if it is not marked as updateable.
If idw_Requestor.of_GetUpdateable ( ) Then 
	// Add the requesting datawindow to the array.
	adw_sequence[UpperBound(adw_sequence) + 1] = idw_Requestor
End If

// Determine how many details are subordinate to the requestor.
li_numdetails = UpperBound ( idw_details )

// Loop through the valid details and call this function on the each detail.
For li_i = 1 to li_numdetails
	If IsValid ( idw_details[li_i]) Then
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_CreateUpdateSequence ( adw_sequence )
		// If an error occurs, get out now.
		If li_rc <> 1 Then Exit
	End If 
Next

Return li_rc
end function

public function integer of_findroot (ref u_dw adw_root);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_FindRoot
//
//	Access:    		Public
//
//	Arguments:
//	  adw_root:  	The root datawindow reference returned
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//
//	Description:  Searches the Datawindow chain for the top-most,
//				     or root, datawindow.
//
//	  *Note: Can be called from any datawindow in the linked chain.
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
Integer	li_rc=-1

// Is the requesting datawindow the root?
If of_IsRoot ( ) Then 
	adw_root = idw_Requestor
	Return 1
End If 

// Call this function on this datawindow's master.
li_rc = idw_master.inv_Linkage.of_FindRoot ( adw_root )

Return li_rc
end function

public function integer of_getdetails (ref u_dw adw_details[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetDetails
//
//	Access:    		Public
//
//	Arguments:
//	adw_details:  	An array of u_dw (passed by reference) to hold the detail references.
//
//	Returns:   		Integer
//   					The number of details
//
//	Description:  Obtains a reference to all the details attached to 
//					  the requesting datawindow.
//
//	   Note: Can be called from any datawindow in the linked chain.
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
adw_details = idw_details 

Return UpperBound(idw_details) 
end function

public function integer of_getupdatespending ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetUpdatesPending
//
//	Access:    	Public
//
//	Arguments: 	None
//
//	Returns:  	Integer
// 				 1 = Updates pending within the datawindow chain.
// 				 0 = No updates pending within the datawindow chain.
//					-1 = Error
//
//	Description:  Determines if updates are pending in the linked datawindow chain.
//
//	   *Note:	Typically called from the root datawindow to affect all 
//					datawindows in the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails, li_i, li_rc=0, li_updpending=0

// Bypass the datawindow if it is NOT marked as updateable.
If idw_Requestor.of_GetUpdateable ( ) Then 
	// Check for any Pending Updates.
	If idw_Requestor.Event pfc_UpdatesPending() > 0 Then 
		// Store that there is at least one datawindow that has Updates Pending.
		li_updpending = 1
	End If 
End If

// Determine how many details are subordinate to the requestor.
li_numdetails = UpperBound ( idw_details ) 

// Loop through the valid details and call this function on the each detail.
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_GetUpdatesPending()
		If li_rc < 0 Then 
			// If an error occurs, then exit. 	
			Return li_rc
		ElseIf li_rc >= 1 Then 
			// Store that there is at least one datawindow that has Updates Pending.
			li_updpending = 1
		End If
	End If 
Next 

Return li_updpending
end function

public function integer of_getusecollinks ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUseColLinks
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:  		Integer
//  					 1 = "filter"
//	  					 2 = "retrieve"
//   					 3 = "scroll"
//
//	Description:  
//	This function will return an integer to indicate how to use column links 
//	to refresh data.
//
// Note:
//	Can be called from any datawindow in the linked chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_GetStyle().
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_GetStyle()
end function

public function boolean of_islinked ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsLinked
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//   					TRUE: The datawindow participates in a linked chain
//	 					FALSE: The datawindow does not participate in a linked chain
//
//	Description:  	This function will determine if the requesting datawindow is 
//               	linked.
//
//	   *Note: Can be called from any datawindow in the linked chain.
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
Integer	li_numdetails
Integer	li_i

If of_IsRoot ( ) Then 
	// This is a root datawindow, check if it is linked to any details.
	li_numdetails = UpperBound ( idw_details ) 
	For li_i = 1 to li_numdetails 
		If IsValid ( idw_details[li_i] ) Then Return True
	Next 
Else
	// This dw is at least linked to a root datawindow.
	Return True
End If 

// Datawindow is not linked to either a master or a detail datawindow.
Return False
end function

public function boolean of_isroot ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRoot
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//   					TRUE: The requesting datawindow is the top-most (or root)
//							datawindow in the chain
//  					FALSE: The requesting datawindow is not the top-most 
//							(or root) datawindow
//
//	Description:  	Determines if the datawindow is the root of the chain.
//
//	   *Note: Can be called from any datawindow in the linked chain.
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

// Determine if the datawindow is a root.
If IsNull(idw_master) Or Not IsValid (idw_master) Then
	Return True
Else
	Return False
End If
end function

public function integer of_linkdetail (u_dw adw_detail);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LinkDetail
//
//	Access:    		Public
//
//	Arguments:
//   adw_detail:	The detail datawindow reference to be set on the master.
//
//	Returns:   		Integer
//  					1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Sets the master's detail variable to passed datawindow.
//	Called internally by 'of_SetMaster'
//
//	Note:
//	This function is not typically called by the developer. 
//	To link a detail datawindow, call of_SetMaster instead.
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

// If the passed detail is not valid, then return error.
If IsNull(adw_detail) Or Not IsValid (adw_detail) Then 
	Return FAILURE
End If

// Link the detail.
idw_details[UpperBound(idw_details) + 1] = adw_detail
Return 1
end function

public function integer of_linkto (u_dw adw_master);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LinkTo
//
//	Access:    		Public
//
//	Arguments:
//   adw_master:	The master datawindow reference
//
//	Returns:   		Integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Links the detail datawindow to the master.  
//
//	Note:
//	This function should only be called from subordinate datawindows.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version.
// 6.0 	Marked obsolete Replaced by of_SetMaster(...).
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_SetMaster(adw_master)
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Reset
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
// 					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Resets the datawindows in the linked chain.
//
//		*Note:	Typically called from the root datawindow to affect all datawindows
//					in the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Reset the current datawindow. 
If idw_Requestor.Reset()<>1 Then Return FAILURE

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Reset ( ) 
		// If error, then get out now.
		If li_rc<> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_resetarguments ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ResetArguments
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:  		Integer
// 					1 if it succeeds and -1 if an error occurs.
//
//	Description:  This function will remove any column linkages between the 
//               master and detail datawindow
//
//	   Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_Unregister().
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_Unregister()
end function

public function integer of_resetupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_ResetUpdate
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Resets Update Status on the datawindows in the linked chain,
//					  	starting with the top-level datawindow.
//
//	   *Note: 	Typically called from the root datawindow to affect all datawindows
//					in the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Enhanced so the datawindow requestor will perform its own resetupdate
//			functionality.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Validate required reference.
If IsNull(idw_Requestor) or Not IsValid(idw_Requestor) Then Return FAILURE

// Reset Update Status on the requesting datawindow.
If idw_Requestor.Event pfc_ResetUpdate() <> 1 Then 
	Return FAILURE
End If

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_ResetUpdate ( ) 
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_retrieve ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Retrieve
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves (using 'pfc_retrieve' event) the datawindows in the
//					  linked chain, starting with the requesting datawindow.
//
//	  *Note: Typically called from the root datawindow to affect all datawindows in
//	   		the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 When appropriate, notify the requestor that row focus has changed.
// 5.0.04 If applicable when using the scroll style, scroll to the appropriate row.
// 6.0 	Instead of notifying the requestor of the rowfocus just notify the service.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
Boolean 	lb_rowpriortoretrieveisone

// Determine the current row prior to retrieval.
lb_rowpriortoretrieveisone = (idw_requestor.GetRow() = 1)

// Retrieve the requesting datawindow.
If idw_requestor.Event pfc_retrieve () = -1 Then Return FAILURE

// If appropriate, notify the service of the row focus change.
If lb_rowpriortoretrieveisone and (idw_requestor.GetRow() = 1) Then
	this.Event pfc_RowFocusChanged(1)
End If

Choose Case ii_collinkuse
	Case FILTER
		// The retrieve should be filtered.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_FilterDetails(idw_master.GetRow())
			End If
		End If
	Case SCROLL
		// The retrive should be scrolled.
		If IsValid(idw_master) Then
			If IsValid(idw_master.inv_linkage) Then
				of_ScrollDetails(idw_master.GetRow())
			End If
		End If
End Choose	

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i]) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Retrieve ( )
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

protected function integer of_retrievedetails (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RetrieveDetails
//
//	Access:   		protected
//
//	Arguments:
//   al_row:		The current row of the master datawindow
//
//	Returns:   		Integer
// 					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Retrieves detail datawindows based on current row
//					  values in the detail's master.
//
//	  *Note:	This function is not typically called by the developer.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Corrected code to look at master datawindow when checking for row
//				status of new! or newmodified!.
// 5.0.03 Handle comparisons between any variables casted to different datatypes.
// 6.0.01 Capture the return code of the PowerScript retrieve into a long type.
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
Integer	li_numlinks
Integer	li_i
Integer	li_rc
Long		ll_rc
Any		la_args[20]
Any		la_detail
Boolean	lb_performretrieve=False

// Operation is not valid for the root datawindow.
If Of_IsRoot() Then Return FAILURE

// Verify that master has started linkage service.
If IsNull(idw_master.inv_Linkage) Or &
	Not IsValid(idw_master.inv_Linkage) Then Return FAILURE

// Verify the row.
If IsNull(al_row) or al_row<=0 Then Return FAILURE

// No need to attempt a Retrieve if this is a new row.
If idw_master.GetItemStatus (al_row, 0, Primary!) = New! &
	or idw_master.GetItemStatus (al_row, 0, Primary!) = NewModified! Then
	// If the requestor's or row is new, then reset the rows.
	idw_Requestor.inv_Linkage.of_Reset()
	Return 1
End If

// Create array that contains the Retrieve arguments.
li_numlinks = UpperBound ( inv_linkargs.is_mastercolarg )
For li_i = 1 to li_numlinks
	// Get the data value from the master.
	la_args[li_i] = idw_master.inv_Linkage.of_GetItemAny( &
										al_row, inv_linkargs.is_mastercolarg[li_i])

	// Determine if the data is already in sync; if not set lb_performretrieve=True.
	If Not lb_performretrieve Then
		If idw_requestor.RowCount()=0 Then 
			lb_performretrieve = True
		ElseIf idw_requestor.ModifiedCount() > 0 or idw_requestor.DeletedCount() > 0 Then
			lb_performretrieve = True
		Else
			la_detail = idw_requestor.inv_Linkage.of_GetItemAny( &
									1, inv_linkargs.is_detailcolarg[li_i] ) 
								
			// Handle comparisons between any variables casted to different datatypes.								
			If IsNull(la_args[li_i]) or IsNull(la_detail) Then
				lb_performretrieve = True			
			ElseIf la_args[li_i] <> la_detail Then 
				lb_performretrieve = True
			End If
		End If 
	End If
Next 

// Prevents re-retrieve if data is already in sync.
If Not lb_performretrieve Then 
	Return 1
End If

// This is a generic retrieve that will handle up thru 20 arguments.
ll_rc = idw_Requestor.Retrieve ( &
				la_args[1],  la_args[2],  la_args[3],  la_args[4],  la_args[5], &
				la_args[6],  la_args[7],  la_args[8],  la_args[9],  la_args[10], &
				la_args[11], la_args[12], la_args[13], la_args[14], la_args[15], &
				la_args[16], la_args[17], la_args[18], la_args[19], la_args[20] ) 

If ll_rc >= 0 Then 
	// Notify of rows changed.
	idw_Requestor.Event pfc_rowchanged ( ) 
	If ll_rc >0 Then li_rc = 1 Else li_rc = 0
Else
	li_rc = ll_rc
End If

Return li_rc
end function

protected function integer of_scrolldetails (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ScrollDetails
//
//	Access:    		protected
//
//	Arguments:
//   al_row:		The current row of the master datawindow
//
//	Returns:   		Integer
// 					1 if it succeeds.
//						0 if there is no data to refresh.
//						-1 if an error occurs.
//
//	Description:  Scrolls detail datawindows based on current row
//					  values in the detail's master.
//
//	   *Note: 	This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Changed to use of_BuildExpression.
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
Integer	li_i
Integer	li_numlinks
String	ls_coldata
String	ls_find
Long		ll_row
Long		ll_toprow
string	ls_value
string	ls_expression

// Check for a valid row number.
If IsNull(al_row) or al_row<=0 Then Return -1

// Not a valid operation for a root datawindow. 
If of_IsRoot ( ) Then Return -1

// Loop around all values to create Find expression.
li_numlinks = UpperBound ( inv_linkargs.is_mastercolarg )
For li_i = 1 to li_numlinks
	// Get the current value on the master dw (use the master column).
	ls_value = string( idw_master.inv_Linkage.of_GetItemAny &
			(al_row, inv_linkargs.is_mastercolarg[li_i]))

	// Build the Expresion with the Detail Column.
	ls_expression = of_BuildExpression (0, inv_linkargs.is_detailcolarg[li_i], '=', ls_value)

	// Build the Find statement.
	If IsNull(ls_expression) or Len(Trim(ls_expression))=0 Then Continue
	If ls_find <> "" Then ls_find += ' AND '
	ls_find += ls_expression
Next 

// Find the row in the detail.
ll_row = idw_Requestor.Find (ls_find, 1, idw_Requestor.RowCount())
If ll_row <= 0 Then
	Return 0
End If

// Scroll the detail datawindow.
ll_toprow = Long ( idw_Requestor.Describe ( "DataWindow.FirstRowOnPage" ) )
If ll_toprow <> ll_row Then 
	idw_Requestor.ScrollToRow (ll_row) 
	idw_Requestor.SetRow (ll_row) 
End If 

Return 1
end function

public function integer of_setarguments (string as_masterarg, string as_detailarg);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetArguments
//
//	Access:    		Public
//
//	Arguments:
//   as_masterarg:	A string containing the columnname in the master
//                   that is a linkage argument
//   as_detailarg:	A string containing the columnname in the detail
//                   that is a linkage argument matched with the as_masterarg
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  This function will establish the columns between the master and 
//               the detail that link these two datawindows.  These do not necessarily
//               have to correspond with datawindow retrieval arguments.
//
//					  Call this function multiple times for multiple column arguments
//
//	   *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_Register(...).
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_Register(as_masterarg, as_detailarg)
end function

public function integer of_settransobject (n_tr atr_trans);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetTransObject
//
//	Access:    		Public
//
//	Arguments:
//   atr_trans:	The connected transaction object
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Sets the transaction object on all datawindows in the linked chain.
//
//	   Note: Typically called from the root datawindow to affect all datawindows in
//	   the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Verify the passed transaction object.
If IsNull(atr_trans) Or Not IsValid(atr_trans) Then Return -1

// Set the transaction object on the requesting datawindow.
If idw_Requestor.of_SetTransObject(atr_trans) <> 1 Then Return -1

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
 		If IsNull(idw_details[li_i].inv_Linkage) Or & 
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return -1
		li_rc = idw_details[li_i].inv_Linkage.of_SetTransObject ( atr_trans ) 
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_setupdatebottomup (boolean ab_direction);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUpdateBottomUp
//
//	Access:    		Public
//
//	Arguments:
//   ab_direction:	True, update linked chain from Bottom-Up
//						  	False (default), update linked chain from Top-Down.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description: 	This function sets an attribute of the datawindow
//					  	to indicate that the chain of linked datawindows should
//					  	be updated from the bottom-up.
//
//	   *Note:	This function should be called on *each* datawindow that
//					could be calling the of_update function directly.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_SetUpdateStyle().
//	12.5	Added Metaclass Service Obsolete Tag
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
If IsNull(ab_direction) Then 
	Return -1
End If

ib_updatebottomup = ab_direction

// Forward to the of_UpdateStyle the desired style.
If ib_updatebottomup Then
	of_SetUpdateStyle(BOTTOMUP)
Else
	of_SetUpdateStyle(TOPDOWN)
End if

Return 1
end function

public function integer of_setusecollinks (integer ai_use);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetUseColLinks 
//
//	Access:    	Public
//
//	Arguments:
//   ai_use:	An integer describing how detail datawindows will be refreshed
//					Valid values are: 
//						1 = Use column links to build a filter and filter. 
//									    the subordinate datawindow
//						2 = Use column links as arguments to a datawindow retrival.
//								(*This is mostly intended for Browsing Capabilities.  If the
//								 user will be updating rows as well as using this option,
//								 the modified rows need to be updated thru other means. 
//									(i.e., on pfc_master one could call the pfc_save event
//									 prior to allowing this service to discard the updates.)
//								(*Note: column links must be established in proper order)
//								(*Note: The service does not perform any updates unless
//											instructed so by the developer.)
//						3 = Use column links to cause details to scroll to proper row.
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:  Used to establish how detail datawindows will be refreshed
//
//	   *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Do not notify the master dw of the style of this detail.  The master
//			dw can query each detail to determine their styles.  This allows for
//			multiple styles to be suported on the same linkage chain.
// 5.0.02 Return 1 for successful operation.
// 6.0 	Marked obsolete Replaced by of_SetStyle().
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_SetStyle(ai_use)
end function

public function integer of_triggerevent (string as_event);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_TriggerEvent
//
//	Access:    		Public
//
//	Arguments:
//	  as_event:		The name of the event to be triggered
//
//	Returns:   		Integer
// 					 1 Succeeds for *ALL* linked datawindows.
//	 					-1 Event call on all linked datawnindows, but it did not exist
//							or has no script for at least one datawindow.
//						-2 Fatal error encountered.
//
//	Description:  	Walks the linked datawindow chain and triggers the passed
//					  	event in the datawindow control. 
//
//	   *Note: 	Typically called from the root datawindow to affect all 
//					datawindows in the chain, but may be started anywhere in 
//					the chain.
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
Integer	li_numdetails
Integer  li_rc=1, li_rcall=1
Integer	li_i

// Verify passed arguments.
If IsNull(as_event) or Len(Trim(as_event))=0 Then Return -2

// Trigger the event on the requesting datawindow; save error if any.
li_rc = idw_requestor.TriggerEvent (as_event)
If li_rc < li_rcall Then li_rcall = li_rc

// Determine how many details are subordinate to the requestor.
li_numdetails = UpperBound ( idw_details ) 

// Loop through the valid details and call this function on the each detail.
For li_i = 1 to li_numdetails 
	If IsValid(idw_details[li_i]) Then 
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid(idw_details[li_i].inv_Linkage) Then Return -2
		
		// Trigger the event on details, save error if any.
		li_rc = idw_details[li_i].inv_Linkage.of_TriggerEvent (as_event)
		If li_rc < li_rcall Then li_rcall = li_rc
	End If 
Next

Return li_rcall
end function

public function integer of_unlink ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Unlink
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	
//		Reset the master datawindow. (detail to master reference)
// 	Reset the detail datawindow on the master. (master to detail reference)
//
//	  *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete.  Replaced by of_ResetMaster().
//	12.5	Added Metaclass Service Obsolete Tag
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
Return of_ResetMaster()
end function

public function integer of_unlinkdetail (u_dw adw_detail);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnlinkDetail
//
//	Access:    		Public
//
//	Arguments:
//   adw_detail: 	The detail datawindow reference
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Sets this master's detail reference to null, thus unlinking the datawindow.
// Called internally from 'of_ResetMaster'
//
//	Note:
//	This function is not typically called by the developer.  
// To unregister a detail datawindow, from the detail dw call of_ResetMaster instead.
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

Integer	li_numdetails
Integer	li_i
u_dw		ldw_notvalid	//Invalid detail reference

// If the passed detail is not valid, then return error.
If IsNull(adw_detail) Or Not IsValid(adw_detail) Then 
	Return -1
End If

// Loop through the valid details attached and reset the detail reference.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails
	If idw_details[li_i] = adw_detail Then 
		// Invalidate the detail reference.
		idw_details[li_i] = ldw_notvalid
		Return 1
	End If
Next 

Return -1
end function

public function integer of_update ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Update (Format 1)
//
//	Access:    		Public
//
//	Arguments: 		None 
//   
//	  Uses defaults of:
//   PS Update function parameters:  AcceptText = TRUE
//   											 ResetFlags = TRUE
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Updates the linked datawindows in the direction of the
//					  ii_updatestyle attribute.
//
//	   Note: Typically called from the root datawindow to affect all datawindows in
//	   the chain, but may be started anywhere in the chain.
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
Return of_Update ( TRUE, True )
end function

public function integer of_update (boolean ab_accepttext);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Update (Format 2)
//
//	Access:    		Public
//
//	Arguments:
//   ab_accepttext:	Automatically perform an AcceptText prior to update
//
//   Uses default for PS Update function parameters:  ResetFlags = TRUE
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Updates the linked datawindows in the direction indicated by
//					  	the ii_updatestyle attribute. 
//
//	   *Note: 	Typically called from the root datawindow to affect all datawindows 
//					in the chain, but may be started anywhere in the chain.
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
If IsNull(ab_accepttext) Then Return -1

Return of_Update ( ab_accepttext, True )
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Update (Format 3)
//
//	Access:    		Public
//
//	Arguments:
//   ab_accepttext:  Automatically perform an AcceptText prior to update
//   ab_resetflags:  Automatically reset datawindow update flags
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Updates the linked datawindows in the direction indicated by
//					  	the ii_updatestyle attribute.
//
//	   *Note:	Typically called from the root datawindow to affect all datawindows
//					in the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Added support for the UpdateStyle attribute.
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
boolean	lb_focusonerror = False

// Verify passed arguments.
IF IsNull ( ab_accepttext ) Or IsNull ( ab_resetflags ) THEN Return -1 

// Perform AcceptText processing (all datawindows) prior to update.
IF ab_accepttext THEN 
	IF of_Accepttext (lb_focusonerror) <> 1 THEN Return -1
END IF

// Perform the appropriate update sequence.
CHOOSE CASE ii_updatestyle
	CASE TOPDOWN	
		li_rc = of_UpdateTopDown( ) 	
	CASE BOTTOMUP 
		li_rc = of_UpdateBottomUp( )
	CASE TOPDOWN_BOTTOMUP
		li_rc = of_UpdateTopDownAndBottomUp( )
	CASE BOTTOMUP_TOPDOWN
		li_rc = of_UpdateBottomUpAndTopDown( )	
	CASE CUSTOM
		li_rc = of_UpdateCustom(ii_customupdate)			
	CASE ELSE
		li_rc = -1
END CHOOSE

// Note: One may want to confirm all other updates are succesful 
//	prior to clearing any flags.
IF li_rc = 1 AND ab_resetflags THEN 
	li_rc = of_ResetUpdate ( ) 
END IF
	
Return li_rc
end function

public function integer of_updatebottomup ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateBottomUp
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Updates the datawindows in the linked chain, starting with
//					  	the lowest-level datawindow and going up the chain.
//
//	   Note:	This function is not typically called by the developer.  
//         	To cause an update from the bottom-up, call 
//				of_SetUpdateStyle (...), then call of_update.
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
Integer	li_i
Integer	li_max
String	ls_sqlspyheading
String	ls_sqlspymessage
u_dw		ldw_updatedw[]

// Create an array of the linked datawindows for update.
If of_CreateUpdateSequence ( ldw_updatedw ) <> 1 Then Return FAILURE 

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update single-pass BottomUp (inserts/updates/deletes)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

// Loop thru the array backwards to create a reverse update sequence ( Bottom-Up ).
li_max = UpperBound ( ldw_updatedw ) 
For li_i = li_max to 1 Step -1
	// Update the datawindow.
	If ldw_updatedw[li_i].Event pfc_update ( FALSE, False ) <> 1 Then Return FAILURE
Next 

Return 1
end function

public function integer of_updatetopdown ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateTopDown
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Updates the datawindows in the linked chain, starting with
//         		  the top-level datawindow and going down the chain.
//
//	   Note: This function is not typically called by the developer.  
//          To cause an update from the top-down, make sure that
//				ii_updatestyle is set and then call of_update.
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
Integer	li_i
Integer	li_max
String	ls_sqlspyheading
String	ls_sqlspymessage
u_dw		ldw_updatedw[]

// Create an array of the linked datawindows for update.
If of_CreateUpdateSequence ( ldw_updatedw ) <> 1 Then Return FAILURE 

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update single-pass TopDown (inserts/updates/deletes)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If


// Loop thru the array.
li_max = UpperBound ( ldw_updatedw ) 
For li_i = 1 to li_max 
	// Update the datawindow.
	If ldw_updatedw[li_i].Event pfc_update ( FALSE, False ) <> 1 Then Return FAILURE
Next 

Return 1
end function

public function integer of_validation ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	
//	of_validation
//
//	Access:    	Public
//
//	Arguments: 	None
//
//	Returns:  	Integer
//	1 = No error found during validation.
//	-1 = An error was found during validation.
//
//	Description:  
//	Validate each control on the chain.  Stop if an error is found.
//
//	Note:	
//	Typically called from the root datawindow to affect all datawindows in 
//	the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Allow datawindows which are marked as NotUpdateable to be validated.
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
Integer	li_numdetails, li_i, li_rc=0

// Check for any errors.
If idw_Requestor.Event pfc_Validation() < 0 Then 
	Return FAILURE
End If 

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_Validation()
		If li_rc < 0 Then Return li_rc
	End If 
Next 

Return li_rc
end function

public function integer of_accepttext (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AcceptText
//
//	Access:    		Public
//
//	Arguments: 
//	ab_focusonerror	Indicates if focus should be set to the DW if an error is
//							found.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Performs AcceptText on the datawindows in the linked chain,
//					  starting with the top-level datawindow.
//
//	   Note: Typically called from the root datawindow to affect all datawindows in
//	   the chain, but may be started anywhere in the chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Do not perform AcceptText on Datawidows found on uncreated tab pages.
// 6.0 	Enhanced so the datawindow requestor will perform its own accepttext
//			functionality.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Validate required reference.
If IsNull(idw_Requestor) or Not IsValid(idw_Requestor) Then Return FAILURE

// Perform the accepttext functionality.
If idw_Requestor.Event pfc_AcceptText(ab_focusonerror) <> 1 Then
	Return FAILURE
End If

// Loop through the valid details and call this function on each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or & 
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_AcceptText (ab_focusonerror)
		// If an error occurs, get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

protected function integer of_filterdetails (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_FilterDetails
//
//	Access:    	Protected
//
//	Arguments:
//   al_row: 	The current row of the master datawindow
//
//	Returns:   	Integer
//   				1 if it succeeds.
//					0 if there is no need to refresh.
//					-1 if an error occurs.
//
//	Description:  Filters detail datawindows based on current row
//					  values in the detail's master.
//
//	   *Note:	This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Notification of row changed is needed when the filter is the same as previous.
// 6.0 	Changed to use of_BuildExpression.
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
Integer	li_i
Integer	li_numlinks
Integer 	li_rc
String	ls_expression
String	ls_filter=""
string	ls_value
constant string NOMATCH_FILTER = '1 = 2'

// Not a valid operation for a root datawindow.
If of_IsRoot ( ) Then Return FAILURE 

// Check for an invalid row; see processing for empty expression.
If al_row>0 Then 
	// Loop thru all the link columns and construct a filter expression.
	li_numlinks = UpperBound ( inv_linkargs.is_mastercolarg ) 
	For li_i = 1 to li_numlinks

		// Check for an invalid row; see processing after loop.
		If IsNull(al_row) or al_row<=0 Then Continue

		// Get the current value on the master dw (use the master column).
		ls_value = string( idw_master.inv_Linkage.of_GetItemAny &
			(al_row, inv_linkargs.is_mastercolarg[li_i]))

		// Build the Expresion with the Detail Column.
		ls_expression = of_BuildExpression (0, inv_linkargs.is_detailcolarg[li_i], '=', ls_value)

		// Build the Filter statement.
		If IsNull(ls_expression) or Len(Trim(ls_expression))=0 Then Continue
		If ls_filter <> "" Then ls_filter += ' AND '
		ls_filter += ls_expression
	Next 
End If

//	processing for empty expression.
//	If the filter expression is empty, then the master row is is invalid or the column 
//	links are not populated, so construct a filter that will always return FALSE. 
If ls_filter = "" Then 
	//	This will clear the details.
	ls_filter = NOMATCH_FILTER
End If

// Don't re-filter, if it's the same as the last time.
If (is_filterexp <> ls_filter) Or (is_filterexp = NOMATCH_FILTER) Then 
	// Save the new filter expression.
	is_filterexp = ls_filter

	// Perform the filter.
	If idw_Requestor.SetFilter(ls_filter) <> 1 Then 
		Return FAILURE
	End If
	li_rc = idw_Requestor.Filter ( ) 
End If

// Fire the event to indicate that the row has changed.
idw_Requestor.Event pfc_rowchanged ( ) 

Return li_rc
 end function

public function integer of_getarguments (ref n_cst_linkageattrib anv_linkargs);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetArguments
//
//	Access:    		Public
//
//	Arguments:
//   anv_linkargs:  An instance of the NVO class (Passed by reference)
//						  to hold the linkage argument values.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Return the NVO class containing the master/detail 
//						column links (or arguments )
//
//	   Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_GetRegistered().
//	12.5	Added Metaclass Service Obsolete Tag
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
anv_linkargs = inv_linkargs 
Return 1
end function

public function integer of_refresh (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Refresh
//
//	Access:    		Public
//
//	Arguments:
//   al_row: 		The current row of the requesting datawindow
//
//	Returns:  		Integer
// 1 if it succeeds
//	0 if there is no data to refresh.
//	-1 if an error occurs.
//
//	Description:  
//	Refreshed detail datawindows based on its style.
//
//	Note:	
//	This function is not typically called by the developer.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Changed to use service constants and not use absoleted functions.
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
u_dw		ldw_root

// This operation is not valid for the root datawindow.
If of_IsRoot() Then Return FAILURE

// Find the root datawindow.
If of_FindRoot(ldw_root) <> 1 Then Return FAILURE

// If the linkage service is off on the root, then error.
If IsNull(ldw_root.inv_Linkage) Or & 
	Not IsValid (ldw_root.inv_Linkage) Then Return FAILURE

// Cause a refresh on the details.
Choose Case of_GetStyle()
	Case FILTER
		Return of_FilterDetails(al_row)
	Case RETRIEVE
		Return of_RetrieveDetails(al_row)
	Case SCROLL
		Return of_ScrollDetails(al_row)
End Choose 

Return FAILURE 
end function

public function integer of_setkeycols (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetKeyCols
//
//	Access:    		Public
//
//	Arguments:
//   as_column: 	The columnname of the linkage argument in the master
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description: 	
//	This function will establish the key column attributes on the master
//	datawindow.  When data in one of these columns changes, then a refresh 
//	(or some other action) is necessary on at least one of its detail datawindows.
//
//	Note:
//	This function is not typically called by the developer.  
// Used internally by of_Register(...) from an subordinate dw.
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

If IsNull(as_column) or Len(Trim(as_column))=0 Then 
	Return -1
End If
 
is_keycols[UpperBound(is_keycols) + 1] = as_column
Return 1
end function

public function integer of_setkeyvalues (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetKeyValues
//
//	Access:    		Public
//
//	Arguments: 		
//	 al_row			Row number.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	
//		Gets key column values from the master and sets the value in row.
//
//	   *Note:	This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Replaced of_GetItem(...) call with of_GetItemAny(...) to get the column
//			data from the master.
// 6.0	Enhanced to use the Status On InsertRow functionality.
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
Integer	li_i
Integer	li_numlinks
String	ls_coldata
Long		ll_currrow
dwItemStatus le_rowstatus

// This operation is not valid for the root datawindow.
If Of_IsRoot() Then Return -1

// Verify that master has started the linkage service.
If IsNull(idw_master.inv_linkage) Or &
	Not IsValid(idw_master.inv_linkage) Then Return -1

// Validate the current row of the master datawindow.
ll_currrow = idw_master.GetRow()
If ll_currrow <= 0 Then Return -1

// Loop thru all the link columns.
li_numlinks = UpperBound ( inv_linkargs.is_mastercolarg ) 
For li_i = 1 to li_numlinks

	// Get the column data value from the master.
	ls_coldata =  string( idw_master.inv_Linkage.of_GetItemAny (ll_currrow, &
									inv_linkargs.is_mastercolarg[li_i] ) )
	
	If IsNull(ls_coldata) or Len(Trim(ls_coldata))=0 Then 
		// Skip to the next loop.
		Continue
	Else
		// Set the master key column value in the Detail row.
		If idw_Requestor.inv_Linkage.of_SetItem ( al_row, &
			inv_linkargs.is_detailcolarg[li_i], ls_coldata ) = -1 Then Return -1
	End If

Next 

// Check if the row flag should be marked New!
If ib_statusoninsertrow or of_UpdateOnRowChange() Then
	le_rowstatus = idw_Requestor.GetItemStatus(al_row, 0, Primary!)
	If le_rowstatus = NewModified! Then
		// This will convert NewModified! row to New!.
		idw_requestor.SetItemStatus(al_row, 0, Primary!, NotModified!)
	End If
End If

Return 1
end function

public function integer of_setupdatestyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUpdateStyle
//
//	Access:    		Public
//
//	Arguments:
//   ai_style:	The style for Updates.
//					TOPDOWN
//					BOTTOMUP
//					TOPDOWN_BOTTOMUP
//					BOTTOMUP_TOPDOWN
//					CUSTOM
//
//	Returns:   		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  Set the Update Style.
//
//		Note: If CUSTOM is used, the of_UpdateCustom() function needs to be coded 
//				to provide the custom functionality.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_setUpdateBottomUp(...)
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

// Validate the argument.
If IsNull(ai_style) Then Return -1
CHOOSE CASE ai_style
	CASE	TOPDOWN, BOTTOMUP, TOPDOWN_BOTTOMUP, BOTTOMUP_TOPDOWN, CUSTOM
		// Good value.
	CASE ELSE
		Return -1
END CHOOSE

// Set the update style.
ii_updatestyle = ai_style
Return 1
end function

public function integer of_updatetopdownandbottomup ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateTopDownAndBottomUp
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Updates the datawindows in the linked chain, starting with
//         		  the top-level datawindow and going down the chain (inserts and Updates).
//					  The second pass will be bottom-level datawindow going up the 
//					  chain (deletes).
//
//	   Note: This function is not typically called by the developer.  
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
Integer	li_i
Integer	li_max
boolean	lb_accepttext = False
boolean 	lb_resetflag = False
boolean	lb_insert	
boolean	lb_update
boolean	lb_delete
String	ls_sqlspyheading
String	ls_sqlspymessage
u_dw		ldw_updatedw[]

// Create an array of the linked datawindows for update.
If of_CreateUpdateSequence ( ldw_updatedw ) <> 1 Then Return FAILURE 

// Get the number of datawindows.
li_max = UpperBound ( ldw_updatedw ) 

// -- First loop thru the array; top-level datawindow going down the chain.
//    Performing Inserts and Updates only.  --
lb_insert = True
lb_update = True
lb_delete = False

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update dual-pass - 1st pass TopDown (inserts/updates)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

For li_i = 1 to li_max 
	// Update the datawindow.
	If ldw_updatedw[li_i].of_Update &
		(lb_accepttext, lb_resetflag, lb_insert, lb_update, lb_delete) <> 1 Then 
		Return FAILURE
	End If
Next 

// -- Second loop thru the array; bottom-level datawindow going up the chain.
//    Performing Deletes only. --
lb_insert = False
lb_update = False
lb_delete = True

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update dual-pass - 2nd pass BottomUp (deletes)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

For li_i = li_max to 1 Step -1
	// Update the datawindow.
	If ldw_updatedw[li_i].of_Update &
		(lb_accepttext, lb_resetflag, lb_insert, lb_update, lb_delete) <> 1 Then 
		Return FAILURE
	End If
Next 

Return 1
end function

public function integer of_getupdatestyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUpdateStyle
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		Integer
//						The Update Style.
//
//	Description:  Get the Update Style.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_getUpdateBottomUp(...)
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
Return ii_updatestyle
end function

public function integer of_setdeletestyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetDeleteStyle
//
//	Access:    		Public
//
//	Arguments:
//   ai_style:	The Delete style.
//					DEFAULT 
//					DELETE_ROWS
//					DISCARD_ROWS
//
//	Returns:   		Integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Set the Delete Style.
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

// Validate the argument.
CHOOSE CASE ai_style
	CASE DEFAULT, DELETE_ROWS, DISCARD_ROWS
		// Good style.
	CASE ELSE
		Return -1
END CHOOSE

// Set the delete style.
ii_deletestyle = ai_style
Return 1
end function

public function integer of_setstyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetStyle
//
//	Access:    	Public
//
//	Arguments:
//   ai_use:	An integer describing how detail datawindows will be refreshed
//					Valid values are: 
//						1 = Use column links to build a filter and filter. 
//									    the subordinate datawindow
//						2 = Use column links as arguments to a datawindow retrival.
//								(*This is mostly intended for Browsing Capabilities.  If the
//								 user will be updating rows as well as using this option,
//								 the modified rows need to be updated thru other means. 
//									(i.e., on pfc_master one could call the pfc_save event
//									 prior to allowing this service to discard the updates.)
//								(*Note: column links must be established in proper order)
//								(*Note: The service does not perform any updates unless
//											instructed so by the developer.)
//						3 = Use column links to cause details to scroll to proper row.
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:  Used to establish how detail datawindows will be refreshed
//
//	   *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_setUseColLinks(...)
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

// Validate passed arguments.
CHOOSE CASE ai_style
	CASE  FILTER, RETRIEVE, SCROLL
		// Good style.
	CASE ELSE
		Return -1
END CHOOSE

// Set the attribute.
ii_collinkuse = ai_style

Return 1
end function

public function integer of_getstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetStyle
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:  		Integer
//  					 1 = FILTER
//	  					 2 = RETRIEVE
//   					 3 = SCROLL
//
//	Description:  This function will return an integer to indicate how 
//					  to use column links to refresh data.
//
//	   Note: Can be called from any datawindow in the linked chain.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_getUseColLinks(...)
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
Return ii_collinkuse
end function

public function integer of_setredraw (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetRedraw
//
//	Access:    		Public
//
//	Arguments: 
//	ab_switch		switch for the dw redraw function.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Performs SetRedraw on the datawindows in the linked chain,
//					  starting with the top-level datawindow.
//
//	   Note: Typically called from the root datawindow to affect all datawindows in
//	   the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

If IsNull(ab_switch) Then
	Return -1
End If

// Call AcceptText on the requesting datawindow.	
If idw_Requestor.SetRedraw(ab_switch) <> 1 Then
	Return -1
End If

// Loop through the valid details and call this function on each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or & 
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return -1
		li_rc = idw_details[li_i].inv_Linkage.of_SetRedraw (ab_switch)
		// If an error occurs, get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function boolean of_iskey (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsKey
//
//	Access:    		public
//
//	Arguments:
//	  as_column			The column for which we need to know if it is a key column
//
//	Returns:   		Boolean
// 					True if column is a key column, otherwise False.
//
//	Description:  Determine if column is a key column.
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

integer	li_upperbound
integer	li_i

if IsNull(as_column) or Len(Trim(as_column))=0 then 
	return False
end if

li_upperbound = UpperBound(is_keycols)
for li_i = 1 to li_upperbound
	if as_column = is_keycols[li_i] then
		return True
	end if
next

// Not found.
return False
end function

public function integer of_deletedetailrows ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DeleteDetailRows
//
//	Access:    		public
//
//	Arguments:		None
//
//	Returns:   		Integer
//		The number of rows deleted/discarded.
//		-1 if an error occurs.
//
//	Description: 
//	Notification that a row has been deleted.
//
//	Note:
//	The pfc_predeleterow should have been called prior to the actual deletion.
// This function is not typically called by the developer.  
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

long		ll_deletedcount
integer	li_numdetails
integer	li_detail
integer	li_rc
string	ls_reset[]

// Determine how many details are subordinate to the requestor.
li_numdetails = UpperBound ( idw_details ) 

// Loop through the valid details and Refresh each detail.
for li_detail = 1 to li_numdetails 
	If IsNull(idw_details[li_detail]) Or &
		Not IsValid (idw_details[li_detail]) Then Continue
	If IsNull(idw_details[li_detail].inv_Linkage) Or &
		Not IsValid (idw_details[li_detail].inv_Linkage) Then Return FAILURE

	CHOOSE CASE ii_deletestyle
		CASE DEFAULT
			// No Action.
			li_rc = 0

		CASE DELETE_ROWS
			// This will perform Deletes on all Detail rows for the deleted Master row.
			li_rc = idw_details[li_detail].inv_Linkage.of_DeleteRows &
						(True, is_keycols, is_keycolsvalue) 
			
		CASE DISCARD_ROWS
			// This will perform Discards on all Detail rows for the deleted Master row.			
			li_rc = idw_details[li_detail].inv_Linkage.of_DeleteRows &
						(False, is_keycols, is_keycolsvalue) 			
	END CHOOSE
	If li_rc < 0 Then Exit
	ll_deletedcount += li_rc
next

// Reset the key value information.
is_keycolsvalue = ls_reset

if li_rc <0 then 
	Return FAILURE
end if
Return ll_deletedcount
end function

public function integer of_deleterows (boolean ab_delete, string as_masterkeys[], string as_mastervalues[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DeleteRows
//
//	Access:    		public
//
//	Arguments:
//	  ab_delete				Switch which determines if Deletes or Discard operations
//								will be performed.
//   as_masterkeys[]		Column Names from the master row that was deleted.
//	  as_mastervalues[]	Column Values from the master row that was deleted.
//
//	Returns:   		Integer
// 					The number of rows deleted/discarded.
//						-1 if an error occurs.
//
//	Description: 
// Delete the rows that match the master row information.
//	These passed in arrays contain all the relevant information about the
//	master row that was deleted. 	The master dw knows which columns
//	are key values for all its detail datawindows, but it does not know
//	which go with which detail.  So it just passes all the information
//	and lets the detail datawindow figure out which values it needs.
//
//	Note:
// This function is not typically called by the developer.  
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
Integer	li_i
Integer	li_x
Integer	li_upperbound
integer	li_masterupperbound
integer	li_rc
long		ll_deletecount
String	ls_find
Long		ll_row
Long		ll_toprow
boolean	lb_keyfound
string	ls_filter
string	ls_expression

// Validate the arguments.
li_masterupperbound = UpperBound (as_masterkeys)
if li_masterupperbound <> UpperBound (as_mastervalues) or &
	li_masterupperbound = 0 then
	return FAILURE
end if

// Not a valid operation for a root datawindow. 
If of_IsRoot ( ) Then Return FAILURE

// Create the Find expression to match the rows that need to be deleted.
li_upperbound = UpperBound (inv_linkargs.is_mastercolarg)
For li_i = 1 to li_upperbound
	// Get the column data value from the master row that was deleted.  This is found
	// on the arrays that were passed in.
	lb_keyfound = False
	for li_x = 1 to li_masterupperbound
		If inv_linkargs.is_mastercolarg[li_i] = as_masterkeys[li_x] then
			lb_keyfound = True
			ls_expression = as_mastervalues[li_x]
			Exit
		end if
	next	
	if not lb_keyfound Then
		// Required data not found.
		Return FAILURE
	End If
	
	If IsNull(ls_expression) Then ls_expression = ""
	If Not Len(Trim(ls_expression))=0 Then
		// Construct the Find expression.
		If (ls_find <> "") Then ls_find += " And "
		If Pos(Lower(ls_expression), 'null') > 0 Then
			ls_find += 'IsNull('+ inv_linkargs.is_detailcolarg[li_i]+')'
		Else
			ls_find += inv_linkargs.is_detailcolarg[li_i] + " = " + ls_expression	
		End If
	End If
Next 

// Clear out any filter currently on the dw.
If of_GetStyle() = FILTER Then
	ls_filter = idw_requestor.Object.DataWindow.Table.Filter
	If ls_filter <> '' And ls_filter <> '?' Then
		is_filterexp = ""
		idw_requestor.SetFilter("")
		idw_requestor.Filter()
	End If
End If

// -- Loop around the rows that need to be deleted.
ib_cascadingdelete = True
DO
	ll_row = idw_Requestor.Find (ls_find, ll_row, idw_Requestor.RowCount())
	if ll_row > 0 then
		// Notify that the row is going to be deleted.
		li_rc = this.Trigger Event pfc_predeleterow(ll_row)

		// Delete or Discard the row.
		ib_allowfocuschange = True
		If ab_delete Then
			li_rc = idw_requestor.DeleteRow(ll_row)
		Else
			li_rc = idw_requestor.RowsDiscard(ll_row, ll_row, Primary!)
		End If
		ib_allowfocuschange = False
		If li_rc >0 Then ll_deletecount++
		
		// Continue the Delete opearation.
		li_rc = of_DeleteDetailRows()
		If li_rc >0  Then ll_deletecount += li_rc
		
	end if
LOOP WHILE ll_row > 0
ib_cascadingdelete = False

//If IsValid(gnv_app.inv_debug) then
//	gnv_app.inv_debug.of_Message (idw_requestor.ClassName()+'.Linkage.of_DeleteRows'+&
//		' ls_find('+ls_find+')'+' RowCount='+string(idw_requestor.RowCount()) + &
//		' ll_deletecount='+string(ll_deletecount))
//End If

Return ll_deletecount
end function

public function integer of_itemfocuschanged (long al_row, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_ItemFocusChanged
//
//	Access:    	Public
//
//	Arguments: 	
//	  al_row		The row number which just received focus.
//	  as_column	The column name which just received focus.
//						
//
//	Returns:  	Integer
//					 1 = No error found 
//					-1 = An error was found
//
//	Description:  Keep track of the column to get focus.
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

// Validate arguments.
If IsNull(al_row) or al_row < 0 Then Return FAILURE
If IsNull(as_column) or Len(Trim(as_column)) =0 Then Return FAILURE

is_focuscol	= as_column
is_focusval = string( of_GetItemAny (al_row, is_focuscol) )

Return 1
end function

public function integer of_keychanged (long al_row, string as_column, string as_prevvalue, any aa_newvalue);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_KeyChanged
//
//	Access:    	Public
//
//	Arguments: 	
//	  al_row		The row number.
//	  as_column	The keycolumn which just changed.
//	  as_prevvalue
//	  aa_newvalue
//
//	Returns:  	Integer
//	 1 = No error found 
//	-1 = An error was found
//
//	Description:  
//	A key column has just been changed.  Cascade this change to the detail dws.
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

Integer	li_numdetails, li_i, li_rc

// Validate arguments.
if IsNull(al_row) or al_row < 0 then Return FAILURE
if IsNull(as_column) or Len(Trim(as_column)) =0 then Return FAILURE

// Loop through the valid details and request the syncronization.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_KeySync &
				(al_row, as_column, as_prevvalue, aa_newvalue)
		If li_rc < 0 Then Return FAILURE
	End If 
Next 

Return 1
end function

protected function boolean of_getupdatebottomup ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUpdateBottomUp
//
//	Access:    		Protected
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//   					TRUE: Updates are performed from the bottom-up
//  					FALSE: Updates are performed from the top-down
//
//	Description:  	Returns the attribute to indicate the direction of update
//					  	in linked chains.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_GetUpdateStyle().
//	12.5	Added Metaclass Service Obsolete Tag
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
Return ib_updatebottomup
end function

public function integer of_updatebottomupandtopdown ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateBottomUpAndTopDown
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Updates the datawindows in the linked chain, starting with
//         		  the bottom-level datawindow and going up the chain (deletes).
//					  The second pass will be top-level datawindow going down the 
//					  chain (inserts and Updates).
//
//	   Note: This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
// 6.0.01 Corrected 2nd pass sqlspy comment to correctly say (inserts/updates).
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
Integer	li_i
Integer	li_max
boolean	lb_accepttext = False
boolean 	lb_resetflag = False
boolean	lb_insert	
boolean	lb_update
boolean	lb_delete
String	ls_sqlspyheading
String	ls_sqlspymessage
u_dw		ldw_updatedw[]

// Create an array of the linked datawindows for update.
If of_CreateUpdateSequence ( ldw_updatedw ) <> 1 Then Return FAILURE 

// Get the number of datawindows.
li_max = UpperBound ( ldw_updatedw ) 

// -- First loop thru the array; bottom-level datawindow going up the chain.
//    Performing Deletes only.  --
lb_insert = False
lb_update = False
lb_delete = True

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update dual-pass - 1st pass BottomUp (deletes)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

For li_i = li_max to 1 Step -1
	// Update the datawindow.
	If ldw_updatedw[li_i].of_Update &
		(lb_accepttext, lb_resetflag, lb_insert, lb_update, lb_delete) <> 1 Then 
		Return FAILURE
	End If
Next 

// -- Second loop thru the array; top-level datawindow going down the chain.
//    Performing Inserts and Updates only. --
lb_insert = True
lb_update = True
lb_delete = False

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = idw_requestor.ClassName() + '.Linkage'
		ls_sqlspymessage = 'Update dual-pass - 2nd pass ToDown (inserts/updates)'
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

For li_i = 1 to li_max 
	// Update the datawindow.
	If ldw_updatedw[li_i].of_Update &
		(lb_accepttext, lb_resetflag, lb_insert, lb_update, lb_delete) <> 1 Then 
		Return FAILURE
	End If
Next 

Return 1
end function

public function integer of_setsavesound (string as_soundfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetSaveSound
//
//	Access:    	Public
//
//	Arguments:
//  as_soundfile:	The complete filename and path of the file play.
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Used to establish the file that is to be played on a successful save.
//
//	Note:
//	This functionality is only used by the Retrival style.
//	Set to an empty string to have no sound.
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

// Validate passed arguments.
If IsNull(as_soundfile) Then 
	Return -1
End If

// Trim spaces.
as_soundfile = Trim(as_soundfile)

If Len(as_soundfile) > 0 Then
	If Not FileExists(as_soundfile) Then
		Return -1
	End If
End If

is_savesound = as_soundfile
Return 1
end function

public function string of_GetSaveSound ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetSaveSound
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Get the file that is to be played on a successful save.
//
//	   *Note: This functionality is only used by the Retrival style.
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

Return is_savesound
end function

public function integer of_setconfirmondelete (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetConfirmOnDelete
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether deletions will be confirmed first
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether deletions will be confirmed by user first.
//
//	Note: 
//	This functionality is only used when style=Retrieval and updateonrowchange=True.
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

// Validate arguments
if IsNull (ab_switch) then return -1

ib_confirmondelete = ab_switch
return 1
end function

public function integer of_setconfirmonrowchange (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetConfirmOnRowChange
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether row changes (once updates are pending)
//					will be confirmed first
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether row changes (once updates are pending) will be confirmed first.
//
//	Note: 
//	This functionality is only used when style=Retrieval and updateonrowchange=True.
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

// Validate arguments
if IsNull (ab_switch) then return -1

ib_confirmonrowchange = ab_switch
return 1
end function

public function boolean of_isconfirmonrowchange ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsConfirmOnRowChange
//
//	Access:  Public
//
//	Arguments:	None
//
//	Returns:  Boolean
//	 whether row changes (once updates are pending) will be confirmed first.
//
//	Description:
//	Reports whether row changes (once updates are pending) will be confirmed first.
//
//	   *Note: This functionality is only used by the Retrival style.
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
Return ib_confirmonrowchange
end function

public function boolean of_isconfirmondelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsConfirmOnDelete
//
//	Access:  Public
//
//	Arguments:	None
//
//	Returns:  Boolean
//	 whether row deletes will be confirmed first.
//
//	Description:
//	Reports whether row deletes will be confirmed first.
//
//	Note: 
//	This functionality is only used when style=Retrieval and updateonrowchange=True.
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

Return ib_confirmondelete
end function

public function integer of_keysync (long al_row, string as_column, string as_prevvalue, any aa_newvalue);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_KeySync
//
//	Access:    	Public
//
//	Arguments: 	
//	  al_row		The master datawindow row number.
//	  as_column	The master column key that needs to be syncronized.
//	  as_prevvalue The previous value found on the master column 
//	  aa_newvalue 	The new value.
//
//	Returns:  	Integer
//	 1 = No error found 
//	 0 = No action taken
//	-1 = An error was found
//
//	Description:  
//	Syncronize all detail datawindows to the new key value.
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
integer	li_i
integer	li_rc=0
integer	li_upperbound
string	ls_detailcolumn=''
string	ls_find
string	ls_coldata
string	ls_filter=''
long		ll_row=0
boolean	lb_detailcolkey=False
string	ls_value
string	ls_expression
long		ll_rowcount

// Confirm that this master key column is found on this requestor.
li_upperbound = UpperBound (inv_linkargs.is_mastercolarg)
for li_i = 1 to li_upperbound
	if as_column = inv_linkargs.is_mastercolarg[li_i] then
		// Yes, master key column is connected to this dw.
		// Get the corresponding column name for this dw.
		ls_detailcolumn = inv_linkargs.is_detailcolarg[li_i]
		Exit
	end if
next
// Get out now if not found. (nothing to sync.)
if ls_detailcolumn = '' Then
	Return 0
end if

// Determine if this detail column is a key to another detail datawindow(s).
lb_detailcolkey = (of_IsKey(ls_detailcolumn))

// Build the find string to match the master data.
for li_i = 1 to li_upperbound
	
	if as_column = inv_linkargs.is_mastercolarg[li_i] then
		ls_value = as_prevvalue		
	else
		// Get the current value on the master dw (use the master column).
		ls_value = string( idw_master.inv_Linkage.of_GetItemAny &
				(al_row, inv_linkargs.is_mastercolarg[li_i]))		
	end If

	// Build the Expresion with the Detail Column.
	ls_expression = of_BuildExpression (0, inv_linkargs.is_detailcolarg[li_i], '=', ls_value)

	// Build the Find statement.
	If IsNull(ls_expression) or Len(Trim(ls_expression))=0 Then Continue
	If ls_find <> "" Then ls_find += ' AND '
	ls_find += ls_expression
next

//gnv_app.of_debug(idw_requestor.ClassName()+' Linkage.of_SyncKeys '+ &
//	' ls_find{'+ls_find+'} newvalue='+string(aa_newvalue))

// Clear out any filter currently on the dw.
If of_GetStyle() = FILTER Then
	ls_filter = idw_requestor.Object.DataWindow.Table.Filter
	If ls_filter <> '' And ls_filter <> '?' Then
		is_filterexp = ""
		idw_requestor.SetFilter("")
		idw_requestor.Filter()
	End If
End if

// Perform the sync.  Loop row by row make the change(s).
ll_rowcount = idw_Requestor.RowCount()
DO
	ll_row = idw_Requestor.Find (ls_find, ll_row, ll_rowcount)
	if ll_row > 0 then
		li_rc = of_SetItem(ll_row, ls_detailcolumn, String(aa_newvalue))
		If li_rc <= 0 Then Return FAILURE
		if lb_detailcolkey then
			of_KeyChanged (ll_row, ls_detailcolumn, as_prevvalue, aa_newvalue)	
		end if
	end if
LOOP WHILE ll_row > 0

Return li_rc
end function

public function integer of_setmaster (u_dw adw_master);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetMaster
//
//	Access:    		Public
//
//	Arguments:
//   adw_master:	The master datawindow reference
//
//	Returns:   		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  Links the detail datawindow to the master.  Sets its master variable
//					  reference, then calls 'of_LinkDetail' on the master.
//
//	   *Note: This function should only be called from subordinate datawindows.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_LinkTo(...)
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

// Attempt to link the master datawindow. 
If IsValid ( adw_master ) Then 
 	If IsValid ( adw_master.inv_Linkage ) Then 
		If adw_master.inv_Linkage.of_LinkDetail ( idw_Requestor ) = 1 Then 
			// Link the master datawindow.
			idw_master = adw_master
			Return 1
		End If 
	End If 
End If

// No linkage was peformed.
Return -1
end function

public function integer of_resetmaster ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ResetMaster
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description: 
//		Reset the master datawindow. (detail to master reference)
// 	Reset the detail datawindow on the master. (master to detail reference)
//
//	  *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_UnLink(...)
// 6.0 	Corrected - function would unregister more than requested.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1
u_dw		ldw_notvalid	//  Invalid master reference

// This operation is not valid on a root datawindow.
If of_IsRoot() Then Return FAILURE
	
// Verify that the master has started the linkage service.
If IsNull(idw_master.inv_Linkage) Or &
	Not IsValid ( idw_master.inv_Linkage ) Then Return FAILURE

// Tell the master to unregister the master to detail reference.
If idw_master.inv_Linkage.of_UnlinkDetail ( idw_Requestor ) <> 1 Then 
	Return FAILURE
End If

// Unregister the detail to master reference.
idw_master = ldw_notvalid

Return li_rc
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Unregister
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:  		Integer
// 					1 if it succeeds and -1 if an error occurs.
//
//	Description:  This function will remove any 'column linkages' between the 
//               master and detail datawindow
//
//	   Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_ResetArguments(...)
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
String					ls_keycols[]
n_cst_linkageattrib	lnv_linkargs

// Operation is not valid on a root datawindow.
If of_IsRoot() Then Return -1

// Remove column linkages. 
inv_linkargs = lnv_linkargs
is_keycols = ls_keycols
Return 1
end function

public function integer of_setothersaveobjects (powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetOtherSaveObjects
//
//	Access:    		Public
//
//	Arguments:
//   apo_objects:	The objects to add.
//
//	Returns:   		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description: 
//	Set any other object to be updated when UpdateOnRowChange functionality
//	is turned on.  This allows other controls to be updated.  This should not
//	be used to add other datawindows already found on the linkage chain.  All
//	datawindows on the linkage chain are already included.
//
//	Note: 
//	This functionality is only used when style=Retrieval and updateonrowchange=True.
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

// Set the update style.
ipo_othersaveobjects = apo_objects
Return 1
end function

public function integer of_getothersaveobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetOtherSaveObjects
//
//	Access:    		Public
//
//	Arguments:
//		apo_objects[] By reference. The other objects added to the save process.
//
//	Returns:   		Integer
//		# of objects in array.
//
//	Description: 
//		Get any other object to be updated when UpdateOnRowChange functionality
//		is turned on. 
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

apo_objects = ipo_othersaveobjects
Return UpperBound(apo_objects)
end function

public function integer of_updatecustom (integer ai_custom);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateCustom
//
//	Access:    		Public
//
//	Arguments: 		
//		ai_custom 	Allowing for more than one custom update.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Allows for customization of the Update process.  This is 
//		provided by PFC as an empty stub to be coded with specific update
//		functionality.  This function will be triggered by the linkage service
//		when the UpdateStyle is set to CUSTOM.
//
//		Note:	If more than one Custom Update is needed use of_SetCustom().
//
//		Note: If there is any need to customize, this function should be code on
//				the extension layer.
//
//	   Note: This function is not typically called by the developer.  
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
Return FAILURE
end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'Linkage'
anv_infoattrib.is_description = &
	'Service for linking DataWindow actions. This is typically used for '+&
	'Master/Detail processing but can be used for other purposes. This object '+&
	'includes functions that help you coordinate typical DataWindow functions '+&
	'among groups of related DataWindows.'

Return 1
end function

public function integer of_GetDeleteStyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetDeleteStyle
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		Integer
//						The delete style.
//
//	Description:  Get the Delete Style.
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
Return ii_deletestyle
end function

public function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUpdateRequestor
//
//	Access:    		Public
//
//	Arguments:
//   apo_updaterequestor	The object which is requesting an update within a 
//				transaction.  Or an invalid reference to clear the reference.
//
//	Returns:   		Integer
//   	1 if it succeeds and -1 if an error occurs.
//
//	Description: 
//		Associates the object which is requesting an update within a transaction.
//		Or clears the reference to mean there is no current object requesting an
//		update within a transaction.
//
//	   Note: Typically called from the root datawindow to affect all datawindows in
//	   the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Checking for a valid apo_updaterequestor is not desired.

// Set the transaction object on the requesting datawindow.
If idw_Requestor.of_SetUpdateRequestor(apo_updaterequestor) <> 1 Then Return -1

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
 		If IsNull(idw_details[li_i].inv_Linkage) Or & 
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return -1
		li_rc = idw_details[li_i].inv_Linkage.of_SetUpdateRequestor(apo_updaterequestor)
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function integer of_updateprep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	
//	of_UpdatePrep
//
//	Access:    	Public
//
//	Arguments: 	None
//
//	Returns:  	Integer
//	1 = No error found during update preparation.
//	-1 = An error was found during update preparation.
//
//	Description:  
//	Prepare each control on the chain.  Stop if an error is found.
//
//	Note:	
//	Typically called from the root datawindow to affect all datawindows in 
//	the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails, li_i, li_rc=1

// Prepare for Update.
If idw_Requestor.Event pfc_UpdatePrep() < 0 Then 
	Return FAILURE
End If 

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then 
		If IsNull(idw_details[li_i].inv_Linkage) Or &
			Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_UpdatePrep()
		If li_rc < 0 Then Return li_rc
	End If 
Next 

Return li_rc
end function

public function integer of_setcustomupdate (integer ai_custom);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetCustomUpdate
//
//	Access:    	Public
//
//	Arguments:
//   ai_custom	Custom update identifier (1 through 9)
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Used to establish more than one type of CUSTOM update.
//
//	   *Note: This value is used for CUSTOM Updates.  It allows for more than
//					one custom update.  Look in of_Update(...) and of_UpdateCustom(...) 
//					for its usage.
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

// Validate passed arguments.
If IsNull(ai_custom) or ai_custom <= 1 Or ai_custom >= 9 Then 
	Return -1
End If

// Set the attribute.
ii_customupdate = ai_custom
Return 1
end function

public function integer of_GetCustomUpdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetCustomUpdate
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Integer
// 			  	The current CUSTOM Update.
//
//	Description:  Get the CUSTOM update attribute.
//
//	   *Note: This value is used for CUSTOM Updates.  It allows for more than
//					one custom update.  Look in of_Update(...) and of_UpdateCustom(...) 
//					for its usage.
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

Return ii_customupdate
end function

public function boolean of_confirmonrowchange ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ConfirmOnRowChange
//
//	Access:  Public
//
//	Arguments:	None
//
//	Returns: boolean 
//	stating if confirmation is needed.
//
//	Description:
//	Determine by looking at the linked dws, if current dw requires confirmation
//	on RowChange.
//
//	Note: 
//	This functionality is only used by the Retrival style.
//	This function is not typically called by the developer.  
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

integer	li_numdetails
integer	li_i

// Determine if current dw requires Updates to occur on RowChange.
If of_GetStyle() = RETRIEVE And of_IsConfirmOnRowChange() Then
	Return True
End If

// Determine if any Detail requires Updates to occur on RowChange.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsNull(idw_details[li_i]) Or Not IsValid (idw_details[li_i]) Then Continue
	If IsNull(idw_details[li_i].inv_Linkage) Or & 
	 	Not IsValid (idw_details[li_i].inv_Linkage) Then Return False
	
	If idw_details[li_i].inv_Linkage.of_ConfirmOnRowChange() Then
		Return True
	End If
Next 

Return False
end function

protected function integer of_checkrequired (dwbuffer adw_buffer, ref long al_row, ref integer ai_col, ref string as_colname, boolean ab_updateonly);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CheckRequired 
//
//	Access:  Protected
//
//	Arguments:
//	adw_buffer   The buffer to check for required fields
// al_row   First row to be checked.  Also stores the number of the found row
//	ai_col   First column to be checked.  Also stores the number of the found column
//	as_colname   Contains the columnname in error
//
//	Returns:  integer
//	 1 = The required fields test was successful, check arguments for required fields missing
//	 0 = The required fields test was successful and no missing data was found
//  -1 = The FindRequired failed
//
//	Description:
//	Calls the FindRequired function to determine if any of the required
//	columns contain null values.
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

long		ll_originalrow
string	ls_msgparm[2]

// Check required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return FAILURE
End If

// Check arguments
if IsNull (adw_buffer) or IsNull (al_row) or IsNull (ai_col) or IsNull (as_colname) then
	return FAILURE
end if

SetPointer(HourGlass!) 
ll_originalrow = al_row

// Call FindRequired to locate first missing, if any
if idw_requestor.FindRequired (adw_buffer, al_row, ai_col, as_colname, ab_updateonly) < 0 then
	return FAILURE
end if

// Check if an missing was found.
if al_row <> 0 then
	
	If al_row = ll_originalrow Then
		If IsValid(gnv_app.inv_error) Then
			ls_msgparm[1] = as_colname
			ls_msgparm[2] = String (al_row)
			gnv_app.inv_error.of_Message('pfc_dwlinkage_requiredmissing', ls_msgparm, &
					gnv_app.iapp_object.DisplayName)
		Else
			of_MessageBox ('pfc_linkage_checkrequiredmissing', gnv_app.iapp_object.DisplayName, &
				"Required value missing for " + &
				as_colname + " on row "  + String (al_row) + &
				".  Please enter a value.", information!, Ok!, 1)
		End If
		idw_requestor.SetColumn (ai_col)
		idw_requestor.SetFocus () 		
	Else
		Return FAILURE
	End If
	//	 1 = Check arguments for required fields missing
	return 1
end if

//	 0 = No missing data was found
return 0
end function

protected function integer of_save (long al_validaterow, boolean ab_prompt);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Save
//
//	Access:    		protected
//
//	Arguments:
//	 al_validaterow	If >0 then the row to be tested.
//							if <=0 then there is no row to be tested.
//	 ab_prompt	If the user should be prompted.
//
//	Returns:   		Integer
//		3 if the save operation was cancelled for any reason.
//		2 if the user choose to not have an update and loose 
//			any pending changes.
//		1 if the save operation was successful.
//		0 if there are no updates pending.
//		-1 if an error occurs.
//
//	Description: 
//	Perform the save process.
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

//constant	integer	NO_ACTION = 0
constant	integer	NO_UPDATE = 2
constant	integer	CANCEL = 3

Integer 	li_rc
integer 	li_i
integer	li_option
string	ls_msgparm[]
string	ls_option
long		ll_checkrow
integer	li_checkcolumn
string	ls_checkcolname
boolean	lb_updateonly = True
integer	li_upper
integer	li_cnt
w_master	lw_obj
u_dw		ldw_root
powerobject lpo_saveobjects[]

// Validate the arguments.
If IsNull(al_validaterow) or IsNull(ab_prompt) Then
	Return FAILURE
End if

// Validate the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return FAILURE
End If

// Get the root datawindow.
of_FindRoot(ldw_root) 		
If IsNull(ldw_root) or NOt IsValid(ldw_root) Then 
	Return FAILURE
End If
		
// Get the parent window.		
idw_requestor.Function of_GetParentWindow(lw_obj)
If IsNull(lw_obj) or Not IsValid(lw_obj) Then
	Return FAILURE
End If

// Make sure all data has been accepted.
li_rc = of_AcceptText (True)
If li_rc <=0 Then 
	Return CANCEL
End If

// Determine if there are any updates pending.
li_rc = of_GetUpdatesPending ()
If li_rc <0 Then 
	Return CANCEL
End If

// Check if there are updates pending.
If li_rc = 0 Then 
	Return NO_ACTION
End If

// -- Updates are pending. --

// Determine, if there is a specific row that needs to be validated.
If al_validaterow > 0 Then
	// Check for Missing Required Fields on the row.
	ll_checkrow = al_validaterow
	li_checkcolumn = 1
	li_rc = of_CheckRequired &
			(primary!, ll_checkrow, li_checkcolumn, ls_checkcolname, lb_updateonly)
	if (li_rc < 0) or (ll_checkrow = al_validaterow) Then
		// There was an error or missing data.
		Return CANCEL
	End If

	// Perform dw specific validation.
	li_rc = idw_requestor.Event pfc_RowValidation (al_validaterow) 
	If li_rc <= 0 Then 
		// There was an error validating the data. 
		Return CANCEL
	End If
End If

// Prompt the user about the change?
If ab_prompt Then
	If of_ConfirmOnRowChange() Then
		If IsValid(gnv_app.inv_error) Then
			li_option = gnv_app.inv_error.of_Message('pfc_dwlinkage_rowchanging', ls_msgparm, &
							gnv_app.iapp_object.DisplayName)
		Else
			li_option = of_MessageBox('pfc_linkage_savenow', gnv_app.iapp_object.DisplayName, &
							'Updates are pending. ~r~nSave them now?', Exclamation!, YesNoCancel!, 1)
		End If
	Else
		li_option = 1
	End If
	
	If li_option = 2 Then 
		// 'No button'  No update wanted, loose all pending updates.
		Return NO_UPDATE
	ElseIf li_option >= 3 Then
		// 'Cancel button' Don't want to save but  keep all pending updates.
		Return CANCEL
	End If
End If
	
// Set the objects to be saved by the Window save process.
lpo_saveobjects[1] = ldw_root

// Add any other objects which have been requested for the save.
li_upper = UpperBound (ipo_othersaveobjects)
For li_cnt = 1 to li_upper
	lpo_saveobjects[li_cnt +1] = ipo_othersaveobjects[li_cnt]
Next

// Save the requested objects.
li_rc = lw_obj.Event pfc_SaveObjects (lpo_saveobjects)
If li_rc < 0 Then
	Return FAILURE
ElseIf li_rc = 0 Then
	Return NO_ACTION
End If

// Successfulsave was performed.
If Len(is_savesound) > 0 Then
	If IsNull(inv_platform) or Not IsValid(inv_platform) Then
		// Start the appropriate platform service.
		f_SetPlatform (inv_platform, True)
	End If
	If IsValid(inv_platform) Then
		inv_platform.of_PlaySound(is_savesound, True)
	End If	
End If

Return SUCCESS
end function

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_PostUpdate
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	
//	Perform Post Update processing on the datawindows in the linked chain,
//	starting with the top-level datawindow.
//
//	Note:
//	Typically called from the root datawindow to affect all datawindows
//	in the chain, but may be started anywhere in the chain.
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
Integer	li_numdetails
Integer	li_i
Integer	li_rc=1

// Validate required reference.
If IsNull(idw_Requestor) or Not IsValid(idw_Requestor) Then Return FAILURE

// Execute the Post Update process on the requesting datawindow.
If idw_Requestor.Event pfc_postupdate() <> 1 Then 
	Return FAILURE
End If

// Loop through the valid details and call this function on the each detail.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsValid ( idw_details[li_i] ) Then
 		If IsNull(idw_details[li_i].inv_Linkage) Or &
		 	Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
		li_rc = idw_details[li_i].inv_Linkage.of_PostUpdate ( ) 
		// If error, then get out now.
		If li_rc <> 1 Then Exit
	End If 
Next 

Return li_rc
end function

public function boolean of_IsUpdateOnRowChange ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsUpdateOnRowChange
//
//	Access:    	Public
//
//	Arguments:
//  ab_switch:	Determines the 
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Used to establish if the Retrieval Style - Update on Row change functionality
// is on or not.
//
//	   *Note: This functionality is only used by the Retrival style.
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
Return ib_updateonrowchange
end function

public function integer of_setupdateonrowchange (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetUpdateOnRowChange
//
//	Access:    	Public
//
//	Arguments:
// ab_switch	Tell the Retrieval Style if Update on Row change functionality
// 		is on or not.
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Used to establish if the Retrieval Style - Update on Row change functionality
// is on or not.
//
//	Note:
//	This functionality is only used by the Retrival style.
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

// Validate passed arguments.
If IsNull(ab_switch ) Then 
	Return -1
End If

ib_updateonrowchange = ab_switch
Return 1
end function

public function boolean of_updateonrowchange ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_UpdateOnRowChange
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	boolean 
//	stating if current dw requires Updates to occur on RowChange.
//
//	Description:
//	Determine by looking at the linked dws, if current dw requires Updates to
//	occur on RowChange.
//
//	Note: 
//	This functionality is only used by the Retrival style.
//	This function is not typically called by the developer.  
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
integer	li_numdetails
integer	li_i

// Determine if current dw requires Updates to occur on RowChange.
If of_GetStyle() = RETRIEVE And of_IsUpdateOnRowChange() Then
	Return True
End If

// Determine if any Detail requires Updates to occur on RowChange.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsNull(idw_details[li_i]) Or Not IsValid (idw_details[li_i]) Then Continue
	If IsNull(idw_details[li_i].inv_Linkage) Or & 
	 	Not IsValid (idw_details[li_i].inv_Linkage) Then Return False
			 
	If idw_details[li_i].inv_Linkage.of_UpdateOnRowChange() Then
		Return True
	End If
Next 

Return False
end function

public function integer of_setsynconkeychange (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetSyncOnKeyChange
//
//	Access:    	Public
//
//	Arguments:
// ab_switch		Syncronize on Key change or not.
//
//	Returns:   	Integer
// 1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Syncronize on Key change or not.
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

// Validate passed arguments.
If IsNull(ab_switch ) Then 
	Return -1
End If

ib_synconkeychange = ab_switch
Return 1
end function

public function boolean of_issynconkeychange ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsSyncOnKeyChange
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	boolean
// Status of the Syncronize on Key Change.
//
//	Description:
//	Get s the Syncronize on Key change status.
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

Return ib_synconkeychange
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description + &
	'~r~n~r~nService cannot the enabled or disabled via the property window.'

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvlinkage', &
	'u_tabpg_dwproperty_srvlinkage2'}
anv_attrib.ib_switchbuttons = False

Return 1
end function

public function integer of_getmaster (ref u_dw adw_master);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetMaster
//
//	Access:    		Public
//
//	Arguments:
//   adw_master:	(by ref.) The master datawindow reference
//
//	Returns:   		Integer
//	1 if it succeeds and returns the master reference.
// -1 if there is no master reference.
//
//	Description: 
//	Returns the master datawindow.
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

u_dw ldw_notvalid

If IsValid(idw_master) Then
	adw_master = idw_master
	Return 1
End If

adw_master = ldw_notvalid
Return FAILURE
end function

public function integer of_getregistered (ref n_cst_linkageattrib anv_linkargs);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegistered
//
//	Access:    		Public
//
//	Arguments:
//   anv_linkargs:  An instance of the NVO class (Passed by reference)
//						  to hold the linkage argument values.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Return the NVO class containing the master/detail 
//						column links (or arguments )
//					  	The arguments are set in 'of_Register'
//
//	   Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_getArguments(...)
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
anv_linkargs = inv_linkargs 

Return 1
end function

public function boolean of_confirmondelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ConfirmOnDelete
//
//	Access:  Public
//
//	Arguments:	None
//
//	Returns: boolean 
//	stating if confirmation is needed.
//
//	Description:
//	Determine by looking at the linked dws, if current dw requires confirmation
//	on Delete.
//
//	Note: 
//	This functionality is only used by the Retrival style.
//	This function is not typically called by the developer.  
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
integer	li_numdetails
integer	li_i

// Determine if current dw requires Updates to occur on RowChange.
If of_GetStyle() = RETRIEVE And of_IsConfirmOnDelete() Then
	Return True
End If

// Determine if any Detail requires Updates to occur on Delete.
li_numdetails = UpperBound ( idw_details ) 
For li_i = 1 to li_numdetails 
	If IsNull(idw_details[li_i]) Or Not IsValid (idw_details[li_i]) Then Continue
	If IsNull(idw_details[li_i].inv_Linkage) Or & 
	 	Not IsValid (idw_details[li_i].inv_Linkage) Then Return False
	
	If idw_details[li_i].inv_Linkage.of_ConfirmOnDelete() Then
		Return True
	End If
Next 

Return False
end function

protected function integer of_undomodified ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UndoModified
//
//	Access:    		Protected
//
//	Arguments: 		None
//
//	Returns:   		Integer
// # of rows that were modified.
//	-1 error 
//
//	Description:  
//	Performs the necessary actions to loose all changes in the current
//	datawindow.
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
integer	li_modcnt
integer	li_fnrc
integer	li_idx
long		ll_row = 0
long		ll_colcnt = 0
long		ll_currrow
string	ls_null
dwItemStatus le_rowstatus
dwItemStatus le_colstatus

SetNull(ls_null)

// Check required references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Get and validate the number of columns in the datawindow.
ll_colcnt = Integer( idw_requestor.Describe('DataWindow.Column.Count'))
If ll_colcnt = 0 Then Return 0

// Loop around all the modified rows.
Do 
	// Get the next row that has been modified.
	ll_row = idw_requestor.GetNextModified ( ll_row, Primary!)
	If ll_row <= 0 Then Exit

	// Get the row information.
	ll_currrow = idw_requestor.GetRow()
	le_rowstatus = idw_requestor.GetItemStatus(ll_row, 0, Primary!)

	If le_rowstatus = DataModified! Then
		// -- Reset the data to the original values. --
		For li_idx = 1 to ll_colcnt
			If idw_requestor.Object.Data.Primary[ll_row, li_idx] <> &
				idw_requestor.Object.Data.Original[ll_row, li_idx] Then
				idw_requestor.Object.Data.Primary[ll_row, li_idx] = &
					idw_requestor.Object.Data.Original[ll_row, li_idx]
			End If
		Next
		// This will convert DataModified row to NotModified.
		idw_requestor.SetItemStatus(ll_row, 0, Primary!, NotModified!)	
	Else // NewModified!
		// Reset the row to a New! row.
		For li_idx = 1 to ll_colcnt
			le_colstatus = idw_requestor.GetItemStatus(ll_row, li_idx, Primary!)
			If le_colstatus = NewModified! or le_colstatus = DataModified! Then
				li_fnrc = of_SetItem(ll_row, li_idx, ls_null)
				If li_fnrc <> 1 Then Return FAILURE
			End If
		Next
		// This will convert NewModified! row to New!.
		idw_requestor.SetItemStatus(ll_row, 0, Primary!, NotModified!)	
		// Make sure the row has the right key values.
		of_SetKeyValues (ll_row)
	End If
	
	li_modcnt ++
	
Loop Until ll_row <= 0

Return li_modcnt
end function

public function integer of_SetStatusOnInsertRow (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetStatusOnInsertRow
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether the row status will be set to New! on 
//					inserted rows.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the row status will be set to New! on inserted rows.
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

// Validate arguments
if IsNull (ab_switch) then return -1

ib_statusoninsertrow = ab_switch
return 1
end function

public function boolean of_isstatusoninsertrow ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsStatusOnInsertRow
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether the row status will be set to New! on 
//					inserted rows.
//
//	Returns:  boolean
//	specifies whether the row status will be set to New! on inserted rows.
//
//	Description:
//	Reports whether the row status will be set to New! on inserted rows.
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

return ib_statusoninsertrow
end function

public function integer of_register (string as_masterarg, string as_detailarg);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:    		Public
//
//	Arguments:
//   as_masterarg:	A string containing the columnname in the master
//                   that is a linkage argument
//   as_detailarg:	A string containing the columnname in the detail
//                   that is a linkage argument matched with the as_masterarg
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//		This function will register the columns between the master and the detail 
//		that link these two datawindows.  These do not necessarily have to 
//		correspond with datawindow retrieval arguments.
//
//		Call this function multiple times for multiple column arguments.
//
//	   *Note: This function should only be called from subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_setArguments(...)
// 7.0	CR186541.  Removed following validation:
//				ls_id = idw_requestor.Describe(as_detailarg+".ID")
//				If Not IsNumber(ls_id) Then Return FAILURE
//			Detail arguments do not have to be a column.
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

Integer	li_newupper
String	ls_id

// Verify required reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return FAILURE

// Trim the arguments.
as_masterarg = Trim(as_masterarg)
as_detailarg = Trim(as_detailarg)

// Verify passed arguments.
If IsNull(as_masterarg) or Len(as_masterarg)=0 Then Return FAILURE
If IsNull(as_detailarg) or Len(as_detailarg)=0 Then Return FAILURE

// Check service.
If IsNull(idw_master) Or Not IsValid(idw_master) Then Return FAILURE
If IsNull(idw_master.inv_Linkage) Or &
	Not IsValid (idw_master.inv_Linkage) Then Return FAILURE

// Check to make sure they are columns.
ls_id = idw_master.Describe(as_masterarg+".ID")
If Not IsNumber(ls_id) Then Return FAILURE

// Establish the boundaries of the array.
li_newupper = UpperBound ( inv_linkargs.is_mastercolarg ) + 1

// Set the columns.
inv_linkargs.is_mastercolarg[li_newupper] = as_masterarg
inv_linkargs.is_detailcolarg[li_newupper] = as_detailarg

// Tell the master that these column links are the master's key columns used 
//	to determine if a refresh of details is necessary.
Return idw_master.inv_Linkage.of_SetKeyCols (as_masterarg)
end function

public function integer of_accepttext ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AcceptText
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
// 					1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Performs AcceptText on the datawindows in the linked chain,
// starting with the top-level datawindow.
//
// Note:
//	lb_focusonerror=False indicates that focus should Not be set 
//	to the DW if an error is found.
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

Boolean lb_focusonerror=False

Return  of_AcceptText (lb_focusonerror)
end function

protected function string of_getvalue (long al_row, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetValue
//
//	Access:    		Protected
//
//	Arguments:
//	  al_row:    	The row for which the value is desired.
//   as_column: 	The columnname for which the value is desired.
//
//	Returns:  		String
//	  					The value in passed row/column formatted for use in 
//						datawindow expressions.
//
//	Description:	Extracts the data from the master's row and column, properly
//					 	formatted for use in datawindow expressions.
//
//	   *Note: This function is not typically called by the developer.  
//          Used internally to refresh subordinate datawindows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Replaced of_GetItem(...) call with of_GetItemAny(...) to get the column
//			data from the master.
//	5.0.03 Added Quote to date, datetime, and time strings.
// 6.0   Function is no longer used by service.  Obsoleted.
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
String	ls_string

// Verify passed arguments.
If al_row<=0 or Len(Trim(as_column))=0 or IsNull(as_column) Then Return ""
If al_row > idw_master.RowCount() Then Return ""

// Verify that master has linkage service available.
If IsNull(idw_master.inv_Linkage) Or &
	Not IsValid (idw_master.inv_Linkage) Then Return ""

// Get the string value.
ls_string = string( idw_master.inv_Linkage.of_GetItemAny (al_row, as_column) )

// Wrap the string with datatype conversion functions, so that
// the value is valid in Filter and Find expressions.
//	Note: a number value does not need any special handling.
Choose Case Lower ( Left ( idw_master.Describe ( as_column + ".ColType" ) , 5 ) )

	Case "char("	
		// CHARACTER DATATYPE
		ls_string = "'" + ls_string + "'"
	
	Case "date"					
		// DATE DATATYPE
		ls_string = "Date('" + ls_string  + "')" 

	Case "datet"				
		// DATETIME DATATYPE
		ls_string = "DateTime('" + ls_string + "')" 

	Case "time", "times"		
		// TIME DATATYPE
		ls_string = "Time('" + ls_string + "')" 

End Choose

Return ls_string
end function

public function integer of_undomodified (boolean ab_all);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_UndoModified
//	Arguments: 				boolean 		Undo all datawindows in the chain
//	Returns:   				Integer		1 if successful, -1 error
//	Description:  			Performs the necessary actions to loose all changes in the datawindow chain.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:			Version
//								8.0   Initial version
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
Integer	li_numdetails, li_i, li_rc=1

dwItemStatus le_rowstatus
dwItemStatus le_colstatus

/*  Undo modifications on this DW  */
li_rc = of_UndoModified ( ) 

If ab_all Then 
	// Loop through the valid details and call this function on each detail.
	li_numdetails = UpperBound ( idw_details ) 
	For li_i = 1 to li_numdetails 
		If IsValid ( idw_details[li_i] ) Then
			If IsNull(idw_details[li_i].inv_Linkage) Or Not IsValid ( idw_details[li_i].inv_Linkage ) Then Return FAILURE
			li_rc = idw_details[li_i].inv_Linkage.of_UndoModified (ab_all)
			// If an error occurs, get out now.
			If li_rc <> 1 Then Exit
		End If 
	Next 
End If

Return li_rc
end function

on pfc_n_cst_dwsrv_linkage.destroy
call super::destroy
end on

on pfc_n_cst_dwsrv_linkage.create
call super::create
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	Description:  	Linkage Service
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
end event

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Destructor
//
//	Description:  	Service Cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Added Platform cleanup.
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

// Destroy the appropriate platform service.
f_SetPlatform (inv_platform, False)
end event

