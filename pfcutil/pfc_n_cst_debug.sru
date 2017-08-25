HA$PBExportHeader$pfc_n_cst_debug.sru
$PBExportComments$PFC Debug service
forward
global type pfc_n_cst_debug from n_base
end type
end forward

global type pfc_n_cst_debug from n_base
end type
global pfc_n_cst_debug pfc_n_cst_debug

type variables
Public:
// 4/30/2013 - Updated - Calvin Allen
constant integer	PFC_MAJOR = 12
constant integer	PFC_MINOR = 5
constant integer	PFC_FIXES = 1

constant string	PFC_NAME = "PowerBuilder Foundation Classes"
constant date	PFC_BUILD_DATE = Today()
constant time	PFC_BUILD_TIME = Now()

n_ds		ids_debuglog
n_cst_sqlspy	inv_sqlspy
n_ds		ids_debugjson

Protected:
boolean		ib_alwaysontop=False

end variables

forward prototypes
public function integer of_setsqlspy (boolean ab_switch)
public function integer of_message (string as_message)
public function integer of_ClearLog ()
public function integer of_OpenLog (boolean ab_switch)
public function integer of_PrintLog ()
public function integer of_setalwaysontop (boolean ab_switch)
public function boolean of_getalwaysontop ()
public function integer of_setdwproperty (boolean ab_switch)
public function boolean of_islogopen ()
public function boolean of_isdwproperty ()
public function integer of_openjson (n_cst_json anv_json)
public function integer of_closejson ()
end prototypes

public function integer of_setsqlspy (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetSQLSpy
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		integer
//						Returns 1 if it succeeds, 0 if no action is taken, and
//						-1 if an error occurs.
//						
//	Description:  	Starts or stops the SQLSpy Service	.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

If ab_Switch Then
	If IsNull(inv_sqlspy) Or Not IsValid (inv_sqlspy) Then
		inv_sqlspy = CREATE n_cst_sqlspy
		Return 1
	End If
Else
	If IsValid (inv_sqlspy) Then
		DESTROY inv_sqlspy
		Return 1
	End If	
End If

Return 0
end function

public function integer of_message (string as_message);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//	as_message		Message to be displayed
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description: 	Enters a new entry into the Debug Log.
//						If visible portion of the service is available, 
//						scroll it to the newly added row.
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

long 		ll_row
boolean	lb_visible=False

//Determine if the Visible portion of the service is "open".
lb_visible = IsValid(w_debuglog)

//Prevent flickering
If lb_visible Then w_debugLog.of_DwSetRedraw(False)

//Add the new row
ll_row = ids_debuglog.InsertRow(0)
If ll_row > 0 Then
	ids_debuglog.Object.msg [ll_row] = as_message

	//Syncronize the Visible portion of the service.
	If lb_visible Then w_debugLog.of_DwScrollToRow(ll_row)
End If
	
If lb_visible Then w_debugLog.of_DwSetRedraw(True)

If ll_row > 0 Then
	Return 1
End If

Return -1
end function

public function integer of_ClearLog ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_ClearLog
//
//	Access:  	public
//
//	Arguments:	None
//
//	Returns:  	Integer
//					Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Clears all the data from a DebugLog datastore.
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

Return ids_debuglog.Reset()
end function

public function integer of_OpenLog (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_OpenLog
//
//	Access:  		public
//
//	ab_switch	True to open DebugLog window.
//					False to close DebugLog window.
//
//	Returns:  	integer
//					Return value of Open or Close PowerBuilder call.
//					0 if no action to open or close the window is taken.
//					If any argument's value is NULL, function returns -1.
//
//	Description:	Open or Close the DebugLog window.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

If ab_switch Then
	Return Open(w_debuglog)
Else
	If IsValid(w_debuglog) Then
		Return Close(w_debuglog)
	End If
End If

Return 0

end function

public function integer of_PrintLog ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_PrintLog
//
//	Access:  	public
//
//	Arguments:
//
//	Returns:  	Integer
//					Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description:  Prints the contents of the DebugLog datastore.
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

// Prints the contents of the DebugLog datastore.
Return ids_debuglog.Print()
end function

public function integer of_setalwaysontop (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAlwaysOnTop
//
//	Access:  		public
//
//	ab_switch	True to have DebugLog window always on top.
//					False not to have DebugLog window always on top.
//
//	Returns:  	integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//
//	Description:	Allow the DebugLog window to always be on top when TRUE.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

ib_alwaysontop = ab_switch

If IsValid(w_debuglog) Then
	w_debuglog.of_SetAlwaysOnTop (ib_alwaysontop)
End If

Return 1

end function

public function boolean of_getalwaysontop ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetAlwaysOnTop
//
//	Access:  		public
//
//	Returns:  	boolean
//					True to have DebugLog window always on top.
//					False not to have DebugLog window always on top.
//
//	Description:	Allow the DebugLog window to always be on top when TRUE.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

Return ib_alwaysontop

end function

public function integer of_setdwproperty (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetDWProperty
//
//	Access:  		public
//
//	Arguments:
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//						 1 - Successful operation.
//						 0 - No action taken.
//						-1 - An error was encountered.
//						
//	Description:  	Starts or stops the Shared DW Property Service.
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

u_dw 		ldw_obj
integer	li_rc

//Check arguments
If IsNull(ab_switch) Then Return -1

ldw_obj = Create u_dw
If IsValid(ldw_obj) Then
	li_rc = ldw_obj.of_SetSharedProperty(ab_switch)
	Destroy ldw_obj
	Return li_rc
End If

Return -1
end function

public function boolean of_islogopen ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsLogOpen
//
//	Access:  		public
//
//	Returns:  	boolean
//					True if the DebugLog window is currently opened.
//					False otherwise.
//
//	Description:	
//	Reports if the DebugLog window is currently opened.
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

Return IsValid(w_debuglog)
end function

public function boolean of_isdwproperty ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsDWProperty
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Boolean
//						
//	Description:  	
//	Determines the state of the Shared DW Property Service.
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

u_dw 		ldw_obj
boolean	lb_rc

ldw_obj = Create u_dw
If IsValid(ldw_obj) Then
	lb_rc = ldw_obj.of_IsSharedProperty()
	Destroy ldw_obj
	Return lb_rc
End If

Return False
end function

public function integer of_openjson (n_cst_json anv_json);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_OpenJSON
//
//	Access:  		public
//
//  anv_json		The instance of n_cst_JSON to debug
//
//	Returns:  	integer
//					Return value of Open or Close PowerBuilder call.
//					0 if no action to open or close the window is taken.
//					If any argument's value is NULL, function returns -1.
//
//	Description:	Open the DebugJSON window.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

if isnull( anv_json ) or not isvalid( anv_json ) then return -1

if anv_json.ids_repository.sharedata( ids_debugjson ) = -1 then  return -1

Return Open(w_debugjson)

end function

public function integer of_closejson ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CloseJSON
//
//	Access:  		public
//
//	Returns:  	integer
//					Return value of Close PowerBuilder call.
//					0 if no action to close the window is taken.
//					If any argument's value is NULL, function returns -1.
//
//	Description:	Closethe DebugJSON window.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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


if isvalid( w_debugjson ) then
	Return close(w_debugjson)
end if

return 0

end function

on pfc_n_cst_debug.create
call super::create
end on

on pfc_n_cst_debug.destroy
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Arguments: none
//	
//
//	Returns:  none
//
//	Description:  Set up needed objects by service.
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

//Create the DebugLog datastore.
ids_debuglog = CREATE n_ds
ids_debuglog.DataObject = 'd_debuglog'

//Create the DebugJSON datastore.
ids_debugjson = CREATE n_ds
ids_debugjson.DataObject = "d_json_repository"

end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Arguments: none
//	
//
//	Returns:  none
//
//	Description:  Perform cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Added SQLSpy cleanup.
// 6.0 Added DWProperty cleanup.
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

//Close the DebugLog window
If IsValid(w_debuglog) Then
	of_OpenLog (False)
End If

//Destroy the DebugLog datastore.
If IsValid(ids_debuglog) Then
 	Destroy ids_debuglog
End If

//SQLSpy cleanup.
of_SetSQLSpy(False)

//DW Property cleanup.
of_SetDWProperty(False)

//Close the DebugJSON window
of_Closejson ()

//Destroy the DebugJSON datastore.
If IsValid(ids_debugjson) Then
 	Destroy ids_debugjson
End If
end event

