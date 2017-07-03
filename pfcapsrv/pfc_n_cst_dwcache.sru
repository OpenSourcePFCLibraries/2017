HA$PBExportHeader$pfc_n_cst_dwcache.sru
$PBExportComments$PFC Caching service
forward
global type pfc_n_cst_dwcache from n_base
end type
end forward

global type pfc_n_cst_dwcache from n_base
end type
global pfc_n_cst_dwcache pfc_n_cst_dwcache

type variables
Public:
// for reference outside the cache.
// -- Style Constants.
Constant String RETRIEVE = 'retrieve'
Constant String DATAOBJECTDATA = 'dataobjectdata'
Constant String POWEROBJECT = 'powerobject'
Constant String DATAWINDOWCONTROL = 'datawindowcontrol'
Constant String DATASTORECONTROL = 'datastorecontrol'
Constant String IMPORTFILE = 'importfile'
Constant String SQL = 'sql'

Protected:

// -- Other Internal Constants.
Constant String EMPTY = ''

// Obsoleted Constants.
Constant String ics_retrieve = 'retrieve'  // Obsoleted in 6.0
Constant String ics_dataobjectdata = 'dataobjectdata' // Obsoleted in 6.0
Constant String ics_powerobject = 'powerobject' // Obsoleted in 6.0

//	7.0   Instance variable datatype changed from os_cachelist to n_cst_dwcacheattrib type
//	7.0   Instance variable name changed from istr_cachelist to inv_cachelist
n_cst_dwcacheattrib	inv_cachelist[]

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_dwcacheattrib	istr_cachelist[]

end variables

forward prototypes
public function integer of_getcount ()
public function integer of_getregistered (ref string as_idlist[])
public function integer of_getregistered (string as_id, ref n_ds ads_cache)
public function integer of_isregistered (string as_id)
public function integer of_getregistered (ref n_ds ads_list[])
public function integer of_unregister ()
protected function integer of_register (string as_method, string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], powerobject apo_data[])
public function integer of_register (string as_id, string as_dwobjectname, powerobject apo_data[])
public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj)
public function long of_refresh ()
public function integer of_register (string as_id, string as_dwobjectname)
public function integer of_register (string as_id, n_tr atr_obj, string as_sql)
public function integer of_register (string as_id, n_tr atr_obj, string as_sql, boolean ab_initialload)
public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, boolean ab_initialload)
public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20])
public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], boolean ab_initialload)
public function integer of_registerargs (string as_id, any aa_args[20])
public function integer of_register (string as_id, string as_dwobjectname, string as_importfile)
public function integer of_register (string as_id, string as_dwobjectname, string as_importfile, boolean ab_initialload)
public function integer of_register (string as_id, datastore ads_control)
public function integer of_register (string as_id, datawindow adw_control, boolean ab_initialload)
public function integer of_register (string as_id, datawindow adw_control)
public function integer of_register (string as_id, datastore ads_control, boolean ab_initialload)
public function integer of_unregister (string as_id)
public function long of_refresh (string as_id)
protected function integer of_register (string as_method, boolean ab_initialload, string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile, string as_sql)
end prototypes

public function integer of_getcount ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetCount
//	Arguments:		as_id
//	Returns:			Integer - The number of objects that are currently registered.
//	Description:		Determines the Number of objects that are currently registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer	li_upper
Integer	li_cnt
Integer 	li_registeredcnt=0

// Find the ID.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If Len(inv_cachelist[li_cnt].s_id) > 0 Then 
		// A registered object has been found.   
		// Increment the count.
		li_registeredcnt ++
	End If
Next

// The number of registered objects.
Return li_registeredcnt
end function

public function integer of_getregistered (ref string as_idlist[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetRegistered
//	Arguments:		ads_list - An array of ID strings being cached by the service 	(by reference).
//	Returns:			Integer -	number of IDs returned, -1 error.
//	Description:		Returns an array holding all the IDs that are in the service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer 	li_upper=0
Integer	li_cnt=0
Integer	li_registeredcnt=0

// Loop around all objects and build array of valid entries.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If Len(inv_cachelist[li_cnt].s_id) > 0 Then
		If IsNull(inv_cachelist[li_cnt].ds_obj) Or &
			Not IsValid(inv_cachelist[li_cnt].ds_obj) Then
			Return -1
		End If
		// A Registered Datastore has been found.
		li_registeredcnt ++
		as_idlist[li_registeredcnt] = inv_cachelist[li_cnt].s_id
	End If
Next

Return li_registeredcnt
end function

public function integer of_getregistered (string as_id, ref n_ds ads_cache);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetRegistered
//	Arguments:		as_id			The ID of the registered datastore for which a reference is wanted.
//						ads_cache	A reference to the Datastore matching the passed ID (by reference).
//	Returns:  		Integer 		1 success the ads_cache holds the desired reference, -1 error.
//	Description:		Returns a reference to the Datastore matching the passed ID.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer 	li_upper=0
Integer	li_cnt=0

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Loop around all objects to find the matching ID.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If as_id = inv_cachelist[li_cnt].s_id Then
		If IsNull(inv_cachelist[li_cnt].ds_obj) Or &
			Not IsValid(inv_cachelist[li_cnt].ds_obj) Then
			Return -1
		End If
		

		// A Registered Datastore has been found.
		ads_cache = inv_cachelist[li_cnt].ds_obj
		Return 1
	End If
Next

// A matching ID was not found.
Return -1
end function

public function integer of_isregistered (string as_id);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_IsRegistered
//	Arguments:		as_id		The ID for the object to test on.
//	Returns:  		Integer 	1 - Yes it has been registered.
// 									0 - No it has not been registered.
//								-1 - An error was encountered.
//	Description:		Determines if the object has been registered on the service by the ID.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer	li_upper
Integer	li_cnt

// Check arguments.
If IsNull(as_id) or Len(Trim(as_id))=0 Then
	Return -1
End If

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Find the ID.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If as_id = inv_cachelist[li_cnt].s_id Then
		If IsNull(inv_cachelist[li_cnt].ds_obj) Or &
			Not IsValid(inv_cachelist[li_cnt].ds_obj) Then
			// At this point the ds_obj should be valid.
			Return -1
		End If		
		// The entry has been found.   
		Return 1
	End If
Next

// The ID was not found.
Return 0
end function

public function integer of_getregistered (ref n_ds ads_list[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetRegistered
//	Arguments:		ads_list		An array of datastores being cached by the service	(by reference).
//	Returns:  		Integer		number of IDs returned, -1 error.
//	Description:		Returns an array holding all the datastores that are in the service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer 	li_upper=0
Integer	li_cnt=0
Integer	li_registeredcnt=0

// Loop around all objects and build array of valid entries.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If Len(inv_cachelist[li_cnt].s_id) > 0 Then
		If IsNull(inv_cachelist[li_cnt].ds_obj) Or &
			Not IsValid(inv_cachelist[li_cnt].ds_obj) Then
			Return -1
		End If
		// A Registered Datastore has been found.
		li_registeredcnt ++
		ads_list[li_registeredcnt] = inv_cachelist[li_cnt].ds_obj
	End If
Next

Return li_registeredcnt
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UnRegister
//	Arguments: 		None
//	Returns:  		Integer	the number of Objects that were unregistered, -1 error.
//	Description:		UnRegisters all the objects that have been registered.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer	li_rc=0
Integer	li_upper=0
Integer	li_cnt=0
Integer	li_unregistercnt=0

// Loop and Unregister all objects.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If Len(inv_cachelist[li_cnt].s_id) > 0 Then 
		// A registered entry has been found.  
		li_rc = of_Unregister (inv_cachelist[li_cnt].s_id)
		If li_rc > 0 Then
			li_unregistercnt ++
		Else
			Return -1
		End If
	End If
Next

// Return the number of Objects that were unregistered.
Return li_unregistercnt
end function

protected function integer of_register (string as_method, string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], powerobject apo_data[]);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_Register
//	Arguments:				as_method			The method being used, depending on the method some of the arguments are not used.
//								as_id					The ID to be given to this Cache Object.
//								as_dwobjectname	The DataWindow Object to be used on the Cache Object (if required).
//								atr_obj				The Transaction to use (if required).
//								aa_args[20]			The arguments to use (if required). 
//								apo_data[]			The data to load (if required).
//	Returns:  				Integer				1 successful.
//														0 already registered.
//														-1 error.
//														-2 error on the transaction object.
// 														-3 error on the retrieve process.
//	Description:			Registers the object into the service.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						6.0		Added support for new register methods.
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
string		ls_importfile
string		ls_sql
boolean		lb_initialload=True
datawindow 	ldw_control
datastore	lds_control

Return of_Register ( as_method, lb_initialload, as_id, &
							as_dwobjectname, atr_obj, aa_args, &
							apo_data, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, powerobject apo_data[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						apo_data[]			The data to load into the Cache Object.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on the PowerObject array.  There will be an initial
//						load of this data.   The of_Refresh() functions will have no effect on this Cache object.
//						Note: This structure used to populate the load the data must match the DataWindow
//						Object structure.  If not, the result will be an 	application error message.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_importfile
boolean		lb_initialload=True
datawindow	ldw_control
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (POWEROBJECT, lb_initialload, as_id, &
							as_dwobjectname, ltr_obj, la_args, &
							apo_data, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						atr_obj				The Transaction to be used to load the data from a DB.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//												-2 error on the transaction object.
// 												-3 error on the retrieve process.
//	Description:		Registers the object into the service.
// 						The data to be cached is found on a DataBase.  A retrive will be performed to load the data.
// 						Notice that DataWindow object should have no arguments.
// 						The of_Refresh() functions can be used to refresh the data on demand. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						6.0 	Added support for new register methods.
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
any			la_args[20]
string		ls_sql
string		ls_importfile
boolean		lb_initialload=True
datawindow	ldw_control
powerobject lpo_obj[]
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (RETRIEVE, lb_initialload, as_id, &
							as_dwobjectname, atr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function long of_refresh ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Refresh
//	Arguments:		None
//	Returns:			Long	The number of DataStores refreshed, -1 error.
//	Description:		Refresh all objects that can be refreshed.
//						*Note: All registered methods have the capabilitty of being refreshed.
//						On certain circustances registered objects cannot be refreshed.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						8.0		Changed return of of_Refresh to Long datatype
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
Integer 	li_upper=0, li_cnt=0, li_rc
Long		ll_refreshcnt=0, ll_refresh

// Loop around all objects and retrieve on those that have the capabilities.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If Len(inv_cachelist[li_cnt].s_id) > 0  Then 
		
		ll_refresh = of_Refresh(inv_cachelist[li_cnt].s_id)
		If ll_refresh > 0 Then
			// Count the number of objects that have been refreshed.
			ll_refreshcnt ++
		End If
		
	End If
Next

Return ll_refreshcnt
end function

public function integer of_register (string as_id, string as_dwobjectname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on the DataWindow Object.  No load will be perfomed.
// 						The of_Refresh() functions will have no effect on this Cache object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						6.0 	Added support for new register methods.
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
any			la_args[20]
string		ls_sql
string		ls_importfile
boolean		lb_initialload=True
datawindow	ldw_control
powerobject lpo_obj[]
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (DATAOBJECTDATA, lb_initialload, as_id, &
							as_dwobjectname, ltr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, ls_sql, ls_importfile)
end function

public function integer of_register (string as_id, n_tr atr_obj, string as_sql);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id			The ID to be given to this Cache Object.
//						atr_obj		The transaction object.
//						as_sql		The SQL to use to create the object.
//	Returns:  		Integer		1 successful.
//										0 already registered.
//										-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on a DataBase.  When requested, a retrieve will be performed
//						to load the data.  The of_Refresh() functions can be used to refresh the data on demand.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_dwobjectname
string		ls_importfile
boolean		lb_initialload=True
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control

Return  of_Register (SQL, lb_initialload, as_id, &
							ls_dwobjectname, atr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, as_sql)
end function

public function integer of_register (string as_id, n_tr atr_obj, string as_sql, boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id				The ID to be given to this Cache Object.
//						atr_obj			The transaction object.
//						as_sql			The SQL to use to create the object.
//						ab_initialload	Perform an initial load of the data.
//	Returns:  		Integer			1 successful.
//											0 already registered.
//											-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on a DataBase.  When requested, a retrieve will be performed
//						to load the data.  The of_Refresh() functions can be used to refresh the data on demand.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_dwobjectname
string		ls_importfile
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control

Return  of_Register (SQL, ab_initialload, as_id, &
							ls_dwobjectname, atr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, as_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						atr_obj				The Transaction to be used to load the data from a DB.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//												-2 error on the transaction object.
// 												-3 error on the retrieve process.
//	Description:		Registers the object into the service. 
// 						The data to be cached is found on a DataBase.  A retrieve will be performed
// 						to load the data.   Notice that DataWindow object should have no arguments.
// 						The of_Refresh() functions can be used to refresh the data on demand. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_importfile
boolean		lb_initialload=False
datawindow	ldw_control
powerobject lpo_obj[]
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (RETRIEVE, ab_initialload, as_id, &
							as_dwobjectname, atr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						atr_obj				The Transaction to be used to load the data from a DB.
//						aa_args[20]			The arguments to be used while retrieving from the DB.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//												-2 error on the transaction object.
// 												-3 error on the retrieve process.
//	Description:		Registers the object into the service.
// 						The data to be cached is found on a DataBase.  A retrieve will be performed
// 						to load the data.   Notice that DataWindow can have arguments.
// 						The of_Refresh() functions can be used to refresh the data on demand. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						6.0 	Added support for new register methods.
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
string 		ls_importfile
string		ls_sql
boolean		lb_initialload=True
datawindow	ldw_control
powerobject lpo_obj[]
datastore	lds_control

Return  of_Register (RETRIEVE, lb_initialload, as_id, &
							as_dwobjectname, atr_obj, aa_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						atr_obj				The Transaction to be used to load the data from a DB.
//						aa_args[20]			The arguments to be used while retrieving from the DB.
//						ab_initialload		Perform an initial load of the data.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//												-2 error on the transaction object.
// 												-3 error on the retrieve process.
//	Description:		Registers the object into the service.
// 						The data to be cached is found on a DataBase.  A retrieve will be performed
// 						to load the data.   Notice that DataWindow can have arguments.
// 						The of_Refresh() functions can be used to refresh the data on demand. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
string 		ls_importfile
string		ls_sql
boolean		lb_initialload=True
datawindow	ldw_control
powerobject lpo_obj[]
datastore	lds_control

Return  of_Register (RETRIEVE, ab_initialload, as_id, &
							as_dwobjectname, atr_obj, aa_args, &
							lpo_obj, ldw_control, lds_control, ls_importfile, ls_sql)
end function

public function integer of_registerargs (string as_id, any aa_args[20]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterArgs
//	Arguments:		as_id					The registered ID.
//						aa_args				The actual arguments.
//	Returns:  		Integer				1 successful, -1 error.
//	Description:		Change the Arguement value(s) of an already registered object.
//						*Note: If no load is performed, the 'loading' checks will be skipped.
//						Among other tests, it means that the new retrieval arguments may not be valid.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer	li_rc, li_upper=0, li_cnt=0, li_index=0

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Check for a valid ID
If IsNull(as_id) or Len(Trim(as_id))= 0 Then
	Return -1
End If

// Confirm that the ID is registered.
li_upper = UpperBound (inv_cachelist)
For li_cnt = 1 to li_upper
	If inv_cachelist[li_cnt].s_id = as_id Then 
		// The ID index has been found.
		li_index = li_cnt
		Exit
	End If
Next
If li_index = 0 Then
	// The ID is not registered.
	Return -1
End If

// Confirm that the method is 'Retrieve'.
If inv_cachelist[li_index].s_method <> RETRIEVE Then
	Return -1
End IF

// Confirm that the number of arguments match the previous number of arguments.
li_upper = UpperBound(inv_cachelist[li_index].a_args)
If li_upper <> UpperBound(aa_args) Then
	Return -1
End If

// Replace the arguments for future use on Retrieval process.
inv_cachelist[li_index].a_args = aa_args

Return 1
end function

public function integer of_register (string as_id, string as_dwobjectname, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						as_importfile		The name of the file.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on an import file.  There will be an initial load of this data.
//						The of_Refresh() functions will have no effect on this Cache object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
n_tr			ltr_obj
any			la_args[20]
boolean		lb_initialload=True
powerobject lpo_obj[]
datawindow	ldw_control
string		ls_sql
datastore	lds_control

Return of_Register ( IMPORTFILE, lb_initialload, as_id, &
							as_dwobjectname, ltr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, as_importfile, ls_sql)
end function

public function integer of_register (string as_id, string as_dwobjectname, string as_importfile, boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id					The ID to be given to this Cache Object.
//						as_dwobjectname	The DataWindow Object to be used on the Cache Object.
//						as_importfile		The name of the file.
//						ab_initialload		Perform an initial load.
//	Returns:  		Integer				1 successful.
//												0 already registered.
//												-1 error.
//	Description:		Registers the object into the service.
// 						The cache data is found on an import file.  There will be an initial load of this data.
//						The of_Refresh() functions will have no effect on this Cache object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
n_tr			ltr_obj
any			la_args[20]
powerobject lpo_obj[]
datawindow	ldw_control
string		ls_sql
datastore	lds_control

Return of_Register ( IMPORTFILE, ab_initialload, as_id, &
							as_dwobjectname, ltr_obj, la_args, &
							lpo_obj, ldw_control, lds_control, as_importfile, ls_sql)
end function

public function integer of_register (string as_id, datastore ads_control);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id				The ID to be given to this Cache Object.
//						ads_control		The DataSore Control containing the DataObject and Data to be used
//											on the Cache Object.
//	Returns:  		Integer			1 successful.
//											0 already registered.
//											-1 error.
//	Description:		Registers the object into the service.
//						The cache data is found on the DataStore control.  
//						The of_Refresh() function will refresh the data according to the data found
//						in ads_control at the time of the call to of_refresh.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_dwobjectname
string		ls_importfile
boolean		lb_initialload=True
powerobject lpo_obj[]
n_tr			ltr_obj
datawindow	ldw_control

Return  of_Register (DATASTORECONTROL, lb_initialload, as_id, &
							ls_dwobjectname, ltr_obj, la_args, &
							lpo_obj, ldw_control, ads_control, ls_sql, ls_importfile)
end function

public function integer of_register (string as_id, datawindow adw_control, boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id				The ID to be given to this Cache Object.
//						adw_control		The DataWindow Control containing the DataObject and Data to be used
//											on the Cache Object.
//						ab_initialload	Perform an Initial load (T/F).
//	Returns:  		Integer			1 successful.
//											0 already registered.
//											-1 error.
//	Description:		Registers the object into the service.
//						The cache data is found on the datawindow control.  
//						The of_Refresh() function will refresh the data according to the data found
//						in adw_control at the time of the call to of_refresh.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_dwobjectname
string		ls_importfile
powerobject lpo_obj[]
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (DATAWINDOWCONTROL, ab_initialload, as_id, &
							ls_dwobjectname, ltr_obj, la_args, &
							lpo_obj, adw_control, lds_control, ls_sql, ls_importfile)
end function

public function integer of_register (string as_id, datawindow adw_control);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_Register
//	Arguments:		as_id				The ID to be given to this Cache Object.
//						adw_control		The DataWindow Control containing the DataObject and Data to be used
//											on the Cache Object.
//	Returns:  		Integer			1 successful.
//											0 already registered.
//											-1 error.
//	Description:		Registers the object into the service.
//						The cache data is found on the datawindow control.  
//						The of_Refresh() function will refresh the data according to the data found
//						in adw_control at the time of the call to of_refresh.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_dwobjectname
string		ls_importfile
boolean		lb_initialload = True
powerobject lpo_obj[]
n_tr			ltr_obj
datastore	lds_control

Return  of_Register (DATAWINDOWCONTROL, lb_initialload, as_id, &
							ls_dwobjectname, ltr_obj, la_args, &
							lpo_obj, adw_control, lds_control, ls_sql, ls_importfile)
end function

public function integer of_register (string as_id, datastore ads_control, boolean ab_initialload);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_id				The ID to be given to this Cache Object.
//						ads_control		The DataSore Control containing the DataObject and Data to be used
//											on the Cache Object.
//						ab_initialload	Perform initial load (T/F)
//	Returns:  		Integer			1 successful.
//											0 already registered.
//											-1 error.
//	Description:		Registers the object into the service.
//						The cache data is found on the DataStore control.  
//						The of_Refresh() function will refresh the data according to the data found
//						in ads_control at the time of the call to of_refresh.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
any			la_args[20]
string		ls_sql
string		ls_dwobjectname
string		ls_importfile
powerobject lpo_obj[]
n_tr			ltr_obj
datawindow	ldw_control

Return  of_Register (DATASTORECONTROL, ab_initialload, as_id, &
							ls_dwobjectname, ltr_obj, la_args, &
							lpo_obj, ldw_control, ads_control, ls_sql, ls_importfile)
end function

public function integer of_unregister (string as_id);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UnRegister
//	Arguments:		as_id
//	Returns:  		Integer		1 successful, -1 error.
//	Description:		UnRegisters the object from the service by the ID.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						6.0		Added cleanup of new variables found on the structure.
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
Integer	li_upper
Integer	li_cnt
any		la_emptyargs[20]
n_tr		ltr_empty
datastore lds_empty
datawindow ldw_empty
powerobject lpo_empty[]

// Check for a valid ID.
If IsNull(as_id) or Len(Trim(as_id))= 0  Then
	Return -1
End If

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Find the ID.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If as_id = inv_cachelist[li_cnt].s_id Then 
		// The entry has been found.   
		// Perform the actual Unregister.
		If IsValid (inv_cachelist[li_cnt].ds_obj) Then
			Destroy inv_cachelist[li_cnt].ds_obj
		End If
		inv_cachelist[li_cnt].tr_obj = ltr_empty
		inv_cachelist[li_cnt].s_id = EMPTY
		inv_cachelist[li_cnt].a_args = la_emptyargs
		inv_cachelist[li_cnt].s_method = EMPTY
		// Added cleanup of new variables found on the structure.
		inv_cachelist[li_cnt].dw_originalcontrol = ldw_empty
		inv_cachelist[li_cnt].ds_originalcontrol = lds_empty
		inv_cachelist[li_cnt].po_originaldata = lpo_empty
		inv_cachelist[li_cnt].s_originaldataobject = EMPTY
		Return 1
	End If
Next

// The ID was not found.
Return  -1
end function

public function long of_refresh (string as_id);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Refresh
//	Arguments:		as_id		The ID for the object that needs to be refreshed.
//	Returns:  		Long		The number of rows refreshed.
//									0 this datastore could not be refreshed.
//									-1 error.
//	Description:		Refresh the object in the service.
//						*Note: All registered methods have the capabilitty of being refreshed.
//						On certain circustances registered objects cannot be refreshed. 
//						(i.e. The transaction is no longer connected.)
//
//						 Register Method - RETRIEVE
//							Validates the transaction object.
//							Confirms the transaction object is still connected to the db.
//							Refreshes by performing a retrive to the database.
//						 Register Method - DATAOBJECTDATA
//							Refreshes to the original data as of the time of registering.
//						 Register Method - POWEROBJECT
//							Refreshes to the original data as of the time of registering.
//						 Register Method - DATAWINDOWCONTROL
//							Validates that the original control source is still available.
//							Validates that the original control source is still holding the same dataobject.
//							Refreshes by getting the current data that is being held on the original control.
//						 Register Method - DATASTORECONTROL
//							Validates that the original control source is still available.
//							Validates that the original control source is still holding the same dataobject.
//							Refreshes by getting the current data that is being held on the original control.
//						 Register Method - IMPORTFILE
//							Validates that the file is still in existance.
//							Refreshes by importing the current contents of the file.
//						 Register Method - SQL
//							Validates the transaction object.
//							Confirms the transaction object is still connected to the db.
//							Refreshes by performing a retrive to the database.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
// 						5.0.04 Corrected arguments being passed twice to the retrieve function.			
// 						6.0 	Enhanced to support refresh capabilities on all registering methods.
// 						6.0 	Added support for new register methods.
// 						7.0		Changed the li_rows variable to Long (ll_rows).
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
Integer	li_rc
Integer 	li_upper=0
Integer	li_cnt=0
Long		ll_rows=0
Integer	li_id
Any		la_args[20]

// Check arguments
If IsNull(as_id) or Len(Trim(as_id))=0 Then
	Return -1
End If

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Find the matching ID.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If as_id = inv_cachelist[li_cnt].s_id Then 
		// The ID was found.
		li_id = li_cnt
		Exit
	End If
Next
		
// Make sure an ID was found.		
If li_id = 0 Then
	// The ID was not found.
	Return -1
End If

// ---------------------------------------------------------------------------
// -- Refresh operation will be attempted.
// ---------------------------------------------------------------------------

// Validate the cached datastore.
If IsNull(inv_cachelist[li_id].ds_obj) Or &
	Not IsValid(inv_cachelist[li_id].ds_obj) Then
	// At this point the ds_obj should always be valid.
	Return -1
End If
		
// Check for the method and use the appropriate Refresh functionality.		
Choose Case inv_cachelist[li_id].s_method
		
	Case RETRIEVE, SQL		
		// Confirm that the transaction objects is good for a retrieve.
		If IsNull(inv_cachelist[li_id].tr_obj) Or & 
			Not IsValid(inv_cachelist[li_id].tr_obj) Then Return -1
		If Not inv_cachelist[li_id].tr_obj.of_IsConnected() Then Return -1
			
		// Refresh the data.
		la_args = inv_cachelist[li_id].a_args
		ll_rows = inv_cachelist[li_cnt].ds_obj.Retrieve(la_args[1], la_args[2], &
				la_args[3], la_args[4], la_args[5], la_args[6], la_args[7], &
				la_args[8], la_args[9], la_args[10], la_args[11], la_args[12], &
				la_args[13], la_args[14], la_args[15], la_args[16], la_args[17], &
				la_args[18], la_args[19], la_args[20])
		Return ll_rows
	
	Case DATAOBJECTDATA
		// Refresh the data to the original data.
		inv_cachelist[li_id].ds_obj.DataObject = ''
		inv_cachelist[li_id].ds_obj.DataObject = inv_cachelist[li_id].s_originaldataobject
		Return inv_cachelist[li_id].ds_obj.RowCount()
	
	Case DATAWINDOWCONTROL
		// Validate that the source is still available.
		If IsNull(inv_cachelist[li_id].dw_originalcontrol) or Not IsValid(inv_cachelist[li_id].dw_originalcontrol) Then
			Return -1
		End If
		// Validate the dataobjects still match.		
		If inv_cachelist[li_id].dw_originalcontrol.DataObject <> inv_cachelist[li_id].ds_obj.DataObject Then 
			Return -1	 			
		End If

		// Refresh the data.
		inv_cachelist[li_id].ds_obj.Reset()
		li_rc = inv_cachelist[li_id].dw_originalcontrol.RowsCopy (1, inv_cachelist[li_id].dw_originalcontrol.RowCount(), Primary!, &
						inv_cachelist[li_id].ds_obj, 1, Primary!)			
		If li_rc > 0 Then
			Return inv_cachelist[li_id].ds_obj.RowCount()
		End If
		Return -1
	
	Case DATASTORECONTROL
		// Validate that the source is still available.
		If IsNull(inv_cachelist[li_id].ds_originalcontrol) or Not IsValid(inv_cachelist[li_id].ds_originalcontrol) Then
			Return -1
		End If
		// Validate the dataobjects still match.		
		If inv_cachelist[li_id].ds_originalcontrol.DataObject <> inv_cachelist[li_id].ds_obj.DataObject Then 
			Return -1	 			
		End If
			
		// Refresh the data.
		inv_cachelist[li_id].ds_obj.Reset()			
		li_rc = inv_cachelist[li_id].ds_originalcontrol.RowsCopy (1, inv_cachelist[li_id].ds_originalcontrol.RowCount(), Primary!, &
						inv_cachelist[li_id].ds_obj, 1, Primary!)			
		If li_rc > 0 Then
			Return inv_cachelist[li_id].ds_obj.RowCount()
		End If
		Return -1

	Case POWEROBJECT
		// Check for a valid powerobject object.
		If IsNull(inv_cachelist[li_id].po_originaldata) Then 
			Return -1
		End If
		If UpperBound(inv_cachelist[li_id].po_originaldata) = 0 Then 
			Return -1
		End If	
		// Refresh the data to the original data.
		// *Note: if the po_originaldata does not match the data requirements
		// of the datawindow object, Powerbuilder will provide immediate
		//	error feedback.			
		inv_cachelist[li_id].ds_obj.object.data = inv_cachelist[li_id].po_originaldata
		Return 1
	
	Case IMPORTFILE
		// Validate the import file.
		If IsNull(inv_cachelist[li_id].s_filename) or &
			Not FileExists(inv_cachelist[li_id].s_filename) Then
			Return -1
		End If
			
		// Refresh the data.
		inv_cachelist[li_id].ds_obj.Reset()
		ll_rows = inv_cachelist[li_id].ds_obj.ImportFile(inv_cachelist[li_id].s_filename)
		If ll_rows > 0 Then
			Return ll_rows
		End If
		Return -1
End Choose

// Cache does not support Refresh operations.
Return 0
end function

protected function integer of_register (string as_method, boolean ab_initialload, string as_id, string as_dwobjectname, n_tr atr_obj, any aa_args[20], powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile, string as_sql);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_Register
//	Arguments:			as_method			The method being used, depending on the method some of the arguments are not used.
//							ab_initialload		Should an initial load of the data be performed? (T/F)
//							as_id					The ID to be given to this Cache Object.
//							as_dwobjectname	The DataWindow Object to be used on the Cache Object (if required).
//							atr_obj				The Transaction to use (if required).
//							aa_args[20]			The arguments to use (if required). 
//							apo_data[]			The data to load (if required).
//							adw_control			The datawindow control which to load (if required).
//							ads_control			The datastore control which to load (if required).
//							as_importfile		The import file from which to load (if required).
//							as_sql				The sql to use if (required).
//	Returns:  			Integer:  			1 successful.
//													0 already registered.
//													-1 error.
//													-2 error on the transaction object.
// 													-3 error on the refresh process.
//	Description:			Registers the object into the service.
//							If the method is RETRIEVE: The data to be cached is found on a DataBase.  When requested, a retrieve 
//								will be performed to load the data.  Notice that DataWindow can have arguments. The of_Refresh() functions 
//								can be used to refresh the data on demand. 
//								*Note: If no initial load is performed, the 'loading' checks will be skipped.
//								Among other tests, it means that retrieval arguments may not be valid.
//							If the method is SQL: The cache data is found on a DataBase.  When requested, a retrieve will be performed to 
//								load the data.  The of_Refresh() functions can be used to refresh the data on demand.
//								*Note: If no initial load is performed, the 'loading' checks will be skipped.
//							If the method is DATAOBJECTDATA:	The cache data is found on the DataWindow Object.
//								The of_Refresh() functions will reset the data to the original contents.
//							If the method is POWEROBJECT: The cache data is found on the PowerObject array.  There will be an initial
//								load of this data.  The of_Refresh() functions will reset the data to the original contents.
//								*Note: This structure used to populate the load the data must match the 
//								DataWindow Object structure.  If not, the result will be an application error message.
//							If the method is DATAWINDOWCONTROL: 	The cache data is found on the datawindow control. The of_Refresh() 
//								functions will attempt to refresh the Cached data with that currently found on the original control.
//							If the method is DATASTORECONTROL: The cache data is found on the datastore control. The of_Refresh() 
//								functions will attempt to refresh the Cached data with that currently found on the original control.
//							If the method is IMPORTFILE:	The cache data is found on an import file.  When requested, there will be 
//								an initial load of this data.  The of_Refresh() functions can be used to refresh the data on demand.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   		Initial version
// 						6.0.01 	Took out duplicate trim() call.
//						8.0			Changed return of of_Refresh to Long datatype
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
Integer	li_rc, 	li_upper=0, li_cnt=0, li_openslot=0, li_newentry=0
Long		ll_refresh
Boolean	lb_initialload = False
String	ls_sqlerr, ls_dwsyntax

// Check for a valid method.
Choose Case as_method
	Case RETRIEVE, DATAOBJECTDATA, POWEROBJECT, DATAWINDOWCONTROL, &
			DATASTORECONTROL, IMPORTFILE, SQL
	Case Else
		Return -1
End Choose

// Check for a valid ID
If IsNull(as_id) or Len(Trim(as_id))= 0 Then
	Return -1
End If

// --------------------------------------------------------------------------
// -- Preparation/Validation prior to attempting the actual registration.
// --------------------------------------------------------------------------

// Trim and Convert the ID to lower case.
as_id = Trim(Lower(as_id))

// Trim the DWObjectName.
as_dwobjectname = Trim(as_dwobjectname)

// Check for valid DataObjecName
Choose Case as_method
	Case RETRIEVE, DATAOBJECTDATA, POWEROBJECT, IMPORTFILE
		If IsNull(as_dwobjectname) or Len(as_dwobjectname)= 0 Then
			Return -1
		End If		
End Choose

// Method dependent validation.
Choose Case as_method
	Case RETRIEVE, SQL
		If IsNull(atr_obj) Or Not IsValid(atr_obj) Then Return -2
		If Not atr_obj.of_IsConnected() Then Return -2
		
		If as_method = SQL Then
			If IsNull(as_sql) Then Return -1
			ls_dwsyntax = atr_obj.SyntaxFromSQL ( as_sql, '', ls_sqlerr )	
			If Len(ls_sqlerr) >0 Then Return -1			
		End If
		
	Case POWEROBJECT
		If IsNull(apo_data) Then Return -1
		If UpperBound(apo_data) = 0 Then Return -1
		
	Case DATAWINDOWCONTROL
		If IsNull(adw_control) or Not IsValid(adw_control) Then Return -1
		If Len(adw_control.DataObject) = 0 Then Return -1
	
		// Populate the argument with the desired DataObject.
		as_dwobjectname = adw_control.DataObject

	Case DATASTORECONTROL
		If IsNull(ads_control) or Not IsValid(ads_control) Then Return -1
		If Len(ads_control.DataObject) = 0 Then Return -1	
	
		// Populate the argument with the desired DataObject.
		as_dwobjectname = ads_control.DataObject

	Case IMPORTFILE
		If IsNull(as_importfile) or Not FileExists(as_importfile) Then
			Return -1
		End If

End Choose

// --------------------------------------------------------------------------
// -- Get the next Registration ID.
// --------------------------------------------------------------------------

// Determine if the ID already registered.
li_upper = UpperBound(inv_cachelist)
For li_cnt = 1 to li_upper
	If as_id = inv_cachelist[li_cnt].s_id Then 
		// ID had already been registered.
		Return 0
	End If
Next

// Find an open slot (if any).
For li_cnt = 1 to li_upper
	If inv_cachelist[li_cnt].s_id = EMPTY Then 
		// Open slot has been found.
		li_openslot = li_cnt
		Exit
	End If
Next

// Determine the new entry slot.
If li_openslot > 0 Then
	li_newentry = li_openslot
Else
	li_newentry = li_upper + 1
End If

// --------------------------------------------------------------------------
// -- Begin actual registration.
// --------------------------------------------------------------------------

// Populate the ID reference
inv_cachelist[li_newentry].s_id = as_id

// Create the new cache datastore.
inv_cachelist[li_newentry].ds_obj = Create n_ds

// Populate the DataWindowObject (if any).
inv_cachelist[li_newentry].ds_obj.DataObject = as_dwobjectname

// Populate the Data Load Method.
inv_cachelist[li_newentry].s_method = as_method

// Method dependent functionality.
Choose Case as_method
		
	Case RETRIEVE, SQL
		If as_method = SQL Then
			inv_cachelist[li_newentry].ds_obj.Create( ls_dwsyntax, ls_sqlerr)
			If Len(ls_sqlerr) >0 Then
				// There is a problem, take it out from the list.
				li_rc = of_Unregister (as_id)
				Return -1		
			End If 	
		End If
	
		// Set the transaction object
		li_rc = inv_cachelist[li_newentry].ds_obj.of_SetTransObject(atr_obj)
		If li_rc <> 1 Then
			// There is a problem, take it out from the list.
			li_rc = of_Unregister (as_id)
			Return -2		
		End If 
	
		// Store the transaction object.
		inv_cachelist[li_newentry].tr_obj = atr_obj
	
		// Store the arguments (if any) for use on Retrieval process.
		inv_cachelist[li_newentry].a_args = aa_args
	
		// Keep track if an initial load needs to be performed.
		lb_initialload = ab_initialload
		
	Case POWEROBJECT
		// Populate the PO_OriginalData array.  Used in refresh operations.
		inv_cachelist[li_newentry].po_originaldata = apo_data
	
		// Perform the initial load of data into the object.
		// *Note: if the apo_data does not match the data requirements
		// of the datawindow object, Powerbuilder will provide immediate
		//	error feedback.
		// Keep track if an initial load needs to be performed.
		lb_initialload = True		
		
	Case DATAOBJECTDATA
		// *Note: All the data should already be in the DataWindow object.
		// Asign of the dataobject will be used in the of_refresh operation.
		inv_cachelist[li_newentry].s_originaldataobject = as_dwobjectname
		
		// Keep track if an initial load needs to be performed.
		lb_initialload = False
		
	Case DATAWINDOWCONTROL
		// Populate the DW_OriginalControl reference.  Used in refresh operations.
		inv_cachelist[li_newentry].dw_originalcontrol = adw_control
	
		// Keep track if an initial load needs to be performed.
		lb_initialload = ab_initialload	
		
	Case DATASTORECONTROL
		// Populate the DS_OriginalControl reference.  Used in refresh operations.
		inv_cachelist[li_newentry].ds_originalcontrol = ads_control
	
		// Keep track if an initial load needs to be performed.
		lb_initialload = ab_initialload
		
	Case IMPORTFILE
		// Populate the FileName reference
		inv_cachelist[li_newentry].s_filename = as_importfile
	
		// Keep track if an initial load needs to be performed.
		lb_initialload = ab_initialload
End Choose

// If appropriate, perform the initialload of data.
If lb_initialload Then
	ll_refresh = of_Refresh (as_id)	
	If ll_refresh < 0 Then
		// There is a problem, take it out from the list.
		li_rc = of_Unregister (as_id)
		Return -3
	End If	
End If

Return 1
end function

on pfc_n_cst_dwcache.create
call super::create
end on

on pfc_n_cst_dwcache.destroy
call super::destroy
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			destructor
//	Description:  	Service is shutting down so destroy all registered datastores.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
Integer	li_cnt
Integer	li_upper

// Destroy all registered datastores.
li_upper = UpperBound (inv_cachelist)
For li_cnt = 1 to li_upper
	If IsValid (inv_cachelist[li_cnt].ds_obj) Then
		Destroy inv_cachelist[li_cnt].ds_obj
	End If
Next
end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			constructor
//	Description:  	DataWindow/DataStore caching.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//					 	6.0 	Added support for new register methods.
//								The new register methods are DATAWINDOWCONTROL, DATASTORECONTROL,
//								IMPORTFILE, and SQLStatement.
// 						6.0 	Added support for all register methods to have some kind of refresh functionality.
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
end event

