HA$PBExportHeader$pfc_n_cst_dssrv_multitable.sru
$PBExportComments$PFC Datastore Multiple Table service
forward
global type pfc_n_cst_dssrv_multitable from n_cst_dssrv
end type
end forward

global type pfc_n_cst_dssrv_multitable from n_cst_dssrv
end type
global pfc_n_cst_dssrv_multitable pfc_n_cst_dssrv_multitable

type variables
//	7.0   Instance variable datatype changed from os_updcharacteristics to n_cst_dssrv_multitableattrib type
//	7.0   Instance variable name changed from istr_newupdate to inv_newupdate
Protected:
n_cst_dssrv_multitableattrib inv_newupdate[]

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_dssrv_multitableattrib istr_newupdate[]
end variables

forward prototypes
public function integer of_update (boolean ab_accepttext, boolean ab_resetflags)
public function integer of_update ()
public function integer of_update (boolean ab_accepttext)
protected function integer of_restoreupdatesettings (n_cst_dssrv_multitableattrib anv_originalupdate)
protected function integer of_storeupdatesettings (ref n_cst_dssrv_multitableattrib anv_originalupdate)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_register (string as_table, string as_keycolumns[])
public function integer of_register (string as_table, string as_keycolumns[], string as_updateable_cols[])
public function integer of_getregisterable (ref string as_tablecolumn[])
public function integer of_GetRegisterableTable (ref string as_table[])
public function boolean of_isregistered (string as_table)
public function integer of_register (string as_table, string as_keycolumns[], string as_updateablecolumns[], boolean ab_keyinplace, integer ai_whereoption)
public function integer of_unregister (string as_table)
public function integer of_UnRegister ()
public function integer of_getregistered (string as_table, ref string as_keycolumns[], ref string as_updateablecolumns[], ref boolean ab_keyinplace, ref integer ai_whereoption)
public function integer of_getregisterablecolumn (string as_table, ref string as_column[])
end prototypes

public function integer of_update (boolean ab_accepttext, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Update (Format 3)
//	Arguments:			ab_accepttext:	A boolean value specifying whether the datastore control
//								should automatically perform an AcceptText prior to 
//								performing the update:
//								TRUE  -- Perform AcceptText
//								FALSE -- Do not perform AcceptText
//  						ab_resetflags:	A boolean value specifying whether datastore should
//								automatically reset the update flags:
//								TRUE  -- Reset the flags
//								FALSE -- Do not reset the flags
//	Returns:  			Integer
//    					 		1 if it succeeds
//								-1 if an update error occurs.
//    							-2 if the Modify for Update Characteristics failed

//	Description:			Update the datastore for all the registered tables.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:		Version
//							5.0   Initial version
//							7.0   Local variable datatype changed from os_updcharacteristics to n_cst_dssrv_multitableattrib type
//							7.0   Local variable name changed from lstr_originalupdate to lnv_originalupdate
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
integer	li_num_tables
integer	li_num_cols
integer	li_tabidx
integer	li_updcolidx
integer	li_keycolidx
integer	li_i
integer	li_rc
integer	li_num_updateable
integer	li_num_keys
boolean	lb_is_updateable
boolean	lb_is_key
string	ls_column
string	ls_mod_string
n_cst_dssrv_multitableattrib	lnv_originalupdate

// Verify passed arguments.
IF IsNull (ab_accepttext) THEN Return -1
IF IsNull (ab_resetflags) THEN Return -1

// Get the number of tables involved.
li_num_tables = UpperBound (inv_newupdate) 
IF li_num_tables = 0 THEN Return -2

// First save the original update characteristics for later restoration.
li_rc = of_StoreUpdateSettings ( lnv_originalupdate )
If li_rc < 0 Then Return li_rc

// Get the number of columns on the datastore.
li_num_cols = Integer (ids_requestor.Describe ( "DataWindow.Column.Count" )) 

// Loop thru each table that is registered, modify the characteristics and update.
FOR li_tabidx = 1 to li_num_tables

	// (start new string) Set the Update Table.
	ls_mod_string = "DataWindow.Table.UpdateTable='" + &
						 inv_newupdate[li_tabidx].s_updatetable +"' "
	
	// Set the Update Where Option.
	ls_mod_string += "DataWindow.Table.UpdateWhere=" + &
						 String(inv_newupdate[li_tabidx].i_whereoption) +" " 
	
	// Set the Update Key in Place flag.
	If inv_newupdate[li_tabidx].b_keyupdateinplace THEN
		ls_mod_string += "DataWindow.Table.UpdateKeyInPlace=yes " 
	Else
		ls_mod_string += "DataWindow.Table.UpdateKeyInPlace=no " 
	End If
	
	// Get the number of UpdateColumns and Keys.
	li_num_updateable = UpperBound ( inv_newupdate[li_tabidx].s_updatecolumns )
	li_num_keys = UpperBound ( inv_newupdate[li_tabidx].s_keycolumns )

	// Loop around all columns.
	FOR li_updcolidx = 1 to li_num_cols
		ls_column = ids_requestor.Describe ( "#" + String(li_updcolidx) + ".Name" )

		//Determine if this column should be Updatable.
		lb_is_updateable = FALSE	
		FOR li_i = 1 to li_num_updateable
			IF Lower(ls_column) = Lower(inv_newupdate[li_tabidx].s_updatecolumns[li_i]) THEN 
				lb_is_updateable = TRUE
				EXIT
			END IF 
		NEXT 
		// Set the Updatable flag as appropriate.
		IF lb_is_updateable THEN 
			ls_mod_string += ls_column + ".Update=Yes " 
		ELSE
			ls_mod_string += ls_column + ".Update=No " 
		END IF 

		// Determine if this column should be a Key.
		lb_is_key = FALSE		
		FOR li_keycolidx = 1 to li_num_keys
			IF Lower(ls_column) = Lower(inv_newupdate[li_tabidx].s_keycolumns[li_keycolidx]) THEN 
				lb_is_key = TRUE
				EXIT
			END IF 
		NEXT 
		// Set the Key flag as appropriate.		
		IF lb_is_key THEN 
			ls_mod_string += ls_column + ".Key=Yes " 
		ELSE
			ls_mod_string += ls_column + ".Key=No " 
		END IF 
	NEXT

	// Modify the datastore object.
	IF ids_requestor.Modify ( ls_mod_string ) <> "" THEN Return -2

	// Update the datastore, Make sure the Flags are Not Reset.
	li_rc = ids_requestor.Update ( ab_accepttext, FALSE ) 
	IF li_rc <> 1 THEN Return li_rc 

NEXT 

// Restore the update characteristics to their original settings.
li_rc = of_RestoreUpdateSettings ( lnv_originalupdate ) 
If li_rc < 0 Then Return li_rc

// All updates have succesfully occurred, Reset the flags if appropriate.
IF ab_resetflags = TRUE THEN ids_requestor.ResetUpdate ( ) 

Return 1
end function

public function integer of_update ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Update (Format 1) 
//	Arguments:			None
//	Returns:				Integer
//					 	 		1 if it succeeds
//								-1 if an update error occurs.
//    							-2 if the Modify for Update Characteristics failed
//	Description:			Update the datastore for all the registered tables.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
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
boolean	lb_accepttext = True
boolean	lb_resetflags = True

Return of_Update(lb_accepttext, lb_resetflags) 
end function

public function integer of_update (boolean ab_accepttext);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Update (Format 2)
//	Arguments:			ab_accepttext:	A boolean value specifying whether the datastore control
//								should automatically perform an AcceptText prior to 
//								performing the update:
//								TRUE  -- Perform AcceptText
//								FALSE -- Do not perform AcceptText
//	Returns: 				Integer
//    				 			1 if it succeeds
//								-1 if an update error occurs.
//    							-2 if the Modify for Update Characteristics failed
//	Description:			Update the datastore for all the registered tables.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
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
boolean	lb_resetflags = True

Return of_Update (ab_accepttext, lb_resetflags) 
end function

protected function integer of_restoreupdatesettings (n_cst_dssrv_multitableattrib anv_originalupdate);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_RestoreUpdateSettings
//	Arguments:				anv_originalupdate 	Original Update information.
//	Returns:   				Integer
// 				  	 				1 = The Update Characteristics were successfully reset.
//									-1 = The Modify for Update Characteristics failed.
//	Description:				To reset the datastore's Update Characteristics to their
//					  			original values.   Called by of_update().
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								5.0		Initial version
//								7.0   Argument datatype changed from os_updcharacteristics to n_cst_dssrv_multitableattrib type
//								7.0   Argument name changed from astr_originalupdate to anv_originalupdate
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
integer	li_num_cols
integer	li_num_updateable
integer	li_num_keys
integer	li_colidx
integer	li_keycolidx
integer	li_updcolidx
string	ls_mod_string=''
string	ls_column
boolean	lb_found

// Check the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return -1

// Restore the Update Table.
ls_mod_string = "DataWindow.Table.UpdateTable='" + anv_originalupdate.s_updatetable + "' "

// Restore the Update Where statement.
ls_mod_string = ls_mod_string + &
					 "DataWindow.Table.UpdateWhere=" + String(anv_originalupdate.i_whereoption) + " "

// Restore the Update Key In Place flag.
If anv_originalupdate.b_keyupdateinplace Then
	ls_mod_string = ls_mod_string + "DataWindow.Table.UpdateKeyInPlace=yes "  
Else
	ls_mod_string = ls_mod_string + "DataWindow.Table.UpdateKeyInPlace=no "
End If

//Set the original updateable columns and key columns
li_num_updateable = UpperBound (anv_originalupdate.s_updatecolumns) 
li_num_keys = UpperBound (anv_originalupdate.s_keycolumns) 

// Loop thru all the datastore columns to Restore the Updateable and Key flags.
li_num_cols = Integer(ids_requestor.Describe ( "DataWindow.Column.Count" ) )
FOR li_colidx = 1 to li_num_cols
	//Get the column name.
	ls_column = ids_requestor.Describe ( "#" + String(li_colidx) + ".Name" )
	
	// See if the column was marked as an updateable column.
	lb_found = FALSE	
	FOR li_updcolidx = 1 to li_num_updateable 
		IF anv_originalupdate.s_updatecolumns [li_updcolidx] = ls_column THEN 
			lb_found = TRUE
			Exit
		END IF 
	NEXT
	// Restore the Updateable Flag
	IF lb_found THEN 
		ls_mod_string = ls_mod_string + ls_column + ".Update=Yes "
	Else
		ls_mod_string = ls_mod_string + ls_column + ".Update=No "
	END IF
	
	// See if the column was marked as a key column
	lb_found = FALSE	
	FOR li_keycolidx = 1 to li_num_keys
		IF anv_originalupdate.s_keycolumns [li_keycolidx] = ls_column THEN 
			lb_found = TRUE
			Exit
		END IF 
	NEXT
	// Restore the Key column flag
	IF lb_found THEN 
		ls_mod_string = ls_mod_string + ls_column + ".Key=Yes "
	ELSE 		
		ls_mod_string = ls_mod_string + ls_column + ".Key=No "
	END IF 
NEXT  

// Modify the requesting datastore with the original
// update characteristics
IF ids_requestor.Modify ( ls_mod_string ) <> "" THEN Return -1

Return 1
end function

protected function integer of_storeupdatesettings (ref n_cst_dssrv_multitableattrib anv_originalupdate);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_StoreUpdateSettings
//	Arguments:				anv_originalupdate 	Original Update information (passed by reference).
//	Returns:   				Integer
// 				  	 				1 = The Update Characteristics were successfully stored.
//									-1 = An error was encountered.
//	Description:				To store the datastore's Update Characteristics for
//								later restoration.	Called by of_update().
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								5.0   Initial version
//								7.0   Argument datatype changed from os_updcharacteristics to n_cst_dssrv_multitableattrib type
//								7.0   Argument name changed from astr_originalupdate to anv_originalupdate
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
integer	li_numcols
integer	li_colidx
string	ls_column

// Check the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return -1

// Store all Update Table.
anv_originalupdate.s_updatetable = &
	ids_requestor.Describe ( "DataWindow.Table.UpdateTable" )
	
// Store the Update Where statement.	
anv_originalupdate.i_whereoption = &
	Integer ( ids_requestor.Describe ( "DataWindow.Table.UpdateWhere" ) )
	
// Store the Update Key In Place flag.	
IF Lower(ids_requestor.Describe("DataWindow.Table.UpdateKeyInPlace")) = "yes" THEN 
   anv_originalupdate.b_keyupdateinplace = TRUE
ELSE
   anv_originalupdate.b_keyupdateinplace = FALSE
END IF 

// Loop around all columns of the datastore.
// Store all Updateable and Key columns.
li_numcols = Integer (ids_requestor.Describe ( "DataWindow.Column.Count" )) 
FOR li_colidx = 1 to li_numcols
	
	// Get the column name.
	ls_column = ids_requestor.Describe ( "#" + String(li_colidx) + ".Name" )
	
	//If a column was set as updateable, then store it in the attribute class.
	IF Lower(ids_requestor.Describe (ls_column + ".Update" )) = "yes" THEN
		anv_originalupdate.s_updatecolumns[UpperBound(anv_originalupdate.s_updatecolumns)+1] = ls_column
	END IF 
	
	//If a column was set as a key column, then store it in the attribute class.
	IF Lower(ids_requestor.Describe (ls_column + ".Key" )) = "yes" THEN
		anv_originalupdate.s_keycolumns[UpperBound(anv_originalupdate.s_keycolumns)+1] = ls_column
	END IF 
	
NEXT

Return 1
end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetInfo
//	Arguments:			anv_infoattrib	(By reference) The Information attributes.
//	Returns:  			Integer
//	 							1 for success.
//								-1 for error.
//	Description:			Gets the Service Information.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
anv_infoattrib.is_name = 'Multitable'
anv_infoattrib.is_description = &
	'Facilitate the updating of DataStores that contain rows from more '+&
	'than one table.'

Return 1
end function

public function integer of_register (string as_table, string as_keycolumns[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Register
//	Arguments:			as_table:					A string containing the table to update
// 							as_keycolumns[]:		A string array containing the key columns to be used for update
//	Returns:				Integer					1 if it succeeds, -1 if an error occurs. 
//	Description:			Registers a table and its corresponding update characteristics with the service.
//							Note:	Uses dw default options for -
//							Updateable columns are all columns belong to the passed table
//							Where Option: Key and Updateable Columns
//							Key,Update In Place = FALSE, use Delete / then Insert
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0		Initial version - Replaces obsoleted function of_AddToUpdate(...)
//							8.0		Fix up table name so that comparison includes owner name where necessary
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
string	ls_updateablecolumns []
string	ls_table
string	ls_column
integer	li_numcols
integer	li_i
integer	li_j
boolean	lb_keyinplace=False 	//Default value
integer	li_whereoption=1 		//Default value
long		ll_pos

// Validate the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return -1

// Loop around all the columns on the datastore searching for Update columns.
li_numcols = Integer ( ids_requestor.Describe ( "DataWindow.Column.Count" ) ) 
FOR li_i = 1 to li_numcols
	ls_column = ids_requestor.Describe ( "#" + String(li_i) + ".Name" )
	IF ls_column = '!' Then Return -1

	// Get the table name for this column
	ls_table  = ids_requestor.Describe (ls_column + ".dbName" ) 
	// Extract just the table portion of the column's database name
	ls_table  = Left ( ls_table, Pos ( ls_table, ".", 1) - 1 )

	//  Trim Owner name off passed table name and append to tablename
	ll_pos = Pos ( as_table, "." ) 
	If ll_pos > 0 Then ls_table = Left ( as_table, ll_pos ) + ls_table 

	// If a column belongs to the passed table, then set it as
 	//	an updateable column 
	IF Lower(as_table) = Lower(ls_table) THEN 
		li_j++
		ls_updateablecolumns[li_j] = ls_column
	END IF
NEXT

Return of_Register(as_table, as_keycolumns, ls_updateablecolumns, &
				lb_keyinplace, li_whereoption) 
end function

public function integer of_register (string as_table, string as_keycolumns[], string as_updateable_cols[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Register
//	Arguments:			as_table: A string containing the table to update
//   						as_keycolumns[]: A string array containing the key columns to be used for update
//	  						as_updateable_cols[]: A string array containing a list of updateable columns
//	Returns:  			Integer
// 								1 if it succeeds
//								-1 if an error occurs. 
//	Description:			Registers a table and its corresponding update characteristics with the service.
//							Note: Uses dw default options for -
//										Where Option: Key and Updateable Columns
//										Key,Update In Place = FALSE, use Delete / then Insert
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version - Replaces obsoleted function of_AddToUpdate(...)
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
boolean	lb_keyinplace=False 	//Default value
integer	li_whereoption=1 		//Default value

Return of_Register(as_table, as_keycolumns, as_updateable_cols, &
				lb_keyinplace, li_whereoption) 
end function

public function integer of_getregisterable (ref string as_tablecolumn[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetRegisterable
//	Arguments:			as_tablecolumn[] (By Ref.)  All table/columns belonging to the requestor 
//							which	could be registered.
//	Returns:  			Integer - The table/column count.
//							-1 if an error is encountered.
//	Description:			Determines all table/columns belonging to the requestor which could be registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_colcount
integer	li_cnt
integer  li_upper
string	ls_colname
string	ls_colattributes
string	ls_dbname
string	ls_table
string 	ls_empty[]
n_cst_string lnv_string

// Clear the reference variable.
as_tablecolumn = ls_empty

// Validate required references.
If IsNull(ids_requestor) or Not IsValid(ids_requestor) Then Return -1

// Get the number of columns in the datastore object
li_colcount = integer(ids_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for dddw or ddlb columns.
For li_cnt=1 to li_colcount
	// Get the column name.
	ls_colname = ids_requestor.Describe("#"+string(li_cnt)+".Name")
	
	// Get the Table name.
	ls_dbname = ids_requestor.Describe(ls_colname+".dbName")
	ls_table = lnv_string.of_GetToken(ls_dbname, '.')
	
	// Create the TableColumn value.
	li_upper = UpperBound(as_tablecolumn) + 1
	as_tablecolumn[li_upper] = ls_table+'.'+ls_colname
Next

Return UpperBound(as_tablecolumn)
end function

public function integer of_GetRegisterableTable (ref string as_table[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetRegisterableTable
//	Arguments:			as_table[] (By Ref.)  All table belonging to the requestor which could be registered.
//	Returns:  			Integer -  The table count.
//							-1 if an error is encountered.
//	Description:			Determines all table belonging to the requestor which could be registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_tablecount
integer	li_tablecnt
integer	li_colcount
integer	li_cnt
integer  li_upper
string	ls_colname
string	ls_colattributes
string	ls_dbname
string	ls_table
string 	ls_empty[]
boolean 	lb_found
n_cst_string lnv_string

// Clear the reference variable.
as_table = ls_empty

// Validate required references.
If IsNull(ids_requestor) or Not IsValid(ids_requestor) Then Return -1

// Get the number of columns in the datastore object
li_colcount = integer(ids_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for dddw or ddlb columns.
For li_cnt=1 to li_colcount
	// Get the column name.
	ls_colname = ids_requestor.Describe("#"+string(li_cnt)+".Name")
	
	// Get the Table name.
	ls_dbname = ids_requestor.Describe(ls_colname+".dbName")
	ls_table = lnv_string.of_GetToken(ls_dbname, '.')
	
	// Determine if this is an new table.
	li_tablecount = UpperBound(as_table)
	lb_found = False
	For li_tablecnt = 1 to li_tablecount
		If as_table[li_tablecnt] = ls_table Then
			lb_found = True
			Exit
		End If
	Next
	If Not lb_found Then
		// Found a new table entry.
		as_table[li_tablecount +1] = ls_table
	End If
Next

Return UpperBound(as_table)
end function

public function boolean of_isregistered (string as_table);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_IsRegistered
//	Arguments:			as_table: A string containing the table to check for
//	Returns:				Boolean - True if the table is registered
//	Description:			Determines if the table is registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_registeredcount
integer	li_cnt

// Validate the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return False

// Get the upper value for registered objects.
li_registeredcount = UpperBound ( inv_newupdate ) 
For li_cnt = 1 to li_registeredcount
	If inv_newupdate[li_cnt].s_updatetable = Trim(as_table) Then
		// The table is already registered.
		Return True
	End If
Next

// Not registered.
Return False
end function

public function integer of_register (string as_table, string as_keycolumns[], string as_updateablecolumns[], boolean ab_keyinplace, integer ai_whereoption);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_Register
//	Arguments:			as_table: A string containing the table to update
//   						as_keycolumns[]: A string array containing the key columns to be used for update
//	  						as_updateablecolumns[]: A string array containing a list of updateable columns
//	  						ab_keyinplace: A boolean when TRUE specifies use Update Key in Place, otherwise
//						  		use delete, then insert on key changes
//   						ai_whereoption:	An integer that corresponds to the datastore Update Where option
//	Returns:				Integer - 1 if it succeeds
//							-1 if an error occurs. 
//	Description:			Registers a table and its corresponding update characteristics with the service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0		Initial version - Replaces obsoleted function of_AddToUpdate(...)
//							6.0		Enhanced to perform more validation.
// 							6.0		Enhanced to find openslot.
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
constant	string SEPARATOR = '@#$'
integer	li_tablecount
integer	li_cnt
integer	li_openslot
integer	li_columncnt
integer	li_keycolumncnt
integer	li_updatecolumncnt
string	ls_column
string	ls_allcolumns
string	ls_findexp

//  Validate the passed arguments
IF IsNull (as_table) OR Len(Trim(as_table)) = 0 THEN Return -1
IF UpperBound(as_keycolumns)=0 Then Return -1
IF IsNull (ab_keyinplace) THEN Return -1 
IF IsNull (ai_whereoption) OR (ai_whereoption < 0) OR (ai_whereoption > 2) THEN Return -1

// Create string containing every column in the datastore.
li_columncnt = Integer ( ids_requestor.Describe ( "DataWindow.Column.Count" ) ) 
For li_cnt = 1 to li_columncnt
	ls_column = ids_requestor.Describe ( "#" + String(li_cnt) + ".Name" )
	IF ls_column = '!' Then Return -1

	ls_allcolumns += ' ' + SEPARATOR + Lower(Trim(ls_column)) + SEPARATOR + ' '
Next

// Make sure every passed in key column is found.
li_keycolumncnt = UpperBound(as_keycolumns)
For li_cnt = 1 To li_keycolumncnt
	as_keycolumns[li_cnt] = Lower(Trim(as_keycolumns[li_cnt]))
	ls_findexp = SEPARATOR+as_keycolumns[li_cnt]+SEPARATOR
	If Pos(ls_allcolumns, ls_findexp) = 0 Then
		// Column was not found.
		Return -1
	End If
Next

// Make sure every passed in update column is found.
li_updatecolumncnt = UpperBound(as_updateablecolumns[])
For li_cnt = 1 To li_updatecolumncnt
	as_updateablecolumns[li_cnt] = Lower(Trim(as_updateablecolumns[li_cnt]))
	ls_findexp = SEPARATOR+as_updateablecolumns[li_cnt]+SEPARATOR
	If Pos(ls_allcolumns, ls_findexp) = 0 Then
		// Column was not found.
		Return -1
	End If
Next

// Get the Index for the new entry (openslot)
li_tablecount = UpperBound ( inv_newupdate ) 
For li_cnt = 1 to li_tablecount
	If Trim(inv_newupdate[li_cnt].s_updatetable) = '' Then
		li_openslot = li_cnt
		Exit
	End If
Next
If li_openslot = 0 Then
	li_openslot = li_tablecount + 1
End If

// Add this table to the attribute class of update tables 
inv_newupdate[li_openslot].s_updatetable = Trim(as_table)
inv_newupdate[li_openslot].i_whereoption = ai_whereoption
inv_newupdate[li_openslot].b_keyupdateinplace = ab_keyinplace
inv_newupdate[li_openslot].s_updatecolumns = as_updateablecolumns
inv_newupdate[li_openslot].s_keycolumns = as_keycolumns

Return 1
end function

public function integer of_unregister (string as_table);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_UnRegister
//	Arguments:			as_table: A string containing the table to unregister.
//	Returns:				Integer - 1 - success
// 							-1 - error
//	Description:			Unregister the passed in table.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_registeredcount
integer	li_cnt
string	ls_empty[]

// Validate the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return -1

// Get the upper value for registered objects.
li_registeredcount = UpperBound ( inv_newupdate ) 
For li_cnt = 1 to li_registeredcount
	If Trim(inv_newupdate[li_cnt].s_updatetable) = Trim(as_table) Then
		// The table to be unregisterd has been found. 
		inv_newupdate[li_cnt].s_updatetable = ''
		inv_newupdate[li_cnt].i_whereoption = 0
		inv_newupdate[li_cnt].b_keyupdateinplace = False
		inv_newupdate[li_cnt].s_updatecolumns = ls_empty
		inv_newupdate[li_cnt].s_keycolumns = ls_empty
		Return 1
	End If
Next

// Not registered.
Return -1
end function

public function integer of_UnRegister ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_UnRegister
//	Arguments:			None
//	Returns:				Integer - # the number of tables that were unregistered.
// 							-1 - error
//	Description:			Unregister all.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_registeredcount
integer	li_cnt
integer	li_unregistercount
string	ls_empty[]

// Validate the datastore reference.
If IsNull(ids_requestor) Or Not IsValid(ids_requestor) Then Return -1

// Get the upper value for registered objects.
li_registeredcount = UpperBound ( inv_newupdate ) 
For li_cnt = 1 to li_registeredcount
	If Len(Trim(inv_newupdate[li_cnt].s_updatetable)) > 0 Then
		// A table to be unregistered has been found. 
		li_unregistercount ++
		inv_newupdate[li_cnt].s_updatetable = ''
		inv_newupdate[li_cnt].i_whereoption = 0
		inv_newupdate[li_cnt].b_keyupdateinplace = False
		inv_newupdate[li_cnt].s_updatecolumns = ls_empty
		inv_newupdate[li_cnt].s_keycolumns = ls_empty
	End If
Next

Return li_unregistercount
end function

public function integer of_getregistered (string as_table, ref string as_keycolumns[], ref string as_updateablecolumns[], ref boolean ab_keyinplace, ref integer ai_whereoption);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetRegistered
//	Arguments:			as_table: A string containing the table to get the registered info for.
//   						as_keycolumns[] (by ref.): An array containing the registered key columns
//	  						as_updateablecolumns[] (by ref.): An array containing the registered updateable columns
//	  						ab_keyinplace (by ref.): The registed Update Key in Place setting
//   						ai_whereoption (by ref.): The registed WhereOption setting.
//	Returns:				Integer - 1 if it succeeds
//							-1 if an error occurs. 
//	Description:			Gets the registered information/settings for the passed in table.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0		Initial version
// 							6.0		Enhanced to find openslot.
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
integer	li_tablecount
integer	li_cnt
string	ls_empty[]

//  Clear the reference variables.
as_keycolumns = ls_empty
as_updateablecolumns = ls_empty
ab_keyinplace = False
ai_whereoption = 0

// Validate the arguments.
IF IsNull (as_table) OR Len(Trim(as_table)) = 0 THEN Return -1

// Find the supposedly registered table.
li_tablecount = UpperBound ( inv_newupdate ) 
For li_cnt = 1 to li_tablecount
	If Trim(inv_newupdate[li_cnt].s_updatetable) = Trim(as_table) Then
		// Found the registered information.
		as_keycolumns = inv_newupdate[li_cnt].s_keycolumns
		as_updateablecolumns = inv_newupdate[li_cnt].s_updatecolumns
		ab_keyinplace = inv_newupdate[li_cnt].b_keyupdateinplace
		ai_whereoption = inv_newupdate[li_cnt].i_whereoption
		Return 1
	End If
Next

// The table is not registered.
Return -1
end function

public function integer of_getregisterablecolumn (string as_table, ref string as_column[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetRegisterableColumn
//	Arguments:			as_table: The table for which the columns are wanted.
//							as_column[] (By Ref.):  All columns belonging to the table passed in which could be registered.
//	Returns:				Integer - The column count.
//							-1 if an error is encountered.
//	Description:			Determines all columns belonging to the passed in table which could be registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0   Initial version
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
integer	li_colcount
integer	li_cnt
integer  li_upper
string	ls_colname
string	ls_dbname
string	ls_table
string 	ls_empty[]
n_cst_string lnv_string

// Clear the reference variable.
as_column = ls_empty

// Validate required references.
If IsNull(ids_requestor) or Not IsValid(ids_requestor) Then Return -1

// Get the number of columns in the datastore object
li_colcount = integer(ids_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for dddw or ddlb columns.
For li_cnt=1 to li_colcount
	// Get the column name.
	ls_colname = ids_requestor.Describe("#"+string(li_cnt)+".Name")
	
	// Get the Table name.
	ls_dbname = ids_requestor.Describe(ls_colname+".dbName")
	ls_table = lnv_string.of_GetToken(ls_dbname, '.')

	// Determine if this table matches the desired table.
	If ls_table = as_table Then
		li_upper = UpperBound(as_column) + 1
		as_column[li_upper] = ls_colname
	End If
Next

Return UpperBound(as_column)
end function

on pfc_n_cst_dssrv_multitable.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dssrv_multitable.destroy
TriggerEvent( this, "destructor" )
end on

