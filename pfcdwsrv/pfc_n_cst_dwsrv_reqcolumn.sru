HA$PBExportHeader$pfc_n_cst_dwsrv_reqcolumn.sru
$PBExportComments$PFC DataWindow Required Column service
forward
global type pfc_n_cst_dwsrv_reqcolumn from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_reqcolumn from n_cst_dwsrv
end type
global pfc_n_cst_dwsrv_reqcolumn pfc_n_cst_dwsrv_reqcolumn

type variables
Protected:

string 	is_skipcolumn[]
string	is_skip

end variables

forward prototypes
public function integer of_settonullifempty (long al_row, string as_colname, string as_text)
protected function integer of_updateskipstring (string as_skipcolumn[])
public function integer of_registerskipcolumn (string as_column)
public function integer of_getregisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_GetRegistered (ref string as_regcolumns[])
public function boolean of_IsRegistered (string as_column)
public function integer of_Unregister (string as_column)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

public function integer of_settonullifempty (long al_row, string as_colname, string as_text);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetToNullIfEmpty
//
//	Access:    Public
//
//	Arguments:
//	al_row		The row to check.
//	as_colname	The column name to check on.
//	as_text		The current text to check.
//
//	Returns:  	Integer
//					 3	Reject the data value but allow focus to change.
//						The empty string was not converted to string since the current
//						value on the dw buffer is a null value.   A return code of 3 on
//						the itemerror will reject the value thus leaving it with
//						a null.
//					 1 Converted Empty value to a Null via a dw_cntrl.SetItem.
//						A return code of 3 on the itemerror will leave the null value
//						on the field.
//					 0 No action was taken.
//					-1 an error occurred.
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
//////////////////////////////////////////////////////////////////////////////

string	ls_describe
string	ls_rc
string	ls_null
any		la_currentvalue
SetNull  (ls_null)

// Determine if the field has an empty value.
If as_text <> '' Then Return 0

// Determine if the column is marked to be skipped.
IF Pos(Lower(is_skip), '~t'+Lower(as_colname)+'~t') > 0 Then Return 0

// Determine if the error is because it is Required Field. 
ls_describe =	as_colname + '.Edit.Required ' + &
					as_colname + '.EditMask.Required ' + &
					as_colname + '.DDLB.Required ' + &
					as_colname + '.DDDW.Required '
ls_rc = idw_requestor.Describe(ls_describe)
If Pos(Lower(ls_rc), 'yes') = 0 Then Return 0

// The field is a Required Field; Now determine if Nulls are allowable. 
ls_describe =	as_colname + '.Edit.NilIsNull ' + &
					as_colname + '.DDLB.NilIsNull ' + &
					as_colname + '.DDDW.NilIsNull ' 	
ls_rc = idw_requestor.Describe(ls_describe)
If Pos(Lower(ls_rc), 'yes') = 0 Then Return 0

//////////////////////////////////////////////////////////////////////////////
// The field is a Required Field Which has the NilIsNul attributes on. 
//////////////////////////////////////////////////////////////////////////////

// Get the current value on this row/column.
la_currentvalue = of_GetItemAny(al_row, as_colname)

// Prevent the Row and Item Status from changing if the value was 
//	originally null.
If IsNull(la_currentvalue) Then 
	Return 3
End If

// Convert the empty string to a Null value.
// The of_SetItem will handle the Column Type value. 
Return of_SetItem (al_row, as_colname, ls_null)

end function

protected function integer of_updateskipstring (string as_skipcolumn[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateSkipString
//
//	Access: 			Protected
//
//	Arguments:
//	as_skipcolumn	Array to be used in the construction of the Skip String.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Create the current skip string.
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

integer	li_max
integer	li_index

// Initialize the string.
is_skip = '~t'

// Get the number of entries on array.
li_max = UpperBound ( as_skipcolumn )

// Loop around array creating the string, with each entry separated by a tab ('~t').
For li_index = 1 to li_max
	If Len (Trim(as_skipcolumn[li_index])) > 0 Then
		is_skip = is_skip + as_skipcolumn[li_index] + '~t'
	End If
Next

Return 1
end function

public function integer of_registerskipcolumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RegisterSkipColumn
//
//	Access: 			Public
//
//	Arguments:
//	as_column		Column that should be added so it can be skipped.
//
//	Returns:  		Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	0 if column already registered.
// -1 failure.
//
//	Description:  	
//	Register a column to skip process on.  If column is to be skipped then 
//	the service will not take any action on it.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Added checks to prevent column from being registered multiple times.
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
integer	li_slotavailable = 0

// Check arguments.
If IsNull(as_column) or Len(Trim(as_column))=0 Then 
	Return -1
End If

// Trim and Convert to lower case.
as_column = Lower(Trim(as_column))

// Determine if column is already registered.
li_upper = UpperBound(is_skipcolumn)
For li_cnt = 1 to li_upper
	If is_skipcolumn[li_cnt] = as_column Then
		// Column was previously registered.
		Return 0 
	End If
	// Get the first slot available.
	If Len(is_skipcolumn[li_cnt]) = 0 And li_slotavailable = 0 Then
		li_slotavailable = li_cnt
	End If
Next

// Use the slot available or create a new upper entry.
If li_slotavailable = 0 Then
	li_slotavailable = li_upper + 1
End If

// Add to array.
is_skipcolumn[ li_slotavailable ] = as_column

// Update the skip string.
of_UpdateSkipString (is_skipcolumn)

Return 1
end function

public function integer of_getregisterable (ref string as_allcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisterable
//
//	Access:    		Public
//
//	Arguments:
//   as_allcolumns[]		Passed by reference, that will hold all the columns 
//			that the service could receive for registering purposes.
//
//	Returns:   		Integer
//   					1 if it succeeds and 
//						-1 if an error occurs.
//
//	Description:  
//	To get the list of all the columns that the service could receive for 
//	registering purposes.
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

string	ls_allcolumns[]

// Get all the column names on the datawindow.
of_GetObjects(ls_allcolumns, "column", "*", True) 

as_allcolumns = ls_allcolumns
Return UpperBound(as_allcolumns)



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
anv_infoattrib.is_name = 'Required Column'
anv_infoattrib.is_description = &
	'This service enables and disables default DataWindow processing for '+&
	'required fields, making it easier for your application to handle '+&
	'interdependent fields within a DataWindow.  '+&
	'This service applies only to DataWindow columns that use the nilisnull property. '

Return 1
end function

public function integer of_GetRegistered (ref string as_regcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegistered
//
//	Access: 			Public
//
//	Arguments:
//	as_regcolumns[] by reference.   Registered columns.
//
//	Returns:  		Integer
//						The number of registered columns.
//
//	Description:  	
//	Gets all the registered SkipColumns.
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

integer	li_upper
integer	li_cnt
integer	li_regcnt = 0
string	ls_empty[]

// Initialize
as_regcolumns = ls_empty

// Loop around the entire array.
li_upper = UpperBound(is_skipcolumn)
For li_cnt = 1 to li_upper
	If Len(is_skipcolumn[li_cnt]) > 0 Then
		// Found a registered column.
		li_regcnt ++
		as_regcolumns[li_regcnt] = is_skipcolumn[li_cnt]
	End If
Next

Return UpperBound(as_regcolumns[])
end function

public function boolean of_IsRegistered (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access: 			Public
//
//	Arguments:
//	as_column		Column which needs to be tested..
//
//	Returns:  		boolean
//		True / False
//
//	Description:  	
//	Determines if the passed in column is registered.
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

integer	li_upper
integer	li_cnt

// Check arguments.
If IsNull(as_column) or Len(Trim(as_column))=0 Then 
	Return False
End If

// Trim and Convert to lower case.
as_column = Lower(Trim(as_column))

// Determine if column is registered.
li_upper = UpperBound(is_skipcolumn)
For li_cnt = 1 to li_upper
	If is_skipcolumn[li_cnt] = as_column Then
		// Column was previously registered.
		Return True
	End If
Next

// The column is not registerd.
Return False
end function

public function integer of_Unregister (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Unregister
//
//	Access: 			Public
//
//	Arguments:
//	as_column		Column that should be deleted from the skip array.
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Unregister a column from skip process.  
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
integer	li_index

// Check arguments.
If IsNull(as_column) or Len(Trim(as_column))=0 Then 
	Return -1
End If

// Get the current number of entries on array.
li_upper = UpperBound (is_skipcolumn)

// Loop around array and unregister entry if found.
For li_index = 1 to li_upper
	If Lower(as_column) = Lower(is_skipcolumn[li_index]) Then
		
		// Found matching entry, Unregister it.
		is_skipcolumn[li_index] = ''
		
		// Update the skip string.
		of_UpdateSkipString (is_skipcolumn)
		
		Return 1
	End If
Next

// No maching entry was found to unregister.
Return -1
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
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvreqcolumn'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

on pfc_n_cst_dwsrv_reqcolumn.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_reqcolumn.destroy
TriggerEvent( this, "destructor" )
end on

