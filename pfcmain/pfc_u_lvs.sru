HA$PBExportHeader$pfc_u_lvs.sru
$PBExportComments$PFC Service Based Listview class
forward
global type pfc_u_lvs from listview
end type
end forward

global type pfc_u_lvs from listview
integer width = 325
integer height = 268
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 12632256
event pfc_prermbmenu ( ref m_lvs am_view )
event type integer pfc_newitem ( )
event type integer pfc_deleteitem ( )
event type integer pfc_accepttext ( powerobject apo_control[],  boolean ab_focusonerror )
event type integer pfc_updatespending ( powerobject apo_control[],  ref powerobject apo_pending[] )
event type integer pfc_validation ( powerobject apo_control[] )
event type integer pfc_updateprep ( powerobject apo_control[] )
event type integer pfc_update ( powerobject apo_control[],  boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_postupdate ( powerobject apo_control[] )
event pfc_preinsertitem ( n_ds ads_obj,  long al_row,  ref listviewitem alvi_item )
event pfc_predeleteitem ( integer ai_index )
event type integer pfc_undo ( )
event type integer pfc_selectall ( )
event type integer pfc_properties ( )
event type long pfc_refresh ( )
event type integer pfc_invertselection ( )
event type integer pfc_renameitem ( )
event rbuttonup pbm_rbuttonup
event contextmenu pbm_contextmenu
event type long pfc_populate ( )
event type long pfc_retrieve ( ref n_ds ads_data )
event type long pfc_addall ( n_ds ads_source )
event type integer pfc_insertitem ( n_ds ads_source,  long al_row,  string as_position,  integer ai_index )
event type integer pfc_additem ( n_ds ads_source,  long al_row )
event type integer pfc_setitemattributes ( n_ds ads_obj,  long al_row,  ref listviewitem alvi_item )
event keydown pbm_keydown
event type integer pfc_refreshitem ( integer ai_index )
event pfc_prerefreshitem ( integer ai_index,  n_ds ads_obj,  long al_row,  ref listviewitem alvi_item )
end type
global pfc_u_lvs pfc_u_lvs

type variables
Public:
Constant Integer	CONTINUE_ACTION = 1
Constant Integer	PREVENT_ACTION = 0
Constant Integer	NO_ACTION = 0

Constant String	INSERT_FIRST = "first"
Constant String	INSERT_LAST = "last"
Constant String	INSERT_BEFORE = "before"
Constant String	INSERT_AFTER = "after"

n_cst_lvsrv		inv_base
n_cst_lvsrv_sort		inv_sort
n_cst_lvsrv_datasource	inv_datasource

Protected:
boolean		ib_IsObsolete
boolean	ib_rmbmenu=True
long	il_rightclicked

// Logical Unit of Work -  SelfUpdatingObject - Save Process - (Attributes).
boolean		ib_isupdateable = False
boolean		ib_alwaysvalidate = false // Save process flag to include all objects in validation process.
powerobject	ipo_updaterequestor
powerobject	ipo_pendingupdates[]
n_cst_luw	inv_luw

end variables

forward prototypes
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setdatasource (boolean ab_switch)
public function integer of_setupdateable (boolean ab_isupdateable)
public function integer of_setlogicalunitofwork (boolean ab_switch)
public function boolean of_isupdateable ()
public function integer of_accepttext (boolean ab_focusonerror)
public function integer of_updatespending ()
public function integer of_validation ()
public function integer of_updateprep ()
public function boolean of_isalwaysvalidate ()
public function integer of_postupdate ()
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor)
public function integer of_setupdaterequestor (powerobject apo_updaterequestor)
public function integer of_getupdaterequestor (ref powerobject apo_updaterequestor)
public function integer of_update (boolean ab_accepttext, boolean ab_resetflag)
public function integer of_setbase (boolean ab_switch)
public function integer of_Setalwaysvalidate (boolean ab_validate)
protected function integer of_getobjects (ref powerobject apo_objects[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_setsort (boolean ab_switch)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_insertitem (ref n_ds ads_obj, long al_row)
public function integer of_insertitem (ref n_ds ads_obj, long al_row, string as_position, integer ai_index)
public function integer of_insertitem (any aa_columnvalues[], string as_position, integer ai_index)
public function integer of_additem (any aa_columnvalues[])
public function integer of_insertitem (any aa_columnvalues[])
public function integer of_getrow (integer ai_index, ref n_ds ads_obj, ref long al_row)
public function integer of_reset ()
public function integer of_getcolumninfo (integer ai_column, ref n_cst_columnattrib anv_columnattrib)
public function boolean of_canundo (ref string as_undotype)
public function integer of_setrmbmenu (boolean ab_switch)
public function boolean of_isrmbmenu ()
public function long of_retrieve (any aa_args[20], ref n_ds ads_data)
public function long of_populate ()
end prototypes

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_PreRMBMenu
//
//	Arguments:	
//	am_view		The popup menu about to display.  
//
//	Returns:		None
//
//	Description:	Use this event to change menu item attributes before the menu displays.
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

end event

event pfc_newitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_newItem
//
//	Arguments:	None
//
//	Returns:		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	
//	Description:	Add an item to the listview.
//
//	Note:	This is a placeholder event for you to use if you need the functionality
//
//		If using a listview to add a new item not already in the datastore, then
//		create a local datastore with the same source as the listview.  Open a 
//		response window with the edit field information.  Return the new data to
//		your local datastore and call inv_datasource.of_insertitem() for each row of
//		data in your local datastore
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

Return -1
end event

event pfc_deleteitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_deleteItem
//
//	Arguments:	none
//
//	Returns:		Integer
//			 # of items deleted successfuliy
//			 0 - no item was deleted
//			-1 = error
//
//	Description:
//	Deletes the selected row(s) of the listview and syncs the datastore
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
Integer		li_selected, li_counter=0

// Use the service if it is on
If isvalid(inv_datasource) Then
	Return inv_datasource.event pfc_deleteitem()
End If

// only perform delete if we have items selected
If this.TotalSelected() < 1 Then Return NO_ACTION

// find the first selected item
li_selected = this.SelectedIndex()

//Loop and delete the selected items.
DO WHILE li_selected > 0
	this.event pfc_predeleteitem(li_selected)
	this.Deleteitem(li_selected)
	li_counter++

	// Get handle to next selected item - when an item is deleted, listview count is reset
	// so we have to start from the top again
	li_selected = this.FindItem(0, Directiondown!, False, True, False, False)
LOOP 

Return li_counter


end event

event pfc_accepttext;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_AcceptText
//
//	Arguments:
//	apo_control[]		The controls on which to perform functionality.
//	ab_focusonerror   Should focus be set to object in error
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Accepttext functionality
//	on the array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	Return inv_luw.of_AcceptText(apo_control, ab_focusonerror)
End If

Return -1
end event

event pfc_updatespending;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_UpdatesPending
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//	apo_pending[]	The controls on which have updates pending.  passed by reference
//
//	Returns:  integer
//	 1 = updates are pending (no errors found)
//	 0 = No updates pending (no errors found)
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to determine which objects have
//	UpdatesPending.  Store references in pending array.
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

constant integer NO_UPDATESPENDING =0
Integer	li_rc
PowerObject lpo_pending[]
powerobject lpo_updatearray[]

// Clear the pending by reference array.
apo_pending = lpo_pending

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_UPDATESPENDING
If Not of_IsUpdateable() Then Return NO_UPDATESPENDING

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	li_rc = inv_luw.of_UpdatesPending(apo_control, lpo_pending)
	apo_pending = lpo_pending
	Return li_rc
End If

Return -1

end event

event pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_validation
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Validation functionality
//	on the array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	Return inv_luw.of_Validation(apo_control)
End If

Return -1
end event

event pfc_updateprep;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_updateprep
//
//	Arguments:	
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform Update Preparation
//	functionality on the array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	Return inv_luw.of_UpdatePrep(apo_control)
End If

Return -1
end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_update
//
//	Arguments:
//	apo_control[]	The controls on which to perform functionality.
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//
//	Returns:   integer
//	 1 = all updates successful
//	-1 = At least one update failed
//
//	Description:
//	Request the Logical Unit of Work service to perform Update functionality
//	on the array.
//
//	Note:
//	This function will update objects in the order in which they are found in
//	the array.  
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION
If Not of_IsUpdateable() Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	Return inv_luw.of_Update(apo_control, ab_accepttext, ab_resetflag)
End If

Return -1
end event

event pfc_postupdate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_postupdate
//
//	Arguments:
//	apo_control[]	The controls on which to perform functionality.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Request the Logical Unit of Work service to perform PostUpdate functionality
//	on the array.
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

// Make sure there is something to take action on.
If UpperBound(apo_control) = 0 Then Return NO_ACTION

// Let Logical Unit of Work Service perform the functionality (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)

If IsValid(inv_luw) Then
	Return inv_luw.of_PostUpdate(apo_control)
End If

Return -1
end event

event pfc_preinsertitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_PreInsertItem
//
//	Arguments:	
//	ads_obj		Datastore holding Listview item information
//	al_row		Row in datastore pointing to Listview Item
//	alvi_item	Listview item about to be inserted.  
//						Passed by Reference
//
//	Returns:		None
//
//	Description:	Set the default attributes for the listview item.  
//
//		Note:		Extend this event to change item attributes before it is inserted 
//					into the listview
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



end event

event pfc_predeleteitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_PreDeleteItem
//
//	Arguments:	
//	ai_index		Index to listview item about to be deleted.  
//
//	Returns:		None
//
//	Description:	Use this event to perform logic prior to the item being deleted.
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

end event

event pfc_undo;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Undo
//
//	Arguments:	None
//
//	Returns:		integer
//	 1 = success; 
//	-1 = error
//
//	Description:	Restore the last listview change.  
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

if isvalid(inv_datasource) then
	return inv_datasource.event pfc_undo()
end if

return -1
end event

event pfc_selectall;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  pfc_selectall
//
//	Arguments: None
//
//	Returns:   Integer
//
//	Description:  Selects (highlights) all items
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

long	ll_max
long	ll_i
listviewitem	llvi_item

// Get the row count.
ll_max = this.TotalItems() 

// Prevent flickering and improve performance.
This.SetReDraw ( FALSE ) 

// Invert row by row.
FOR ll_i = 1 to ll_max
	this.GetItem( ll_i, llvi_item )
	llvi_item.selected = TRUE
	this.SetItem( ll_i, llvi_item )
NEXT 

// Prevent flickering and improve performance.
this.SetReDraw ( TRUE ) 

Return 1


end event

event pfc_properties;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_properties
//
//	Arguments:	None
//
//	Returns:		integer
//
//	Description:	Invoke a properties type dialog.
//
//	Note:	This is a placeholder event for you to use if you need the functionality
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

return -1
end event

event pfc_refresh;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Refresh
//
//	Arguments:	None
//
//	Returns:		long
//					 # of items refreshed successfully  
//					-1 = an error occurred
//
//	Description:	Refresh the ListView with items from the data source.
//						Do not re-retrieve the data.
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

// perform refresh logic on the datasource
If isvalid(inv_datasource) then
	Return inv_datasource.event pfc_refresh()
End If

Return -1
end event

event pfc_invertselection;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  pfc_InvertSelection
//
//	Arguments: None
//
//	Returns:   Integer
//
//	Description:  Reverses the selection (highlight) on all rows
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
long	ll_max
long	ll_i
listviewitem	llvi_item

// Get the row count.
ll_max = this.TotalItems() 

// Prevent flickering and improve performance.
This.SetReDraw ( FALSE ) 

// Invert row by row.
FOR ll_i = 1 to ll_max
	this.GetItem( ll_i, llvi_item )
	llvi_item.selected = NOT llvi_item.selected
	this.SetItem( ll_i, llvi_item )
NEXT 

// Prevent flickering and improve performance.
this.SetReDraw ( TRUE ) 

Return 1

end event

event pfc_renameitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_RenameItem
//
//	Arguments:	None
//
//	Returns:		Integer
//					 1 = action taken
//					-1 = no action taken
//
//	Description:	Rename the selected item.
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

if this.editlabels Then
	return this.editlabel( this.selectedindex() )
End If

Return -1
end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:				rbuttonup
//	Description:			
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
//							8.0   Moved existing code for PopUp menu to new contextmenu event
//						   	12.5	Redirect code to contextmenu event
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

Return this.event contextmenu( xpos, ypos)
end event

event contextmenu;//////////////////////////////////////////////////////////////////////////////
//	Event:				contextmenu
//	Description:			Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							8.0   Initial version
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
boolean	lb_frame
integer	li_rc
integer	li_index, li_width, li_selected
string		ls_label
alignment	le_align
window		lw_parent
window		lw_frame
window		lw_sheet
window		lw_childparent
m_lvs			lm_view

// Determine if RMB popup menu should occur
if not ib_rmbmenu then
	return 1
end if

// Determine parent window for PointerX, PointerY offset
this.of_GetParentWindow (lw_parent)
if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	do while IsValid (lw_frame)
		if lw_frame.windowtype = mdi! or lw_frame.windowtype = mdihelp! then
			lb_frame = true
			exit
		else
			lw_frame = lw_frame.ParentWindow()
		end if
	loop
	
	if lb_frame then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		if lw_parent.windowtype = child! then
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
		if lw_parent.windowtype = child! then
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
if IsNull(lm_view) Or not IsValid (lm_view) then
	lm_view = create m_lvs
	lm_view.of_SetParent (this)
end if

// Set the values of the Arrange Items submenu
If isvalid(inv_sort) then
	li_index = 1
	li_rc = GetColumn (li_index, ls_label, le_align, li_width)
	do while li_rc = 1
		if li_index >=1 and li_index <= 10 then
			lm_view.m_viewitem.m_arrangeicons.item[li_index].text = "by " + ls_label
			lm_view.m_viewitem.m_arrangeicons.item[li_index].microhelp = "Sorts items by " + ls_label
			lm_view.m_viewitem.m_arrangeicons.item[li_index].visible = true
		end if
		li_index++
		li_rc = GetColumn (li_index, ls_label, le_align, li_width)
	loop
else
	lm_view.m_viewitem.m_arrangeicons.enabled = false
end if


// Determine if the Auto Arrange Icons item should be enabled
if this.view = ListViewLargeIcon! or this.view = ListViewSmallIcon! then
	lm_view.m_viewitem.m_arrangeicons.m_autoarrange.enabled = true
	lm_view.m_viewitem.m_arrangeicons.m_autoarrange.checked = this.autoarrange
else
	lm_view.m_viewitem.m_arrangeicons.m_autoarrange.enabled = false
	lm_view.m_viewitem.m_arrangeicons.m_autoarrange.checked = false
end if

li_selected = this.totalselected()
// we have clicked on an item
If li_selected > 0 Then
	lm_view.m_viewitem.m_delete.visible = True
	lm_view.m_viewitem.m_dash15.visible = True
	If li_selected > 1 Then
		lm_view.m_viewitem.m_rename.visible = False
	Else
		If this.editlabels Then
			lm_view.m_viewitem.m_rename.visible = True
		Else
			lm_view.m_viewitem.m_rename.visible = False
		End IF
	End If
Else
	// We are not on an item
	lm_view.m_viewitem.m_delete.visible = False
	lm_view.m_viewitem.m_rename.visible = False
End IF
	
this.event pfc_prermbmenu (lm_view)

lm_view.m_viewitem.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

If IsValid(lm_view) Then Destroy lm_view

return 1

end event

event pfc_populate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_populate
//
//	Arguments:	none
//
//	Returns:		Long
//			 # of items added to the listview
//			-1 = error
//
//	Description:
//	retrieves the datasource and uses it to load the listview with data
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

// add the retrieved rows to the listview
Return of_populate()


end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Retrieve
//
//	Arguments:	
//	ads_data		The datastore holding the rows to add to the treeview as items
//
//	Returns:		long
//			 number of items returned by the retrieve
//			-1 = error
//
//	Description:
//	Return the number of rows placed in the data source
//
//	Extend this event to populate the retrieval arguments and then call the of_retrieve()
//		function.
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
//any		la_args[20]
//of_retrieve(la_args, ads_data)

Return 0
end event

event pfc_addall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_AddAll
//
//	Arguments:	
//	ads_source	data source to use for setting listview item values
//
//	Returns:		long
//					 # of items added successfully  
//					-1 = an error occurred
//
//	Description:	Add all the rows from data source to the listview.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//	7.0	add Arrange(), deferred from pfc_n_cst_lvsrv_datasource.of_InsertItem
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
Long		ll_addcount=0
Long		ll_rowcount, ll_row

If IsNull(ads_source) or not isvalid(ads_source) then return -1

// loop through the data and add the items
ll_rowcount = ads_source.RowCount()
For ll_row = 1 to ll_rowcount
	If this.event pfc_insertitem(ads_source, ll_row, INSERT_LAST, 0) < 1 then
		Return -1
	End If
	ll_addcount++
End For

this.Arrange ( )

return ll_addcount
end event

event pfc_insertitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_InsertItem
//
//	Arguments:	
//	ads_source	The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the listview, or
//						another maintained by the user.  If the latter, the row will be added
//						to the listviews DataStore.  Passed by reference.
//	al_Row		The row in the DataStore pointing to the data.
//	as_Position	The position under the parent where the new item will be inserted:
//						"First" - before the first item of the listview 
//						"Last" - after the last listview item (default)
//						"Before" - before the item with index al_Item
//						"After" - after the item with index al_Item
//	al_Item		The index to the item which the new item will be inserted either after or before.
//						Ignored unless as_Position = "After" or "Before".
//
//	Returns:		integer
//					 index of item added successfully  
//					-1 = an error occurred
//
//	Description:	Set the item attributes and place into the listview.
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
listviewitem	llvi_new

// check arguments
if IsNull(ads_source) or not isvalid(ads_source) Then Return -1
If IsNull(as_position) or (trim(as_position) = "") Then return -1
if IsNull(ai_index) or (ai_index < 0) then return -1
If IsNull(al_row) or (al_row = 0) then return -1

// popuate the new item with data
this.event pfc_SetItemAttributes(ads_source, al_row, llvi_new)

// preform pre insert logic
this.event pfc_preinsertitem(ads_source, al_row, llvi_new)

// add the item to the listview
If isvalid(inv_datasource) then
	Return inv_datasource.event pfc_insertitem(ads_source, al_row, llvi_new, as_position, ai_index)
Else
	Return this.AddItem(llvi_new)
End If

Return -1
end event

event pfc_additem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_AddItem
//
//	Arguments:	
//	ads_source	The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the listview, or
//						another maintained by the user.  If the latter, the row will be added
//						to the listviews DataStore.  Passed by reference.
//	al_Row		The row in the DataStore pointing to the data.
//
//	Returns:		integer
//					 index of item added  
//					-1 = an error occurred
//
//	Description:	Add the item to the end of the listview.
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

return this.event pfc_insertitem(ads_source, al_row, INSERT_LAST, 0)

end event

event pfc_setitemattributes;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_SetItemAttributes
//
//	Arguments:	
//	ads_obj		Datastore holding Listview item information
//	al_row		Row in datastore pointing to Listview Item
//	alvi_item	Listview item about to be inserted.  
//						Passed by Reference
//
//	Returns:		Integer
//	 1 = Success
//	-1 = Failure 
//
//	Description:	Set the default attributes for the listview item.  
//
//		Note:		Extend this event to change item attributes before it is inserted 
//					into the listview
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
If isvalid(inv_datasource) then
	Return inv_datasource.event pfc_SetItemAttributes(ads_obj, al_row, alvi_item)
End If

Return -1
end event

event keydown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		keydown
//
//	Arguments:	
//	key			key pressed down
//	keyflags		alt or ctrl pressed
//
//	Description:	Catch the delete key and let pfc handle the delete versus the
//						built in listview deletekey processing
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

If KeyFlags = 0 then
	If Key = KeyDelete! then
		// we can delete through the keyboard if true
		if this.deleteitems then
			// this stops any other messages from being fired by this event action
			message.processed = true
			// let the pfc delete event delete the item - not the listview
			this.event pfc_deleteitem()
		End if
	End IF
End If

end event

event pfc_refreshitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_RefreshItem
//
//	Arguments:
//	ai_index		The index of the item to be refreshed.
//
//	Returns:		Integer
//					 1 if successfull
//					-1 if an error occurred
//
//	Description:	Refresh an item in the ListView.  Reset all its attributes to the 
//						default values based on the data in the DataStore.
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

// are we using the service
If isvalid(inv_datasource) then
	Return inv_datasource.event pfc_refreshitem(ai_index)
End If

Return -1
end event

event pfc_prerefreshitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_PreRefreshItem
//
//	Arguments:	
//	ai_index		index of the item being refreshed
//	ads_obj		Datastore holding Listview item information
//	al_row		Row in datastore pointing to Listview Item
//	alvi_item	Listview item about to be refreshed.  
//						Passed by Reference
//
//	Returns:		None
//
//	Description:	Set the default attributes for the listview item.  
//
//		Note:		Extend this event to change item attributes before it is refreshed.
//					most likely will be the same as pfc_preinsert event
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



end event

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetParentWindow
//
//	Access:		public
//
//	Arguments:
//	aw_parent   The Parent window for this object (passed by reference).
//	  					 If a parent window is not found, aw_parent is NULL
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	 Calculates the parent window of a window object
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

if IsNull(lpo_parent) Or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

public function integer of_setdatasource (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdatasource
//
//	Access:  public
//
//	Arguments:
//	ab_switch   enable/disable the listviews data source service
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Instantiates or destroys the listview data source service
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

integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_datasource) Or not IsValid (inv_datasource) then
		inv_datasource = create n_cst_lvsrv_datasource
		inv_datasource.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_datasource) then
		destroy inv_datasource
		li_rc = 1
	end if	
end if

return li_rc


end function

public function integer of_setupdateable (boolean ab_isupdateable);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateable
//
//	Access:  Public
//
//	Arguments:
//	ab_isupdateable   Indicates whether the DW is updateable
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the DW is updateable
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

// Check arguments
if IsNull (ab_isupdateable) then
	return -1
end if

ib_isupdateable =  ab_isupdateable
return 1
end function

public function integer of_setlogicalunitofwork (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetLogicalUnitofWork
//
//	Access:		public
//
//	Arguments:
//	ab_switch	enable/disable the base window service
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Instantiates or destroys the Logical Unit of Work service
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

integer	li_rc

// Check arguments
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_luw) Or not IsValid (inv_luw) then
		inv_luw = create n_cst_luw
		// This call to set the requestor is an optional setting on the service.
		// Different functionality will occurr depending if the requestor is set.
		//inv_luw.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_luw) then
		destroy inv_luw
		li_rc = 1
	end if	
end if

return li_rc


end function

public function boolean of_isupdateable ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsUpdateable
//
//	Access:  Public
//
//	Arguments:  None
//
//	Returns:  boolean
//	TRUE   The treeview is marked as updateable
//	FALSE   The treeview is not marked as updateable
//
//	Description:
//	Gets the value of the updateable property of the treeview indicating
//	whether anypart of the Treeview is updateable
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

return ib_isupdateable
end function

public function integer of_accepttext (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_accepttext
//
//	Access:		public
//
//	Arguments:  
//	ab_focusonerror	States if focus should be set in case of error.
//
//	Returns:		integer
//  1 = CONTINUE_ACTION
//  0 = NO_ACTION
// -1 = error
//	
//	Description:
//	Perform an accepttext and set focus when requested.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
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

powerobject lpo_updatearray[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

// Determine the appropriate array.
this.of_Getobjects(lpo_updatearray)

Return this.Event pfc_AcceptText(lpo_updatearray, ab_focusonerror)

end function

public function integer of_updatespending ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UpdatesPending
//
//	Access:		Public
//
//	Arguments:	none
//
//	Returns:  integer
//	1 = Updates are pending.
//	0 = No updates are pending
//
//	Description:
//	Determine if any updates are pending on this listview.
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

constant integer NO_UPDATESPENDING =0
integer		li_rc 
powerobject lpo_updatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_UPDATESPENDING

// Determine the appropriate array.
this.of_GetObjects(lpo_updatearray)

li_rc = this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending)
ipo_pendingupdates = lpo_pending

return li_rc

end function

public function integer of_validation ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_validation
//
//	Access:		public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All validation passed
//	-1 = validation failed
//
//	Description:
//	Validate the datasources on the listview
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

powerobject lpo_updatearray[]
powerobject lpo_validatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If ib_alwaysvalidate Then
	// Don't need to know the objects with updatespending.
	this.of_GetObjects(lpo_validatearray)
Else
	If UpperBound(ipo_pendingupdates) > 0 Then
		// Should be part of a SUO unit.
		lpo_pending = ipo_pendingupdates
	Else
		// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
		this.of_GetObjects(lpo_updatearray)

		If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
			Return -1
		End If
	End If
	lpo_validatearray = lpo_pending
End If

Return this.Event pfc_validation(lpo_validatearray)
end function

public function integer of_updateprep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_UpdatePrep
//
//	Access:		public
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = All preparation passed
//	 0 = No Action taken
//	-1 = preparation failed
//
//	Description:
//	Perform an Update Preparation.
//
// Note:
//	Specific updateprep logic should be coded in descendant pfc_updateprep event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	this.of_GetObjects(lpo_updatearray)

	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

Return this.Event pfc_updateprep(lpo_pending)
end function

public function boolean of_isalwaysvalidate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsAlwaysValidate
//
//	Access:		Public
//
//	Arguments:	None
//
//	Returns:  boolean
//	False, the objects with updates pending will be validated.
//	True, all objects that were tested for updates pending will be validated.
//
//	Description:
//	Gets the switch which determines which objects should be validated in the save 
//	process.
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

return ib_alwaysvalidate
end function

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PostUpdate
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:  Integer
//	 1 if it succeeds
//  0 No Action
// -1 if an error occurs
//	
//	Description:
//	Perform post update processing.  Clear the ipo_pendingupdates array.  
//
// Note:
//	Specific PostUpdate logic should be coded in descendant pfc_PostUpdate event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0	Initial version
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
Integer		li_rc
powerobject lpo_updatearray[]
powerobject lpo_pending[]
powerobject lpo_empty[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	this.of_GetObjects(lpo_updatearray)

	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

li_rc = this.Event pfc_postupdate(lpo_pending)

ipo_pendingupdates = lpo_empty

return li_rc

end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag, powerobject apo_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Update
//
//	Access:		public
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//						reset its update flags.
//	apo_requestor	An object requesting the update within a transaction.
//
//	Returns: Integer
//	 1 = The update was successfull
//	 0 = No Action taken
//	-1 = The update failed
//
//	Description:  	
//	Execute the specific Update logic.  
//
// Note:
//	Specific Update logic should be coded in descendant pfc_Update event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

integer		li_rc
powerobject	lpo_notvalid

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

// Set the object requesting the update.
If of_SetUpdateRequestor(apo_requestor) <0 Then Return -1

// Ask the LUW to present itself as the original update requestor (create if necessary).
If IsNull(inv_luw) Or Not IsValid (inv_luw) Then of_SetLogicalUnitofWork(True)
If IsValid(inv_luw) Then 
	inv_luw.of_SetUpdateRequestor(apo_requestor)
End If
	
// Perform the actual update.
li_rc = this.of_Update(ab_accepttext, ab_resetflag)
	
// Clear the object which requested the update.
of_SetUpdateRequestor(lpo_notvalid)
If IsValid(inv_luw) Then 
	inv_luw.of_SetUpdateRequestor(lpo_notvalid)
End If

Return li_rc



end function

public function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUpdateRequestor
//
//	Access:    Public
//
//	Arguments:
// apo_updaterequestor   The object which is requesting an update within a 
//			transaction.  Or an invalid reference to clear the reference.
//
//	Returns:  Integer
//		1 for success
//		-1 for error.
//
//	Description:  
//	Associates the object which is requesting an update within a transaction.
//	Or clears the reference to mean there is no current object requesting an
//	update within a transaction.
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

// Check for a valid apo_updaterequestor is not desired.
ipo_updaterequestor = apo_updaterequestor

Return 1
end function

public function integer of_getupdaterequestor (ref powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUpdateRequestor
//
//	Access:  		public
//
//	Arguments:
//	apo_updaterequestor	The object which is requesting an update within a 
//			transaction.
//
//	Returns:  		Integer
//	1 success
// 0 No requestor
// -1 error 
//
//	Description:
//	Gets reference to the object which is requesting an update within a transaction.
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

// Get the requestor (if any)
apo_updaterequestor = ipo_updaterequestor

If IsValid(apo_updaterequestor) Then return 1
Return 0
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Update
//
//	Access:		public
//
//	Arguments:  
//	ab_accepttext	When applicable, specifying whether control should perform an
//							AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically 
//							reset its update flags.
//
//	Returns: Integer
//	 1 = The update was successful
//  0 = No action
//	-1 = The update failed
//
//	Description:  	
//	Execute the specific Update logic.  
//
// Note:
//	Specific Update logic should be coded in descendant pfc_Update event.
//	Part of the SelfUpdatingObject(SUO) API.
//	No Action will be executed, If the object is not Updateable.
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

powerobject lpo_updatearray[]
powerobject lpo_pending[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

If UpperBound(ipo_pendingupdates) > 0 Then
	// Should be part of a SUO unit.
	lpo_pending = ipo_pendingupdates
Else
	// Might not be part of an SUO unit.  Need to know what objects had updatespending. 
	this.of_GetObjects(lpo_updatearray)

	If this.Event pfc_UpdatesPending(lpo_updatearray, lpo_pending) < 0 Then
		Return -1
	End If
End If

Return this.Event pfc_Update(lpo_pending, ab_accepttext, ab_resetflag)
end function

public function integer of_setbase (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBase
//
//	Access:  public
//
//	Arguments:
//	ab_switch   enable/disable the listviews base service
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Instantiates or destroys the listview base service
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

integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_base) Or not IsValid (inv_base) then
		inv_base = create n_cst_lvsrv
		inv_base.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_base) then
		destroy inv_base
		li_rc = 1
	end if	
end if

return li_rc

end function

public function integer of_Setalwaysvalidate (boolean ab_validate);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAlwaysValidate
//
//	Access:  Public
//
//	Arguments:
//	ab_validate   Indicates whether object always performs validation
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether object always performs validation
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

// Check arguments
if IsNull (ab_validate) then
	return -1
end if

ib_alwaysvalidate =  ab_validate
return 1
end function

protected function integer of_getobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetObjects
//
//	Access:  protected
//
//	Arguments:		
//	apo_objects[] (by reference) An array of objects on which the update process 
//				will take effect.
//
//	Returns:  integer
//	 # of objects in the array if successful
//	-1 = error
//
//	Description:
//	Gets the current objects for which an updates will be attempted.
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
n_ds	lds_source

// Determine the datasource.
If IsValid(inv_datasource) Then
	If inv_datasource.of_GetDataSource(lds_source) < 1 then Return -1
	apo_objects[1] = lds_source
	Return upperbound(apo_objects)
End If

Return -1
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
//	 Gets the Object Information.
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
anv_infoattrib.is_name = 'Service Based Listview'
anv_infoattrib.is_description = 'Service Based Listview'

Return 1
end function

public function integer of_setsort (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetSort
//
//	Access:  public
//
//	Arguments:
//	ab_switch   enable/disable the listviews sorting service
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Instantiates or destroys the listview sorting service
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

integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_sort) Or not IsValid (inv_sort) then
		inv_sort = create n_cst_lvsrv_sort
		inv_sort.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_sort) then
		destroy inv_sort
		li_rc = 1
	end if	
end if

return li_rc


end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:
//	as_id			An ID for the Message.
//	as_title  	Text for title bar
//	as_text		Text for the actual message.
//	ae_icon 		The icon you want to display on the MessageBox.
//	ae_button	Set of CommandButtons you want to display on the MessageBox.
//	ai_default  The default button.
//
//	Returns:  integer
//	Return value of the MessageBox.
//
//	Description:
//	Display a PowerScript MessageBox.  
//	Allow PFC MessageBoxes to be manipulated prior to their actual display.
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

Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

public function integer of_insertitem (ref n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_InsertItem
//
//	Access:		public
//
//	Arguments:
//	ads_obj		The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the listview, or
//						another maintained by the user.  If the latter, the row will be added
//						to the listviews DataStore.  Passed by reference.
//	al_Row		The row in the DataStore pointing to the data.
//
//	Returns:		Integer
//					Returns the index of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the ListView using data from a DataStore.
//
//		This function overloads the real of_InsertItem function to allow the last 2
//		parameters to be optional.
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

Return this.event pfc_InsertItem(ads_obj, al_row, INSERT_LAST, 0)
end function

public function integer of_insertitem (ref n_ds ads_obj, long al_row, string as_position, integer ai_index);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_InsertItem
//
//	Access:		public
//
//	Arguments:
//	ads_obj		The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the listview, or
//						another maintained by the user.  If the latter, the row will be added
//						to the listviews DataStore.  Passed by reference.
//	al_Row		The row in the DataStore pointing to the data.
//	as_Position	The position under the parent where the new item will be inserted:
//						"First" - before the first item of the listview 
//						"Last" - after the last listview item (default)
//						"Before" - before the item with index al_Item
//						"After" - after the item with index al_Item
//	ai_Index		The index to the item which the new item will be inserted either after or before.
//						Ignored unless as_Position = "After" or "Before".
//
//	Returns:		Integer
//					Returns the index of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the ListView using data from a DataStore.
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

// check arguments
if IsNull(ads_obj) or not isvalid(ads_obj) Then Return -1
If IsNull(as_position) or (trim(as_position) = "") Then return -1
if IsNull(ai_index) or (ai_index < 0) then return -1
If IsNull(al_row) or (al_row = 0) then return -1

Return this.event pfc_insertitem(ads_obj, al_row, as_position, ai_index)
end function

public function integer of_insertitem (any aa_columnvalues[], string as_position, integer ai_index);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_InsertItem
//
//	Access:		public
//
//	Arguments:
//	aa_ColumnValues[]	The array containing the data to be used for the new item.
//	as_Position			The position under the parent where the new item will be inserted:
//								"First" - before the first item of the listview 
//								"Last" - after the last listview item (default)
//								"Before" - before the item with index al_Item
//								"After" - after the item with index al_Item
//	ai_index				The index to the item which the new item will be inserted either after or before.
//								Ignored unless as_Position = "After" or "Before".
//
//	Returns:		Integer
//					Returns the index of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the ListView using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
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
long					ll_row
integer				li_newindex
n_ds					lds_datastore

// check arguments
if upperbound(aa_columnvalues) < 1 Then Return -1
If IsNull(as_position) or (trim(as_position) = "") Then return -1
if IsNull(ai_index) or (ai_index < 0) then return -1

// Create the storage datastore
lds_datastore = create n_ds

If isvalid(inv_datasource) then
	If inv_datasource.of_ConvertToRow(aa_columnvalues, lds_datastore, ll_row) <> 1 Then
		Destroy lds_datastore
		Return -1
	End If
Else
	Return -1
End If

// Add the item to the listview
li_newindex = this.event pfc_insertitem(lds_datastore, ll_row, as_position, ai_index)

Destroy lds_datastore

return li_newindex
end function

public function integer of_additem (any aa_columnvalues[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_AddItem
//
//	Access:		public
//
//	Arguments:
//	aa_ColumnValues[]	The array containing the data to be used for the new item.
//
//	Returns:		Integer
//					Returns the index of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the ListView using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
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
long					ll_row
integer				li_newindex
n_ds					lds_datastore

// check arguments
if upperbound(aa_columnvalues) < 1 Then Return -1

// Create the storage datastore
lds_datastore = create n_ds

If isvalid(inv_datasource) then
	If inv_datasource.of_ConvertToRow(aa_columnvalues, lds_datastore, ll_row) <> 1 Then
		Destroy lds_datastore
		Return -1
	End If
End If

// Add the item to the listview
li_newindex = this.event pfc_additem(lds_datastore, ll_row)

Destroy lds_datastore

return li_newindex
end function

public function integer of_insertitem (any aa_columnvalues[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_InsertItem
//
//	Access:		public
//
//	Arguments:
//	aa_ColumnValues[]	The array containing the data to be used for the new item.
//
//	Returns:		Integer
//					Returns the index of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the ListView using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
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

return this.of_insertitem(aa_columnvalues, INSERT_LAST, 0)

end function

public function integer of_getrow (integer ai_index, ref n_ds ads_obj, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRow
//
//	Access:   		Public
//
//	Arguments:		
//	ai_index		The index of the item to be refreshed.
//	ads_obj		Datastore holding Listview item information
//	al_row		Row in datastore pointing to Listview Item
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Return the row in the datastore and the datastore for the listview item index.
//
//	Note: If using a different service from the one PFC provides, then override
//			this function to call the other service.
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

// Get the corresponding row in the DataStore
If IsValid(inv_datasource) then
	Return inv_datasource.of_GetDataRow(ai_index, ads_obj, al_Row) 
End If

Return -1
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Reset
//
//	Access:		public
//
//	Arguments:  None
//
//	Returns:  Integer
//	 1 if it succeeds
//	-1 if an error occurs.
//	
//	Description:
//	Reset the entire listview (items and datastores).
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
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
long 		ll_rootitem
integer	li_index, li_level

this.setredraw(false)

// delete all the listview items
this.DeleteItems() 

// reset the data
If isvalid(inv_datasource) Then
	If inv_datasource.of_resetlist() <> 1 Then Return -1
End If

this.setredraw(true)

Return 1
end function

public function integer of_getcolumninfo (integer ai_column, ref n_cst_columnattrib anv_columnattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetColumnInfo
//
//	Access:		public
//
//	Arguments:
//	ai_column			Column from the listview
//	anv_columnattrib	The attributes of the Datasource column populating this column
//
//	Returns:		Integer
//					 1 = success,
//					-1 = an error occurred
//
//	Description:	Return column information from ListView control.  
//						Column information is displayed in Report View only.
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

If isvalid(inv_datasource) Then
	Return inv_datasource.of_Getcolumninfo(ai_column, anv_columnattrib)
End If

Return -1
end function

public function boolean of_canundo (ref string as_undotype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_CanUndo
//
//	Access:		Public
//
//	Arguments:	
//	as_undotype		The type of undo we are performing.  Passed by reference
//
//	Returns:		Boolean
//					true = we can undo the last edit/insert/delete
//					false = cannot undo the last edit/insert/delete
//
//	Description:
//	Returns if undo can be performed and the type of undo that can be performed
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

// initialize the undo type
as_undotype = ""

// call undo on the service to see if we can perform an undo
If IsValid(inv_datasource) Then
	Return inv_datasource.of_canundo(as_undotype)
End If

Return FALSE

end function

public function integer of_setrmbmenu (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRMBMenu
//
//	Access:  Public
//
//	Arguments:
//	ab_switch   True if RMB menu should pop up on right clicked
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether the popup menu occurs on a right mouse click
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

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

ib_rmbmenu =  ab_switch
return 1
end function

public function boolean of_isrmbmenu ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsRMBMenu
//
//	Access:		Public
//
//	Arguments:	None
//
//	Returns:  boolean
//	False, the popup menu will not display on right click.
//	True, the popup menu will display on right click.
//
//	Description:
//	Determine if RMB menu should pop up
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

return ib_rmbmenu
end function

public function long of_retrieve (any aa_args[20], ref n_ds ads_data);//////////////////////////////////////////////////////////////////////////////
//
//	Event:		of_Retrieve
//
//	Arguments:	
//	aa_args		retrieval arguments to pass to the datastore if needed
//	ads_data		The datastore holding the rows to add to the treeview as items
//
//	Returns:		long
//			 number of items returned by the retrieve
//			-1 = error
//
//	Description:
//	Return the number of rows placed in the data source
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

// retrieve the rows into the datasource
If isvalid(inv_datasource) then
	Return inv_datasource.of_retrieve(aa_args, ads_data)
End If

Return 0
end function

public function long of_populate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_populate
//
//	Access:		public
//
//	Arguments:	none
//
//	Returns:		Long
//			 # of items added to the listview
//			-1 = error
//
//	Description:
//	retrieves the datasource and uses it to load the listview with data
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

n_ds	lds_data

Setpointer(hourglass!)

// clear the listview
If this.DeleteItems() < 1 Then Return -1

// retrieve the data into the services datastore
If this.event pfc_retrieve(lds_data) < 0 Then Return -1

// add the retrieved rows to the listview
Return this.event pfc_addall(lds_data) 


end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	Description:	Destroy the DataStore that was created
//						when the data source was registered.
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

of_setbase(false)
of_setsort(false)
of_setdatasource(false)
of_setlogicalunitofwork( false )

end event

event endlabeledit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  EndLabelEdit
//
//	Description:	Change the label column in the appropriate to be the new
//						text.  This only works if the label column is updatable.
//						If a computed column is being used for the label, override
//						this script with appropriate code.
//
//						NOTE:  Update() is NOT called for the DataStore.  This is
//						left to the user to perform.
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

If IsValid(inv_datasource) Then
	If inv_datasource.event pfc_endlabeledit(index, newlabel) <> CONTINUE_ACTION Then
		// prevent new text from becoming the label
		Return 1
	End If
End If

// 0 means to accept the new text for the label
Return 0

end event

event getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			getfocus
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	If appropriate, notify the parent window that this
//						control got focus.
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

window 	lw_parent

//Check for microhelp requirements.
If gnv_app.of_GetMicrohelp() Then
	//Notify the parent.
	of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) Then
		lw_parent.Dynamic Event pfc_ControlGotFocus (this)
	End If
End If

end event

event columnclick;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  ColumnClick
//
//	Description:	Sort the items based on the column whose heading
//						was clicked.  If already sorted on that column, then
//						reverse the sort order.
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

If isvalid(inv_sort) then
	inv_sort.event pfc_columnclick(column)
End If
end event

event sort;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		Sort
//
//	Description:	Perform the sort comparison on two listview items when sort
//						type is userdefined!  You can extend this event to allow your
//						own sorting logic.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0	Initial version
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
If isvalid(inv_sort) then
	Return inv_sort.event pfc_sort(index1, index2, column)
End If

// on rc=0 do not switch items for the sort
Return 0
end event

event rightclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  RightClicked
//
//	Description:	Keep track of the item that was clicked.
//						This is necessary because the contextmenu
//						event has no parameters.
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

il_RightClicked = index

end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:
//	Service Based ListView Control.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version - Brian J. Grimm
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

on pfc_u_lvs.create
end on

on pfc_u_lvs.destroy
end on

