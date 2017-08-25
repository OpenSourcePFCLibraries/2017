HA$PBExportHeader$pfc_u_tvs.sru
$PBExportComments$PFC Service Based TreeView class
forward
global type pfc_u_tvs from treeview
end type
end forward

global type pfc_u_tvs from treeview
integer width = 343
integer height = 244
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 12632256
long statepicturemaskcolor = 12632256
event pfc_prermbmenu ( ref m_tvs am_view )
event type boolean pfc_searchcompare ( long al_handle,  string as_attribute,  any aa_target,  boolean ab_respectcase,  boolean ab_fullcompare )
event type integer pfc_newitem ( )
event type integer pfc_deleteitem ( )
event type integer pfc_accepttext ( powerobject apo_control[],  boolean ab_focusonerror )
event type integer pfc_updatespending ( powerobject apo_control[],  ref powerobject apo_pending[] )
event type integer pfc_validation ( powerobject apo_control[] )
event type integer pfc_updateprep ( powerobject apo_control[] )
event type integer pfc_update ( powerobject apo_control[],  boolean ab_accepttext,  boolean ab_resetflag )
event type integer pfc_postupdate ( powerobject apo_control[] )
event pfc_preinsertitem ( long al_parent,  n_ds ads_obj,  long al_row,  ref treeviewitem atvi_item )
event pfc_predeleteitem ( long al_handle )
event type integer pfc_undo ( )
event type integer pfc_properties ( )
event type integer pfc_refreshlevel ( integer ai_level )
event type integer pfc_renameitem ( )
event type long pfc_populate ( long al_parent )
event type long pfc_retrieve ( long al_parent,  ref n_ds ads_data )
event pfc_prerefreshlevel ( integer ai_level )
event type long pfc_addall ( long al_parent,  n_ds ads_source )
event type long pfc_insertitem ( long al_parent,  n_ds ads_source,  long al_row,  string as_position,  long al_handle )
event type long pfc_additem ( long al_parent,  n_ds ads_source,  long al_row )
event type integer pfc_setitemattributes ( long al_parent,  n_ds ads_obj,  long al_row,  ref treeviewitem atvi_item )
event keydown pbm_keydown
event type integer pfc_refreshitem ( long al_handle )
event pfc_prerefreshitem ( long al_handle,  n_ds ads_obj,  long al_row,  ref treeviewitem atvi_item )
end type
global pfc_u_tvs pfc_u_tvs

type variables
Public:
Constant	Integer	CONTINUE_ACTION = 1
Constant  Integer	PREVENT_ACTION = 0
Constant	Integer	NO_ACTION = 0
// constants for inserting a item
Constant  String	INSERT_FIRST = "first"
Constant  String	INSERT_LAST = "last"
Constant  String	INSERT_SORT = "sort" 
Constant  String	INSERT_AFTER = "after"
// constants for finding a value
Constant  String	FIND_LABEL = "label"
Constant  String	FIND_DATA = "data"

long	il_DragSource
long	il_DragTarget

n_cst_tvsrv					inv_base
n_cst_tvsrv_print			inv_print
n_cst_tvsrv_levelsource	inv_levelsource

Protected:
boolean						ib_rmbmenu=true
boolean						ib_IsObsolete
// Logical Unit of Work -  SelfUpdatingObject - Save Process - (Attributes).
boolean						ib_isupdateable = False
boolean						ib_alwaysvalidate = false // Save process flag to include all objects in validation process.
powerobject					ipo_updaterequestor
powerobject					ipo_pendingupdates[]
n_cst_luw					inv_luw
end variables

forward prototypes
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setbase (boolean ab_switch)
public function integer of_setprint (boolean ab_switch)
public function integer of_setlevelsource (boolean ab_switch)
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
public function integer of_Setalwaysvalidate (boolean ab_validate)
protected function integer of_getobjects (ref powerobject apo_objects[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_getnextlevel (long al_parent)
public function integer of_reset ()
public function long of_additem (long al_parent, any aa_columnvalues[])
public function long of_insertitem (long al_parent, any aa_columnvalues[])
public function long of_insertitem (long al_parent, any aa_columnvalues[], string as_position, long al_handle)
public function long of_insertitem (long al_parent, ref n_ds ads_obj, long al_row, string as_position, long al_handle)
public function boolean of_canundo (ref string as_undotype)
public function integer of_setrmbmenu (boolean ab_switch)
public function boolean of_isrmbmenu ()
public function long of_retrieve (long al_parent, any aa_args[20], ref n_ds ads_data)
public function long of_insertitem (long al_parent, n_ds ads_obj, long al_row)
public function long of_populate (long al_parent)
end prototypes

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_PreRMBMenu
//	Arguments: 		am_view		Menu to be displayed.  
//	Returns:  		None
//	Description:  	Use this event to modify menu item information before the menu displays.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

event pfc_searchcompare;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_searchcompare
//	Arguments:		al_Handle			The handle of the item being compared.
//						as_Attribute		The attribute of the TreeView item to search ("Label", or "Data")
//						aa_Target			A variable of type Any containg the search target.
//						ab_RespectCase		True - search is case sensitive,
//												False - search is not case sensitive.  Only used if the target	is a string.
//						ab_FullCompare		True - Label or Data and Target must be equal,
//												False - Label or Data can contain Target (uses POS() function).
//														Only used if the target is a string.
//	Returns:			Boolean: 	True - a match was found, False - no match
//	Description:		This event is triggered by the of_SearchChild function (which is called	by of_FindItem).  It does the 
//						actual comparison between a TreeView	item and the target being searched for.
//						If a more complex comparison is desired, this event should be overridden.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
String				ls_Target, ls_Source
TreeViewItem		ltvi_Item

If this.GetItem(al_Handle, ltvi_Item) = -1 Then Return False

If Lower(as_Attribute) = FIND_LABEL Then
	// Label Comparison
	If ab_RespectCase Then
		// Comparison is case-sensitive
		ls_Source = ltvi_Item.Label
		ls_Target = String(aa_Target)
	Else
		ls_Source = Upper(ltvi_Item.Label)
		ls_Target = Upper(String(aa_Target))
	End If

	If ab_FullCompare Then
		// Match whole words only
		If ls_Source = ls_Target Then Return True
	Else
		If Pos(ls_Source, ls_Target) > 0 Then Return True
	End If

Else
	// Data Comparison
	If ClassName(ltvi_Item.Data) = "string" Then
		// RespectCase and FullCompare boolean arguments are valid
		If ab_RespectCase Then
			// Comparison is case-sensitive
			ls_Source = String(ltvi_Item.Data)
			ls_Target = String(aa_Target)
		Else
			ls_Source = Upper(String(ltvi_Item.Data))
			ls_Target = Upper(String(aa_Target))
		End If

		If ab_FullCompare Then
			// Match whole words only
			If ls_Source = ls_Target Then Return True
		Else
			If Pos(ls_Source, ls_Target) > 0 Then Return True
		End If

	Else
		// Data is non-string
		If ltvi_Item.Data = aa_Target Then Return True
	End If
End If

Return False
end event

event pfc_newitem;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_newitem
//	Arguments: 		None
//	Returns:  		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:  	Add an item to the treeview.
//						Note:	this is a place holder event for code if you need it:
//						If using a treeview to add a new item not already in the datastore, then create a local datastore with the 
//						same source as the treeview.  Open a response window with the edit field information.  Return the new data to
//						your local datastore and call pfc_insertitem() for each row of data in your local datastore
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Return -1
end event

event pfc_deleteitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_deleteitem
//	Arguments: 		None
//	Returns:  		Integer:  1	- the item was deleted successfuliy
//			 						0 - no item was deleted
//									-1 = error
//	Description:  	Deletes the selected item of the treeview and syncs the datastore
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long		ll_currentitem, ll_rc

// find the current/selected item
ll_currentitem = this.FindItem ( CurrentTreeItem!, 0 ) 
if ll_currentitem < 0 then return -1

// perform pre-delete logic
this.event pfc_predeleteitem(ll_currentitem)

// see if using the pfc datasource
If isvalid(inv_levelsource) then
	Return inv_levelsource.event pfc_deleteitem(ll_currentitem)
else
	Return this.deleteitem(ll_currentitem)
end if

Return -1
end event

event pfc_accepttext;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_AcceptText
//	Arguments: 		apo_control[]		The controls on which to perform functionality.
//						ab_focusonerror    Should focus be set to object in error
//	Returns:  		Integer:				 1 = success
//												-1 = error
//	Description:  	Request the Logical Unit of Work service to perform Accepttext functionality on the array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
If IsNull(ab_focusonerror) then Return -1

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
//	Event:  			pfc_UpdatesPending
//	Arguments: 		apo_control[]	The controls on which to perform functionality.
//	Returns:  		Integer: 			1 = updates are pending (no errors found)
//	 										0 = No updates pending (no errors found)
//											-1 = error
//	Description:  	Request the Logical Unit of Work service to determine which objects have	
//						UpdatesPending.  Store references in pending array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Event:			pfc_validation
//	Arguments: 		apo_control[]	The controls on which to perform functionality.
//	Returns:  		Integer:  1 = success, -1 = error
//	Description:  	Request the Logical Unit of Work service to perform Validation functionality on the array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Event:			pfc_updateprep
//	Arguments: 		apo_control[]	The controls on which to perform functionality.
//	Returns:  		Integer:  1 = success, -1 = error
//	Description:  	Request the Logical Unit of Work service to perform Update Preparation
//						functionality on the array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Event: 			pfc_update
//	Arguments: 		apo_control[]	The controls on which to perform functionality.
//						ab_accepttext	When applicable, specifying whether control should perform an
//						AcceptText prior to performing the update:
//	ab_resetflag	Value specifying whether object should automatically reset its update flags.
//	Returns:  		Integer:  1 = all updates successful, -1 = At least one update failed
//	Description:  	Request the Logical Unit of Work service to perform Update functionality on the array.
//						Note:	This function will update objects in the order in which they are found in the array.  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Event:			pfc_postupdate
//	Arguments: 		apo_control[]	The controls on which to perform functionality.
//	Returns:  		Integer: 1 = success, -1 = error
//	Description:  	Request the Logical Unit of Work service to perform PostUpdate functionality on the array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Event:			pfc_PreInsertItem
//	Arguments: 		al_parent	The handle to the Treeview item to place data under
//						ads_obj		Datastore holding Treeview item information
//						al_row		Row in datastore pointing to Treeview Item
//						atvi_item	Treeview item about to be inserted.  
//										Passed by Reference
//	Returns:  		None
//	Description:  	Set the default attributes for the Treeview item.  
//						Note:		Extend this event to change item attributes before it is inserted 
//									into the Treeview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

event pfc_predeleteitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_PreDeleteItem
//	Arguments: 		al_handle			Handle to Treeview item about to be deleted.  
//	Returns:  		None
//	Description:  	Use this event to do work prior to the items deletion.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

event pfc_undo;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_Undo
//	Arguments:		None
//	Returns:			Integer:  1 = success; 0 = nothing to undo; -1 = error
//	Description:		Restore the last treeview change.  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
if isvalid(inv_levelsource) then
	return inv_levelsource.event pfc_undo()
end if

return -1
end event

event pfc_properties;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_properties
//	Arguments: 		None
//	Returns:  		integer
//	Description:  	Note:	this is a place holder event for code if you need it
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
return -1
end event

event pfc_refreshlevel;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_RefreshLevel
//	Arguments: 		ai_level		The treeview level to refresh
//	Returns:  		integer: 		 1 = treeview level refreshed successfully  
//										-1 = an error occurred
//	Description:  	Refresh the treeview level with items from the data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// see if using the pfc datasource
If isvalid(inv_levelsource) then
	Return inv_levelsource.event pfc_refreshlevel(ai_level)
End IF

Return -1
end event

event pfc_renameitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_RenameItem
//	Arguments: 		None
//	Returns:  		Integer: 		 1 = action taken, -1 = no action taken
//	Description:  	Rename the selected item.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long	ll_handle

// if not able to edit then do not edit
if this.editlabels then
	ll_handle = this.FindItem(CurrentTreeItem!, 0)
	Return this.editlabel( ll_handle )
end if

Return -1
end event

event pfc_populate;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_Populate
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//	Returns:  		Long:		# of items treeview was populated with
//									0 if nothing was populated
//									-1 = error
//	Description:  	Retrieves the datasource and uses it to load the treeview with data
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// check arguments
IF (al_parent < 0) or IsNull(al_parent) then Return -1

// add the treeview data
Return this.of_populate(al_parent) 
end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_Retrieve
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//						ads_data		The datastore holding the rows to add to the treeview as items passed by reference
//	Returns:  		long:	number of items returned by the retrieve, -1 = error
//	Description:  	Return the number of rows placed in the data source.
//						Extend this event to populate the retrieval arguments and then call the of_retrieve()
//						function.  Below is an example of code which would be needed to extend.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

////EXAMPLE CODE//////////////////////////////////////////////////////////////////////////
//any la_args[20]
//integer li_level
//
//if isvalid(inv_levelsource) then
//	li_level = of_getnextlevel(al_parent)
//	of_getargs(al_parent, li_level, la_args)
//end if
//of_retrieve(al_parent, la_args, ads_data)

Return 0
end event

event pfc_prerefreshlevel;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_PreRefreshLevel
//	Arguments: 		ai_level		treeview level to refresh
//	Returns:  		None
//	Description:  	Perform application specific pre refreshlevel logic
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

event pfc_addall;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_AddAll
//	Arguments: 		al_parent	The handle to the Treeview item to place data under
//						ads_source	data source to use for setting treeview item values
//	Returns:  		long:  number of items added successfully  
//					 	0 = no items added
//						-1 = an error occurred
//	Description:  	Add all the rows from data source to the treeview.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long		ll_count=0
Long		ll_rowcount, ll_row

// check the arguments
If IsNull(ads_source) or Not IsValid(ads_source) Then Return -1
If (al_parent < 0) or isnull(al_parent) then Return -1

// loop through the data and add the items
ll_rowcount = ads_source.RowCount()

For ll_row = 1 to ll_rowcount
	If this.event pfc_insertitem(al_parent, ads_source, ll_row, INSERT_LAST, 0) < 1 then
		Return -1
	End If
	ll_count++
End For

return ll_count
end event

event pfc_insertitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_InsertItem
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//						ads_source	The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the treeview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the treeviews DataStore. 
//						al_Row		The row in the DataStore pointing to the data.
//						as_Position	The position under the parent where the new item will be inserted:
//										"First" - before the first child of the parent 
//										"Last" - after the last child (default)
//										"Sort" - in the sorted position based on the item's label
//										"After" - after the item with handle al_handle
//						al_handle		The handle to the item after which the new item will be inserted.
//										Ignored unless as_Position = "After".
//	Returns:			long: 			 handle of item added successfully  
//										-1 = an error occurred
//	Description:  	Set the item attributes and place into the treeview.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
treeviewitem	ltvi_new

// Check Arguments
If IsNull(al_parent) or IsNull(al_row) or IsNull(al_handle) or &
	(al_parent < 0) or (al_row < 1) or (al_handle < 0) or &
	IsNull(as_position) or (Trim(as_position) = "") or &
	IsNull(ads_source) or Not IsValid(ads_source) Then
	Return -1
End If

Choose Case lower(as_position)
	Case INSERT_FIRST, INSERT_LAST, INSERT_SORT, INSERT_AFTER
		// valid insert type
	Case Else
		Return -1
End Choose

// popuate the new item with data
this.event pfc_SetItemAttributes(al_parent, ads_source, al_row, ltvi_new)

// preform pre insert logic
this.event pfc_PreInsertItem(al_parent, ads_source, al_row, ltvi_new)

// add the item to the listview
If isvalid(inv_levelsource) then
	Return inv_levelsource.event pfc_insertitem(al_parent, ads_source, al_row, ltvi_new, as_position, al_handle)
else
	Choose Case Lower(as_Position)
		Case INSERT_LAST
			Return this.InsertItemLast(al_Parent, ltvi_new)
		Case INSERT_SORT
			Return this.InsertItemSort(al_Parent, ltvi_new)
		Case INSERT_AFTER
			Return this.InsertItem(al_Parent, al_handle, ltvi_new)
		Case INSERT_FIRST
			Return this.InsertItemFirst(al_Parent, ltvi_new)
	End Choose
End If

Return -1
end event

event pfc_additem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_AddItem
//	Arguments:		al_parent	The handle to the Treeview item to place retrieved data under
//						ads_source	The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the treeview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the treeview DataStore. 
//						al_Row		The row in the DataStore pointing to the data.
//	Returns:			Long: 			 Handle of item added  
//										-1 = an error occurred
//	Description:	Add the item as the last child of the parent treeviewitem.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// check the arguments
If IsNull(ads_source) or Not IsValid(ads_source) Then Return -1
If (al_parent < 0) or IsNull(al_parent) Then Return -1
If (al_row < 1) or IsNull(al_row) then Return -1

return this.event pfc_insertitem(al_parent, ads_source, al_row, INSERT_LAST, 0)
end event

event pfc_setitemattributes;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_SetItemAttributes
//	Arguments:		al_parent	The handle to the parent treeview item for this item
//						ads_obj		Datastore holding treeview item information
//						al_row		Row in datastore pointing to treeview Item
//						atvi_item	treeview item about to be inserted.  Passed by Reference
//	Returns:  		Integer:		1 = Success, -1 = Failure 
//	Description:  	Set the default attributes for the treeview item.  
//						Note:		Extend this event to change item attributes before it is inserted into the treeview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// Check Arguments
If IsNull(ads_obj) or Not IsValid(ads_obj) Then Return -1
If (al_row < 1) or IsNull(al_row) then Return -1

If isvalid(inv_levelsource) then
	Return inv_levelsource.event pfc_SetItemAttributes(ads_obj, al_row, atvi_item)
End If

Return -1
end event

event keydown;//////////////////////////////////////////////////////////////////////////////
//	Event:			keydown
//	Arguments: 		key			key pressed down
//						keyflags		alt or ctrl pressed
//	Description:  	Catch the delete key and let pfc handle the delete versus the
//						built in listview deletekey processing
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
If KeyFlags = 0 then
	If Key = KeyDelete! then
		// we can delete through the keyboard if true
		if this.deleteitems then
			// let the pfc delete event delete the item - not the treeview
			message.processed = true
			this.event pfc_deleteitem()
		End if
	End IF
End If
end event

event pfc_refreshitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_RefreshItem
//	Arguments: 		al_handle		The handle of the item to be refreshed.
//	Returns:  		Integer: 		 1 if successful, -1 if an error occurred
//	Description:  	Refresh an item in the treeview.  Reset all its attributes to the 
//						default values based on the data in the DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// see if using the pfc datasource
If isvalid(inv_levelsource) then
	Return inv_levelsource.event pfc_refreshitem(al_handle)
End IF

Return -1
end event

event pfc_prerefreshitem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_PreRefreshItem
//	Arguments: 		al_handle		handle of the item being refreshed
//						ads_obj		Datastore holding treeview item information
//						al_row		Row in datastore pointing to treeview Item
//						atvi_item	treeview item about to be refreshed.  	Passed by Reference
//	Returns:  		None
//	Description:  	Set the default attributes for the treeview item.  
//						Note:		Extend this event to change item attributes before it is refreshed.
//						most likely will be the same as pfc_preinsertitem event
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_GetParentWindow
//	Arguments: 		aw_parent	The Parent window for this object (passed by reference).
//	   					If a parent window is not found, aw_parent is NULL
//
//	Returns:  		integer: 1 = success, -1 = error
//	Description:  	Calculates the parent window of a window object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

public function integer of_setbase (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetBase
//	Arguments: 		ab_switch   enable/disable the base treeview service
//	Returns:  		integer: 1 = success, -1 = error
//	Description:  	Instantiates or destroys the base treeview service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_base) Or not IsValid (inv_base) then
		inv_base = create n_cst_tvsrv
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

public function integer of_setprint (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetPrint
//	Arguments: 		ab_switch   enable/disable the treeview print service
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Instantiates or destroys the treeview print service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_print) Or not IsValid (inv_print) then
		inv_print = create n_cst_tvsrv_print
		inv_print.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_print) then
		destroy inv_print
		li_rc = 1
	end if	
end if

return li_rc
end function

public function integer of_setlevelsource (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_setlevelsource
//	Arguments: 		ab_switch   enable/disable the treeview data source service
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Instantiates or destroys the treeview data source service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_levelsource) Or not IsValid (inv_levelsource) then
		inv_levelsource = create n_cst_tvsrv_levelsource
		inv_levelsource.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_levelsource) then
		destroy inv_levelsource
		li_rc = 1
	end if	
end if

return li_rc
end function

public function integer of_setupdateable (boolean ab_isupdateable);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetUpdateable
//	Arguments: 		ab_isupdateable   Indicates whether the treeview is updateable
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Sets whether the treeview is updateable
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
if IsNull (ab_isupdateable) then
	return -1
end if

ib_isupdateable =  ab_isupdateable

return 1
end function

public function integer of_setlogicalunitofwork (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetLogicalUnitofWork
//	Arguments: 		ab_switch   enable/disable the base window service
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Instantiates or destroys the Logical Unit of Work service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Public Function: of_IsUpdateable
//	Arguments: 		None
//	Returns:  		 boolean: TRUE   The treeview is marked as updateable
//									FALSE  The treeview is not marked as updateable
//	Description:  	Gets the value of the updateable property of the treeview indicating
//						whether any part of the Treeview is updateable
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
return ib_isupdateable
end function

public function integer of_accepttext (boolean ab_focusonerror);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_AcceptText
//	Arguments: 		ab_focusonerror	States if focus should be set in case of error.
//	Returns:  		integer, 1 = CONTINUE_ACTION, 0 = NO_ACTION, -1 = error
//	Description:  	Perform an accepttext and set focus when requested.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
powerobject lpo_updatearray[]

// Make sure there is something to take action on.
If Not of_IsUpdateable() Then Return NO_ACTION

// Determine the appropriate array.
this.of_Getobjects(lpo_updatearray)

Return this.Event pfc_AcceptText(lpo_updatearray, ab_focusonerror)
end function

public function integer of_updatespending ();//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_UpdatesPending
//	Arguments: 		none
//	Returns:  		integer, 1 = Updates are pending, 0 = No updates are pending
//	Description:  	Determine if any updates are pending on this treeview.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Public Function: of_Validation
//	Arguments: 		none
//	Returns:  		integer,  1 = All validation passed, -1 = validation failed
//	Description:  	Validate the datasources on the treeview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Public Function: of_UpdatePrep
//	Arguments: 		none
//	Returns:  		integer, 1 = All preparation passed, 0 = No Action taken, -1 = preparation failed
//	Description:  	Perform an Update Preparation.
// 						Note: Specific updateprep logic should be coded in descendant pfc_updateprep event.
//						Part of the SelfUpdatingObject(SUO) API.
//						No Action will be executed, If the object is not Updateable.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Public Function: of_IsAlwaysValidate
//	Arguments: 		None
//	Returns:  		boolean: 	False, the objects with updates pending will be validated.
//									True, all objects that were tested for updates pending will be validated.
//	Description:  	Gets the switch which determines which objects should be validated in the save process.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
return ib_alwaysvalidate
end function

public function integer of_postupdate ();//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_PostUpdate
//	Arguments: 		None
//	Returns:  		integer, 1 = success, 0 - no action, -1 = error
//	Description:  	Perform post update processing.  Clear the ipo_pendingupdates array.  
//						Call the resetflags function
// 						Note:	Specific PostUpdate logic should be coded in descendant pfc_PostUpdate event.
//						Part of the SelfUpdatingObject(SUO) API.
//						No Action will be executed, If the object is not Updateable.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
//	Public Function: of_Update
//	Arguments: 		ab_accepttext	When applicable, specifying whether control should perform an AcceptText prior to performing the update:
//						ab_resetflag	Value specifying whether object should automatically reset its update flags.
//						apo_requestor	An object requesting the update within a transaction.
//	Returns:  		Integer:  1 = The update was successful, 0 = No Action taken, -1 = The update failed
//	Description:  	Execute the specific Update logic.  
// 						Note: Specific Update logic should be coded in descendant pfc_Update event.
//						Part of the SelfUpdatingObject(SUO) API.
//						No Action will be executed, If the object is not Updateable.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
powerobject lpo_updatearray[]
powerobject lpo_pending[]
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

// Perform the actual update.
li_rc = this.Event pfc_update(lpo_pending, ab_accepttext, ab_resetflag)
	
// Clear the object which requested the update.
of_SetUpdateRequestor(lpo_notvalid)
If IsValid(inv_luw) Then 
	inv_luw.of_SetUpdateRequestor(lpo_notvalid)
End If

Return li_rc
end function

public function integer of_setupdaterequestor (powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetUpdateRequestor
//	Arguments: 		apo_updaterequestor   The object which is requesting an update within a 
//						transaction.  Or an invalid reference to clear the reference.
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Associates the object which is requesting an update within a transaction.
//						Or clears the reference to mean there is no current object requesting an
//						update within a transaction.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
ipo_updaterequestor = apo_updaterequestor

Return 1
end function

public function integer of_getupdaterequestor (ref powerobject apo_updaterequestor);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_GetUpdateRequestor
//	Arguments: 		apo_updaterequestor	The object which is requesting an update within a transaction.
//	Returns:  		integer, 1 success, 0 No requestor, -1 error 
//	Description:  	Gets reference to the object which is requesting an update within a transaction.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// Get the requestor (if any)
apo_updaterequestor = ipo_updaterequestor

If IsValid(apo_updaterequestor) Then return 1

Return 0
end function

public function integer of_Setalwaysvalidate (boolean ab_validate);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetAlwaysValidate
//	Arguments: 		ab_validate   Indicates whether the validation should always be done
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Sets whether the validation should always be done
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
if IsNull (ab_validate) then
	return -1
end if

ib_alwaysvalidate =  ab_validate

return 1
end function

protected function integer of_getobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//	Protected Function: of_GetObjects
//	Arguments: 		apo_objects[] 	An array of objects on which the update process will take effect 	passed by reference.
//	Returns:  		integer:  # of objects in the array, -1 = error
//	Description:  	Gets the current objects for which an updates will be attempted.
//						If another service is added to the tree, this event will need to be extended or 
//						overridden to get those objects which need updates.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// Determine the datasource.
If IsValid(inv_levelsource) Then
	If inv_levelsource.of_GetObjects(apo_objects) < 1 then Return -1
	Return upperbound(apo_objects)
End If

Return -1
end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_GetInfo
//	Arguments: 		anv_infoattrib	(By reference) The Information attributes.
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Gets the Object Information.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// Populate Information.
anv_infoattrib.is_name = 'Service Based Treeview'
anv_infoattrib.is_description = 'Service Based Treeview'

Return 1
end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);

//////////////////////////////////////////////////////////////////////////////
//	Protected Function: of_MessageBox
//	Arguments: 		as_id			An ID for the Message.
//						as_title		Text for title bar
//						as_text		Text for the actual message.
//						ae_icon 		The icon you want to display on the MessageBox.
//						ae_button	Set of CommandButtons you want to display on the MessageBox.
//						ai_default	The default button.
//	Returns:  		integer: Return value of the MessageBox.
//	Description:  	Display a PowerScript MessageBox.  
//						Allow PFC MessageBoxes to be manipulated prior to their actual display.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

public function integer of_getnextlevel (long al_parent);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_GetNextLevel
//	Arguments: 		al_parent	The Treeview handle to find the next level for
//	Returns:  		integer: Returns the datastore level al_parent will populate 
//	Description:  	Determine the datastore level the parent will populate
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer			li_level
treeviewitem	ltvi_item

// check the arguments
If (al_parent < 0) or IsNull(al_parent) Then Return -1

// determine the datastore level the parent will populate
If al_parent <> 0 Then
	If this.GetItem(al_parent, ltvi_item) <> 1 Then Return -1
	li_level = ltvi_item.level + 1
Else
	li_level = 1
End If

Return li_level
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_Reset
//	Arguments: 		None
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Reset the entire treeview (items and datastores).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
//						8.0 	Fix CR258957
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
long 		ll_rootitem
integer	li_index, li_level

this.setredraw(false)

/* Fix CR258957 */
//Delete all items from a TreeView control 
//when there are several items at the first level
DO UNTIL this.FindItem(RootTreeItem!, 0) = -1
	// Find the root of current level
	ll_rootitem = this.FindItem(RootTreeItem!, 0)
	this.DeleteItem(ll_rootitem)
LOOP
/* End of Fix */

// reset the data from the datasource
If isvalid(inv_levelsource) Then
	If inv_levelsource.of_resettree() <> 1 Then Return -1
End If

this.setredraw(true)

Return 1
end function

public function long of_additem (long al_parent, any aa_columnvalues[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_AddItem
//	Arguments: 		al_parent			The handle to the Treeview item to place retrieved data under
//						aa_ColumnValues[]	The array containing the data to be used for the new item.
//	Returns:  		Long: The handle of the item if it was added successfully, 
//								-1 if an error occurrs.
//	Description:  	Add a new item to the treeview using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long					ll_row, ll_newindex
n_ds					lds_datastore

// check the arguments
If upperbound(aa_columnvalues) < 1 then return -1
If (al_parent < 0) or IsNull(al_parent) Then Return -1

// Create the storage datastore
lds_datastore = create n_ds

If isvalid(inv_levelsource) then
	If inv_levelsource.of_ConvertToRow(al_parent, aa_columnvalues, lds_datastore, ll_row) <> 1 Then
		Destroy lds_datastore
		Return -1
	End If
Else
	Destroy lds_datastore
	Return -1
End If

// Add the item to the listview
ll_newindex = this.event pfc_additem(al_parent, lds_datastore, ll_row)

Destroy lds_datastore

return ll_newindex
end function

public function long of_insertitem (long al_parent, any aa_columnvalues[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_InsertItem
//	Arguments: 		al_parent			The handle to the Treeview item to place retrieved data under
//						aa_ColumnValues[]	The array containing the data to be used for the new item.
//	Returns:  		Long: the handle of the item if it was added successfully, 
//						-1 if an error occurrs.
//	Description:  	Add a new item to the treeview using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
return this.of_insertitem(al_parent, aa_columnvalues, INSERT_LAST, 0)
end function

public function long of_insertitem (long al_parent, any aa_columnvalues[], string as_position, long al_handle);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_InsertItem
//	Arguments: 		al_parent			The handle to the Treeview item to place retrieved data under
//						aa_ColumnValues[]	The array containing the data to be used for the new item.
//						as_Position			The position under the parent where the new item will be inserted:
//												"First" - before the first child of the parent
//												"Last" - after the last child (default)
//												"Sort" - in the sorted position based on the item's label
//												"After" - after the item with handle al_handle
//						al_handle				The handle to the item after which the new item will be inserted.
//												Ignored unless as_Position = "After".
//	Returns:  		Long: the handle of the item if it was added successfully, 
//							-1 if an error occurrs.
//	Description:  	Add a new item to the treeview using a inserted row.  The row does
//						not have to be added to the datastore first using this method.  Pass
//						the row in with the aa_columnvalues array.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long					ll_row, ll_newindex
n_ds					lds_datastore

// Create the storage datastore
lds_datastore = create n_ds

If isvalid(inv_levelsource) then
	If inv_levelsource.of_ConvertToRow(al_parent, aa_columnvalues, lds_datastore, ll_row) <> 1 Then
		Destroy lds_datastore
		Return -1
	End If
Else
	Destroy lds_datastore
	Return -1
End If

// Add the item to the listview
ll_newindex = this.event pfc_insertitem(al_parent, lds_datastore, ll_row, as_position, al_handle)

Destroy lds_datastore

return ll_newindex
end function

public function long of_insertitem (long al_parent, ref n_ds ads_obj, long al_row, string as_position, long al_handle);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_InsertItem
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//						ads_obj		The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the treeview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the treeviews DataStore. 
//						al_Row		The row in the DataStore pointing to the data.
//						as_Position			The position under the parent where the new item will be inserted:
//										"First" - before the first child of the parent 
//										"Last" - after the last child (default)
//										"Sort" - in the sorted position based on the item's label
//										"After" - after the item with handle al_handle
//						al_handle		The handle to the item after which the new item will be inserted.
//										Ignored unless as_Position = "After".
//	Returns:  		Long: the handle of the item if it was added successfully, 
//							-1 if an error occurs.
//	Description:  	Instantiates or destroys the treeview print service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Return this.event pfc_insertitem(al_parent, ads_obj, al_row, as_position, al_handle)
end function

public function boolean of_canundo (ref string as_undotype);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_CanUndo
//	Arguments: 		as_undotype		The type of undo we are performing.  Passed by reference
//	Returns:  		Boolean: 	true = we can undo the last edit/insert/delete
//									false = cannot undo the last edit/insert/delete
//	Description:  	Returns if undo can be performed and the type of undo that can be performed
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
// initialize the undo type
as_undotype = ""

// call undo on the service to see if we can perform an undo
If IsValid(inv_levelsource) Then
	Return inv_levelsource.of_canundo(as_undotype)
End If

Return FALSE
end function

public function integer of_setrmbmenu (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_SetRMBMenu
//	Arguments: 		ab_switch   True if RMB menu should pop up on right clicked
//	Returns:  		integer, 1 = success, -1 = error
//	Description:  	Sets whether the popup menu occurs on a right mouse click
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
if IsNull (ab_switch) then
	return -1
end if

ib_rmbmenu =  ab_switch
return 1
end function

public function boolean of_isrmbmenu ();//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_IsRMBMenu
//	Arguments: 		None
//	Returns:  		boolean:	False, the popup menu will not display on right click.
//									True, the popup menu will display on right click.
//	Description:  	Determine if RMB menu should pop up
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
return ib_rmbmenu
end function

public function long of_retrieve (long al_parent, any aa_args[20], ref n_ds ads_data);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_Retrieve
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//						aa_args		retrieval arguments to pass to the datastore if needed
//						ads_data		The datastore holding the rows to add to the treeview as items, passed by reference
//	Returns:  		long: 			 number of items returned by the retrieve, -1 = error
//	Description:  	Return the number of rows placed in the data source
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer			li_nextlevel

// Check Arguments
If (al_parent < 0) or IsNull(al_parent) Then Return -1

// we know which level we are on by the parent, so we want to get the children
//	items for the parent, which mean that the data for the next level down (level + 1)
// will need to be retrieved for a level centric tree.
li_nextlevel = of_GetNextLevel(al_parent)
if li_nextlevel < 1 then Return -1

// retrieve the rows into the datasource
If isvalid(inv_levelsource) then
	Return inv_levelsource.of_retrieve(li_nextlevel, aa_args, ads_data)
End If

Return -1
end function

public function long of_insertitem (long al_parent, n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_InsertItem
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//						ads_obj		The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the treeview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the treeviews DataStore.  
//						al_Row		The row in the DataStore pointing to the data.
//	Returns:  		Long: 			the handle of the item if it was added successfully, 	-1 if an error occurrs.
//	Description:  	Add a new item to the treeview using data from a DataStore.
//						This function overloads the real of_InsertItem function to allow the last 2
//						parameters to be optional.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Return this.event pfc_InsertItem(al_parent, ads_obj, al_row, INSERT_LAST, 0)
end function

public function long of_populate (long al_parent);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_Populate
//	Arguments: 		al_parent	The handle to the Treeview item to place retrieved data under
//	Returns:  		Long: 			# of items treeview was populated with
//			 							0 if nothing was populated
//										-1 = error
//	Description:  	Retrieves the datasource and uses it to load the treeview with data
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
n_ds		lds_data

// check arguments
IF (al_parent < 0) or IsNull(al_parent) then Return -1

Setpointer(hourglass!)

// retrieve the data into the services datastore
IF this.event pfc_retrieve(al_parent, lds_data) < 0 Then Return -1

// add the treeview data
Return this.event pfc_AddAll(al_parent, lds_data) 
end function

event destructor//////////////////////////////////////////////////////////////////////////////
//	Event:  			Destructor
//	Description:  	Destroy the treeview services.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
of_setbase( false )
of_setprint( false )
of_setlevelsource( false )
of_setlogicalunitofwork( false )
end event

event itemexpanding;//////////////////////////////////////////////////////////////////////////////
//	Event:  			ItemExpanding
//	Description:  	If this is the first time the item is expanded, call pfc_PopulateLevel to populate it with its children.
//						This is done in this event as opposed to the ItemPopulate	event because it needs to be executed again
//						if the children are deleted (pfc_RefreshItem).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
If IsValid(inv_levelsource) Then
	inv_levelsource.event pfc_itemexpanding(handle)
end if
end event

event endlabeledit;//////////////////////////////////////////////////////////////////////////////
//	Event:  			EndLabelEdit
//	Description:  	Change the label column in the appropriate DataStore to be the new label text.  This only works 
//						if the label column is updatable.  If a computed column is being used for the	label, override this
//						script with appropriate code.
//						NOTE:  Update() is NOT called for the DataStore.  This is left to the user to perform.  If the
//						label column is also part of the key, or is used as a retrieval argument for any of its children, 
//						this item should be refreshed with of_RefreshItem.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

if isvalid(inv_levelsource) then
	If inv_levelsource.event pfc_endlabeledit(handle, newtext) <> CONTINUE_ACTION Then
		// prevent new text from becoming the label
		Return 1
	End If
end if
	
// returning 0 makes the label change
Return 0
end event

event begindrag;//////////////////////////////////////////////////////////////////////////////
//	Event:  			BeginDrag
//	Description:  	Save the handle of the item that is being dragged in the instance variable il_DragSource.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
il_DragSource = handle
end event

event dragdrop;//////////////////////////////////////////////////////////////////////////////
//	Event:  			DragDrop
//	Description:  	Save the handle of the item that is being dropped on in the instance variable il_DragTarget.
//						The user should extend this script to allow dragging and dropping TreeView items from one branch to
//						another.  il_DragSource will equal the handle of the item being dropped.
//						NOTE:  You should verify that source is this TreeView control.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
il_DragTarget = handle
end event

event getfocus;//////////////////////////////////////////////////////////////////////////////
//	Event:  			GetFocus
//	Description:  	If appropriate, notify the parent window that this control got focus.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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

event rightclicked;//////////////////////////////////////////////////////////////////////////////
//	Event:  			RightClicked
//	Description:  	Keep track of the item that was clicked and trigger the popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
boolean		lb_frame
long			ll_selected
window		lw_parent
window		lw_frame
window		lw_sheet
window		lw_childparent
m_tvs			lm_view
treeviewitem lvi_item

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
	lm_view = create m_tvs
	lm_view.of_SetParent (this)
end if

/*  Make rightclicked item the current item  */
this.SelectItem ( handle )

// we have clicked on an item
If handle > 0 Then
	lm_view.m_viewitem.m_delete.visible = True
	If this.editlabels Then
		lm_view.m_viewitem.m_rename.visible = True
	Else
		lm_view.m_viewitem.m_rename.visible = False
	End IF
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

event constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			Constructor
//	Description:  	Service Based TreeView Control.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
end event

on pfc_u_tvs.create
end on

on pfc_u_tvs.destroy
end on

