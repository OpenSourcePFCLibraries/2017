HA$PBExportHeader$pfc_n_cst_error.sru
$PBExportComments$PFC Message Service class
forward
global type pfc_n_cst_error from n_base
end type
end forward

global type pfc_n_cst_error from n_base
end type
global pfc_n_cst_error pfc_n_cst_error

type variables
Public:

// Style constants.
constant integer	DEFAULT=0
constant integer	PFCWINDOW=1

// Log Style constants.
constant integer	TAB_DELIMITED = 1
constant integer	NEWLINE_DELIMITED = 2

Protected:

// Pre-defined message constants.
constant string	DATABASE='database'
constant string	FILE='file'
constant string	ics_database='database'   	// Obsoleted in 6.0
constant string	ics_file='file'		// Obsoleted in 6.0

// Pre-defined message attributes.
string 		is_msgsrc=''  	// input source for pre-defined messages - file or database
string 		is_msgfile		// where to read pre-defined messages from - file
n_tr 		itr_msgdb		// where to read pre-defined messages from - database

// Log attributes.
string	 	is_logfile = "errorlog.txt"  // file name to save messages, with default
integer 		ii_logseverity = 32000  //determine what type of errors to log
integer		ii_logfilestyle = TAB_DELIMITED 

// Notify attributes.
mailSession  	ims_mSes		// Mail session.
integer 		ii_notifyseverity = 32000 //determine what type of errors to notify 
string 		is_notifywho[]	// Holds who gets notified.
string		is_notifyaddress[]	// Holds address of who gets notified.
string		is_notifypretitle = 'Mail Notification - '

// Other attributes
string		is_user
boolean		ib_beep=false
boolean 		ib_unattended = false
integer		ii_timeout = 0
integer		ii_style=DEFAULT 	// Style with default value.

n_cst_errorattrib 	inv_errorpass  	// used to pass error info to message window
n_ds 		ids_messages  	// datastore for cahcing
n_cst_filesrv 	inv_filesrv		// file services NVO
n_cst_string 	inv_string		// string services NVO
n_cst_conversion	inv_conversion 	// conversion services NVO
end variables

forward prototypes
public function integer of_gettimeout ()
public function integer of_getnotifywho (ref string as_users[])
public function integer of_setnotifyseverity (integer ai_severity)
public function integer of_setnotifywho (string as_who[])
public function integer of_message (string as_msgid)
public function integer of_message (string as_msgid, string as_msgparms[])
public function integer of_message (string as_title, string as_message)
public function integer of_message (string as_title, string as_message, icon ae_icon)
public function integer of_message (string as_title, string as_message, icon ae_icon, button ae_buttonstyle)
public function integer of_setpredefinedsource (string as_file)
public function string of_getpredefinedsourcetype ()
public function integer of_setpredefinedsource (n_tr atr_trans)
public function integer of_loadpredefinedmsg ()
public function integer of_getpredefinedsource (ref n_tr atr_trans)
public function integer of_getpredefinedsource (ref string as_source)
protected function integer of_processnotify ()
public function integer of_setlogseverity (integer ai_severity)
public function integer of_getlogseverity ()
public function integer of_GetNotifySeverity ()
public function integer of_setlogfile (string as_filename)
protected function integer of_processlog ()
protected function integer of_processmessagesubstitution (string as_parms[])
public function string of_getlogfile ()
public function boolean of_GetUnattended ()
public function integer of_message (string as_title, string as_message, icon ae_icon, button ae_buttonstyle, integer ai_default)
public function integer of_settimeout (integer ai_seconds)
protected function integer of_processmessage ()
public function integer of_setnotifyconnection (mailsession ams_mses)
public function integer of_getnotifyconnection (ref mailsession ams_mses)
public function integer of_message (string as_title, string as_text, icon ae_icon, button ae_buttonstyle, integer ai_default, integer ai_severity, boolean ab_print, boolean ab_userinput)
protected function integer of_createnotifytext (ref string as_subject, ref string as_text)
protected function integer of_createlogtext (ref string as_text)
public function integer of_message (string as_msgid, string as_msgparms[], string as_overridetitle)
public function integer of_setstyle (integer ai_style)
public function integer of_SetBeep (boolean ab_beep)
public function integer of_getstyle ()
public function boolean of_GetBeep ()
public function integer of_setunattended (boolean ab_unattended)
public function integer of_setuser (string as_user)
public function string of_getuser ()
public function integer of_getnotifywho (ref string as_users[], ref string as_address[])
public function integer of_setnotifywho (string as_who[], string as_address[])
public function integer of_setlogfilestyle (integer ai_style)
public function integer of_getlogfilestyle ()
public function integer of_setnotifypretitle (string as_pretitle)
public function string of_getnotifypretitle ()
end prototypes

public function integer of_gettimeout ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetTimeOut
//
//	Access:  		public
//
//	Arguments:
//
//	Returns:  		integer
//						Number of seconds before message window close by itself.
//
//	Description:  	This function is called to get the number of seconds before 
//						the PFC Message Window closes.
//					  	When using the PFC Message Window the service has the
//						control to automatically close the Message Window after
//						a given number of seconds.
//						For the PFC Message Window, 0 seconds means to stay open
//						forever.
//			*Note:	This seconds setting will have no effect on the service if
//						the service has been instructed to use the standard PB
//						MessageBox function.
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

Return ii_timeout 
end function

public function integer of_getnotifywho (ref string as_users[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetNotifyWho
//
//	Access:  	public
//
//	Arguments: 
//	 as_users[] (by reference) Holds users to notify when there is an error.
//
//	Returns:  	Integer
//					Number of users to Notify.
//
//	Description:	Populate string arrays passed by reference of users to 
//						notify when there is an error.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Changed to use new overloaded function.
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

string ls_addreses[]

Return of_GetNotifyWho(as_users, ls_addreses)

end function

public function integer of_setnotifyseverity (integer ai_severity);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetNotifySeverity
//
//	Access:  		public
//
//	Arguments:
//	 ai_severity	Severity level.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if it fails
//
//	Description:  	This is the thershold to determine if the error	message will
//						be sent (notify the user(s) listed in the instance variable 
//						array is_notifywho[]). 
//					 	For pre-defined errors, each error has a severity assigned 
//						to it. 
// 					With this function, you can send an error notification message
//						with any severity level.  For example, if the severity level 
//						is set to 5, all errors with a severity level of 5 or 
//						greater will generate a mail notification.
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

// Check argument.
If IsNull(ai_severity) Then 
	Return -1
End If

ii_notifyseverity = ai_severity
Return 1


end function

public function integer of_setnotifywho (string as_who[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetNotifyWho
//
//	Access:  		public
//
//	Arguments: 
//	  as_users[] 	String array to populate with the users to 
//						notify when there is an error.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if it fails
//
//	Description:  	Populate string array which holds users and address to 
//						notify when there is an error.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Changed to use new overloaded function.
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

string ls_address[]

Return of_SetNotifyWho(as_who, ls_address)
end function

public function integer of_message (string as_msgid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//	  as_msgid 		Error number to look up and retrieve message "look".
//
//	Returns:  		Integer
//						the button the user selected
//						-1 for failure
//
//	Description:  	Process passed in error index and display message box.
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

String	ls_emptymsgparms[]
String	ls_overridetitle=''

Return of_Message (as_msgid, ls_emptymsgparms, ls_overridetitle)
end function

public function integer of_message (string as_msgid, string as_msgparms[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_msgid 	Error number to look up and retrieve message "look".
//		as_msgparms Array containing the substitution parameters.
//
//	Returns:  		integer
//						the button the user selected
//						-1 for failure
//
//	Description:  	Process passed in error index and display message box.
//			*Note:	Any time this function is called, a window will popup even
//						if errors are encountered.
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

String	ls_overridetitle=''

Return of_Message (as_msgid, as_msgparms, ls_overridetitle)
end function

public function integer of_message (string as_title, string as_message);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_title 	Text for title bar.
//		as_message	Error message.
//			
//	Returns:  		integer
//	
//
//	Description:  This function is  called within an application to 
//						display a message, i.e. messagebox
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

Integer	li_defaultbutton=1
Integer 	li_severity=0
Boolean 	lb_userinput=False
Boolean 	lb_print=False

Return of_message(as_title, as_message, information!, ok!, li_defaultbutton, &
						li_severity, lb_print, lb_userinput )

end function

public function integer of_message (string as_title, string as_message, icon ae_icon);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_title 	Text for title bar
//		as_message	Error message.
//		ae_icon 		The icon you want to display on the left side of the 
//						response window
//			
//	Returns:  		integer
//						<description of possible return values>
//
//	Description:  	This function is  called within an application to 
//						display a message, i.e. messagebox.
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

Integer	li_defaultbutton=1
Integer 	li_severity=0
Boolean 	lb_userinput=False
Boolean 	lb_print=False

Return of_message(as_title, as_message, ae_icon, ok!, li_defaultbutton, &
						li_severity, lb_print, lb_userinput )

end function

public function integer of_message (string as_title, string as_message, icon ae_icon, button ae_buttonstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_title 	Text for title bar
//		as_message	Error message.
//		ae_icon 		The icon you want to display on the left side of the response window.
//		ae_buttonstyle Set of CommandButtons you want to display at the bottom of the 
//							response window
//			
//	Returns:  		integer
//
//	Description:  	This function is  called within an application to 
//						display a message, i.e. messagebox.
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

Integer	li_defaultbutton=1
Integer 	li_severity=0
Boolean 	lb_userinput=False
Boolean 	lb_print=False

Return of_message(as_title, as_message, ae_icon, ae_buttonstyle, li_defaultbutton, &
						li_severity, lb_print, lb_userinput) 

end function

public function integer of_setpredefinedsource (string as_file);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetPredefinedSource
//
//	Access:  		public
//
//	Arguments:
//	as_file   		Filename used to read pre-defined messages
//
//	Returns:  		integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  	This function is called to set the file, including path, to use
//						read pre-defined messages.  It will also perform an
//						initial loading of the messages.
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

Integer	li_rc

// Check arguments.
If IsNull(as_file) or Len(Trim(as_file))=0 Then
	Return -1
End If

// Invalidate the Transaction.
setnull(itr_msgdb)

// Set the file information.
is_msgsrc = FILE
is_msgfile = as_file

// Load the predefined messages.
li_rc = of_LoadPredefinedMsg()

Return li_rc
end function

public function string of_getpredefinedsourcetype ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPredefinedSourceType
//
//	Access:  		public
//
//	Arguments: 		none
//	
//	Returns: 		string
//						The current source type for reading messages.
//
//	Description:  	This function is called to get the source for reading 
//						pre-defined messages.
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

return is_msgsrc
end function

public function integer of_setpredefinedsource (n_tr atr_trans);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetPredefinedSource
//
//	Access:  		public
//
//	Arguments:
//	  atr_trans		Transaction to use to retrieve pre-defined messages.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  	This function is called to set the transaction to use for 
//						reading pre-defined messages.  It will also perform an
//						initial loading of the messages.
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
/////////////////////////////////////////////////////////////////////////////

Integer li_rc

// Check that the transaction is connected.
If IsNull(atr_trans) Or Not IsValid(atr_trans) Then
	Return -1
End If
If dbhandle(atr_trans) = 0 Then 
	Return -1
End If

// Clear the input file.
is_msgfile = ""

// Set the database information.
is_msgsrc = DATABASE
itr_msgdb = atr_trans

// Load the predefined messages.
li_rc = of_LoadPredefinedMsg()

Return li_rc
end function

public function integer of_loadpredefinedmsg ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LoadPredefinedMsg
//
//	Access:  		public
//
//	Arguments: 		none
//
//	Returns:  		Integer
//						1 - retrieved messages.
//						-1 - did not retrieve messages.
//
//	Description:  	This function is used to Load or ReLoad the predefined 
//						messages into a cache using a datastore.
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

// If appropriate, create the datastore cache.
If IsNull(ids_messages) Or Not IsValid(ids_messages) Then
	ids_messages = Create n_ds
	ids_messages.dataobject = 'd_definedmessages'
End If

// Reset the datastore.
ids_messages.Reset()

// Retrieve data into the datastore using the appropriate input source.
If is_msgsrc = DATABASE Then
	ids_messages.setTransObject(itr_msgdb)
	If ids_messages.Retrieve() >0 Then
		Return 1
	End If
ElseIf is_msgsrc = FILE Then
	If ids_messages.ImportFile(is_msgfile) >0 Then
		Return 1
	End If
End If

Return -1

end function

public function integer of_getpredefinedsource (ref n_tr atr_trans);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPredefinedSource
//
//	Access:  		public
//
//	Arguments: 		
//		atr_trans	The transaction for reading pre-defined messages. (by ref)
//	
//	Returns: 		Integer
//						1 if it succeeds and -1 if it fails .
//
//	Description:  	This function is called to get the source for reading 
//						pre-defined messages.
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

// For this function to be called successfuly, the input source type must
// be a database.
If is_msgsrc = DATABASE Then
	atr_trans = itr_msgdb
	Return 1
End if

Return -1
end function

public function integer of_getpredefinedsource (ref string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPredefinedSource
//
//	Access:  		public
//
//	Arguments: 		
//		as_source	The file name use to retrieve pre-defined msgs (by ref).
//	
//	Returns: 		Integer
//						1 if it succeeds and -1 if it fails .
//
//	Description:  	This function is called to get the source for reading 
//						pre-defined messages.
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

// For this function to be called successfuly, the input source type must
// be a file.
If is_msgsrc = FILE Then
	as_source = is_msgfile
	Return 1
End if

Return -1
end function

protected function integer of_processnotify ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ProcessNotify
//
//	Access:  		protected
//
//	Arguments:  	none
//
//	Returns:  	integer
//					 1 if it succeeds
//					 0 No Mail Connection or Notification receipients have been set up.
//					-1 if it fails.
//
//	Description:	This function is used to notify the passed in users of the message.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Enhanced to populate the address in addition to the Receipient's name.
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

String				ls_notesubject
String				ls_notetext
Integer				li_i
Integer				li_count
Integer				li_addresscount
Integer				li_rc
mailReturnCode		lmrc_mRet
mailMessage  		lmm_mMsg

// Check for a mail connection.
If IsNull(ims_mSes) Or Not IsValid(ims_mSes) Then
	Return 0
End If

// Get count of users to notify.
li_count = upperbound(is_notifywho)
li_addresscount = upperbound(is_notifyaddress)
If li_count <= 0 Then
	Return 0
End If

// Create the Notify information.
li_rc = of_CreateNotifyText(ls_notesubject, ls_notetext )

// Populate the Message Subject.
lmm_mMsg.Subject = ls_notesubject

// Populate the Message Text. 
lmm_mMsg.NoteText = ls_notetext

// Populate the Message Recipients.
For li_i=1 to li_count
	lmm_mMsg.Recipient[li_i].Name = is_notifywho[li_i]
	
	// When available, populate the address.
	// The address is not needed for Names that are unique.  The address is
	// needed for names that are not unique and therefor cannot be resolved 
	// without the assistance of the address.
	If li_addresscount >= li_i Then
		If Len(Trim(is_notifyaddress[li_i])) > 0 Then
			lmm_mMsg.Recipient[li_i].address = is_notifyaddress[li_i]
		End If
	End If
Next

// Send the mail.
lmrc_mRet = ims_mSes.mailSend ( lmm_mMsg )

// Check for a succesful Send Mail.
If lmrc_mRet <> mailReturnSuccess! Then
	Return -1
End If

Return 1
end function

public function integer of_setlogseverity (integer ai_severity);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetLogSeverity 
//
//	Access:  		public
//
//	Arguments:
//	 ai_severity   Severity Log level.
//
//	Returns:  		Integer.
//						1 if it succeeds and -1 if it fails.
//
//	Description:  	This is the threshold to determine if the error
// 					will be logged. For pre-defined errors, each error has a
//						severity assigned to it.  With this function, you can log
//						errors with any severity level.   For example, if the 
//						severity level is set to 5, all errors with a severity 
//						level of 5 or greater will be logged.
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

// Check argument.
If IsNull(ai_severity) Then
	Return -1
End If

ii_logseverity  = ai_severity
Return 1
end function

public function integer of_getlogseverity ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetLogSeverity
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		integer
//						Severity Log level.
//
//	Description:  	Return the current Severity Log level.
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

Return ii_logseverity 
end function

public function integer of_GetNotifySeverity ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetNotifySeverity
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		integer
//						Notify Severity level.
//
//	Description:  	Return the current Notify Severity level.
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

Return ii_notifyseverity 
end function

public function integer of_setlogfile (string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetLogFile
//
//	Access:  		public
//
//	Arguments:
//	as_filename   	File name to use for logging messages.
//
//	Returns:  		Integer.
//						1 if it succeeds and -1 if it fails.
//
//	Description:  	Set the file name to be used for logging messages to a file.
//			*Note: 	An empty string on as_filename tells the service to not
//						log any entries.
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

// Check argument.
If IsNull(as_filename) Then
	Return -1
End If

is_logfile = as_filename
Return 1
end function

protected function integer of_processlog ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ProcessLog
//
//	Access:  		protected
//
//	Arguments: 		none
//
//	Returns:  		integer
//						1 if it succeeds and -1 if it fails.
//
//	Description:  	Log message to file.
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

Integer	li_rc
String	ls_errortext
Boolean	lb_append=True

// Confirm there a log file is desired.
If IsNull(is_logfile) or Len(Trim(is_logfile))=0 Then
	Return -1
End If

// Create string to write to file.
li_rc = of_CreateLogText(ls_errortext)
 
// Start fileservice, if it has not yet been started.
If IsNull(inv_filesrv) Or Not IsValid(inv_filesrv) Then
	If f_SetFilesrv(inv_filesrv, True) <> 1 Then
		Return -1
	End If
End If

// Call function to write record on file.
If inv_filesrv.of_filewrite(is_logfile, ls_errortext, lb_append) < 0 Then
	Return -1
End If

Return 1

end function

protected function integer of_processmessagesubstitution (string as_parms[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ProcessMessageSubstitution
//
//	Access:  		protected
//
//	Arguments:
//		as_parms[] 	Array of parms.
//
//	Returns: 		integer 	
//						 1 if it succeeds
//						 0 could not correctly convert.
//						-1 fatal error.
//
//	Description: 	Replace %s in the error text in the instance structure
//						with passed in parms.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Prevent duplication of single argument messages.
// 5.1 	Changed the way arguments get displayed, when the number of expected
//		arguments does not match the passed in arguments. (debugging assistance)
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

String	ls_parms[]
String	ls_replacearray[]
String 	ls_errtext
String	ls_newerrtext
String	ls_stringparms
Integer	li_counter
Integer	li_replacecount
Integer 	li_parmscount
Integer	li_replacearraybound

// Get local copy of error text.
ls_errtext = inv_errorpass.is_text

// Make local copy of parms and get count.
ls_parms = as_parms
li_parmscount = upperbound(ls_parms)
	
// Get number of parms in error message that need to be replaced.
li_replacecount = inv_string.of_countoccurrences(ls_errtext, "%s")

// Check if there is anything to replace.
If li_parmscount=0 And li_replacecount=0 Then
	// Nothing to replace.
	Return 1
End If

// Stop function if number of parms don't equal.
If li_replacecount <> li_parmscount Then
	// Display the parms on the Message window.
	// Note: This is provided as a debugging assistance.
	ls_stringparms = '~r~n ~r~n' + 'Message Arguments:'
	For li_counter= 1 to li_parmscount
		ls_stringparms =  ls_stringparms + '~r~n' + &
								string(li_counter)+ ') '+ ls_parms[li_counter]
	Next
	// Add the display parms to the text for the message window.
	inv_errorpass.is_text = inv_errorpass.is_text + ls_stringparms
	Return 0
End If

// Call function to break up error text string into an array of strings.
// Note: The function strips out all of the '%s'.
If inv_string.of_parsetoarray (ls_errtext, "%s", ls_replacearray) <= 0 Then
	Return 0
End If

// Add the passed in parms to the end using the strings in the two arrays.
For li_counter = 1 to li_replacecount
	ls_replacearray[li_counter] = ls_replacearray[li_counter] + ls_parms[li_counter]
Next

// Rebuild error text using the array.
li_replacearraybound = upperbound(ls_replacearray)
For li_counter = 1 to li_replacearraybound
	ls_newerrtext = ls_newerrtext + ls_replacearray[li_counter]
Next

// Set error text in instance structure.
inv_errorpass.is_text = ls_newerrtext

Return 1
end function

public function string of_getlogfile ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetLogFile
//
//	Access:  		public
//
//	Arguments: 		none
//
//	Returns:  		string
//						filename used for logging.
//
//	Description:  	Get the file name to be used for saving messages to a file.
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

Return is_logfile
end function

public function boolean of_GetUnattended ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUnattended
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		Boolean
//						The state of the Unattended flag.
//
//	Description:  	This function is called to get the current state of the
//						unattended flag.
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

Return ib_unattended 
end function

public function integer of_message (string as_title, string as_message, icon ae_icon, button ae_buttonstyle, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_Message
//
//	Access:  			public
//
//	Arguments:
//		as_title  		Text for title bar
//		as_message
//		ae_icon 			The icon you want to display on the left side of the response
//							window
//		ae_buttonstyle	Set of CommandButtons you want to display at the bottom of the 
//							response window
//		ai_default  	The number of the button you want to be the default button 
//
//	Returns:  integer
//	<description of possible return values>
//
//	Description:  This function is  called within an appliation to 
//						display a message, i.e. messagebox
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

Integer 	li_severity=0
Boolean 	lb_userinput=False
Boolean 	lb_print=False

Return of_message (	as_title, as_message, ae_icon, ae_buttonstyle, ai_default, &
							li_severity, lb_print, lb_userinput )

end function

public function integer of_settimeout (integer ai_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetTimeout
//
//	Access:  		public
//
//	Arguments:
//	  ai_seconds	Seconds to stay open.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if it fails.
//
//	Description:  	When using the PFC Message Window the service has the
//						control to automatically close the Message Window after
//						a given number of seconds.
//						For the PFC Message Window, set to 0 seconds to stay open
//						forever.
//			*Note:	This seconds setting will have no effect on the service if
//						the service has been instructed to use the standard PB
//						MessageBox function.
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

// Check argument.
If IsNull(ai_seconds) or ai_seconds < 0 Then
	Return -1
End If

ii_timeout = ai_seconds
Return 1
end function

protected function integer of_processmessage ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ProcessMessage
//
//	Access:  		protected
//
//	Arguments: 		None.
//
//	Returns:  		integer
//						The button returned from the message window.
//						-1 if an error was encountered.
//
//	Description:  This function is called to process the Message.
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

Integer	li_rc
Integer	li_testrc

// Set other information.
inv_errorpass.idt_date = DateTime(today(), now())

// As appropriate, run the attended/unattended process.
If ib_unattended Then
	// Set the Default button as the return button for unattended mode.
	inv_errorpass.ii_buttonclicked = inv_errorpass.ii_default
	li_rc = inv_errorpass.ii_default
Else
	// Attended Mode.  Open response window.	
	Choose Case ii_style
		Case 	0
				inv_errorpass.ii_buttonclicked = of_MessageBox('pfc_errorsrv_msg', &
						inv_errorpass.is_title, &
						inv_errorpass.is_text, inv_errorpass.ie_icon, &
						inv_errorpass.ie_buttonstyle, inv_errorpass.ii_default)
		Case	1
				// Set the timeout option.
				inv_errorpass.ii_timeout = ii_timeout
		
				If ib_beep Then
					beep(1)
				End If
				li_testrc = OpenWithParm(w_message, inv_errorpass)
				If  li_testrc > 0 Then
					// Get the structure passed by the response window for 
					// any user input and buttonclicked.
					If IsValid(Message.powerobjectparm) Then
						inv_errorpass = Message.powerobjectparm
					End If			
				End If
	End Choose
End If

// If appropriate, log the error.
If (inv_errorpass.ii_severity >= ii_logseverity) Then
	li_testrc = of_ProcessLog ()
End If

// If appropriate, send a notification.
If (inv_errorpass.ii_severity >= ii_notifyseverity) Then 
	li_testrc = of_ProcessNotify()
End If

Return inv_errorpass.ii_buttonclicked
end function

public function integer of_setnotifyconnection (mailsession ams_mses);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetNotifyConnection
//
//	Access:  public
//
//	Arguments:
//	ams_mses   The mail connection.
//
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	This function is called to set the mail connection to use for 
//	sending notificiations via the mail system.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Prevent mailsession from being established if running Unix or Mac.
//		MAPI is not supported on these platforms.
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
/////////////////////////////////////////////////////////////////////////////

environment	lenv_obj

// Determine whether mail notification is supported for current platform
GetEnvironment (lenv_obj)
if IsValid (lenv_obj) then
	if lenv_obj.ostype <> windows! and lenv_obj.ostype <> windowsnt! then
		return -1
	end if
else
	return -1
end if


// Set the notify connection information.
ims_mses = ams_mses

return 1
end function

public function integer of_getnotifyconnection (ref mailsession ams_mses);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetNotifyConnection
//
//	Access:  		public
//
//	Arguments:
//	  ams_mSes		The mail connection (by reference)
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  	This function is called to get the current mail connection 
//						being used by the service.
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
/////////////////////////////////////////////////////////////////////////////

// Get the Notify Connection information.
ams_mSes = ims_mses

Return 1
end function

public function integer of_message (string as_title, string as_text, icon ae_icon, button ae_buttonstyle, integer ai_default, integer ai_severity, boolean ab_print, boolean ab_userinput);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_title 		The message Title
//		as_text			The message Text.
//		ae_icon 			The icon you want to display on the left side of the response window.
//		ae_buttonstyle Set of CommandButtons you want to display at the bottom of the 
//							response window.
//		ai_default 		The number of the button you want to be the default button.
//		ai_severity		The number indicating the severity of this message.
//		ab_print 		Flag to indicate if the print button should be available.
//		ab_userinput 	Flag to indicate if the userinput button should be available.
//			
//	Returns:  			integer
//	
//
//	Description:  		This function is  called within an application to 
//							display a message, i.e. messagebox.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Added user value to structure information.
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

// Clear the instance structure.
n_cst_errorattrib ls_errorpass 
inv_errorpass = ls_errorpass

//-- Initialize the instance structure. --
inv_errorpass.is_title = as_title
inv_errorpass.is_text = as_text
inv_errorpass.ie_icon = ae_icon
inv_errorpass.ie_buttonstyle = ae_buttonstyle
inv_errorpass.ii_default = ai_default
inv_errorpass.ii_severity = ai_severity
inv_errorpass.ib_print = ab_print
inv_errorpass.ib_userinput = ab_userinput
inv_errorpass.is_user = is_user

// Call function to Process Message.
Return of_ProcessMessage()
end function

protected function integer of_createnotifytext (ref string as_subject, ref string as_text);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CreateNotifyText
//
//	Access:  		protected
//
//	Arguments: 
//		as_subject	The subject string (by reference).
//		as_text		The text string (by reference.)
//
//	Returns:  		integer
//						 1 if it succeeds
//						-1 if it fails.
//
//	Description:	
//	This function is used to create the text that is used to peform the Notify process.
//
//	Note:
//	To create other than the standard text override this function on an descendant.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced creation of notify text to use is_notifypretitle.
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

constant	string NEWLINE = '~r~n'
constant string TAB	= '~t'
string ls_date

If IsNull(inv_errorpass) Or Not IsValid(inv_errorpass) Then
	Return -1
End If

// Make sure there are no Null values.
If Not IsNull(inv_errorpass.idt_date) Then ls_date = String(inv_errorpass.idt_date)
If IsNull(inv_errorpass.is_title) Then inv_errorpass.is_title = ''
If IsNull(inv_errorpass.is_text) Then inv_errorpass.is_text = ''
If IsNull(inv_errorpass.is_user) Then inv_errorpass.is_user = ''
If IsNull(inv_errorpass.is_usertext) Then inv_errorpass.is_usertext = ''

//-- Create the Subject text. --
as_subject = is_notifypretitle + inv_errorpass.is_title

//-- Create the Message text. --
If Len(ls_date) > 0 Then
	// Optional datetime.
	as_text = 'DateTime: '+String(inv_errorpass.idt_date) + NEWLINE + NEWLINE
End If

// Required values.
as_text +=  'Title: '+inv_errorpass.is_title + NEWLINE + NEWLINE + &
				'Message: '+inv_errorpass.is_text + NEWLINE + NEWLINE

If Len(inv_errorpass.is_user) > 0 Then
	// Optional user value.
	as_text += 'User: '+ inv_errorpass.is_user + NEWLINE
End If

If Len(inv_errorpass.is_usertext) >0 Then
	// Optional comments.
	as_text += 'Comments: '+inv_errorpass.is_usertext
End If

Return 1
end function

protected function integer of_createlogtext (ref string as_text);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CreateLogText
//
//	Access:  		protected
//
//	Arguments: 
//	as_text	The Log Text string (by reference).
//
//	Returns:  		integer
//	1 if it succeeds
//	-1 if it fails.
//
//	Description:	
//	This function is used to create the text that is used	to peform the log process.
//
//	Note:	
//	To create other than the standard text override this function on an descendant.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Add newline character after each error.
// 6.0	Enhanced to have multiple message styles.
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

constant	string NEWLINE = '~r~n'
constant string TAB	= '~t'
string ls_date

If IsNull(inv_errorpass) Or Not IsValid(inv_errorpass) Then
	Return -1
End If

// Make sure there are no Null values.
If Not IsNull(inv_errorpass.idt_date) Then ls_date = String(inv_errorpass.idt_date)
If IsNull(inv_errorpass.is_title) Then inv_errorpass.is_title = ''
If IsNull(inv_errorpass.is_text) Then inv_errorpass.is_text = ''
If IsNull(inv_errorpass.is_user) Then inv_errorpass.is_user = ''
If IsNull(inv_errorpass.is_usertext) Then inv_errorpass.is_usertext = ''

//-- The default text depending on the style. --
CHOOSE CASE ii_logfilestyle
	CASE TAB_DELIMITED
		as_text=	"DateTime: "+ ls_date + TAB + &
					"Title: "+ inv_errorpass.is_title + TAB + &
					"Message: "+ inv_errorpass.is_text + TAB + &
					"User: "+ inv_errorpass.is_user + TAB + &
					"Comments: "+ inv_errorpass.is_usertext
	
	CASE NEWLINE_DELIMITED
		as_text=	"DateTime: "+ ls_date + NEWLINE + &
					"Title:    "+ inv_errorpass.is_title + NEWLINE + &
					"Message:  "+ inv_errorpass.is_text + NEWLINE + &
					"User:     "+ inv_errorpass.is_user + NEWLINE + &
					"Comments: "+ inv_errorpass.is_usertext + NEWLINE	
					
	CASE ELSE
		Return -1
END CHOOSE

// Add newline character after each error.
as_text += NEWLINE 

Return 1
end function

public function integer of_message (string as_msgid, string as_msgparms[], string as_overridetitle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Message
//
//	Access:  		public
//
//	Arguments:
//		as_msgid 	Error number to look up and retrieve message "look".
//		as_msgparms Array containing the substitution parameters.
//		as_overridetitle	Title string to override the Pre-defined title.
//								This is useful when sharing one pre-defined message
//								that needs to have different titles (for example, the
//								title could be application or window dependent.)
//
//	Returns:  		integer
//						the button the user selected
//						-1 for failure
//
//	Description:  	Process passed in error index and display message box.
//			*Note:	Any time this function is called, a window will popup even
//						if errors are encountered.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Added user value to structure information.
// 5.0.04 Corrected ll_rowcount datatype from integer to long.
// 5.0.04 Removed unwanted beep(1) call.
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
Long		ll_rowcount
Long		ll_row
Boolean	lb_log=False
Boolean	lb_notify=False

// Clear and Initialize instance structure.
n_cst_errorattrib ls_errorpass 
inv_errorpass = ls_errorpass

// Initialize the user
inv_errorpass.is_user = is_user

// Initialize the override title.
inv_errorpass.is_title = as_overridetitle

// Default values in case an error is encountered.
// Give the User all the buttons, in case he/she knows which one to click.
inv_errorpass.ie_buttonstyle = YesNoCancel!
inv_errorpass.ie_icon = StopSign!

// Check argument
If Len(Trim(as_msgid)) >0 Then
	If IsNull(ids_messages) Or Not IsValid(ids_messages) Then
		// The predefined functionality is not yet available.
		inv_errorpass.is_text = 'Predefined Message "'+as_msgid+'" not found.~r~n ~r~n' +&
										'The Predefined Messages not found.'
	Else
		// Get number of rows in datastore
		ll_rowcount = ids_messages.RowCount()

		// Find index.
		ll_row = ids_messages.Find("Lower(msgid) = '"+ Lower(as_msgid) +"'", 1, ll_rowcount)
		If ll_row > 0 Then 
			
			// Entry was found.  Load structure.
			If Len(Trim(as_overridetitle))=0 Then
				// Only get the predefined title, the title was not overriden.
				inv_errorpass.is_title = ids_messages.Object.msgtitle[ll_row]
			End If
			
			// Get the text and perform any needed conversions.
			inv_errorpass.is_text = ids_messages.Object.msgtext[ll_row]
			inv_errorpass.is_text = inv_string.of_GlobalReplace (inv_errorpass.is_text, '~~r', '~r', TRUE)
			inv_errorpass.is_text = inv_string.of_GlobalReplace (inv_errorpass.is_text, '~~n', '~n', TRUE)
			inv_errorpass.is_text = inv_string.of_GlobalReplace (inv_errorpass.is_text, '~~t', '~t', TRUE)

			// Get the rest of the information.			
			li_rc = inv_conversion.of_icon(ids_messages.Object.msgicon[ll_row], inv_errorpass.ie_icon )
			If li_rc <> 1 Then inv_errorpass.ie_icon = StopSign!
			li_rc = inv_conversion.of_button(ids_messages.Object.msgbutton[ll_row], inv_errorpass.ie_buttonstyle )
			If li_rc <> 1 Then inv_errorpass.ie_buttonstyle = OK!
			inv_errorpass.ii_default = ids_messages.Object.msgdefaultbutton[ll_row]
			inv_errorpass.ii_severity = ids_messages.Object.msgseverity[ll_row]
			inv_errorpass.ib_print = (Lower(ids_messages.Object.msgprint[ll_row]) = 'y')
			inv_errorpass.ib_userinput = (Lower(ids_messages.Object.msguserinput[ll_row]) = 'y')
		Else
			// Entry was not found.
			inv_errorpass.is_text = 'Predefined Message "'+as_msgid+'" not found.'
		End If

		If UpperBound (as_msgparms) > 0 Then
			// Replace %s with passed in parms in the error text returned in the 
			// instance structure.
			li_rc = of_ProcessMessageSubstitution(as_msgparms)
		End If
	End If
End If

// Call function to Process Message.
Return of_ProcessMessage()
end function

public function integer of_setstyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetStyle
//
//	Access:    		Public
//
//	Arguments:
//   ai_style 		A value that determines the style of the Message.
//						Values are:
//							0 = PowerBuilder default MessageBox (Default)
//							1 = PFC Message Window 
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1.
//
//	Description:  	Sets the style the service is currently using to display 
//						messages.
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

// Check to see if the passed style number is valid.
IF IsNull(ai_style) Or (ai_style >1 Or ai_style <0) THEN 
	Return -1
End If

ii_style = ai_style
Return 1
end function

public function integer of_SetBeep (boolean ab_beep);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBeep
//
//	Access:    		Public
//
//	Arguments:
//   ab_beep 		A value that determines if a beep should occurr prior
//						to showing the pfc Message window.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1.
//
//	Description:  	Sets the value that determines if a beep should occurr prior
//						to showing the pfc Message window.
//			*Note:	This has no effect if the service is using Powerbuilder's
//						messagebox instead.
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

// Check to see if the passed style number is valid.
IF IsNull(ab_beep) THEN 
	Return -1
End If

ib_beep = ab_beep
Return 1
end function

public function integer of_getstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetStyle
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		Integer
//   					A value that determines the style the service is currently
//						using to display messages.
//						Values are:
//							0 = Powerscript default MessageBox 
//							1 = PFC Message Window 
//
//	Description:  	Gets the style the service is currently using to display 
//						messages.
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

public function boolean of_GetBeep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBeep
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		boolean
//   					True if a beep is set to occurr prior to the showing of 
//								the pfc Message window.
//						False otherwise.
//
//	Description:  	Returns true if a if a beep is set to occurr prior to the 
//						showing of the pfc Message window.
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

Return ib_beep
end function

public function integer of_setunattended (boolean ab_unattended);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUnattended
//
//	Access:  		public
//
//	Arguments: 		
//		ab_unattended 	boolean
//						true - set unattended option true
//						false - set unattended option false
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if it fails.
//			
//	Description:  	Sets the state of the unattended flag.
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

// Check argument.
If IsNull(ab_unattended) Then
	Return -1
End If

ib_unattended = ab_unattended
Return 1
end function

public function integer of_setuser (string as_user);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUser
//
//	Access:    		Public
//
//	Arguments:
//   as_user 		User using this service.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1.
//
//	Description:  	Set the user using this service.   This name will used in the
//						message text information for logging or MAPI notifications.
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

// Check to see if the passed string is valid.
If IsNull(as_user) or Len(Trim(as_user))=0 Then
	Return -1
End If

// Set the user using this service.
is_user = as_user
Return 1
end function

public function string of_getuser ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUser
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		string
//						User using this service.
//
//	Description:  	Return the user using this service.   This name is used in the
//						message text information for logging or MAPI notifications.
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

Return is_user 
end function

public function integer of_getnotifywho (ref string as_users[], ref string as_address[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetNotifyWho
//
//	Access:  	public
//
//	Arguments: 
//	 as_users[] (by reference) Holds the users to notify when there is an error.
//	 as_address[] (by reference) Holds the addresses to notify when there is an error.
//
//	Returns:  	Integer
//					Number of users to Notify.
//
//	Description:	Populate string arrays passed by reference of users to 
//						notify when there is an error.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

as_users = is_notifywho
as_address = is_notifyaddress
Return UpperBound(as_users)

end function

public function integer of_setnotifywho (string as_who[], string as_address[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetNotifyWho
//
//	Access:  		public
//
//	Arguments: 
//	  as_users[] 	String array to populate with the users to 
//						notify when there is an error.
//	  as_address[] String array to populate with the address to 
//						notify when there is an error.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if it fails
//
//	Description:  	Populate string array which holds users and addreses to 
//						notify when there is an error.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

is_notifywho = as_who
is_notifyaddress = as_address
Return 1
end function

public function integer of_setlogfilestyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		
//	of_SetLogFileStyle
//
//	Access:  public
//
//	Arguments: 
//	ai_style	The style to be used for logging messages to a file.
//
//	Returns: Integer.
//	1 success
//	-1 error
//
//	Description:
//	Sets the style to be used for logging messages to a file.
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

CHOOSE CASE ai_style
	CASE TAB_DELIMITED, NEWLINE_DELIMITED
		ii_logfilestyle = ai_style
		Return 1
END CHOOSE

Return -1
end function

public function integer of_getlogfilestyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		
//	of_GetLogFileStyle
//
//	Access:  public
//
//	Arguments: None
//
//	Returns: Integer.
//	Gets the style to be used for logging messages to a file.
//
//	Description:
//	Gets the style to be used for logging messages to a file.
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

Return ii_logfilestyle
end function

public function integer of_setnotifypretitle (string as_pretitle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	
//	of_SetNotifyPreTitle
//
//	Access:  	public
//
//	Arguments:
//	as_pretitle   	The pre title to be used while notifying.
//
//	Returns:  	Integer.
//	1 if it succeeds
//	1 if it fails.
//
//	Description:  	
//	Set the pre title to be used while notifying.
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

// Check argument.
If IsNull(as_pretitle) Then
	Return -1
End If

is_notifypretitle = as_pretitle
Return 1
end function

public function string of_getnotifypretitle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	
//	of_GetNotifyPreTitle
//
//	Access:  	public
//
//	Arguments:	None
//
//	Returns:  	String.
//	Gets the pre title to be used while notifying.
//
//	Description:  	
//	Gets the pre title to be used while notifying.
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

Return is_notifypretitle
end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			destructor
//
//	Arguments: 		none
//
//	Returns:  		none
//
//	Description:  	Destroy anything created during this instance.
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

// Destroy datastore cache.
If IsValid(ids_messages) Then
	Destroy ids_messages
End If

// Destroy file services.
If IsValid(inv_filesrv) Then
	f_SetFilesrv(inv_filesrv, False)
End If

end event

on pfc_n_cst_error.create
call super::create
end on

on pfc_n_cst_error.destroy
call super::destroy
end on

