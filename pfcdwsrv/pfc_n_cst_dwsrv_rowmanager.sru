HA$PBExportHeader$pfc_n_cst_dwsrv_rowmanager.sru
$PBExportComments$PFC DataWindow RowManager service
forward
global type pfc_n_cst_dwsrv_rowmanager from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_rowmanager from n_cst_dwsrv
event type long pfc_insertrow ( long al_beforerow )
event type long pfc_addrow ( )
event type long pfc_deleterow ( )
event type long pfc_restorerow ( )
end type
global pfc_n_cst_dwsrv_rowmanager pfc_n_cst_dwsrv_rowmanager

type variables
Protected:
boolean	ib_confirmondelete
boolean	ib_restorerow = True
end variables

forward prototypes
public function long of_undelete ()
public function boolean of_getconfirmondelete ()
public function integer of_setconfirmondelete (boolean ab_switch)
public function long of_insertrow (long al_beforerow)
protected function integer of_confirmdelete (long al_amount)
public function integer of_deleterow (long al_row)
public function long of_deleteselected ()
public function integer of_SetRestoreRow (boolean ab_switch)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public function boolean of_IsRestoreRow ()
public function integer of_deleteall ()
end prototypes

event pfc_insertrow;call n_cst_dwsrv::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_insertrow
//
//	Arguments:
//	al_beforerow:  row number to insert the new row before
//	0 inserts at the end of all rows.
//
//	Returns:  long
//	number of the row that was inserted
//	-1 = error
//
//	Description:
//	Inserts a new row into the DW requestor
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

return of_InsertRow (al_beforerow)
end event

event pfc_addrow;call n_cst_dwsrv::pfc_addrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_addrow
//
//	Arguments:  none
//
//	Returns:  long
//	number of the row that was inserted
//	-1 = error
//
//	Description:
//	Adds a new row to the end of the DW requestor
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

return of_InsertRow (0)
end event

event pfc_deleterow;call super::pfc_deleterow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_deleterow
//
//	Arguments:  none
//
//	Returns:  long
//	 number of rows deleted
//	-1 = error
//
//	Description:
//	Deletes the current or selected row(s) of the DW requestor
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

long		ll_rc
long		ll_selectedrow

// Validate DW requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

ll_selectedrow = idw_requestor.GetSelectedRow (0)
if ll_selectedrow > 0 then
	ll_rc = of_DeleteSelected()
else
	ll_rc = of_DeleteRow (0)
end if

return ll_rc
end event

event pfc_restorerow;call super::pfc_restorerow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_restorerow
//
//	Arguments:  none
//
//	Returns:  long
//	number of rows restored (undeleted)
//	-1 = error
//	-2 = no rows in delete buffer to undelete
//
//	Description:
//	Allows user to undelete rows in the DW
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

long	ll_rc

ll_rc = of_UnDelete()
if ll_rc = -2 then
	of_MessageBox ('pfc_rowmanager_norestore', gnv_app.iapp_object.displayname, &
		"There are no " + is_displayunits + " to restore.", Information!, Ok!, 1)
end if

return ll_rc
end event

public function long of_undelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Undelete
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  long
//	number of rows that were restored to the primary buffer
//	-1 = error
//	-2 = no rows are in the delete buffer to undelete
//
//	Description:
//	Allows user to select rows which can be undeleted
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Replaced call to w_undelete with call to new w_restorerow dialog.
//			Added call to the dw.pfc_prerestorerow event.
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

n_cst_returnattrib	lnv_return 
n_cst_restorerowattrib lnv_restorerowattrib

// Validate DW requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Check deleted count first
if idw_requestor.DeletedCount() <=0 then
	return -2
end if

// Populate information passed to the RestoreRow window.
lnv_restorerowattrib.idw_active = idw_requestor
idw_requestor.Event pfc_prerestorerow (lnv_restorerowattrib)

// Restore rows.
OpenWithParm (w_restorerow, lnv_restorerowattrib)

// w_restorerow closes with a CloseWithReturn value.  Get the value.
if IsValid(Message.PowerObjectParm) then
	if lnv_return.ClassName() = Message.PowerObjectParm.ClassName() then
		lnv_return = Message.PowerObjectParm
	else
		return -1
	end if
else
	return -1
end if

// Set focus back on the dw.
idw_requestor.SetFocus()

return lnv_return.ii_rc

end function

public function boolean of_getconfirmondelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetConfirmOnDelete
//
//	Access:  Public
//
//	Arguments:  none
//
//	Returns:  boolean
//
//	Description:
//	Returns whether deletions will be confirmed first
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

return ib_confirmondelete
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
//	Sets whether deletions will be confirmed by user first
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

// Validate arguments
if IsNull (ab_switch) then return -1
ib_confirmondelete = ab_switch
return 1
end function

public function long of_insertrow (long al_beforerow);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertRow
//
//	Access:  public
//
//	Arguments:
//	al_beforerow   Identifies the row before which you want to insert the new row.
//	0 inserts at the end of all rows.
//
//	Returns:  long
//	The row number of the new row
//	-1 = error
//
//	Description:
//	Inserts a new row into the DataWindow
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

long	ll_rc

// Validate DW requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

ll_rc = idw_requestor.InsertRow (al_beforerow)
if ll_rc > 0 then
	// Scroll to the new row
	idw_requestor.SetRow (ll_rc)
	idw_requestor.ScrollToRow (ll_rc)
	idw_requestor.SetFocus()
end if

return ll_rc

end function

protected function integer of_confirmdelete (long al_amount);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ConfirmDelete
//
//	Access:  protected
//
//	Arguments:
//	al_amount:  number of rows to confirm deletion for
//
//	Returns:  integer
//	 1 = yes (ok to delete)
//	 2 = no (do not delete)
//	-1 = error
//
//	Description:  Displays messagebox confirming deletion
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

// Validate amount argument
if al_amount <=0 then
	return -1
end if

// Display confirm delete message based on single/multiple deletes
if al_amount = 1 then
	return of_MessageBox ("pfc_rowmanager_confirmsingledelete", "Confirm Delete",  &
		"Are you sure you want to delete " + is_displayitem + "?", question!, yesno!, 1)
else
	return of_messageBox ("pfc_rowmanager_confirmmultipledelete","Confirm Multiple Delete", &
		"Are you sure you want to delete these " + &
		String (al_amount) + " " + is_displayunits + "?", question!, yesno!, 1)
end if
end function

public function integer of_deleterow (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DeleteRow
//
//	Access:  Public
//
//	Arguments:
//	al_delete_row:  Identifies the row you want to delete.
//	Specify 0 to delete the current row.
//
//	Returns:  integer
//	 1 = success
//	 0 = Row was not deleted
//	-1 = error
//
//	Description:
//	Deletes the specified row in the datawindow
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
integer	li_confirm = 1

// Validate requestor DW
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Confirm delete
if ib_confirmondelete then
	li_confirm = of_ConfirmDelete (1)
end if

// Delete row
if li_confirm = 1 then
	if al_row = 0 then
		al_row = idw_requestor.GetRow()
		if al_row <= 0 then return -1
	end if
	li_rc = idw_requestor.DeleteRow (al_row)
	if li_rc > 0 then
		al_row --
		if al_row <= 0 then
			al_row = 1
		end if
		if idw_requestor.RowCount() > 0 then
			idw_requestor.SetRow (al_row)
			idw_requestor.ScrollToRow (al_row)
			idw_requestor.SetFocus()
		end if
	end if
end if

return li_rc


end function

public function long of_deleteselected ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DeleteSelected
//
//	Access:  Public
//
//	Arguments:  none
//
//	Returns:  long
//	Number of rows deleted
//	-1 = error
//
//	Description:  
//	Deletes any rows that are selected
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 	Changed loop to find next Selected row.  The starting row will now
//			be based on the last selected row.
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

integer	li_confirm = 1
integer	li_delete
long		ll_selectedcount
long		ll_row
long		ll_deletedcount

// Validate requestor DW
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Determine number of selected rows
ll_row = idw_requestor.GetSelectedRow (0)
do while ll_row > 0
	ll_selectedcount++
	ll_row = idw_requestor.GetSelectedRow (ll_row)
loop

// Confirm delete
if ib_confirmondelete then
	li_confirm = of_ConfirmDelete (ll_selectedcount)
end if

// Delete selected rows
if li_confirm = 1 then
	// Prevent redraw slowdown if multiple rows selected
	if ll_selectedcount > 1 then
		SetPointer (hourglass!)
		idw_requestor.SetRedraw (false)
	end if
	
	// Get the first selected row.
	ll_row = idw_requestor.GetSelectedRow (0)
	do while ll_row > 0
		li_delete = idw_requestor.DeleteRow (ll_row)
		if li_delete > 0 then
			ll_deletedcount++
		else
			exit
		end if
		ll_row = idw_requestor.GetSelectedRow (ll_row -1)
	loop
end if

// Turn redraw back on if multiple rows were deleted
if ll_selectedcount > 1 then
	idw_requestor.SetRedraw (true)
end if

return ll_deletedcount
end function

public function integer of_SetRestoreRow (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRestoreRow
//
//	Access:  Public
//
//	Arguments:
//	ab_switch:  specifies whether restore row functionality is desired.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets restore row functionality is desired.
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

// Validate arguments
if IsNull (ab_switch) then return -1
ib_restorerow = ab_switch
return 1
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
anv_infoattrib.is_name = 'Row Manager'
anv_infoattrib.is_description = &
	'Enhances row inserts, deletes, and facilitates restoring of deleted rows.'

Return 1
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
anv_attrib.is_description = lnv_infoattrib.is_description

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvrowmanager'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

public function boolean of_IsRestoreRow ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsRestoreRow
//
//	Access:  Public
//
//	Arguments:  none
//
//	Returns:  boolean
//
//	Description:
//	Returns whether whether restore row functionality is enabled.
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

return ib_restorerow
end function

public function integer of_deleteall ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DeleteAll
//
//	Access:  Public
//
//	Arguments:  none
//
//	Returns:  integer
//	Number of rows deleted
//	-1 = error
//
//	Description:  Deletes all rows from the primary buffer of the DW
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Corrected return value to return Number of rows deleted.
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

integer	li_confirm = 1
long		ll_rowcount

// Validate DW requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Determine # of rows to be deleted
ll_rowcount = idw_requestor.RowCount()
if ll_rowcount <= 0 then
	return 0
end if

// Confirm deletion
if ib_confirmondelete then
	li_confirm = of_ConfirmDelete (ll_rowcount)
end if

// Delete all rows
if li_confirm = 1 then
	idw_requestor.RowsMove (1, ll_rowcount, primary!, idw_requestor, idw_requestor.DeletedCount() + 1, delete!)
	return ll_rowcount
end if

// No rows deleted.
return 0

end function

on pfc_n_cst_dwsrv_rowmanager.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_rowmanager.destroy
TriggerEvent( this, "destructor" )
end on

