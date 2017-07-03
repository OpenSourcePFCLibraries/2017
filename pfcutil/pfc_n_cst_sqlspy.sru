HA$PBExportHeader$pfc_n_cst_sqlspy.sru
$PBExportComments$PFC SQL Spy Service
forward
global type pfc_n_cst_sqlspy from n_base
end type
end forward

global type pfc_n_cst_sqlspy from n_base
end type
global pfc_n_cst_sqlspy pfc_n_cst_sqlspy

type variables
Protected:
w_sqlspy iw_sqlspy		//Reference to the SQLSpy equivalent window
w_sqlspyinspect iw_sqlspyinspect	//Reference to the SQLSpyInspect equivalent window
boolean	ib_allowinspect=False	//Should service allow anything other than batchmode?
boolean 	ib_batchmode=True		//Current mode of service
boolean	ib_alwaysontop=False	//Will window always be on top?
string 	is_history = ''		//Contains the current history
string 	is_currentheading=''		//SQL Current Heading
string 	is_currentsyntax=''		//SQL Current Syntax
string	is_logfile=''		//The path and name of the logfile


end variables

forward prototypes
public function integer of_sqlsyntax (string as_heading, ref string as_syntax, boolean ab_oktopause)
public function integer of_sqlsyntax (string as_heading, string as_syntax)
public function integer of_SetCurrentSyntax (string as_currentsyntax)
public function boolean of_GetAllowInspect ()
protected function integer of_addtohistory (string as_heading, string as_syntax)
public function integer of_clearhistory ()
public function boolean of_GetBatchmode ()
public function string of_GetCurrentHeading ()
public function string of_GetCurrentSyntax ()
public function integer of_SetAllowInspect (boolean ab_allowinspect)
public function integer of_setbatchmode (boolean ab_batchmode)
public function integer of_SetCurrentHeading (string as_currentheading)
public function integer of_sqlsyntax (string as_heading)
public function integer of_SetLogfile (string as_logfile)
protected function integer of_addtologfile (string as_newentry)
public function integer of_savehistorytofile ()
public function integer of_printhistory ()
protected function string of_preventhistoryoverflow (string as_history, string al_newentry)
public function integer of_opensqlspy (boolean ab_switch)
public function string of_GetHistory ()
protected function integer of_opensqlspyinspect ()
public function integer of_sqlpreview (string as_controlname, sqlpreviewfunction a_sqlpreviewfunction, sqlpreviewtype a_sqlpreviewtype, ref string as_sqlsyntax, dwbuffer a_dwbuffer, long al_row)
public function integer of_setalwaysontop (boolean ab_switch)
public function boolean of_getalwaysontop ()
public function boolean of_isopen ()
public function string of_getlogfile ()
end prototypes

public function integer of_sqlsyntax (string as_heading, ref string as_syntax, boolean ab_oktopause);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_SQLSyntax
//
//	Access:  		public
//
//	Arguments:
//	as_heading		Heading (if any) for the SQLSyntax
//	as_syntax		The actual SQLSyntax by Reference
//	ab_oktopause	A boolean stating if this SQLSyntax can be paused
//						for user interaction on the SQLSpy window.
//
//	Returns:  		integer
//						0 if it succeeds and the caller's processing should 
//							continue as normal.
//						1 if it suceeds but the caller's proccessing should stop.
//						2 if it succeeds but the caller's processing should skip 
//							this request and execute the next request (if any).
//						-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	SQL Syntax to be processed by SQLSpy.
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

//check parameters
If IsNull(as_heading) or IsNull(as_syntax) or IsNull(ab_oktopause) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

//Check if the syntax was marked as OKToPause.
//Check if the user wants to stop all pausable SQL.
//If both are True then allow the user to change the SQL
//prior to adding it to the history.
If ab_oktopause and ib_batchmode=False Then

	//Prepare information for the SQLSpyInspect window.
	of_SetCurrentHeading(as_heading)
	of_SetCurrentSyntax(as_syntax)

	//Perform the inspect functionality
	li_rc = of_OpenSQLSpyInspect()

	If li_rc = 0 Then 
		//Take the syntax that may have been modified by the user
		as_heading = of_GetCurrentHeading()
		as_syntax = of_GetCurrentSyntax()
	ElseIf li_rc > 0 Then
		//The user either clicked on Cancel or CancelAll button
		as_heading = ''
		as_syntax = ''
	End If

Else
	//By default processing should continue as normal.
	li_rc = 0
End If

//Update the history components.
If li_rc = 0 Then
 	of_addtohistory (as_heading, as_syntax)
End If

Return li_rc

end function

public function integer of_sqlsyntax (string as_heading, string as_syntax);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_SQLSyntax
//
//	Access:  		public
//
//	Arguments:
//	as_heading		Heading (if any) for the SQLSyntax
//	as_syntax		The actual SQLSyntax
//
//	Returns:  		integer
//						0 if it succeeds and the caller's processing should 
//							continue as normal.
//						1 if it suceeds but the caller's proccessing should stop.
//						2 if it succeeds but the caller's processing should skip 
//							this request and execute the next request (if any).
//						-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	SQL Syntax to be processed by SQLSpy.
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

//check parameters
If IsNull(as_heading) or IsNull(as_syntax) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

//The SQLSyntax cannot be paused	for user interaction 
//on the SQLSpy window.
li_rc = of_SQLSyntax (as_heading, as_syntax, False)

Return li_rc

end function

public function integer of_SetCurrentSyntax (string as_currentsyntax);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetCurrentSyntax
//
//	Access:  		public
//
//	Arguments:
//	as_currentheading   String containing the current syntax.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Sets the current syntax for the SQLSpy service.
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

If IsNull(as_currentsyntax) Then
	Return -1
End If

//Set the Heading
is_currentsyntax = as_currentsyntax

Return 1

end function

public function boolean of_GetAllowInspect ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetAllowInspect
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		boolean
//						Returns True if service is on allowinspect.
//						
//	Description:  	Gets the current allowinspect mode of the SQLSpy service.
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

Return ib_allowinspect

end function

protected function integer of_addtohistory (string as_heading, string as_syntax);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AddToHistory
//
//	Access:  		protected
//
//	Arguments:
//	as_heading		The header information to be added.
//	as_syntax		The detail information to be added.
//
//	Returns:  		integer
//						1 if it succeeds.
//						-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Add a history entry into the RichTextControl.
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

string	ls_newentry
string	ls_spacing
long		ll_rc
datetime ldm_current

//Check parameters
If IsNull(as_heading) or IsNull(as_syntax) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

//Add a datetime stamp to the heading
ldm_current = DateTime( Today(), Now())
as_heading = as_heading + '    TimeStamp: ' + string(ldm_current,'dd/mm/yy hh:mm:ss:ff')

//Make the heading a comment
as_heading = '/*** ' + as_heading + ' ***/'

//Determine the needed spacing 
If Len(is_history) > 0 Then
	ls_spacing = '~r~n~r~n'
End If

//Determine what information was passed to function
//  Header and Detail, Header only, or Detail only
If Len(as_heading) > 0 and Len(as_syntax) > 0 Then
	ls_newentry =	ls_spacing + as_heading + '~r~n' + as_syntax
ElseIf Len(as_heading) > 0 Then
	ls_newentry =	ls_spacing + as_heading 
Else
	ls_newentry =	ls_spacing + as_syntax
End If

//Update the history string
is_history = is_history + ls_newentry

//Depending on operating system - prevent the history string from
//getting too long
is_history = of_PreventHistoryOverflow (is_history, ls_newentry)

//If available, Notify visual to update the current history.
If IsValid(iw_sqlspy) Then
	ll_rc = iw_sqlspy.of_UpdateHistory()
End If 

//If available, update the log file
of_AddToLogfile(ls_newentry)

Return 1

end function

public function integer of_clearhistory ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AddToHistory
//
//	Access:  		public
//
//	Arguments:		<None>
//
//	Returns:  		integer
//						1 if it succeeds.
//						-1 if an error occurs.
//
//	Description:  	Clear the visual history.
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

integer li_rc =1

//Update the history string
is_history = ''

//If available, Notify that the history has changed.
If IsValid(iw_SQLSpy) Then
	li_rc = iw_SQLSpy.of_UpdateHistory()
End If 

Return li_rc

end function

public function boolean of_GetBatchmode ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBatchmode
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		boolean
//						Returns True if service is on BatchMode.
//						
//	Description:  	Gets the current mode of the SQLSpy service.
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

Return ib_batchmode 

end function

public function string of_GetCurrentHeading ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetCurrentHeading
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		string
//						Returns the current SQL Heading.
//						
//	Description:  	Gets the current SQL Heading from the SQLSpy service.
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

Return is_currentheading

end function

public function string of_GetCurrentSyntax ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetCurrentSyntax
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		strins
//						Returns the current syntax.
//						
//	Description:  	Gets the current syntax on the SQLSpy service.
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

Return is_currentsyntax

end function

public function integer of_SetAllowInspect (boolean ab_allowinspect);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAllowInspect
//
//	Access:  		public
//
//	Arguments:
//	ab_allowinspect   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Sets the mode of the SQLSpy service.  If this mode is
//						True then inspect capabilities are available.  If the the
//						mode is False then the service will have no inspect 
//						capabilities.
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

If IsNull(ab_allowinspect) Then
	Return -1
End If

//Set the AllowInspect attribute
ib_allowinspect = ab_allowinspect

Return 1

end function

public function integer of_setbatchmode (boolean ab_batchmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBatchmode
//
//	Access:  		public
//
//	Arguments:
//	ab_batchmode   Mode of the service.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Sets the mode of the SQLSpy service.
//						Notifies the visual part of SQLSpy for it to correctly
//						reflect the appropriate mode.
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

If IsNull(ab_batchmode) Then
	Return -1
End If

//Set the BatchMode
ib_batchmode = ab_batchmode

// Make sure the Visual part of SQLSpy reflects the BatchMode
If IsValid(iw_SQLSpy) Then
	iw_SQLSpy.of_UpdateBatchMode()
End If

Return 1

end function

public function integer of_SetCurrentHeading (string as_currentheading);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetCurrentHeading
//
//	Access:  		public
//
//	Arguments:
//	as_currentheading   String containing the current heading.
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Sets the current heading for the SQLSpy service.
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

If IsNull(as_currentheading) Then
	Return -1
End If

//Set the Heading
is_currentheading = as_currentheading

Return 1

end function

public function integer of_sqlsyntax (string as_heading);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_SQLSyntax
//
//	Access:  		public
//
//	Arguments:
//	as_heading		Heading for the SQLSyntax
//
//	Returns:  		integer
//						0 if it succeeds and the caller's processing should 
//							continue as normal.
//						1 if it suceeds but the caller's proccessing should stop.
//						2 if it succeeds but the caller's processing should skip 
//							this request and execute the next request (if any).
//						-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	SQL Syntax to be processed by SQLSpy.
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
string ls_empty_sqlsyntax=''

//check parameters
If IsNull(as_heading) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

//There is only the Heading present.
//The SQLSyntax cannot be paused	for user interaction 
//on the SQLSpy window.
li_rc = of_SQLSyntax (as_heading, ls_empty_sqlsyntax, False)

Return li_rc

end function

public function integer of_SetLogfile (string as_logfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetLogfile
//
//	Access:  		public
//
//	Arguments:
//	as_logfile   	String containing the log filename.
//						(i.e., 'c:\appl\logfile.asc')
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Sets the log filename for the SQLSpy service.
//						Set the logfile to an empty string to disable the logfile
//						processing.
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

If IsNull(as_logfile) Then
	Return -1
End If

//Set the log filename
is_logfile = as_logfile

Return 1

end function

protected function integer of_addtologfile (string as_newentry);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AddTologfile
//
//	Access:  		protected
//
//	Arguments:
//	as_newentry		The new entry to be added to the logfile.
//
//	Returns:  		integer
//						1 if it succeeds.
//						-1 if an error occurs.
//
//	Description:  	Add a history entry into the RichTextControl.
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

integer	li_filenumber

//Check parameters
If IsNull(as_newentry) Then
	Return -1
End If

//Check there is a log filename or
//that there is a new entry
If Len(is_logfile) = 0 or &
	Len(as_newentry) = 0 Then
	Return 0
End If	

If FileExists (is_logfile) Then
	//Existing logfile has been found
End If
	
//Append the new entry to the logfile
SetPointer (HourGlass!)
li_filenumber = FileOpen(is_logfile, StreamMode!, Write!, LockWrite!, Append!)
If li_filenumber > 0 Then
	FileWrite (li_filenumber, as_newentry)	
	FileClose (li_filenumber)
End If


Return 1

end function

public function integer of_savehistorytofile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SaveHistoryToFile ()
//
//	Access:  		public
//
//	Arguments: 		<None>
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Saves the current history to a file.
//						Opens the GetFileSaveName dialog window, gets a 
//						filename, and allows for the saving of the SQL history to 
//						the file.
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

constant string	TITLE='Save SQLSpy File'
string	ls_path_filename
string	ls_filename
integer	li_rc
integer	li_filenumber

SetPointer(HourGlass!)

//Get the filename
li_rc = GetFileSaveName  (TITLE, ls_path_filename, ls_filename, & 
				'SQL', 'SQL Files (*.SQL), *.SQL' )

If li_rc > 0 Then
	
	If FileExists (ls_path_filename) Then
		//Existing file has been found
		If of_MessageBox ('pfc_sqlspy_replacefile', TITLE, &
			'Replace existing file '+ls_path_filename, &
			Question!, YesNo!, 1) = 2 Then
			//Do not replace the file
			Return 1
		End If
	End If
	
	//Write the history to the file
	SetPointer (HourGlass!)
	li_filenumber = FileOpen(ls_path_filename, StreamMode!, Write!, LockWrite!, Replace!)
	If li_filenumber > 0 Then
		FileWrite (li_filenumber, is_history)	
		FileClose (li_filenumber)
	End If
	
End If

Return li_rc

end function

public function integer of_printhistory ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PrintHistory
//
//	Access:  		public
//
//	Arguments: 		<None>
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Prints the current history.
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

n_ds 		lds_print

lds_print = Create n_ds

lds_print.DataObject = 'd_sqlspyprint'

If lds_print.InsertRow(0) = 1 Then
	If lds_print.SetItem(1,'text', is_history) = 1 Then
		If lds_print.Print() = 1 Then
			// Print was successful.
			Destroy lds_print
			Return 1
		End If
	End If
End If

// Print failed.
Destroy lds_print
Return -1

end function

protected function string of_preventhistoryoverflow (string as_history, string al_newentry);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PreventHistoryOverflow
//
//	Access:  		protected
//
//	Arguments:
//	as_history		The history string.
//	al_newentry 	The latest new entry to be added to the history string.
//
//	Returns:  		string
//						The manipulated string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Prevent the history string from growing past the maximum
//						supported by the Operating Environment.
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

constant long TEST_LENGTH = 32700

long	ll_pos
long	ll_startposition
long	ll_historylength

//Check parameters
If IsNull(as_history) or IsNull(al_newentry) Then
	string ls_null
	SetNull (ls_null)
	Return ls_null
End If

//Get the position on which to start searching in order for 
//the new string not be any longer than the original string
//prior to the newentry
ll_startposition = Len(al_newentry)

//Get the current length of the history string
ll_historylength = Len(as_history)

If ll_historylength > TEST_LENGTH Then
	ll_pos = Pos(as_history, '/***', ll_startposition)
	If ll_pos > 0 Then
		as_history = Mid(as_history, ll_pos, ll_historylength)
	End If
End If

Return as_history

end function

public function integer of_opensqlspy (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_OpenSQLSpy
//
//	Access:  	public
//
//	Arguments:
//	ab_switch	True to open SQLSpy window.
//					False to close SQLSpy window.
//
//	Returns:  	integer
//					Return value of Open or Close PowerBuilder call.
//					0 if no action to open or close a window is taken.
//					If any argument's value is NULL, function returns -1.
//					
//
//	Description:	Open or Close the SQLSpy window.
//						If opening the SQLSpy window then immediately update
//						the current history on the SQLSpy window.
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

If ab_switch Then
	li_rc = Open(iw_sqlspy)
	Return li_rc
Else
	If IsValid(iw_sqlspy) Then
		Return Close(iw_sqlspy)
	End If
End If

Return 0

end function

public function string of_GetHistory ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetHistory
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		string
//						Returns the current history. 
//						(i.e., 'c:\appl\logfile.asc')
//						
//	Description:  	Gets the current history from the SQLSpy service.
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

Return is_history

end function

protected function integer of_opensqlspyinspect ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_OpenSQLSpyInspect
//
//	Access:  		protected
//
//	Arguments:		<None>
//
//	Returns:  		integer
//						0 if it succeeds and the caller's processing should 
//							continue as normal.
//						1 if it suceeds but the caller's proccessing should stop.
//						2 if it succeeds but the caller's processing should skip 
//							this request and execute the next request (if any).
//						-1 if an error occurs.
//
//	Description:	Open the SQLSpyInspect window.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Prevent the SQLSpy window from being on top of the SQLSpyInspect window.
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

integer li_rc, li_testrc

// If appropriate, prevent the SQLSpy window from being on top of 
// the SQLSpyInspect window.
If ib_alwaysontop Then
	If IsValid(iw_sqlspy) Then
		li_testrc = iw_sqlspy.of_SetAlwaysOnTop(False)
	End If
End If

//Wait on user inspection.
Open(iw_sqlspyinspect)

//Get the return value
li_rc = Message.DoubleParm

// If appropriate, reset the SQLSpy window to always be on top.
If ib_alwaysontop Then
	If IsValid(iw_sqlspy) Then
		li_testrc = iw_sqlspy.of_SetAlwaysOnTop(True)		
	End If
End If

Return li_rc

end function

public function integer of_sqlpreview (string as_controlname, sqlpreviewfunction a_sqlpreviewfunction, sqlpreviewtype a_sqlpreviewtype, ref string as_sqlsyntax, dwbuffer a_dwbuffer, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SQLPreview
//
//	Access:  		public
//
//	Arguments:
//	as_controlname				Control name. (i.e.,dw_1.ClassName() or ds_1.ClassName())
//	a_sqlpreviewfunction		SQLPreview arg from control: sqlpreviewfunction
//	a_sqlpreviewtype			SQLPreview arg from control: sqlpreviewtype
//	as_sqlsyntax				SQLPreview arg from control: sqlsyntax by Reference
//	a_dwbuffer					SQLPreview arg from control: dwbuffer
//	al_row						SQLPreview arg from control: row
//
//	Returns:  		integer
//						0 if it succeeds and the caller's processing should 
//							continue as normal.
//						1 if it suceeds but the caller's proccessing should stop.
//						2 if it succeeds but the caller's processing should skip 
//							this request and execute the next request (if any).
//						-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Called from a datawindow's SQLPreview event.
//						Receive all the arguments from the SQLPreview event of the 
//						calling datawindow.  Create the appropriate heading and 
//						then call the function to process the SQL syntax.
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

string	ls_newentry_heading
string	ls_sqltype
n_cst_conversion lnv_conversion

//Check arguments
If IsNull(as_controlname) or IsNull(a_sqlpreviewfunction) or &
		IsNull(a_sqlpreviewtype) or IsNull(as_sqlsyntax) or IsNull(a_dwbuffer) or &
		as_sqlsyntax = '' Then
	Return -1
End If


//Get the string that represents a_sqlpreviewtype
ls_sqltype = lnv_conversion.of_string(a_sqlpreviewtype)

//Create the heading based on the type of SQLPreview
	ls_newentry_heading = ls_sqltype + ' - ' + as_controlname 
If Pos(Lower(ls_sqltype),Lower('Retrieve')) = 0  Then
	ls_newentry_heading = ls_newentry_heading + '(' + string(al_row) + ')'
End If

//There is now a Heading for the Syntax.
If Pos(Lower(ls_sqltype),Lower('Retrieve')) > 0  Then
	//There is no Pause capabilities for Retrive actions
	Return of_SQLSyntax(ls_newentry_heading, as_sqlsyntax, False )
End If

//There is Pause capabilities for all other actions
Return of_SQLSyntax(ls_newentry_heading, as_sqlsyntax, True )

end function

public function integer of_setalwaysontop (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetAlwaysOnTop
//
//	Access:  	public
//
//	ab_switch	True to have SQLSpy window always on top.
//					False not to have SQlSpy window always on top.
//
//	Returns:  	integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:	Allow the SQLSpy window to always be on top when TRUE.
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

If IsValid(iw_sqlspy) Then
	 iw_sqlspy.of_SetAlwaysOnTop (ib_alwaysontop)
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
//					True to have SQLSpy window always on top.
//					False not to have SQLSpy window always on top.
//
//	Description:	Allow the SQLSpy window to always be on top when TRUE.
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

public function boolean of_isopen ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsOpen
//
//	Access:  		public
//
//	Returns:  	boolean
//					True if the SQLSpy window is currently opened.
//					False otherwise.
//
//	Description:	Reports if the SQLSpy window is currently opened.
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

Return IsValid(iw_sqlspy)

end function

public function string of_getlogfile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetLogfile
//
//	Access:  		public
//
//	Arguments:
//	as_logfile   	String containing the log filename.
//						(i.e., 'c:\appl\logfile.asc')
//
//	Returns:  		string
//	Returns the log file name (if any)
//						
//	Description:  	
//	Gets the log filename for the SQLSpy service.
//
// Note:
//	An empty string means there is no log file.
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

Return is_logfile

end function

on pfc_n_cst_sqlspy.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_sqlspy.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	(Arguments: None) 
//
//	(Returns:  None)
//
//	Description:  Perform cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0    Initial version
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

//Prevent the visual part from being open if the service is destroyed
of_OpenSQLSpy(False)
end event

