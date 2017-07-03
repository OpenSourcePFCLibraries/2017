HA$PBExportHeader$n_cst_sqlspy.sru
$PBExportComments$Extended for PFC Examples Application.
forward
global type n_cst_sqlspy from pfc_n_cst_sqlspy
end type
end forward

global type n_cst_sqlspy from pfc_n_cst_sqlspy
end type
global n_cst_sqlspy n_cst_sqlspy

forward prototypes
public function string of_getlogfile ()
end prototypes

public function string of_getlogfile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetLogFile
//
//	Access:  		public
//
//	Arguments:
//	<NONE>
//
//	Returns:  		string
//						Returns the path and file name of the SQL Spy Log File.
//						
//	Description:  	Gets the path and file name of the SQL Spy Log File.
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
 *
 * https://opensource.org/licenses/MIT
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

on n_cst_sqlspy.create
TriggerEvent( this, "constructor" )
end on

on n_cst_sqlspy.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Notifies the application's main window that the SQL Spy Service
// has been constructed.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('sqlspysrv','open')
end if
end event

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	destructor
//
//	Description:
//	Notifies the application's main window that the SQL Spy Service
// has been destructed.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('sqlspysrv', 'close')
end if
end event

