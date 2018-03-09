HA$PBExportHeader$pfc_n_cst_dwsrv_grid.sru
$PBExportComments$PFC GRID DataWindow service
forward
global type pfc_n_cst_dwsrv_grid from n_cst_dwsrv
end type
type ids_original from datastore within pfc_n_cst_dwsrv_grid
end type
type ids_repository from datastore within pfc_n_cst_dwsrv_grid
end type
end forward

global type pfc_n_cst_dwsrv_grid from n_cst_dwsrv
event pfc_showdialog ( )
ids_original ids_original
ids_repository ids_repository
end type
global pfc_n_cst_dwsrv_grid pfc_n_cst_dwsrv_grid

type variables
Private:
string		is_ContextKey
any		is_ContextValue

Protected:
Boolean	ib_Original = false
string		is_DialogTitle

n_cst_apppreference	inv_apppref


end variables

forward prototypes
public function integer of_populate ()
protected function integer of_showdialog ()
public function integer of_setdialogtitle (string as_title)
public function string of_getdialogtitle ()
public function integer of_apply ()
public function integer of_save ()
public function integer of_load ()
protected function string of_getlayoutdata ()
protected function integer of_setlayoutdata (string as_layout)
public function integer of_setoriginalcopy ()
public function integer of_restoreoriginalcopy ()
public function integer of_restoreoriginallayout ()
end prototypes

event pfc_showdialog();//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_showdialog
//
// Access:			public
//
// Returns:			(none)
//						
//
// Description:	Open the service dialog
//
// Usage:			Call this event to show the service dialog.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
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

of_showdialog( )

end event

public function integer of_populate ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_populate
//
// Access:			Public
//
// Returns:			integer
//						 1, Success
//						-1, Failure
//
// Description:	Populates the service repository and keep a copy as the
//						original layout the fist time it is called.
//
// Usage:			This function is automatically called when opening the
//							service Dialog.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version.
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
integer 	li_rc = success
integer	li_i
integer	li_limit
long		ll_row
string		ls_dwobject[]
string		ls_name[]
string		ls_visible[]
string		ls_order[]
string		ls_width[]

// 1. Get DW objects to be handled
// 1.1 - Get columns
li_rc = of_getobjects( ls_dwobject,"COLUMN", "DETAIL", false )
if li_rc < 0 then return failure

// 1.2 - Then append computed 
li_rc = of_getobjects( ls_dwobject, "COMPUTE", "DETAIL", false, true) 
if li_rc < 0 then return failure

// 1.3 - Get number of entries
li_limit = upperbound( ls_dwobject )

// 1.4 - Get name of Dw objects
li_rc = of_describe( ls_name, "#HEADERNAME#", ls_dwobject )
if li_rc <> success then return failure

// 1.5 - Get Visible status of Dw objects
li_rc = of_describe( ls_visible, "VISIBLE", ls_dwobject )
if li_rc <> success then return failure

// 1.6 - Get Order of appearance of Dw objects
li_rc = of_describe( ls_order, "X", ls_dwobject )
if li_rc <> success then return failure

// 1.7 - Get width of Dw objects
li_rc = of_describe( ls_width, "WIDTH", ls_dwobject )
if li_rc <> success then return failure

// 2. Store result in service repository
ids_repository.object.column_visible.primary	= ls_visible
ids_repository.object.column_name.primary		= ls_name
ids_repository.object.column_order.primary		= ls_order
ids_repository.object.column_width.primary		= ls_width
ids_repository.object.column_id.primary 			= ls_dwobject

// 2.1 - Sort dw object by order of appearance
ids_repository.sort( )

// 2.2 -  Make order of appearance sequential
for li_i = 1 to li_limit
	ids_repository.object.column_order[li_i] = string(li_i)
	//trim off leading and trailing spaces
	ids_repository.object.column_name.primary[li_i] =&
	trim(ids_repository.object.column_name.primary[li_i],false)
next

// 3. Make a copy of the original layout for further use
if ib_original = false then
	of_setoriginalcopy( )
	ib_original = true
end if

return li_rc

end function

protected function integer of_showdialog ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_showdialog
//
// Access:			Protected
//
// Returns:			integer
//						 1, Success
//						-1, Failure
//
// Description:	Display the service dialog
//
// Usage:			This method is automatically called by the
//							pfc_showdialog() event.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
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

window lw_parent

idw_requestor.of_getparentwindow( lw_parent )

return openwithparm( w_grid, idw_requestor, lw_parent )




end function

public function integer of_setdialogtitle (string as_title);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setdialogtitle
//
// Access:			Public
//
// Arguments:
// as_title:		The title to be used by the service dialog.
//
// Returns:			integer
//						 1, Sucess
//						-1, Failure
//
// Description:	Set the title of the service dialog.
//
// Usage:			Call this method to set the service dialog title before
//							calling the pfc_showdialog() event.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
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

if isnull( as_title ) or len(trim( as_title ) ) = 0 then return failure

is_DialogTitle = as_title

return success
end function

public function string of_getdialogtitle ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getdialogtitle
//
// Access:			Public
//
// Returns:			string
//						The title of the service dfialog.
//
// Description:	Returns the title displayed by the service dialog.
//
// Usage:			Call this function to get the actual Grid service dialog
//							Title.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
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
return is_dialogtitle

end function

public function integer of_apply ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_apply
//
// Access:			Public
//
// Returns:			integer
//						 1 - Success
//						-1 - Failure
//
// Description:	Apply actual layout defined in the service repository
//
// Usage:			This function is automatically called when clicking on
//							the Apply or OK button of the Grid Service Dialog..
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
//	12.5		10/17/2014			Issue 11899 corrected
//////////////////////////////////////////////////////////////////////////////

long	ll_i
long	ll_limit

// 1. Make all columns of the requestor dw invisible
ll_limit = ids_repository.rowcount()
if ll_limit < 1 then return no_action

for ll_i = 1 to ll_limit
	idw_requestor.modify( ids_repository.object.column_id[ll_i]+".visible = '0'")
next

// 2. Filter on visible column & sort it by order of appearance
if ids_repository.SetFilter("column_visible = '1'") <> success then return failure
ids_repository.Filter()

ids_repository.sort()

// 3. Make remaining columns visible & restore width
ll_limit = ids_repository.rowcount()
for ll_i = 1 to ll_limit
	idw_requestor.modify( ids_repository.object.column_id[ll_i] + ".x = '10'" )
	idw_requestor.modify( ids_repository.object.column_id[ll_i] + ".visible = '1'" )
	idw_requestor.modify( ids_repository.object.column_id[ll_i] +".width = '"+ids_repository.object.column_width[ll_i]+"'")
next

// 4. Restore previous state of the repository
// 4.1. Clean filter
if ids_repository.SetFilter("") <> success then return failure		//	11899
ids_repository.Filter()
// 4.2 Sort by order of appearance
ids_repository.Sort()

return success
end function

public function integer of_save ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_save
//
// Access:			Public
//
// Returns:			integer
//						 1, Success
//						-1, Failure
//
// Description:	Store tha actual layout of the requestor dw control using
//						the Application Preference service.
//
// Usage:			This method is automatically called when the method
//							of_SetGrid(FALSE) is called at requestor dw control level.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
//////////////////////////////////////////////////////////////////////////////

string	ls_key
string	ls_subkey
string	ls_value
window	lw_parent

// 1. Preliminary checks
if not isvalid( inv_apppref) or isnull( inv_apppref ) then return failure
if idw_requestor.of_getparentwindow( lw_parent ) = failure then return failure

// 2. Get Actual layout informations
ls_key 		= classname( lw_parent)
ls_subkey 	= classname(idw_requestor)
ls_value		= this.of_Getlayoutdata( )

// 3. Save actual layout through the Application Preference Service
return inv_apppref.of_save( ls_key, ls_subkey, ls_value )

end function

public function integer of_load ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_load
//
// Access:			Public
//
// Returns:			integer
//						 1, Success
//						-1, Failure
//
// Description:	Restore last saved layout of the requestor dw control.
//
// Usage:			This method is automatically called when the service is
//							activated though the call of the method of_SetGrid(TRUE) 
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

integer	li_rc
string		ls_key
string		ls_subkey
string		ls_value
string		ls_null
window	lw_parent

// 1.Preliminary Check 
if not isvalid( inv_apppref) or isnull( inv_apppref ) then return failure
if idw_requestor.of_getparentwindow( lw_parent ) = failure then return failure

// 2.Keep a copy of the original layout of the requrestor DW
of_populate( )

// 3.Get Last saved layout data using the actual settings of the Application Preference Service
setnull(ls_null)
ls_key 		= classname( lw_parent)
ls_subkey 	= classname(idw_requestor)
li_rc 			=  inv_apppref.of_restore( ls_key, ls_subkey, ls_value, ls_null)

// 3.1 Retrun failure if anything goes wrong during the reading of the data
if li_rc <> success then return failure

// 4. Apply loaded layout
if of_SetLayoutdata( ls_value ) > 0 then
	of_apply( )
end if

return success
end function

protected function string of_getlayoutdata ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getlayoutdata
//
// Access:			Protected
//
// Returns:			string
//						The actual layout string in ASCII compatible format
//
// Description:	Get actual layout and prepare it to be ASCII compatible
//						in order to be readable  
//						in any kind of files it can be saved into (INI, REG or
//						XML).
//					This format consist by replacing :
//						- Horizontal Tab characters (~t) by comma,
//						- Carriage Return (~r) & New line characters (~n) by #
//
// Usage:			This method is automatically called by the of_Save()
//							method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
//////////////////////////////////////////////////////////////////////////////

string ls_rc

n_cst_string	lnv_string

ls_rc = ids_repository.object.datawindow.data
if not isnull( ls_rc ) and len(trim(ls_rc)) > 0 then
	ls_rc = lnv_string.of_globalreplace( ls_rc, "~t", ",", FALSE)
	ls_rc = lnv_string.of_globalreplace( ls_rc, "~r~n", "#", FALSE)
end if

return ls_rc
end function

protected function integer of_setlayoutdata (string as_layout);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setlayoutdata
//
// Access:			Protected
//
// Arguments:
// as_layout:		The string containing the layout to be applied in
//						compatible ASCII format. See of_getlayoutdata()
//						method for more information about the format used.
//
// Returns:			integer
//						An integer > than zero in case of success,
//						or an integer < than zero if an error occurs.
//
// Description:	Apply passed layout as the actual one
//
// Usage:			This method is automatically called by the of_load()
//							method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

string 	ls_rc
integer	li_rc
n_cst_string	lnv_string

if isnull( as_layout) or len(trim(as_layout)) = 0 then return failure

ls_rc = as_layout
ls_rc = lnv_string.of_globalreplace( ls_rc, ",", "~t", FALSE)
ls_rc = lnv_string.of_globalreplace( ls_rc, "#", "~r~n", FALSE)

ids_repository.reset()
li_rc = ids_repository.importstring( ls_rc)

return li_rc
end function

public function integer of_setoriginalcopy ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setoriginalcopy
//
// Access:			Public
//
// Returns:			integer
//						always return Success
//						
//
// Description:	Make a copy of the original layout for further user.
//
// Usage:			This method is called by the of_populate() method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

ids_original.object.data.primary = ids_repository.object.data.primary

return success
end function

public function integer of_restoreoriginalcopy ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_restoreoriginalcopy
//
// Access:			Public
//
// Returns:			integer
//						 1, Success
//						-1, Failure
//
// Description:	Restore the original layout into the service repository
//
// Usage:			This function is automatically called when calling the
//							of_Cancel() method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version.
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

ids_repository.object.data.primary = ids_original.object.data.primary

return success
end function

public function integer of_restoreoriginallayout ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_restoreoriginallayout
//
// Access:			Public
//
// Returns:			integer
//						 1 - Success
//						-1 - Failure
//
// Description:	Restore the original layout and re-apply it.
//
// Usage:		This function is automatically called when clicking on
//					the APPLY or OK button of the Grid Dialog Service
//					when the Restore Original Layout option is requested.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5		Initial Version
//////////////////////////////////////////////////////////////////////////////

this.of_restoreoriginalcopy( )
this.of_apply( )

return success
end function

on pfc_n_cst_dwsrv_grid.create
call super::create
this.ids_original=create ids_original
this.ids_repository=create ids_repository
end on

on pfc_n_cst_dwsrv_grid.destroy
call super::destroy
destroy(this.ids_original)
destroy(this.ids_repository)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
// Event: constructor
//
// Description:	Initialise the grid service
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

// Get Application Preference Service ref
gnv_app.of_setapppreference( true )
inv_apppref = gnv_app.inv_apppref

end event

type ids_original from datastore within pfc_n_cst_dwsrv_grid descriptor "pb_nvo" = "true" 
string dataobject = "d_dwsrv_grid"
end type

on ids_original.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_original.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type ids_repository from datastore within pfc_n_cst_dwsrv_grid descriptor "pb_nvo" = "true" 
string dataobject = "d_dwsrv_grid"
end type

on ids_repository.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_repository.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

