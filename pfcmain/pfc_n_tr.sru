HA$PBExportHeader$pfc_n_tr.sru
$PBExportComments$PFC Transaction class
forward
global type pfc_n_tr from transaction
end type
end forward

global type pfc_n_tr from transaction
end type
global pfc_n_tr pfc_n_tr

type variables
Public:
constant integer CST_FILETYPE_INI = 1
constant integer CST_FILETYPE_XML = 2

Protected:
boolean		ib_IsObsolete
boolean		ib_AutoRollBack
boolean 		ib_Trace
string			is_Name
end variables

forward prototypes
public function boolean of_IsConnected ()
public function long of_RollBack ()
public function long of_Connect ()
public function long of_DisConnect ()
public function string of_GetSqlState ()
public function boolean of_GetTrace ()
public function long of_Execute (string as_sqlstatement)
public function boolean of_GetAutoRollBack ()
public function integer of_SetTrace (boolean ab_trace)
public function integer of_SetName (string as_name)
public function string of_GetName ()
public function integer of_Init (string as_inifile, string as_inisection)
public function integer of_Init (string as_registrykey)
public function long of_DistinctValues (string as_table, string as_column, ref string as_values[])
public function long of_End ()
public function integer of_SetAutoRollBack (boolean ab_autorollback)
protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function long of_Commit ()
public subroutine of_setuser (string as_userid, string as_password)
public subroutine of_SetLogidAndPassword (string as_loginid, string as_logpassword)
public subroutine of_SetUseridAndPassword (string as_userid, string as_password)
public function long of_begin ()
public function integer of_copyto (n_tr atr_target)
protected function integer of_restore (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default)
public function integer of_init (integer ai_filetype, string as_inixmlfile, string as_inisectionxmlroot)
end prototypes

public function boolean of_IsConnected ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_IsConnected
//	Arguments:  	None
//	Returns:  		boolean
//						true = connected
//						false = not connected
//	Description:	Determines if a connection has been established to the database
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						5.0.01   Fixed bug where negative handles were not being considered as connected
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
if this.DBHandle() = 0 then
	return false
else
	return true
end if
end function

public function long of_RollBack ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_RollBack
//	Arguments:  	None
//	Returns:  		long - The SQLCode return value from the rollback statement.
//								 -10 if there is no connection to the database.
//	Description:  	Issues a rollback
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						8.0   Move rollback outside of the IsValid test
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
long	ll_rc = -10
string ls_name

if of_IsConnected() then
	
	// If SQLSpy is available, add to the history
	if IsValid (gnv_app) then
		if IsValid (gnv_app.inv_debug) then
			ls_name = this.is_Name
			if Len (ls_name) = 0 then
				ls_name = this.ClassName()
			end if
			if IsValid (gnv_app.inv_debug.inv_sqlspy) then
				gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax ("Rollback using " + ls_name)
			end if 
		end if
	end if
	
	rollback using this;
	ll_rc = this.SQLCode

end if

return ll_rc
end function

public function long of_Connect ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Connect
//	Arguments:  	None
//	Returns:  		long - The SQLCode return value after the connect is issued
//	Description:	Issues a connect
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
long	ll_rc
string ls_name

// If SQLSpy is available, add to the history
if IsValid (gnv_app) then
	if IsValid (gnv_app.inv_debug) then
		ls_name = this.is_Name
		if Len (ls_name) = 0 then
			ls_name = this.ClassName()
		end if
		if IsValid (gnv_app.inv_debug.inv_sqlspy) then
			gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax ("Connect using " + ls_name)
		end if 
	end if
end if

connect using this;
ll_rc = this.SQLCode

return ll_rc
end function

public function long of_DisConnect ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_DisConnect
//	Arguments:		None
//	Returns:			long - The SQLCode return value after the disconnect is issued
//	Description:	Issues a disconnect
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
long	ll_rc
string	ls_name

// If SQLSpy is available, add to the history
if IsValid (gnv_app) then
	if IsValid (gnv_app.inv_debug) then
		ls_name = this.is_Name
		if Len (ls_name) = 0 then
			ls_name = this.ClassName()
		end if
		if IsValid (gnv_app.inv_debug.inv_sqlspy) then
			gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax ("Disconnect using " + ls_name)
		end if 
	end if
end if

disconnect using this;
ll_rc = this.SQLCode

return ll_rc
end function

public function string of_GetSqlState ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetSqlState
//	Arguments:		None
//	Returns:			string - SQL state generated by the dbms
//	Description:	Return the SQL state generated by the dbms
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
integer	li_pos1
integer	li_pos2
string	ls_temp

if this.SqlErrText <> "" then
	li_pos1 = Pos (this.SqlErrText, "=") +2
	li_pos2 = (Pos (this.SqlErrText, "[") -2) - li_pos1
	ls_temp = Mid (this.SqlErrText, li_pos1,  li_pos2)
end if

return ls_temp
end function

public function boolean of_GetTrace ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetTrace
//	Arguments:		None
//	Returns:			boolean - The trace property value.
//	Description:	Gets the value of the trace property
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
return ib_Trace
end function

public function long of_Execute (string as_sqlstatement);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Execute
//	Arguments:		as_sqlstatement:  the SQL statement to execute
//	Returns:			long - the SQLCode value after the SQL is executed
//								 -10	if there is no connection to the database.
//	Description:	Executes specified SQL
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
long	ll_rc = -10
string	ls_name

if of_IsConnected() then
	
	// If SQLSpy is available, add to the history
	if IsValid (gnv_app) then
		if IsValid (gnv_app.inv_debug) then
			if IsValid (gnv_app.inv_debug.inv_sqlspy) then
				ls_name = this.is_Name
				if Len (ls_name) = 0 then
					ls_name = this.ClassName()
				end if
				// Note:  as_sqlstatement is passed by reference
				gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax &
					("Dynamic SQL using " + ls_name, as_SQLStatement, true)
			end if 
		end if
	end if
	
	execute immediate :as_SQLStatement using this;
	ll_rc = this.SQLCode
	
end if

return ll_rc
end function

public function boolean of_GetAutoRollBack ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetAutoRollBack
//	Arguments:		None
//	Returns:			boolean - The autorollback property value.
//	Description:	Gets the autorollback property value
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
return ib_AutoRollBack
end function

public function integer of_SetTrace (boolean ab_trace);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetTrace
//	Arguments:		ab_trace   the desired trace property value.
//	Returns:			integer
//	 					1 = success
//	 					0 = trace property was already the desired value
//						-1 = error
//	Description:	Sets the trace property
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
constant string KEYWORD = 'trace '
integer	li_keywordpos
string ls_dbms

// Check arguments
if IsNull (ab_trace) then return -1

// Check if an action is required
if ib_Trace = ab_trace then return 0

// Set trace property
ib_Trace = ab_trace
ls_dbms =  Lower (this.dbms)
li_keywordpos = Pos (ls_dbms, KEYWORD)

if ib_Trace then
	if li_keywordpos > 0 then 
		// Keyword 'trace ' is already found.
		return -1
	end if
	this.dbms = KEYWORD + this.dbms
else
	// The word 'trace ' should be found and removed
	if li_keywordpos = 0 then 
		// Keyword 'Trace' is not found.
		return -1
	end if	
	this.dbms = Mid (this.dbms, li_keywordpos + Len (KEYWORD), Len (this.dbms))
end if

if of_IsConnected() then
	// For the change to take effect a reconnection is required.
	of_DisConnect()
	of_Connect()
end if

return 1
end function

public function integer of_SetName (string as_name);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetName
//	Arguments:		as_name	   the name of this transaction object
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Sets the name of this transaction object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
if IsNull (as_name) then return -1

is_Name = as_name

return 1
end function

public function string of_GetName ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetName
//	Arguments:		None
//	Returns:			string - The name of this transaction object
//	Description:	Gets the name of this transaction object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
return is_Name
end function

public function integer of_Init (string as_inifile, string as_inisection);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Init
//	Arguments:		as_inifile   		.INI file to read values from.
//						as_inisection   	Section within .INI file where transaction object values are.
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Initializes transaction object's properties with values from 
//						an .INI file.  Values that are not found will be defaulted to an empty string.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
n_cst_conversion lnv_conversion

// Check arguments
if IsNull (as_inifile) or IsNull (as_inisection) or &
	Len (Trim (as_inifile))=0 or Len (Trim (as_inisection))=0 or &
	(not FileExists (as_inifile)) then return -1

this.DBMS= ProfileString (as_inifile, as_inisection, 'DBMS', '')
this.Database = ProfileString (as_inifile, as_inisection, 'Database', '')
this.LogID = ProfileString (as_inifile, as_inisection, 'LogID', '')
this.LogPass = ProfileString (as_inifile, as_inisection, 'LogPassword', '')
this.ServerName = ProfileString (as_inifile, as_inisection, 'ServerName', '')
this.UserID = ProfileString (as_inifile, as_inisection, 'UserID', '')
this.DBPass =ProfileString (as_inifile, as_inisection, 'DatabasePassword', '')
this.Lock =ProfileString (as_inifile, as_inisection, 'Lock', '')
this.DBParm =ProfileString (as_inifile, as_inisection, 'DBParm', '')
this.AutoCommit = lnv_conversion.of_Boolean (ProfileString (as_inifile, as_inisection, 'AutoCommit', 'false'))
if IsNull (this.AutoCommit) then this.AutoCommit = false

return 1
end function

public function integer of_Init (string as_registrykey);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Init
//	Arguments:		as_registrykey   the registry key to read values from
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Initializes transaction object's properties with values from 
//						the registry.  Values that are not found will be defaulted to an empty string.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
string		ls_dbms
string		ls_database
string		ls_logid
string		ls_logpass
string		ls_servername
string		ls_userid
string		ls_dbpass
string		ls_lock
string		ls_dbparm
string		ls_autocommit
n_cst_conversion lnv_conversion

// Check arguments
if IsNull (as_registrykey) or Len (Trim (as_registrykey)) =0 then	return -1

// If available, get each individual value.
li_rc = RegistryGet (as_registrykey, 'DBMS', ls_dbms)
li_rc = RegistryGet (as_registrykey, 'Database', ls_database)
li_rc = RegistryGet (as_registrykey, 'LogID', ls_logid)
li_rc = RegistryGet (as_registrykey, 'LogPassword', ls_logpass)
li_rc = RegistryGet (as_registrykey, 'ServerName', ls_servername)
li_rc = RegistryGet (as_registrykey, 'UserID', ls_userid)
li_rc = RegistryGet (as_registrykey, 'DatabasePassword', ls_dbpass)
li_rc = RegistryGet (as_registrykey, 'Lock', ls_lock)
li_rc = RegistryGet (as_registrykey, 'DBParm', ls_dbparm)
li_rc = RegistryGet (as_registrykey, 'AutoCommit', ls_autocommit)

// Initialize this object
this.DBMS = ls_dbms
this.Database = ls_database
this.LogID = ls_logid
this.LogPass = ls_logpass
this.ServerName = ls_servername
this.UserID = ls_userid
this.DBPass = ls_dbpass
this.Lock 	= ls_lock
this.DbParm = ls_dbparm
this.Autocommit = lnv_conversion.of_Boolean (ls_autocommit)
if IsNull (this.Autocommit) then this.Autocommit = false

return 1
end function

public function long of_DistinctValues (string as_table, string as_column, ref string as_values[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_DistinctValues
//	Arguments:		as_table:  	a SQL table name
//						as_column:  a database column name in passed SQL table
//						as_values:  string array, passed by reference to hold the returned values
//	Returns:			long - the SQLCode based on the SQL fetch
//	Description:	Get the distinct values from the database
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
long	ll_rc
string	ls_sqlstatement
string	ls_value
string	ls_name

// Build the SQL Select statement
ls_sqlstatement = "SELECT DISTINCT " + as_column + " FROM " + as_table

// If SQLSpy service is on, add to the history
if IsValid (gnv_app) then
	if IsValid(gnv_app.inv_debug) then
		if IsValid (gnv_app.inv_debug.inv_sqlspy) then
			ls_name = this.is_Name
			if Len (ls_name) = 0 then
				ls_name = this.ClassName()
			end if
			gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax &
				("Dynamic SQL using " + ls_name, ls_sqlstatement)
		end if 
	end if
end if

// Execute the SQL
prepare sqlsa from :ls_sqlstatement using this;
describe sqlsa into sqlda;
declare c_values_cursor	dynamic cursor for sqlsa;
open dynamic c_values_cursor using descriptor sqlda;
fetch c_values_cursor using descriptor sqlda;
ll_rc = this.SQLCode

// Retrieve the distinct values and add them to the array
do while this.SQLCode = 0 
	choose case sqlda.OutParmType[1]
		case TypeString!
			ls_value = GetDynamicString (sqlda, 1)
		case TypeDate!
			ls_value = String (GetDynamicDate (sqlda, 1))
		case TypeTime!
			ls_value = String (GetDynamicTime (sqlda, 1))
		case TypeDateTime!
			ls_value = String (GetDynamicDateTime (sqlda, 1))
		case else
			ls_value = String (GetDynamicNumber (sqlda, 1))
	end choose

	as_values[UpperBound(as_values)+1] =  ls_value
	fetch c_values_cursor using descriptor sqlda;
	ll_rc = this.SQLCode
loop

close c_values_cursor;

return ll_rc
end function

public function long of_End ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_End
//	Arguments:		None
//	Returns:			long
//	Description:	End a transaction
//						Note:  This function should be implemented in descendant DBMS transaction objects
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
end function

public function integer of_SetAutoRollBack (boolean ab_autorollback);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetAutoRollBack
//	Arguments:		ab_trace   the desired autorollback property value.
//	Returns:			Integer
//	 					1 = success
//						-1 = error
//	Description:	Sets the autorollback property
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
// Check argument
if IsNull (ab_autorollback) then return -1

ib_AutoRollBack = ab_autorollback

return 1
end function

protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//	Protected Function: 		of_MessageBox
//	Arguments:		as_id			An ID for the Message.
//						as_title  	Text for title bar
//						as_text		Text for the actual message.
//						ae_icon 		The icon you want to display on the MessageBox.
//						ae_button	Set of CommandButtons you want to display on the MessageBox.
//						ai_default  The default button.
//	Returns:			integer - Return value of the MessageBox.
//	Description:	Display a PowerScript MessageBox.  
//						Allow PFC MessageBoxes to be manipulated prior to their actual display.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
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

public function long of_Commit ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Commit
//	Arguments:		None
//	Returns:			long - The SQLCode return value from the commit statement.
//								 -10 if there is no connection to the database.
//	Description:	Issues a commit transaction
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
long	ll_rc = -10
string	ls_name

if of_IsConnected() then
	
	// If SQLSpy service is on, add to the history
	if IsValid (gnv_app) then
		if IsValid (gnv_app.inv_debug) then
			if IsValid (gnv_app.inv_debug.inv_sqlspy) then
				ls_name = this.is_Name
				if Len (ls_name) = 0 then
					ls_name = this.ClassName()
				end if
				gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax ("Commit using " + ls_name )
			end if 
		end if
	end if
	
	commit using this;
	ll_rc = this.SQLCode
	
end if

return ll_rc
end function

public subroutine of_setuser (string as_userid, string as_password);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetUser
//	Arguments:			as_userid:  	User ID
//							as_password:	User's password
//	Returns:			None
//	Description:	Sets the property values of the transaction object for user id and password specified.
//						Note:	Use this function for ODBC database connections.  For native connections,
//						use of_SetLogidAndPassword or of_SetUseridAndPassword, depending on the DBMS
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						5.0.02   Changed default behavior of function to modify the ConnectString
//									UID and PWD parameters in the dbparm property of the trans object.
//									Prior to the change, the function set the UserID and DBPass properties.
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
string	ls_connectstring
string	ls_userid
string	ls_password
n_cst_string	lnv_string

// Get connect string value
ls_connectstring = lnv_string.of_GetKeyValue (this.dbparm, "connectstring", ",")

if len (ls_connectstring) <= 0 then
	// No connectstring defined
	if len (this.dbparm) > 0 then
		ls_connectstring = ","
	end if
	ls_connectstring = ls_connectstring + "ConnectString='UID=" + as_userid + ";PWD=" + as_password + "'"
	this.dbparm = this.dbparm + ls_connectstring
else
	// Temporarily remove single quotes from connectstring
	ls_connectstring = lnv_string.of_globalReplace (ls_connectstring, "'", "", FALSE)

	// Set User ID
	ls_userid = lnv_string.of_getKeyValue (ls_connectstring, "UID", ";")
	if len (ls_userid) > 0 then
		lnv_string.of_setKeyValue (ls_connectstring, "UID", as_userid, ";")
	else
		ls_connectstring = ls_connectstring + ";UID=" + as_userid
	end if
	
	// Set password
	ls_password = lnv_string.of_getKeyValue (ls_connectstring, "PWD", ";")
	if len (ls_password) > 0 then
		lnv_string.of_setKeyValue (ls_connectstring, "PWD", as_password, ";")
	else
		ls_connectstring = ls_connectstring + ";PWD=" + as_password
	end if
	
	// Restore single quotes
	ls_connectstring = "'" + ls_connectstring + "'"
	lnv_string.of_SetKeyValue (this.dbparm, "ConnectString", ls_connectstring, ",")
end if
end subroutine

public subroutine of_SetLogidAndPassword (string as_loginid, string as_logpassword);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetLogidAndPassword
//	Arguments:		as_LoginId: 		 	User's Login Id

//						as_LogPassWord:  		User's Login password
//	Returns:  		None
//	Description:	Sets the property values of the transaction
//						object for LogID and LogPass
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
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
// Set Login ID
this.LogID = as_LoginId
// Set Log Password
this.LogPass = as_LogPassWord
end subroutine

public subroutine of_SetUseridAndPassword (string as_userid, string as_password);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetUseridAndPassword
//	Arguments:		as_UserId: 		 	User's Login Id
//						as_PassWord:  		User's Login password
//	Returns:  		None
//	Description:	Sets the property values of the transaction
//						object for UserId and DBPass
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						7.0   Initial version
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
// Set Login ID
this.UserID = as_UserId
// Set Log Password
this.DBPass = as_PassWord
end subroutine

public function long of_begin ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Begin
//	Arguments:		None
//	Returns:			long
//	Description:	Begin a transaction
//						Note:  This function should be implemented in descendant DBMS transaction objects
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
end function

public function integer of_copyto (n_tr atr_target);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_CopyTo
//	Arguments:		atr_target  target transaction object passed by reference.
//	Returns:			Integer
//	 					1 = success
//						-1 = error
//	Description:	Copy the contents of this object to the transaction object passed in.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
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
if IsNull(atr_target) Or not IsValid (atr_target) then return -1

// Copy the system transaction values
atr_target.DBMS = this.DBMS
atr_target.Database = this.Database
atr_target.LogID = this.LogID
atr_target.LogPass = this.LogPass
atr_target.ServerName = this.ServerName
atr_target.UserID = this.UserID
atr_target.DBPass = this.DBPass
atr_target.Lock = this.Lock
atr_target.DbParm = this.DbParm
atr_target.Autocommit = this.Autocommit
atr_target.sqlcode = this.sqlcode
atr_target.sqldbcode = this.sqldbcode
atr_target.sqlnrows = this.sqlnrows
atr_target.sqlerrtext = this.sqlerrtext
atr_target.sqlreturndata = this.sqlreturndata

// Copy the pfc transaction properties
atr_target.of_SetAutoRollBack (ib_AutoRollBack)
atr_target.of_SetTrace (ib_Trace)
atr_target.of_SetName (is_Name)

return 1
end function

protected function integer of_restore (integer ai_filetype, string as_keyoriniorxml, string as_inisectionxmlroot, string as_subkeyelement, ref string as_value, string as_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Restore
//
//	Access:  		protected
//
//	Arguments:
//	ai_filetype				Function behavior. - use the registry, an .ini or .xml file.
//	as_keyoriniorxml		The KeyName for use with the Registry , the Ini or XML file name
//								for use with an .Ini or .Xml File
//	as_inisectionxmlroot	The name of the .Ini section. or Xml Root
//	as_subkeyelement		The key/element value to be used on either the Registry , .Ini or .Xml file.
//	as_value					The value to be restored from either the Registry, .Ini or .Xml file
//								Passed by reference.
// as_default				Used also as a default value, if the desired value is not found.
//
//	Returns:  		integer
//						1 if it succeeds.
//						0 if the default value was used.
//					   -1 if an error occurs.
//
//	Description:  	Perform the actual Get from the .Ini or .Xml File
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

constant string DEFAULT='$%^'

integer	li_rc = 1

choose case ai_filetype
	case CST_FILETYPE_INI
		
		as_value = ProfileString (as_keyoriniorxml, as_inisectionxmlroot, as_subkeyelement, DEFAULT)

		If as_value=DEFAULT Then
			as_Value = as_default
			li_rc = 0
		End If
		
	case CST_FILETYPE_XML
		
		PBDOM_BUILDER     	l_pbdom_builder
		PBDOM_DOCUMENT	l_pbdom_doc
		PBDOM_ELEMENT		l_pbdom_ele[]
		PBDOM_ELEMENT		l_pbdom_val

		TRY
		
			l_pbdom_builder = Create PBDOM_Builder
			l_pbdom_doc = l_pbdom_builder.BuildFromFile(as_keyoriniorxml)
			l_pbdom_doc.Getelementsbytagname( as_inisectionxmlroot, l_pbdom_ele )
			l_pbdom_val =  l_pbdom_ele[1].getchildelement( as_subkeyelement )
			as_value = l_pbdom_val.Gettext()

			if isnull( as_value ) then
				as_value = as_default
			end if
			
		CATCH ( PBDOM_Exception pbde )
			MessageBox( "Preference Service - PBDOM Exception", pbde.getMessage() )
			li_rc = -1

		CATCH ( PBXRuntimeError re )   
			MessageBox( "Preference Service - PBNI Exception", re.getMessage() )
			li_rc = -1
		END TRY
	case else
		li_rc = -1
end choose

return li_rc

end function

public function integer of_init (integer ai_filetype, string as_inixmlfile, string as_inisectionxmlroot);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Init
//	Arguments:		
//		as_inixmlfile   			.INI or .XML file to read values from.
//		as_inisectionxmlroot   Section within .INI or .XML file where transaction object values are.
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Initializes transaction object's properties with values from 
//						an .INI or .XML file.  Values that are not found will be defaulted to an empty string.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						12.5   Initial version
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
string		ls_dbms
string		ls_database
string		ls_logid
string		ls_logpass
string		ls_servername
string		ls_userid
string		ls_dbpass
string		ls_lock
string		ls_dbparm
string		ls_autocommit
n_cst_conversion lnv_conversion

choose case ai_filetype
	case cst_filetype_ini
		li_rc = of_init( as_inixmlfile, as_inisectionxmlroot )
	
	case cst_filetype_xml
		if IsNull (as_inixmlfile) or IsNull (as_inisectionxmlroot) or Len (Trim (as_inixmlfile))=0 or Len (Trim (as_inisectionxmlroot))=0 or (not FileExists (as_inixmlfile)) then return -1

		// If available, get each individual value.
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'DBMS', ls_dbms, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'Database', ls_database, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'LogID', ls_logid, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'LogPassword', ls_logpass, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'ServerName', ls_servername, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'UserID', ls_userid, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'DatabasePassword', ls_dbpass, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'Lock', ls_lock, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'DBParm', ls_dbparm, "" )
		li_rc = of_restore( ai_filetype, as_inixmlfile, as_inisectionxmlroot, 'AutoCommit', ls_autocommit, "" )

		// Initialize this object
		this.DBMS = ls_dbms
		this.Database = ls_database
		this.LogID = ls_logid
		this.LogPass = ls_logpass
		this.ServerName = ls_servername
		this.UserID = ls_userid
		this.DBPass = ls_dbpass
		this.Lock 	= ls_lock
		this.DbParm = ls_dbparm
		this.Autocommit = lnv_conversion.of_Boolean (ls_autocommit)
		if IsNull (this.Autocommit) then this.Autocommit = false
		
		li_rc = 1
end choose

return li_rc
end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  destructor
//	Description:
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   	Initial version
//						5.0.02   Removed conditional checking for sqlca before unregistering
//	   							with the transaction registration service.  Check was not needed and 
//	   							caused regeneration problems when other subclassed transaction objects
//	   							(from transaction, not n_tr) were in the library search path.
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
// If still connected, determine whether to commit or rollback.
if of_IsConnected() then
	if ib_AutoRollBack then
		of_RollBack()
	else
		of_Commit()
	end if
	of_DisConnect()
end if

// If transaction object is registered with the Transaction 
// Registration service, then unregister it
if IsValid (gnv_app) then
	if IsValid (gnv_app.inv_trregistration) then
		if gnv_app.inv_trregistration.of_IsRegistered (this) then
			gnv_app.inv_trregistration.of_Unregister (this)
		end if
	end if
end if
end event

on pfc_n_tr.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_tr.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

