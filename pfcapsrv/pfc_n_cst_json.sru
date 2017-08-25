HA$PBExportHeader$pfc_n_cst_json.sru
$PBExportComments$JSON Parser
forward
global type pfc_n_cst_json from n_base
end type
type ids_repository from datastore within pfc_n_cst_json
end type
end forward

global type pfc_n_cst_json from n_base autoinstantiate
ids_repository ids_repository
end type

type variables
Protected:
n_cst_json_tagattrib	inv_tag
n_cst_filesrv				inv_file
end variables

forward prototypes
public function integer of_delete_entries (long al_start, long al_end)
public function integer of_delete_entry (long al_index)
public function long of_find_entry (string as_object, string as_pair_name)
public function integer of_delete_object (string as_object)
public function integer of_clear ()
public function integer of_parse (string as_json)
public function string of_tostring ()
public function long of_get_objects (ref string as_objects[])
public function long of_get_pair (string as_object, string as_pair_name, ref s_json_attrib astr_pair)
public function integer of_get_value (string as_object, string as_pair_name, ref string as_value)
public function integer of_load (string as_filename)
public function integer of_save (string as_filename)
public function integer of_reset ()
public function long of_find_entries (string as_object, string as_pair_name, ref long al_entries[])
public function integer of_get_entry (long al_index, ref s_json_attrib astr_pair)
public function long of_get_object (string as_object, ref s_json_attrib astr_entries[])
public function integer of_add_entry (string as_object, string as_pair_name, string as_pair_value, integer ai_kind)
public function integer of_edit_entry (long al_index, string as_object, string as_pair_name, string as_pair_value, integer ai_kind)
public function integer of_get_values (string as_object, string as_pair_name, ref string as_values[])
end prototypes

public function integer of_delete_entries (long al_start, long al_end);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_delete_entries
//
// Access:			Public
//
// Arguments:
// al_start:		The index of the first entry of the group of JSON
//						entries to be deleted.
// al_end:			The index of the last entry of the group of JSON
//						entries to be deleted.
//
// Returns:			integer
//						 1, OK.
//						-1, An error occurs.
//
// Description:	Delete JSON repository entries between specified start &
//						end indexes.
//
// Usage:			Call this method to delete a group of adjacents JSON
//							repository entries.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial version
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

long ll_rowcount

ll_rowcount = ids_repository.rowcount( )

if al_start < 1 or al_start > ll_rowcount then return -1
if al_end < 1 or al_end < al_start then return -1
if al_end > ll_rowcount then return -1

this.of_reset( )

return ids_repository.rowsdiscard( al_start, al_end, primary! )

end function

public function integer of_delete_entry (long al_index);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_delete_entry
//
// Access:			Public
//
// Arguments:
// al_index:		The index of the JSON entry to delete.
//
// Returns:			integer
//						 1, OK.
//						-1, An error occurs.
//
// Description:	Delete a JSON entry from the repository using its
//						corresponding index.
//
// Usage:			Call this method to delete a specif JSON entry from the
//							repository knowing its index. 
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial version
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

this.of_reset( )

return this.of_delete_entries( al_index, al_index )
end function

public function long of_find_entry (string as_object, string as_pair_name);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_find_entry
//
// Access:			Public
//
// Arguments:
// as_object:		The JSON object's name to be found
// as_pair_name:			The JSON Pair's name to be found
//
// Returns:			long
//						 The corresponding JSON repository index of the entry
//						found, or
//						 0, if no entry found, or
//						-1, if an error occurs.
//
// Description:	Returns the first corresponding index of a JSON entry
//						identiified by the specified Object & pair's name values.
//
// Usage:			Call this method to find a JSON entry without knowing its
//							corresponding repository index.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.35	Initial version
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

string ls_find

if isnull( as_object )  or len(trim( as_object )) = 0 then return -1
if isnull( as_pair_name )  or len(trim( as_pair_name )) = 0 then return -1

this.of_reset( )

ls_find = "object ='"+as_object+"' and pair ='"+as_pair_name+"'"

return ids_repository.find( ls_find, 1 , ids_repository.rowcount( ) )
end function

public function integer of_delete_object (string as_object);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_delete_object
//
// Access:			Public
//
// Arguments:
// as_object:		The JSON object's name to be deleted.
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs.
//
// Description:	Delette all JSON repository's entries that correspond to
//						the specified JSON object's name.
//
// Usage:			Call this method to delete a specified JSON object from
//							the repository.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial version
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

integer	li_rc
long		ll_end
string		ls_filter

if isnull( as_object ) or len(trim( as_object )) = 0 then return -1

// Apply temporary filter to list corresponding Object's entries
ls_filter = "object ='"+as_object+"'"
if ids_repository.setfilter( ls_filter ) = -1 then return -1
ids_repository.filter()

// Delete entries found, if any
ll_end = ids_repository.rowcount( )
if ll_end > 0 then
	li_rc = this.of_delete_entries( 1, ll_end)
end if

// Remove temporary filter
ids_repository.setfilter("")
ids_repository.filter()

return li_rc

end function

public function integer of_clear ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_clear
//
// Access:			Public
//
// Returns:			integer
//						 1, OK.
//						-1, An error occurs.
//
// Description:	Cleat the content of the JSON repository.
//
// Usage:			Call this method when you need to clear the content of
//							the repository. This method is called by the of_load()
//							method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5 Initial version
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

return ids_repository.reset( )

end function

public function integer of_parse (string as_json);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_parse
//
// Access:			Public
//
// Arguments:
// as_json:		The JSON string to be parsed.
//
// Returns:			integer
//						 1, Ok
//						-1, An error occurs
//
// Description:	Parse the passed JSON string.
//						JSON object & Pairs are stored in the JSON repository.
//
// Usage:			Call this method to parse a JSON string. This method is
//							called by the of_load() method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial version
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

integer	li_rc
integer	li_kind
long		ll_pos
long		ll_pos2
long		ll_tmp
string		ls_tmp
string		ls_object
string		ls_pair_name
string		ls_pair_value
boolean 	lb_array

n_cst_string		lnv_string

// Check Parameter
if isnull( as_json ) or len( trim( as_json ) ) = 0 then return -1

// Work on a cleaned up copy of the JSON string to parse
ls_tmp = lnv_string.of_removewhitespace( as_json )
ls_tmp = lnv_string.of_globalreplace( ls_tmp, '"', "", FALSE )

// Remove intial object tags
ls_tmp = mid( ls_tmp, 2)
ls_tmp = left( ls_tmp, len( ls_tmp) - 1)

do while len( ls_tmp ) >0
	// Must find a Pair tag
	ll_pos = pos( ls_tmp, inv_tag.cst_pair_sep )
	if ll_pos = 0 then return -1
	
	// Determine if we have found an Object definition
	if mid( ls_tmp, ll_pos + 1, 1) = inv_tag.cst_obj_start then 

		// Set entry Kind
		li_kind = inv_tag.cst_obj_kind
		
		// Determine the name of it
		ls_object = mid( ls_tmp, 1, ll_pos - 1)
		
		// Trim working JSON string to optimize performance
		ls_tmp = mid( ls_tmp, ll_pos + 2)
		
		// Handle next token
		continue
	end if
	
	// Determine if we have found a Pair definition
	ll_pos2 = pos( ls_tmp, inv_tag.cst_ent_sep)
	if ll_pos2 = 0 then exit
	
	//Determine if we have found an Array definition
	lb_array = (mid( ls_tmp, ll_pos + 1, 1 ) = inv_tag.cst_array_start)
		
	// Determine Pair name value
	ls_pair_name = left( ls_tmp, ll_pos -1)
	
	// Determine Pair value
	if lb_array = true then
		// Set entry Kind
		li_kind = inv_tag.cst_array_kind
		
		// Set array name
		ls_object = ls_pair_name
		
		// Set array value
		ls_tmp = mid( ls_tmp, ll_pos + 1)
		ll_pos2 = pos( ls_tmp, inv_tag.cst_array_end )
		if ll_pos2 = 0 then return -1
		ls_pair_value =mid( left( ls_tmp, ll_pos2 - 1 ),2)
		
	else
		// Set current Object's pair value
		ls_pair_value = mid( ls_tmp, ll_pos + 1, ll_pos2 - (ll_pos + 1 ))
		if right(ls_pair_value,1) = inv_tag.cst_obj_end then
			ls_pair_value = left( ls_pair_value, len( ls_pair_value) - 1)
		end if
	end if	
	
	// Trim working JSON string to optimize performance
	ls_tmp = mid( ls_tmp, ll_pos2 + 1 )
	
	// Set Entry kind to VALUE by default
	if li_kind = -1 then li_kind = inv_tag.cst_val_kind
	
	// Add a new parsed JSON entry in the repository
	if this.of_add_entry( ls_object , ls_pair_name , ls_pair_value, li_kind  ) = -1 then return -1
	
	li_kind = -1
loop
	
return 1
end function

public function string of_tostring ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_tostring
//
// Access:			Public
//
// Returns:			string
//						The content of the JSON repository into a conform JSON
//						non formated string, or
//						Null if an error occurs.
//
// Description:	Convert JSON repository into a conform JSON string in raw
//						format without any layout formatting.
//						
//
// Usage:			Call this method to store the content of the repository
//							into a conform JSON String. This method is called by the
//							of_save() method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
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

integer	li_kind
long	ll_i
long	ll_limit
long	ll_object = 1
string ls_rc
string ls_previous_object
string ls_current_object
string ls_pair_name
string ls_pair_value
string	ls_null

SetNull( ls_null )

ll_limit = ids_repository.rowcount( )
if ll_limit < 1 then return ls_null

// Reset original order of the repository Entries
this.of_reset()

ls_rc = inv_tag.cst_obj_start
for ll_i = 1 to ll_limit
	ls_current_object = ids_repository.getitemstring( ll_i, 1 )
	if ls_current_object <> ls_previous_object then
		ll_object++
		if ll_object > 2 then
			ls_rc = left( ls_rc, len(ls_rc) - 1) + inv_tag.cst_obj_end + inv_tag.cst_ent_sep
		end if
		ls_rc += inv_tag.cst_val_start+ ls_current_object + inv_tag.cst_val_end + inv_tag.cst_pair_sep + inv_tag.cst_obj_start
		ls_previous_object = ls_current_object
	end if
	
	ls_pair_name = ids_repository.getitemstring( ll_i, 2 )
	ls_pair_value = ids_repository.getitemstring( ll_i, 3 )
	li_kind = ids_repository.getitemnumber( ll_i, 5)
	if li_kind <> inv_tag.cst_array_kind then
		ls_rc += inv_tag.cst_val_start+ ls_pair_name + inv_tag.cst_val_end + inv_tag.cst_pair_sep + inv_tag.cst_val_start+ ls_pair_value + inv_tag.cst_val_end  + inv_tag.cst_ent_sep
	else
		ls_rc += inv_tag.cst_val_start+ ls_pair_name + inv_tag.cst_val_end + inv_tag.cst_pair_sep + inv_tag.cst_array_start+ ls_pair_value + inv_tag.cst_array_end  + inv_tag.cst_ent_sep
	end if
next

ls_rc = left( ls_rc, len( ls_rc ) -  inv_tag.cst_ent_sep_len)
ls_rc +=inv_tag.cst_obj_end

return ls_rc
end function

public function long of_get_objects (ref string as_objects[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_objects
//
// Access:			Public
//
// Arguments:
// as_objects[]:		The string array that will holds the objects list
//						(by ref).
//
// Returns:			long
//						The number of returned objects, or
//						-1, if an error occurs.
//
// Description:	Get the list of objects from the JSON repository ordered
//						by order of appearance.
//
// Usage:			Call this method to get the list of JSON objects from the
//							repository.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
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

long	ll_i
long	ll_limit
long	ll_index
string	ls_current_object
string ls_previous_object

ll_limit = ids_repository.rowcount( )
if ll_limit < 1 then return -1

ids_repository.SetSort( "#4 A")
ids_repository.Sort()

for ll_i = 1 to ll_limit
	ls_current_object = ids_repository.getitemstring( ll_i, 1 )
	if ls_current_object <> ls_previous_object then
		ll_index = upperbound( as_objects ) + 1
		as_objects[ll_index] = ls_current_object
		ls_previous_object = ls_current_object
	end if
next

return ll_index
end function

public function long of_get_pair (string as_object, string as_pair_name, ref s_json_attrib astr_pair);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_pair
//
// Access:			Public
//
// Arguments:
// as_object:		The name of the JSON object that contain the as_pair_name
// as_pair_name:	The name of the Pair value to get its value
// astr_pair:			The s_json_attrib variable that will hold the
//						result (by ref).
//
// Returns:			long
//						1, Ok
//						-1, An error occurs.
//
// Description:	Get the content of the specified JSON object's pair.
//
// Usage:			Call this method to get the value of a JSON Object's Pair.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5 Initial version
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

long  	ll_limit
string	ls_filter

if isnull( as_object ) or len(trim(as_object)) = 0 then return -1
if isnull( as_pair_name ) or len(trim( as_pair_name )) = 0 then return -1

ls_filter = "object ='"+ as_object +"' and pair ='"+as_pair_name+"'"
if ids_repository.setfilter ( ls_filter ) = -1 then return -1
ids_repository.filter()

ll_limit = ids_repository.rowcount( )
if ll_limit < 1 then return -1

if this.of_get_entry( 1, astr_pair) = -1 then return -1

ids_repository.SetFilter("")
ids_repository.filter()

return 1
end function

public function integer of_get_value (string as_object, string as_pair_name, ref string as_value);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_value
//
// Access:			Public
//
// Arguments:
// as_object:		The name of the JSON object that contain the as_pair_name
// as_pair_name:	The name of the Pair value to get its value
// as_value:			The string variable that will holds the pair's valuet (by ref).
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs.
//
// Description:	Get the value of the specified JSON pair.
//
// Usage:			Call this method to get the value of a JSON Object's Pair.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5 Initial version
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

long	li_rc
long  	ll_limit
string	ls_filter

if isnull( as_object ) or len(trim(as_object)) = 0 then return -1
if isnull( as_pair_name ) or len(trim( as_pair_name )) = 0 then return -1

ls_filter = "object ='"+ as_object +"' and pair ='"+as_pair_name+"'"
if ids_repository.setfilter ( ls_filter ) = -1 then return -1
ids_repository.filter()

ll_limit = ids_repository.rowcount( )
if ll_limit= 1 then 
	as_value = ids_repository.getitemstring( 1, 3) 
	li_rc = 1
else
	li_rc = -1
end if

ids_repository.SetFilter("")
ids_repository.filter()

return li_rc
end function

public function integer of_load (string as_filename);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_load
//
// Access:			Public
//
// Arguments:
// as_filename:		The complete filename of the JSON file to load &
//						parse.
//
// Returns:			integer
//						 1, ok
//						-1, an error occurs
//
// Description:	Load a specified JSON file using the PFC file service and parse it.
//
// Usage:			Call this method to load and parse a JSON file.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
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

long	ll_i
long	ll_limit
string	ls_json[]

if f_setfilesrv( inv_file, true ) = -1 then return -1
if inv_file.of_fileread( as_filename, ls_json ) = -1 then return -1

ll_limit = Upperbound( ls_json)
if ll_limit < 1 then return -1

this.of_clear( )

for ll_i = 1 to ll_limit
	if this.of_parse( ls_json[ll_i] ) = -1 then return -1
next

return 1
end function

public function integer of_save (string as_filename);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_save
//
// Access:			Public
//
// Arguments:
// as_filename:		The complete filename of the JSON file to save.
//
// Returns:			integer
//						 1, ok
//						-1, an error occurs
//
// Description:	Save a specified JSON file using the PFC file service. 
//
// Usage:			Call this method to save the JSON repository into a JSON file.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
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

long	ll_i
long	ll_limit
string	ls_json

ls_json = this.of_tostring( )
if isnull( ls_json ) then return -1
if f_setfilesrv( inv_file, true ) = -1 then return -1
if inv_file.of_filewrite( as_filename, ls_json ) = -1 then return -1

return 1
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_reset
//
// Access:			Public
//
// Returns:			integer
//						Always return 1
//
// Description:	Reset intial JSON repository status to restore content
//						order as just after last parsing issued.
//
// Usage:			Call this method when you need to works on the repository
//							and the entries order of appearance should be as just
//							after a parsing. This method is automatically called when
//							needed according to the context of work.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial version
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

ids_repository.setfilter("")
ids_repository.filter()
ids_repository.setsort( "#4 A" )
ids_repository.sort()

return 1
end function

public function long of_find_entries (string as_object, string as_pair_name, ref long al_entries[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_find_entries
//
// Access:			Public
//
// Arguments:
// as_object:		The JSON object's name to be found
// as_pair_name:	The JSON Pair's name to be found
// al_entries[]:		The long array variable	that will holds entries found.
//						(by ref)		
//
// Returns:			long
//						 The number of entries found, or
//						 0, if no entry found, or
//						-1, if an error occurs.
//
// Description:	Returns all corresponding index of a JSON entries
//						identiified by the specified Object & pair's name values.
//
// Usage:			Call this method to find JSON entries using their
//					object's & pair's names.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.35	Initial version
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

long	ll_found
long	ll_index
long	ll_start = 1
long	ll_limit
string ls_find

if isnull( as_object )  or len(trim( as_object )) = 0 then return -1
if isnull( as_pair_name )  or len(trim( as_pair_name )) = 0 then return -1

ll_limit = ids_repository.rowcount( )
if ll_limit < 1 then return -1

this.of_reset()

ls_find = "object ='"+as_object+"' and pair ='"+as_pair_name+"'"

ll_found = ids_repository.find( ls_find, ll_start, ll_limit + 1 )
do while ll_found > 0
		ll_index++
		al_entries[ll_index] = ll_found
		ll_start = ll_found + 1
		ll_found = ids_repository.find( ls_find, ll_start, ll_limit+ 1 )
loop

return ll_index

end function

public function integer of_get_entry (long al_index, ref s_json_attrib astr_pair);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_entry
//
// Access:			Public
//
// Arguments:
// al_index:		The repository index that corresponds to the pair
//						that you want to get its content.
// astr_pair:			The s_json_attrib variable that will holds the
//						contents.
//
// Returns:			integer
//						 1, ok
//						-1, An error occurs
//
// Description:	Store pair contents coressponding to the specified
//						repository index into specified variable.
//
// Usage:			Call this method to get a pair's content knowing its
//							reposiroty index to be stored into an s_json_attrib
//							structure variable.
//						This method is called by of_get_object() & of_get_pair() methods
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5	Initial Version
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

if isnull( al_index) or al_index < 1 or al_index > ids_repository.rowcount( ) then return -1

astr_pair.is_object = ids_repository.getitemstring( al_index, 1)
astr_pair.is_pair_name = ids_repository.getitemstring( al_index, 2)
astr_pair.ia_pair_value = ids_repository.getitemstring( al_index, 3)
astr_pair.ii_kind = ids_repository.getitemnumber( al_index, 5)

return 1
end function

public function long of_get_object (string as_object, ref s_json_attrib astr_entries[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_object
//
// Access:			Public
//
// Arguments:
// as_object:		The name of the JSON object to get its content
// astr_entries[]:			The s_json_attrib arrays that will hold the
//						result (by ref).
//
// Returns:			long
//						The number of pairs found for the specified JSON object,
//						or
//						-1, when an error occurs.
//
// Description:	Get tthe content of the specified JSON object.
//
// Usage:			Call this method to get the content of a JSON object.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5 Initial version
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

long	ll_i
long  	ll_limit
string	ls_filter

if isnull( as_object ) or len(trim(as_object)) = 0 then return -1

ls_filter = "object ='"+ as_object +"'"
if ids_repository.setfilter ( ls_filter ) = -1 then return -1
ids_repository.filter()

ll_limit = ids_repository.rowcount( )
if ll_limit < 1 then return -1

for ll_i = ll_limit to 1 step -1
	if this.of_get_entry( ll_i, astr_entries[ll_i] ) = -1 then return -1
next

return ll_limit
end function

public function integer of_add_entry (string as_object, string as_pair_name, string as_pair_value, integer ai_kind);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_add_entry
//
// Access:			Public
//
// Arguments:
// as_object:		The JSON object's name to be added.
// as_pair_name:			The JSON Pair's name to be added
// as_pair_value:			The JSON Pair's value to be added.
// ai_kind:					The entry Kind. Possible values are :
//								1 = OBJECT (n_cst_json_tagattrib.CST_OBJ_KIND)
//								2 = VALUE (n_cst_json_tagattrib.CST_VAL_KIND)
//								3 = ARRAY (n_cst_json_tagattrib.CST_ARRAY_KIND)
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs
//
// Description:	Add a new JSON entry in the repository.
//
// Usage:			Call this method to store in the repository a new JSON
//							entry. This method is called by the of_parse() method.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 	12.5	Initial version
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

long ll_index

if isnull( as_object) or len(trim( as_object )) = 0 then return -1
if isnull( as_pair_name ) or len(trim( as_pair_name )) = 0 then return -1

ll_index = ids_repository.insertrow(0)
if ll_index < 1 then return -1

return this.of_edit_entry( ll_index, as_object , as_pair_name , as_pair_value, ai_kind )


end function

public function integer of_edit_entry (long al_index, string as_object, string as_pair_name, string as_pair_value, integer ai_kind);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_edit_entry
//
// Access:			Public
//
// Arguments:
// al_index:		The index of the JSON repository entry to be
//						edited.
// as_object:			The JSN object name to set.
// as_pair_name:		The JSON Pair's Name value to set.
// as_pair_value:		The JSON Pair's value to set.
// ai_kind:				the JSON Pair's kind. Possible values are :
//
// Returns:			integer
//						 1, Ok
//						-1, An error occurs
//
// Description:	Edit JSON entry corresponding to the specified repository
//						index.
//
// Usage:			Call this method to edit content of an JSON entry that
//							you know its repository's index.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5		Initial Version
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

if al_index < 1 or al_index > ids_repository.rowcount() then return -1
if isnull( as_object) or len(trim( as_object )) = 0 then return -1
if isnull( as_pair_name ) or len(trim( as_pair_name )) = 0 then return -1
if isnull( ai_kind) then return -1

if ids_repository.setitem( al_index, 1, as_object ) = -1 then return -1
if ids_repository.setitem( al_index, 2, as_pair_name ) = -1 then return -1
if ids_repository.setitem( al_index, 3, as_pair_value ) = -1 then return -1
if ids_repository.setitem( al_index, 4, al_index) = -1 then return -1
if ids_repository.setitem( al_index, 5, ai_kind) = -1 then return -1

return 1

end function

public function integer of_get_values (string as_object, string as_pair_name, ref string as_values[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_get_values
//
// Access:			Public
//
// Arguments:
// as_object:		The name of the JSON object that contain the as_pair_name
// as_pair_name:	The name of the Pair value to get its value
// as_values:		The string array variable that will holds the pair's valuet (by ref).
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs.
//
// Description:	Get the values of the specified JSON pair with Array Kind.
//
// Usage:			Call this method to get the value of a JSON Object's Pair.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5 Initial version
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

long	li_rc
long  	ll_limit
string	ls_filter
string	ls_tmp

n_cst_string		lnv_string

if isnull( as_object ) or len(trim(as_object)) = 0 then return -1
if isnull( as_pair_name ) or len(trim( as_pair_name )) = 0 then return -1

ls_filter = "object ='"+ as_object +"' and pair ='"+as_pair_name+"' and kind =" +string( inv_tag.cst_array_kind)
if ids_repository.setfilter ( ls_filter ) = -1 then return -1
ids_repository.filter()

ll_limit = ids_repository.rowcount( )
if ll_limit= 1 then
	ls_tmp  = ids_repository.getitemstring( 1, 3) 
	li_rc = lnv_string.of_parsetoarray( ls_tmp, ",",  as_values )
end if

ids_repository.SetFilter("")
ids_repository.filter()

return li_rc
end function

on pfc_n_cst_json.create
call super::create
this.ids_repository=create ids_repository
end on

on pfc_n_cst_json.destroy
call super::destroy
destroy(this.ids_repository)
end on

event destructor;call super::destructor;f_setfilesrv( inv_file, false)

end event

type ids_repository from datastore within pfc_n_cst_json descriptor "pb_nvo" = "true" 
string dataobject = "d_json_repository"
end type

on ids_repository.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ids_repository.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

