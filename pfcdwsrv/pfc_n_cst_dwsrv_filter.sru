HA$PBExportHeader$pfc_n_cst_dwsrv_filter.sru
$PBExportComments$PFC DataWindow Filter service
forward
global type pfc_n_cst_dwsrv_filter from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_filter from n_cst_dwsrv
event type integer pfc_filterdlg ( )
end type
global pfc_n_cst_dwsrv_filter pfc_n_cst_dwsrv_filter

type variables
Public:

// Defined in ancestor - constant integer DEFAULT = 0
constant integer EXTENDED = 1
constant integer SIMPLE = 2

Protected:

integer 	ii_style
string 	is_excludecolumns[]
boolean 	ib_visibleonly=TRUE
string	is_filterin
string	is_filterout
end variables

forward prototypes
public function boolean of_getvisibleonly ()
public function string of_getfilter ()
public function integer of_filter ()
public function integer of_setvisibleonly (boolean ab_visible)
public function integer of_setfilter (string as_format)
public function integer of_setexclude (string as_excludecols[])
public function integer of_setstyle (integer ai_style)
public function integer of_getstyle ()
protected function integer of_buildfilterattrib (ref n_cst_filterattrib anv_filterattrib)
public function integer of_getexclude (ref string as_excludecols[])
public function integer of_getregisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

event pfc_filterdlg;call super::pfc_filterdlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_FilterDlg
//
//	(Arguments: 	None)
//
//	(Returns:   	Integer
//						 1 if successful
//						 0 if use cancelled the operation
//						-1 if an error is encountered)
//
//	Description: 	Filters a datawindow based on the filter constructed
//					 	by the user thru one of the PFC Filter dialogs.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Set focus back on the datawindow.
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

integer li_rc

// Check the dw reference
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Create a null string.
string ls_nullformat
SetNull ( ls_nullformat ) 

// This will cause the Filter dialog to open.
li_rc = of_SetFilter(ls_nullformat) 

// Set focus back on the datawindow.
idw_requestor.SetFocus()

If li_rc <= 0 Then Return li_rc

// Filter the requestor.
Return of_Filter() 

end event

public function boolean of_getvisibleonly ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetVisibleOnly
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//
//	Description:  	Get the state of using visible columns only, set in 
//					  	of_SetVisibleOnly
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

Return ib_visibleonly
end function

public function string of_getfilter ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetFilter
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		String
//						The current filter expression
//
//	Description: 	Get the current filter expression.
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

string ls_filter

// Check the dw reference.
If IsNull(idw_Requestor) Or Not IsValid(idw_Requestor) Then Return ''

// Get the current filter
ls_filter = idw_Requestor.Describe ( "DataWindow.Table.Filter" ) 

// A questionmark indicates no filter set.
If ls_filter='?' Then ls_filter = ''

Return ls_filter
end function

public function integer of_filter ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Filter
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:  		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 	Filters a datawindow and fires a message to the datawindow
//						to indicate that the current row may have changed.
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
integer li_rc

// Check the dw reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Filter the requesting datawindow.
li_rc = idw_Requestor.Filter() 

// Tell the datawindow that the buffer has changed and that the 
// current row may have new data.
idw_requestor.Event pfc_rowchanged ( ) 

Return li_rc
end function

public function integer of_setvisibleonly (boolean ab_visible);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetVisibleOnly
//
//	Access:    		Public
//
//	Arguments:
//   ab_visible:  When TRUE, only include visible columns in Filter dialogs.
//
//	Returns:  		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Sets the state of use visible columns only.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Removed IsValid check on idw_requestor
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

// Check the arguments.
IF IsNull (ab_visible) THEN Return -1

ib_visibleonly = ab_visible
Return 1
end function

public function integer of_setfilter (string as_format);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetFilter
//
//	Access:    		Public
//
//	Arguments:
//   as_format:   A filter expression.  When Null, invokes a Specify Filter
//					   dialog.
//
//	Returns:  		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 	Set a datawindow filter or open a Specify Filter dialog.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
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

integer					li_rc
n_cst_returnattrib	lnv_return 
n_cst_filterattrib	lnv_filterattrib

// Check the datawindow reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Passed argument was Null (as_format is null),
// call the appropriate SetSort Dialog.
IF Not IsNull (as_format) THEN 
	Return idw_Requestor.SetFilter (as_format) 
END IF

// Passed argument was null, so call filter dialog.
CHOOSE CASE ii_style

	CASE DEFAULT 					
		//  Powerscript default filter style (Default)
		li_rc = idw_requestor.SetFilter (as_format) 
		// Check if the dialog was close via the Cancel button (=-1).
		If li_rc = -1 Then li_rc = 0
		is_filterin = ''
		is_filterout = ''
		Return li_rc

	CASE EXTENDED, SIMPLE
		// Set up the filter information to be passed to the dialog.
		IF of_BuildFilterAttrib(lnv_filterattrib) <> 1 THEN Return -1
		lnv_filterattrib.idw_dw = idw_Requestor
		
		IF ii_style = EXTENDED THEN
			OpenWithParm(w_filterextended, lnv_filterattrib) 
		ELSE
			// PFC Simple Filter
			OpenWithParm(w_filtersimple, lnv_filterattrib) 
		END IF
		
		// Get the return PowerObject.
		lnv_return = Message.PowerObjectParm
		
		// Check if the dialog was close via the Cancel button.
		IF lnv_return.ii_rc <> 1 Then Return lnv_return.ii_rc
		
		li_rc = idw_Requestor.SetFilter (lnv_return.is_rs)
		If li_rc > 0 Then
			is_filterin = lnv_return.is_rs
			is_filterout = of_GetFilter()
		End If
		Return li_rc

END CHOOSE

// Invalid option.
Return -1
end function

public function integer of_setexclude (string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetExclude
//
//	Access:    		Public
//
//	Arguments:
//   as_exclude_cols:  An array of columnnames to be excluded from
//							  filter dialogs.
//
//	Returns:  		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Establishes a list of columns to be excluded from
//					  	filter dialogs.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Removed IsValid check on idw_requestor
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

is_excludecolumns = as_excludecols
Return 1
end function

public function integer of_setstyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetStyle
//
//	Access:    Public
//
//	Arguments:
//   ai_filter_style  :  A value representing the desired filter dialog
//						Values are:
//							0 = PowerBuilder default filter style (Default)
//							1 = PFC Extended Filter Wizard (sophisticated end-user)
//							2 = Simple Filter (a=b) style
//
//	Returns:   Integer
//   1 if it succeeds and -1 if an error occurs.
//
//	Description:  Sets the style of filter dialog to be used when 
//               of_Filter is called.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Removed IsValid check on idw_requestor
//	6.0	Use of constants within services.
//			Default style now includes dialog help.
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

// Check to see if the passed style number is valid.
IF IsNull (ai_style) THEN Return -1

CHOOSE CASE ai_style
	CASE DEFAULT, EXTENDED, SIMPLE
		ii_style = ai_style
		
		if ii_style = DEFAULT then
			if isValid (idw_requestor) then
				if len (idw_requestor.dataobject) > 0 then
					idw_requestor.object.datawindow.help.command = 1
					idw_requestor.object.datawindow.help.file = "pfcdlg.hlp"
					idw_requestor.object.datawindow.help.typeid.setfilter = "300"
				end if
			end if
		end if
		
		Return 1
END CHOOSE

Return -1
end function

public function integer of_getstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetStyle
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					0 = PowerBuilder default filter style (Default)
//	  					1 = PFC Filter Wizard (sophisticated end-user)
//	  					2 = Simple Filter (a=b) style
//
//	Description:  	To determine the filter dialog style that was set 
//					  	by of_SetFilterStyle
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

Return ii_style
end function

protected function integer of_buildfilterattrib (ref n_cst_filterattrib anv_filterattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_BuildFilterAttrib
//
//	Access:    		protected
//
//	Arguments:
//   astr_filterattrib:  A NVO attribute class, passed by reference, that 
//								 will hold filter information used by the Filter dialogs.
//
//	Returns:   		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	Prepares the filter information required by the 
//					  	Specify Filter dialogs.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version.
// 5.0.02 Prevent excluded columns from appearing as blank entries.
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

integer	li_numcols
integer	li_numcomputes
integer	li_i
integer	li_j
integer	li_k
integer	li_exclude
string	ls_computes[]				// Hold all the computed columns.
string	ls_filtercolumns_all[]	// Hold all filter columns prior to any exclusions.
string	ls_filtercolumns_exc[]	// Hold filter columns after excluding appropriate ones.
string	ls_dbname
string	ls_filter
boolean	lb_exclude

// Check the dw refernce.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

// Get the original filter for the datawindow.
ls_filter = of_GetFilter()
If Len(ls_filter) > 0 And ls_filter = is_filterout then
	ls_filter = is_filterin
end If
anv_filterattrib.is_filter = ls_filter

// Get all the column names on the datawindow.
li_numcols = of_GetObjects(ls_filtercolumns_all, "column", "*", ib_visibleonly) 

// Get all the computed column names on the datawindow and add them to the array.
li_numcomputes =  of_GetObjects(ls_computes, "compute", "*", ib_visibleonly) 
// Add compute columns to the array.
FOR li_i = 1 to li_numcomputes
	li_numcols++
	ls_filtercolumns_all[li_numcols] = ls_computes[li_i] 
NEXT 

// See if any columns were set to be excluded from the filter display
// and create a new list of sort columns.
li_exclude  = UpperBound(is_excludecolumns) 
FOR li_j = 1 to li_numcols
	lb_exclude = FALSE
	FOR li_i = 1 to li_exclude
		IF Lower(is_excludecolumns [li_i]) = Lower(ls_filtercolumns_all[li_j]) THEN
			lb_exclude = TRUE
			EXIT
		END IF
	NEXT
	IF Not lb_exclude THEN 
		li_k++
		ls_filtercolumns_exc[li_k] = ls_filtercolumns_all[li_j]
	END IF
NEXT 

// Copy the list of appropriate sort columns to the nvo.
anv_filterattrib.is_columns = ls_filtercolumns_exc
li_numcols = UpperBound(anv_filterattrib.is_columns)

// Add the database names to the attributes.
FOR li_i = 1 to li_numcols
	ls_dbname = idw_Requestor.Describe ( anv_filterattrib.is_columns[li_i] + ".DbName" )
	IF ls_dbname = "" OR ls_dbname = "!" THEN ls_dbname = anv_filterattrib.is_columns[li_i]
	anv_filterattrib.is_dbnames[li_i] = ls_dbname
NEXT
			
// Get the column displayname.
CHOOSE CASE of_GetColumNnameSource ( )

	CASE 0									
		// Use dw Column Names.
		FOR li_i = 1 to li_numcols
			anv_filterattrib.is_colnamedisplay[li_i] = anv_filterattrib.is_columns[li_i]
		NEXT

	CASE 1									
		// Use Database Names.
		FOR li_i = 1 to li_numcols
			ls_dbname = idw_Requestor.Describe ( anv_filterattrib.is_columns[li_i] + ".DbName" )
			IF ls_dbname = "" OR ls_dbname = "!" THEN ls_dbname = anv_filterattrib.is_columns[li_i]
			anv_filterattrib.is_colnamedisplay[li_i] = ls_dbname
		NEXT
			
	CASE 2									
		// Use Column Headers.
		FOR li_i = 1 to li_numcols
			anv_filterattrib.is_colnamedisplay[li_i] = &
					of_GetHeaderName ( anv_filterattrib.is_columns[li_i] )
		NEXT
END CHOOSE

Return 1
end function

public function integer of_getexclude (ref string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetExclude
//
//	Access:    		Public
//
//	Arguments:
//   as_exclude_cols:  A string array, passed by reference, that will
//			   			  hold the exclude columns returned.
//
//	Returns:  		Integer
//   					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	To get the list of exclude columns set in of_SetExclude.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Removed IsValid check on idw_requestor
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

as_excludecols = is_excludecolumns
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
//			(including computed columns) that the service can use to perform filter.
//
//	Returns:   		Integer
//  # of entries
//	-1 if an error occurs.
//
//	Description:  
//	To get the list of all the columns (including computed columns) that the service
//	can use to perform filter.
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

integer	li_numcols
integer	li_numcomputes
integer	li_i
string	ls_filtercolumns_all[]
string	ls_computes[]

// Get all the column names on the datawindow.
li_numcols = of_GetObjects(ls_filtercolumns_all, "column", "*", ib_visibleonly) 

// Get all the computed column names on the datawindow and add them to the array.
li_numcomputes =  of_GetObjects(ls_computes, "compute", "*", ib_visibleonly) 
// Add compute columns to the array.
FOR li_i = 1 to li_numcomputes
	li_numcols++
	ls_filtercolumns_all[li_numcols] = ls_computes[li_i] 
NEXT 

as_allcolumns = ls_filtercolumns_all
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
anv_infoattrib.is_name = 'Filter'
anv_infoattrib.is_description = &
	'Provides Filter dialogs to facilitate the filtering of rows.'

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
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvfilter'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

on pfc_n_cst_dwsrv_filter.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_filter.destroy
TriggerEvent( this, "destructor" )
end on

