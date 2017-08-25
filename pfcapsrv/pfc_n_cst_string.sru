HA$PBExportHeader$pfc_n_cst_string.sru
$PBExportComments$PFC String service
forward
global type pfc_n_cst_string from n_base
end type
end forward

global type pfc_n_cst_string from n_base autoinstantiate
end type

type variables
Public:
// Email Address Checking Rule constants
constant integer	CST_HOTMAIL_RULE = 1
constant integer	CST_RFC_5321 = 2

// of_GlobalReplace method selection constants
constant integer  CST_GLOBALREPLACE_LEGACY = 1
constant integer  CST_GLOBALREPLACE_NEW    = 2

string	CST_NULL

Protected:
// of_GlobalReplace method (use the new, more efficient method by default)
privatewrite integer ii_globalreplacemethod = CST_GLOBALREPLACE_NEW
end variables

forward prototypes
public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function string of_gettoken (ref string as_source, string as_separator)
public function string of_padleft (string as_source, long al_length)
public function string of_padright (string as_source, long al_length)
public function boolean of_islower (string as_source)
public function boolean of_isupper (string as_source)
public function boolean of_iswhitespace (string as_source)
public function boolean of_isalpha (string as_source)
public function boolean of_isalphanum (string as_source)
public function string of_quote (string as_source)
public function boolean of_isspace (string as_source)
public function boolean of_ispunctuation (string as_source)
public function long of_lastpos (string as_source, string as_target, long al_start)
public function long of_lastpos (string as_source, string as_target)
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string of_globalreplace (string as_source, string as_old, string as_new)
public function long of_countoccurrences (string as_source, string as_target, boolean ab_ignorecase)
public function string of_righttrim (string as_source)
public function string of_lefttrim (string as_source)
public function string of_lefttrim (string as_source, boolean ab_remove_spaces)
public function string of_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_righttrim (string as_source, boolean ab_remove_spaces)
public function string of_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_trim (string as_source)
public function string of_trim (string as_source, boolean ab_remove_spaces)
public function string of_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator)
public function integer of_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator)
public function string of_removenonprint (string as_source)
public function boolean of_isempty (string as_source)
public function boolean of_isprintable (string as_source)
public function boolean of_isformat (string as_source)
public function string of_removewhitespace (string as_source)
public function boolean of_IsComparisonOperator (string as_source)
public function boolean of_IsArithmeticOperator (string as_source)
public function long of_countoccurrences (string as_source, string as_target)
public function long of_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string)
public function long of_arraytostring (string as_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string)
public function string of_wordcap (string as_source)
public function boolean of_iswellformedemailaddress (string as_emailaddress, integer ai_emailaddresscheckrule)
public function boolean of_issurroundedby (string as_source, string as_begin_surrounding, string as_end_surrounding, string as_tobe_surrounded)
public function boolean of_issurroundedby (string as_source, string as_surroundedby, string as_tobe_surrounded)
public function boolean of_iswellformedemailaddress (string as_emailaddress)
public function string of_trimspecificleadchars (string as_source, string as_totrim)
public function string of_trimspecifictrailchars (string as_source, string as_totrim)
public function string of_globalreplacelegacy (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string of_globalreplacenew (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function integer of_getglobalreplacemethod ()
public function integer of_setglobalreplacemethod (integer ai_method)
public function string of_removepunctuation (string as_source)
public function string of_urlencode (string as_value)
end prototypes

public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ParseToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimiter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimiter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimiter string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Fixed problem when delimiter is last character of string.
//	   		Ref array and return code gave incorrect results.
//	12.5		Optimized
//				Changed behavior: #11020
//					reset return array at start
//					return additional empty item when delimiter is last character of string
//					return also one item when string is empty
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

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_upper_source, ls_empty[]

//Reset array
as_Array = ls_empty

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	SetNull(ll_Count)
	Return ll_Count
End If

//ignore case
as_Delimiter = Upper(as_Delimiter)
ls_upper_source = Upper(as_source)

//Get the length of the delimiter
ll_DelLen = Len(as_Delimiter)

ll_Pos = Pos(ls_upper_source, as_Delimiter)

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Add current entry to array
	ll_Length = ll_Pos - ll_Start
	ll_Count ++
	as_Array[ll_Count] = Mid (as_source, ll_start, ll_length)
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos = Pos(ls_upper_source, as_Delimiter, ll_Start)
Loop

//Add last entry to array (also if empty #11020)
ll_count++
as_Array[ll_Count] = Mid (as_source, ll_start, Len (as_source))

//Return the number of entries found
Return ll_Count

end function

public function string of_gettoken (ref string as_source, string as_separator);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetToken
//	Arguments:			as_source		The source string passed by reference
//							as_separator	Separator character in the source string which will be 
//												used to determine the length of characters to strip from
//												the left end of the source string.
//	Returns:  			string
//							The token stripped off of the source string.
//							If the separator character does not appear in the string, 
//							the entire source string is returned.
//							Otherwise, it returns the token stripped off of the left
//							end of the source string (not including the separator character)
//							If any argument's value is NULL, function returns NULL.
//	Description:  		This function strips a source string (from the left) up 
//							to the occurrence of a specified separator character.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						8.0  Changed li_pos variable to type long ll_pos
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
long 		ll_pos
string 	ls_ret

//Check parameters
If IsNull(as_source) or IsNull(as_separator) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

/////////////////////////////////////////////////////////////////////////////////
// Get the position of the separator
/////////////////////////////////////////////////////////////////////////////////
ll_pos = Pos(as_source, as_separator)	

/////////////////////////////////////////////////////////////////////////////////
// Compute the length of the token to be stripped off of the source string.
/////////////////////////////////////////////////////////////////////////////////

// If no separator, the token to be stripped is the entire source string
if ll_pos = 0 then
	ls_ret = as_source
	as_source = ""	
else
	// Otherwise, return just the token and strip it & the separator from the source string
	ls_ret = Mid(as_source, 1, ll_pos - 1)
	as_source = Right(as_source, Len(as_source) - (ll_pos+Len(as_separator)-1) )
end if

return ls_ret
end function

public function string of_padleft (string as_source, long al_length);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PadLeft
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	al_length		The desired length of the string.
//
//	Returns:  		String
//						A string of length al_length wich contains as_source with
//						spaces added to its left.
//						If any argument's value is NULL, function returns NULL.
//						If al_length is less or equal to length of as_source, the 
//						function returns the original as_source.
//
//	Description:  	Pad the original string with spaces on its left to make it of
//					   the desired length.
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

string	ls_return

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(al_length) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Check for the lengths
If al_length <= Len(as_Source) Then
	//Return the original string
	Return as_source
End If

//Create the left padded string
ls_return = space(al_length - Len(as_Source)) + as_source

//Return the left padded string
Return ls_return
end function

public function string of_padright (string as_source, long al_length);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PadRight
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	al_length		The desired length of the string.
//
//	Returns:  		String
//						A string of length al_length wich contains as_source with
//						spaces added to its right.
//						If any argument's value is NULL, function returns NULL.
//						If al_length is less or equal to length of as_source, the 
//						function returns the original as_source.
//
//	Description:  	Pad the original string with spaces on its right to make it of
//					   the desired length.
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

string	ls_return

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(al_length) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Check for the lengths
If al_length <= Len(as_Source) Then
	//Return the original string
	Return as_source
End If

//Create the right padded string
ls_return = as_source + space(al_length - Len(as_Source))

//Return the right padded string
Return ls_return
end function

public function boolean of_islower (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsLower
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains lowercase characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only lowercase 
//						characters.
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

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If as_source = Lower(as_source) Then
	Return True
Else
	Return False
End If
end function

public function boolean of_isupper (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsUpper
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains uppercase characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only uppercase 
//						characters.
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

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If as_source = Upper(as_source) Then
	Return True
Else
	Return False
End If
end function

public function boolean of_iswhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsWhiteSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains White Space characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only White Space
//						characters. White Space characters include Newline, Tab,
//						Vertical tab, Carriage return, Formfeed, and Backspace.
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

long 		ll_count=0
long 		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source


//Perform loop around all characters
//Quit loop if Non WhiteSpace character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=8	or			/* BackSpae */		 		& 
		li_ascii=9 	or			/* Tab */		 			& 
		li_ascii=10 or			/* NewLine */				& 
		li_ascii=11 or			/* Vertical Tab */		& 
		li_ascii=12 or			/* Form Feed */			& 
		li_ascii=13 or			/* Carriage Return */	&
		li_ascii=32 Then		/* Space */		
		//Character is a WhiteSpace.
		//Continue with the next character.
	Else
		/* Character is Not a White Space. */
		Return False
	End If
loop
	
// Entire string is White Space.
return True

end function

public function boolean of_isalpha (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsAlpha
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains alphabetic characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only alphabetic
//						characters.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Alpha character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// 'A'=65, 'Z'=90, 'a'=97, 'z'=122
	if li_ascii<65 or (li_ascii>90 and li_ascii<97) or li_ascii>122 then
		/* Character is Not an Alpha */
		Return False
	end if
loop
	
// Entire string is alpha.
return True
end function

public function boolean of_isalphanum (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsAlphaNum
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains alphabetic and Numeric
//						characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only alphabetic and
//						numeric characters.
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

long ll_count=0
long ll_length
char lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters.
//Quit loop if Non Alphanemeric character is found.
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// '0'= 48, '9'=57, 'A'=65, 'Z'=90, 'a'=97, 'z'=122
	If li_ascii<48 or (li_ascii>57 and li_ascii<65) or &
		(li_ascii>90 and li_ascii<97) or li_ascii>122 then
		/* Character is Not an AlphaNumeric */
		Return False
	end if
loop
	
// Entire string is AlphaNumeric.
return True

end function

public function string of_quote (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Quote
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		String
//						The original string enclosed in quotations.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Enclose the original string in quotations.
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

//Check parameters
If IsNull(as_source) Then
	Return as_source
End If

// Enclosed original string in quotations.
return '"' + as_source + '"'

end function

public function boolean of_isspace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains space characters. 
//						False if the string is empty or if it contains other
//						non-space characters.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only space characters.
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

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Check for an empty string
If Len(as_source)=0 Then
	Return False
End If

If Trim(as_source) = '' Then
	// Entire string is made of spaces.
	return True
end if

//String is not made up entirely of spaces.
Return False

end function

public function boolean of_ispunctuation (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsPunctuation
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains punctuation characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only punctuation
//						characters.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Punctuation character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=33 or			/* '!' */		 & 
		li_ascii=34 or			/* '"' */		 & 
		li_ascii=39 or			/* ''' */		 & 
		li_ascii=44 or			/* ',' */		 & 
		li_ascii=46 or			/* '.' */		 & 
		li_ascii=58 or			/* ':' */		 & 
		li_ascii=59 or			/* ';' */		 & 	
		li_ascii=63 Then 		/* '?' */
		//Character is a punctuation.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is punctuation.
return True

end function

public function long of_lastpos (string as_source, string as_target, long al_start);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LastPos	
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Target		The being searched for.
//	al_start			The starting position, 0 means start at the end.
//
//	Returns:  		Long	
//						The position of as_Target.
//						If as_Target is not found, function returns a 0.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Search backwards through a string to find the last occurrence 
//						of another string.
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

Long	ll_Cnt, ll_Pos

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(as_target) or IsNull(al_start) Then
	SetNull(ll_Cnt)
	Return ll_Cnt
End If

//Check for an empty string
If Len(as_Source) = 0 Then
	Return 0
End If

// Check for the starting position, 0 means start at the end.
If al_start=0 Then  
	al_start=Len(as_Source)
End If

//Perform find
For ll_Cnt = al_start to 1 Step -1
	ll_Pos = Pos(as_Source, as_Target, ll_Cnt)
	If ll_Pos = ll_Cnt Then 
		//String was found
		Return ll_Cnt
	End If
Next

//String was not found
Return 0

end function

public function long of_lastpos (string as_source, string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LastPos	
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Target		The string being searched for.
//
//	Returns:  		Long	
//						The position of as_Target.
//						If as_Target is not found, function returns a 0.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  Search backwards through a string to find the last occurrence of another string
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

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(as_target) Then
	Long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Set the starting position and perform the search
Return of_LastPos (as_source, as_target, Len(as_Source))

end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Implement new, more efficient algorithm; Also provide access to the
//       original (legacy) algorithm.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

string ls_result

// Which algorithm/method is to be used?
Choose Case ii_globalreplacemethod
	Case CST_GLOBALREPLACE_NEW
		ls_result = this.of_GlobalReplaceNew( as_source, as_old, as_new, ab_ignorecase)
	Case CST_GLOBALREPLACE_LEGACY
		ls_result = this.of_GlobalReplaceLegacy( as_source, as_old, as_new, ab_ignorecase)
	Case Else
		SetNull(ls_result)
End Choose

Return ls_result
end function

public function string of_globalreplace (string as_source, string as_old, string as_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// 
//Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
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

//Check parameters

If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//The default is to ignore Case
as_Source = of_GlobalReplace (as_source, as_old, as_new, True)

Return as_Source


end function

public function long of_countoccurrences (string as_source, string as_target, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CountOccurrences
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string in which to search.
//	as_Target		The string to search for.
//	ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns: 		long
//						The number of occurrences of as_Target in as_source.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Count the occurrences of one string within another.
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

Long	ll_Count, ll_Pos, ll_Len

//Check for parameters
If IsNull(as_source) or IsNull(as_target) or IsNull(ab_ignorecase) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Should function ignore case?
If ab_ignorecase Then
	as_source = Lower(as_source)
	as_target = Lower(as_target)
End If

ll_Len = Len(as_Target)
ll_Count = 0

ll_Pos = Pos(as_source, as_Target)

Do While ll_Pos > 0
	ll_Count ++
	ll_Pos = Pos(as_source, as_Target, (ll_Pos + ll_Len))
Loop

Return ll_Count

end function

public function string of_righttrim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end 
//							of a string.
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

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=True, NonPrintCharacters=False
return of_RightTrim (as_source, True, False)
end function

public function string of_lefttrim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning of a string.
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

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=True, NonPrintCharacters=False
return of_LeftTrim (as_source, True, False)
end function

public function string of_lefttrim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning of a string.
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

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If


// Remove spaces=ab_remove_spaces, NonPrintCharacters=False
return of_LeftTrim (as_source, ab_remove_spaces, False)
end function

public function string of_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the beginning of a string.
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

char		lc_char
boolean	lb_char
boolean	lb_printable_char

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the beginning of a string.
	do while Len (as_source) > 0 and not lb_char
		lc_char = as_source
		if of_IsPrintable(lc_char) and Not of_IsSpace(lc_char) then
			lb_char = true
		else
			as_source = Mid (as_source, 2)
		end if
	loop
	return as_source
ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the beginning of a string.
	do while Len (as_source) > 0 and not lb_printable_char
		lc_char = as_source
		if of_IsPrintable(lc_char) then
			lb_printable_char = true
		else
			as_source = Mid (as_source, 2)
		end if
	loop
	return as_source
ElseIf ab_remove_spaces Then
	//Remove spaces from the beginning of a string.
	return LeftTrim(as_source)
End If

return as_source


end function

public function string of_righttrim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end 
//							of a string.
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

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=ab_remove_spaces, NonPrintCharacters=False
return of_RightTrim (as_source, ab_remove_spaces, False)
end function

public function string of_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right
//						end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end of
//							a string.
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

boolean	lb_char
char		lc_char
boolean	lb_printable_char

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the end of a string.
	do while Len (as_source) > 0 and not lb_char
		lc_char = Right (as_source, 1)
		if of_IsPrintable(lc_char) and Not of_IsSpace(lc_char) then
			lb_char = true
		else
			as_source = Left (as_source, Len (as_source) - 1)
		end if
	loop
	return as_source
	
ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the end of a string.
	do while Len (as_source) > 0 and not lb_printable_char
		lc_char = Right (as_source, 1)
		if of_IsPrintable(lc_char) then
			lb_printable_char = true
		else
			as_source = Left (as_source, Len (as_source) - 1)
		end if
	loop
	return as_source
	
ElseIf ab_remove_spaces Then
	//Remove spaces from the end of a string.
	return RightTrim(as_source)
End If

return as_source
end function

public function string of_trim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
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

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove Spaces=True, NonPrintCharacters=False
return of_Trim (as_source, True, False)

end function

public function string of_trim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
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

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove Spaces=ab_remove_spaces, NonPrintCharacters=False
return of_Trim (as_source, ab_remove_spaces, False)

end function

public function string of_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left and 
//						right end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
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

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the beginning and end 
	// of a string.
	as_source = of_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = of_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)

ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the beginning and end
	// of a string.
	as_source = of_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = of_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)

ElseIf ab_remove_spaces Then
	//Remove spaces from the beginning and end of a string.
	as_source = Trim(as_source)

End If

return as_source
end function

public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetKeyValue
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be searched.
//	as_keyword		The keyword to be searched for.
//	as_separator	The separator character used in the source string.
//
//	Returns:  		string	
//						The value found for the keyword.
//						If no matching keyword is found, an empty string is returned.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Gets the value portion of a keyword=value pair from a string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Make function find only an exact match of the keyword
//	12.5	accept spaces after separator (#11014)
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

boolean	lb_done=false
integer	li_keyword, li_separator, li_equal
string	ls_keyvalue, ls_source, ls_exact

//Check parameters
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_separator) Then
	string ls_null
	SetNull (ls_null)
	Return ls_null
End If

//Initialize key value
ls_keyvalue = ''

do while not lb_done
	li_keyword = Pos (Lower(as_source), Lower(as_keyword))
	if li_keyword > 0 then
		ls_source = as_source
		as_source = LeftTrim(Right(as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		// see if this is an exact match.  Either the match will be at the start of the string or
		// the match will be after a separator character.  So check for both cases

		// accept spaces after separator (#11014)
		li_equal = LastPos (ls_source, as_separator, li_keyword - 1)
		IF li_equal > 0 THEN 
			li_equal += Len(as_separator)
			IF Trim (Mid (ls_source, li_equal, li_keyword - li_equal)) > "" THEN continue
		ELSE
			IF Trim (Left (ls_source, li_keyword - 1)) > "" THEN continue
		END IF

		if Left(as_source, 1) = "=" then
			li_separator = Pos (as_source, as_separator, 2)
			if li_separator > 0 then
				ls_keyvalue = Mid(as_source, 2, li_separator - 2)
			else
				ls_keyvalue = Mid(as_source, 2)
			end if
			ls_keyvalue = Trim(ls_keyvalue)
			lb_done = true
		end if
	else
		lb_done = true
	end if
loop

return ls_keyvalue
end function

public function integer of_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetKeyValue
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to have the set performed on.  Passed by reference.
//							Format:  keyword = value; ...
//	as_keyword		The keyword to set a value for.
//	as_keyvalue		The new value for the specified keyword.
//	as_separator	The separator character used in the source string.
//
//	Returns:			integer
//						1 Successful operation.
//						-1 The specified keywork did not exist in the source string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:	Sets the value portion of a keyword=value pair from a string
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	12.5  accept spaces after separator
//			do not check if only partial match of keyword (#11014)
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


integer	li_found=-1
integer	li_keyword, &
			li_separator, &
			li_equal
string	ls_temp

//Check paramemeters
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_keyvalue) or IsNull(as_separator) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

do 
	li_keyword = Pos (Lower(as_source), Lower(as_keyword), li_keyword + 1)
	if li_keyword > 0 then
		ls_temp = LeftTrim (Right (as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		
		// #11014
		// - do not change if only partial match of keyword
		// - accept spaces after separator
		li_equal = LastPos (as_source, as_separator, li_keyword - 1)
		IF li_equal > 0 THEN 
			li_equal += Len(as_separator)
			IF Trim (Mid (as_source, li_equal, li_keyword - li_equal)) > "" THEN continue
		ELSE
			IF Trim (Left (as_source, li_keyword - 1)) > "" THEN continue
		END IF
		
		if Left (ls_temp, 1) = "=" then
			li_equal = Pos (as_source, "=", li_keyword + 1)
			li_separator = Pos (as_source, as_separator, li_equal + 1)
			if li_separator > 0 then
				as_source = Left(as_source, li_equal) + as_keyvalue + as_separator + Right(as_source, Len(as_source) - li_separator)
			else
				as_source = Left(as_source, li_equal) + as_keyvalue
			end if
			li_found = 1
		end if
	end if
loop while li_keyword > 0

return li_found
end function

public function string of_removenonprint (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RemoveNonPrint
//
//	Access:  		public

//
//	Arguments:
//	as_source		The string from which all nonprint characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all nonprint characters.
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

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove nonprintable characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if of_IsPrintable(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function boolean of_isempty (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsEmpty
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string has a lenght of 0 or is NULL.
//
//	Description:  	Determines whether a string has a lenght of 0 or is NULL.
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

if IsNull(as_source) or Len(as_source)=0 then
	//String is empty
	Return True
end if
	
//String is Not empty
return False
end function

public function boolean of_isprintable (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsPrintable
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Printable characters.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string is composed entirely of 
//						Printable characters.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if NonPrintable character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// 'space'=32, '~'=126
	if li_ascii<32 or li_ascii>126 then
		/* Not a printable character */
		Return False
	end if
loop
	
// Entire string is of printable characters.
return True

end function

public function boolean of_isformat (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsFormat
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Formatting characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Formatting
//						characters.  Format characters for this function
//						are all printable characters that are not AlphaNumeric.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If (li_ascii>=33 and li_ascii<=47) or &
		(li_ascii>=58 and li_ascii<=64) or &
		(li_ascii>=91 and li_ascii<=96) or &
		(li_ascii>=123 and li_ascii<=126) Then
		//Character is a Format.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of Format characters.
return True

end function

public function string of_removewhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
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

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove WhiteSpace characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not of_IsWhiteSpace(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function boolean of_IsComparisonOperator (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsComparisonOperator
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Comparison Operator
//						characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Comparison
//						Operator characters.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=60 or			/* < less than */	 & 
		li_ascii=61 or			/* = equal */		 & 
		li_ascii=62 Then		/* > greater than */
		//Character is an Comparison Operator.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of Comparison Operators.
return True

end function

public function boolean of_IsArithmeticOperator (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsArithmeticOperator
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Arithmetic Operator
//						characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Arithmetic
//						Operator characters.
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

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=40 or			/* ( left parenthesis */	 & 
		li_ascii=41 or			/* ) right parenthesis */	 & 
		li_ascii=43 or			/* + addition */				 & 
		li_ascii=45 or			/* - subtraction */			 & 
		li_ascii=42 or			/* * multiplication */		 & 
		li_ascii=47 or			/* / division */				 & 
		li_ascii=94 Then		/* ^ power */	
		//Character is an operator.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of arithmetic operators.
return True

end function

public function long of_countoccurrences (string as_source, string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CountOccurrences
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string in which to search.
//	as_Target		The string to search for.
//
//	Returns: 		long
//						The number of occurrences of as_Target in as_source.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Count the occurrences of one string within another.
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

Long	ll_Count

//Check for parameters
If IsNull(as_source) or IsNull(as_target) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Default is to ignore case.
ll_Count = of_CountOccurrences (as_source, as_target, True)

Return ll_Count

end function

public function long of_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		The array of string to be moved into a single string.
//	as_Delimiter	The delimeter string.
//	as_ref_string	The string to be filled with the array of strings,
//						passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//						Note: Function will not include on the single string any 
//								array entries which match an empty string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Redirect to the overloaded function version, which allows optional 
//			processing of an empty string.  The default behavior is to dissallow 
//			empty string to remain backwards compatible.  Call the 4 argument 
//			version of the function if the empty string processing is desired.
//	12.5	Process empty items by default so the behavior is invers to of_parsetoarray (#11020)
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

return of_arraytostring(as_source[], as_delimiter, TRUE, as_ref_string)

end function

public function long of_arraytostring (string as_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		 The array of string to be moved into a single string.
//	as_Delimiter	 The delimeter string.
//	ab_processempty Whether to process empty string as_source members.
//	as_ref_string	 The string to be filled with the array of strings,
//						 passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	7.0   Initial version
//			Overloaded an existing of_arraytostring to optionally allow processing 
//			of empty string arguments.
//	12.5	Changed: Now optionally ignore empty string arguments (#11020)
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

long		ll_Count, ll_ArrayUpBound

//Get the array size
ll_ArrayUpBound = UpperBound(as_source[])

//Check parameters
IF IsNull(as_delimiter) or (Not ll_ArrayUpBound>0) Then
	Return -1
End If

//Reset the Reference string
as_ref_string = ''

If Not ab_processempty Then
	For ll_Count = 1 to ll_ArrayUpBound
		// Do not include any entries that match an empty string 
		If as_source[ll_Count] <> '' Then
			If Len(as_ref_string) = 0 Then
				//Initialize string
				as_ref_string = as_source[ll_Count]
			else
				//Concatenate to string
				as_ref_string = as_ref_string + as_delimiter + as_source[ll_Count]
			End If
		End If
	Next 
Else
	For ll_Count = 1 to ll_ArrayUpBound
		// Include any entries that match an empty string 
		If ll_Count = 1 Then
			//Initialize string
			as_ref_string = as_source[ll_Count]
		else
			//Concatenate to string
			as_ref_string = as_ref_string + as_delimiter + as_source[ll_Count]
		End If
	Next 
End If
return 1

end function

public function string of_wordcap (string as_source);//////////////////////////////////////////////////////////////////////////////
//	Public Function: 	of_WordCap
//	Arguments:		as_source		The source string.
//	Returns:  		String			Returns string with the first letter of each word set to
//											uppercase and the remaining letters lowercase if it succeeds
//											and NULL if an error occurs.
//											If any argument's value is NULL, function returns NULL.
//	Description:  	Sets the first letter of each word in a string to a capital 
//						letter and all other letters to lowercase (for example, 
//						ROBERT E. LEE would be Robert E. Lee).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						7.0	   Fix to not capitalize the next character after apostrophe
//						8.0  Changed to use new PowerScript WordCap function.
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
return WordCap ( as_source ) 
end function

public function boolean of_iswellformedemailaddress (string as_emailaddress, integer ai_emailaddresscheckrule);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_iswellformedemailaddress
//
//	Access: 			public
//
//	Arguments:
//	as_emailaddress					The Email address to check.
//	ai_emailaddresscheckrule		The optional Check rule to use, by default it used the hotmail rule.
//											Possible values are :
//											- cst_hotmail_rule, to apply HotMail validation rules, or
//											- cst_rfc_5321, to apply RFC 5321 validation rules.
//	Returns:  		Boolean
//						True, Ok
//						False, Not ok
//
//	Description:  	Check that the specified Email addres is well formed according to the specified validation rule.
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
 * Copyright (c) 2004-2013, All rights reserved.
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
 * Libraries see http://pfc.codeplex.com
*/
//
//////////////////////////////////////////////////////////////////////////////
Long	ll_length
Long	ll_tmp
Long	ll_pos
String ls_local_part
String ls_domain_part

// Empty Email Address are not allowed
if isnull( as_emailaddress ) or len( trim( as_emailaddress) ) = 0 then return false

// Email Address longer than 254 characters are not allowed
if len( as_emailaddress ) > 254 then return false

// Not handled Check rule are not allowed
choose case ai_emailaddresscheckrule
	case cst_hotmail_rule, cst_rfc_5321
		// valid continue
	case else
		return false
end choose

// Determine local & domain part of the email address by searching the @ sign
// if not found assurme it is not well formed
ll_pos = LastPos( as_emailaddress, "@")
if ll_pos = 0 then return false

ls_local_part = left( as_emailaddress, ll_pos - 1 )
ls_domain_part = mid( as_emailaddress, ll_pos + 1)

// Local part of Email Address can not be longer than 64 characters
ll_tmp = len( ls_local_part)
if ll_tmp = 0 or ll_tmp  > 64 then return false

// Compute allowed length of the domain part of the Emai Address
ll_length = 253 - ll_tmp 
ll_tmp = len( ls_domain_part)
if  ll_tmp = 0 or ll_tmp > ll_length then return false

// Apply specified validation rule for local part of Email Address
choose case ai_emailaddresscheckrule
	case cst_hotmail_rule
		// Do not allow following special characters
		if match( ls_local_part, '[!#%/`{|}]' ) = true then return false
		if pos( ls_local_part, "$" ) > 0 then return false
		if pos( ls_local_part, "^" ) > 0 then return false
		if pos( ls_local_part, "*" ) > 0 then return false
		
		// Allows alphanumerics
		if match( ls_local_part, "[a-zA-Z0-9]+" ) = false then return false
		
		// Allows dots but not at the beginning or at the end of local part
		// and not consecutive
		ll_pos = pos( ls_local_part, "." )
		if ll_pos = 1 or ll_pos = len( ls_local_part ) then return false
		if mid( ls_local_part, ll_pos + 1, 1) = "." then return false
		
	case cst_rfc_5321
		// Allows alphanumerics
		if match( ls_local_part, "[a-zA-Z0-9]+" ) = false then return false
		
		// Allows dot but not at the beginning or at the end of local part
		// and not consecutive
		ll_pos = pos( ls_local_part, "." )
		if ll_pos = 1 or ll_pos = len( ls_local_part ) then return false
		if mid( ls_local_part, ll_pos + 1, 1) = "." then return false
		
		// allows special characters but only between quotation marks
		if this.of_issurroundedby( ls_local_part , '"', "!#$%&'*+-/=?^_`{|}(),:;<>@[\]"+char(34)+char(32) ) = false then return false
		
end choose

return true
end function

public function boolean of_issurroundedby (string as_source, string as_begin_surrounding, string as_end_surrounding, string as_tobe_surrounded);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_of_issurroundedby
//
//	Access: 			public
//
//	Arguments:
//	as_source					The source string to check.
//	as_begin_surrounding	The string that correspond to the beginning of the surrounding characters combinaison
//	as_end_surrounding		Optional string that correspond to the endding of the surrounding characters combinaison (if not specified assume is equal to as_begin_surrounding
//	as_tobe_surrounded		The string that contains the characters to be checked there are found between the specified surrounding characters inside as_source.

//	Returns:  		Boolean
//						True, Ok
//						False, Not ok
//
//	Description:  	Check that the characters found between the specified surrounding characters combinaison are matching the list of allowed characters to be surrounded.
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
 * Copyright (c) 2004-2013, All rights reserved.
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
 * Libraries see http://pfc.codeplex.com
*/
//
//////////////////////////////////////////////////////////////////////////////
long	ll_i
long	ll_begin
long	ll_end
long	ll_pos
string	ls_tmp

// all parameters are mandatory
if isnull( as_source ) or len( as_source ) = 0 then return false
if isnull( as_begin_surrounding ) or len( as_begin_surrounding ) = 0 then return false
if isnull( as_end_surrounding ) or len( as_end_surrounding ) = 0 then return false
if isnull( as_tobe_surrounded ) or len( as_tobe_surrounded ) = 0 then return false

// verify that the begin & end surrounding characters are present in the source string
ll_begin = pos( as_source, as_begin_surrounding ) 
if ll_begin = 0 then return false

ll_end = pos( as_source, as_end_surrounding, ll_begin + 1  ) 
if  ll_end = 0 then return false

// Verify that the surrounding characters are located logically
if ll_begin > ll_end then return false

// Check that the characters between surrounding characters are included in the allowed characters to be surrounded
for ll_i = ll_begin +1  to ll_end - 1
	ls_tmp = mid(as_source, ll_i, 1)
	ll_pos = pos( as_tobe_surrounded, ls_tmp )
	if ll_pos = 0 then return false
next

return true
end function

public function boolean of_issurroundedby (string as_source, string as_surroundedby, string as_tobe_surrounded);return this.of_issurroundedby( as_source , as_surroundedby , as_surroundedby , as_tobe_surrounded )
end function

public function boolean of_iswellformedemailaddress (string as_emailaddress);return this.of_iswellformedemailaddress( as_emailaddress , this.cst_hotmail_rule  )
end function

public function string of_trimspecificleadchars (string as_source, string as_totrim);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_trimspecificleadchars
//
//	Access: 			public
//
//	Arguments:
//	as_source					The source string totrim.
//	as_totrim					The specific string that contains the leading chars to be trimmed from as_source.
//
//	Returns:  		String
//						Returns trimmed string, if no error occurs.
//						NULL, if an error occurs.
//
//	Description:  	Trim specified leading chars from the specified source string.
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
 * Copyright (c) 2004-2013, All rights reserved.
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
 * Libraries see http://pfc.codeplex.com
*/
//
//////////////////////////////////////////////////////////////////////////////

long	ll_length

// Every parameters are mandatory
if isnull( as_source ) or as_source = "" then return CST_NULL
if isnull( as_totrim ) or as_totrim = "" then return CST_NULL

// Source String length should be greater than the totrim string
ll_length = len( as_totrim )
if len(as_source) < ll_length then return CST_NULL

// Trim all leading occurences
do while left( as_source, ll_length ) = as_totrim
	as_source = mid( as_source, ll_length + 1)
loop

// Return result
return as_source

end function

public function string of_trimspecifictrailchars (string as_source, string as_totrim);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_trimspecifictrailchars
//
//	Access: 			public
//
//	Arguments:
//	as_source					The source string to trim.
//	as_totrim					The specific string that contains the leading chars to be trimmed from as_source.
//
//	Returns:  		String
//						Returns trimmed string, if no error occurs.
//						NULL, if an error occurs.
//
//	Description:  	Trim specified trailing chars from the specified source string.
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
 * Copyright (c) 2004-2013, All rights reserved.
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
 * Libraries see http://pfc.codeplex.com
*/
//
//////////////////////////////////////////////////////////////////////////////

long	ll_length
long	ll_tmp

// Every parameters are mandatory
if isnull( as_source ) or as_source = "" then return CST_NULL
if isnull( as_totrim ) or as_totrim = "" then return CST_NULL

// Source String length should be greater than the totrim string
ll_length = len( as_totrim )
if len(as_source) < ll_length then return CST_NULL

// Trim all trailling occurences
do while Right( as_source, ll_length ) = as_totrim
	ll_tmp = Len( as_source ) - ll_length
	as_source = left( as_source, ll_tmp)
loop

// Return result
return as_source

end function

public function string of_globalreplacelegacy (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplaceLegacy
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Copy of the original of_GlobalReplace method; Maintains availability
//       of this method while it is replace with a newer, more efficient one.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
Else
	ls_source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop

Return as_Source
end function

public function string of_globalreplacenew (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_GlobalReplaceNew
//
// Access:        public
//
// Arguments:
// as_Source      The string being searched.
// as_Old         The old string being replaced.
// as_New         The new string.
// ab_IgnoreCase  A boolean stating to ignore case sensitivity.
//
// Returns:       string
//                as_Source with all occurrences of as_Old replaced with as_New.
//                If any argument's value is NULL, function returns NULL.
//
// Description:   Replace all occurrences of one string inside another with
//                a new string.
//
// Usage Notes:   This method implements an alternative algoithm that is
//                designed to be more efficient (hence, faster) than the
//                original method. The gain in performance is due to avoidance
//                of the "Replace" PowerScript string function.
//
//                The original method has been renamed to of_GlobalReplaceLegacy.
//                It can be invoked explicitly, or by first invoking:
//
//                   of_SetGlobalReplaceMethod( lnv_string.CST_GLOBALREPLACE_LEGACY)
//
//                and then using of_GlobalReplace.
//
//                The new method appears to be approx. 50-60% faster than the
//                original method.
//
//                Disclaimer: The above statements are not to be construed as
//                a guarantee of improved performance. Your mileage may vary.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5  Initial version
// 		Implemented proposed fix included in Issue #11034 - 07/28/2014
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

long   ll_previousendpos, ll_start, ll_oldlen, ll_newlen, ll_sourcelen
string ls_copyofsource, ls_result

// Check for null parameters.
If IsNull(as_source) Or IsNull(as_old) Or IsNull(as_new) Or IsNull(ab_ignorecase) Then
	SetNull(ls_result)
	Return ls_result
End If

// How should differences in upper/lowercase be handled?
If ab_ignorecase Then
	// Ignore differences - Make sure everything used in comparisons is in lowercase.
	as_old = Lower(as_old)
	ls_copyofsource = Lower(as_source)
Else
	// Respect differences - Leave the source string as is.
	ls_copyofsource = as_source
End If

ll_sourcelen = Len(as_source)
ll_oldlen    = Len(as_old)
ll_newlen    = Len(as_new)

// Check for trivial case where the string to be found is longer than the string to be searched.
If ll_oldlen > ll_sourcelen Then Return as_source

// Perform the initial search. If no occurrences found, return the original, unchanged string.
ll_start = Pos(ls_copyofsource, as_old, 1)
If ll_start = 0 Then Return as_source

ls_result = ''
ll_previousendpos = 1

Do While ll_start > 0
	// Append everything between the end of last occurrence and the start of this occurrence?
	If ll_start > ll_previousendpos Then
		ls_result += Mid(as_source, ll_previousendpos, (ll_start - ll_previousendpos))
	End If

	// Append the replacement string and update the start offset to where next search must begin.
	If ll_newlen > 0 Then ls_result += as_new
	ll_previousendpos = ll_start + ll_oldlen
	
	// Look for the next occurrence of the string that is to be replaced.
	If ll_previousendpos > (ll_sourcelen - ll_oldlen + 1) Then Exit	//	Issue #11034 - 7/28/2014 (Changed)
	ll_start = Pos(ls_copyofsource, as_old, ll_previousendpos)
Loop

// Is there anything left that needs to be included?
If ll_previousendpos <= ll_sourcelen Then										//	Issue #11034 - 7/28/2014 (Changed)
	ls_result += Mid(as_source, ll_previousendpos)
End If

Return ls_result
end function

public function integer of_getglobalreplacemethod ();//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_GetGlobalReplaceMethod
//
// Access:        public
//
// Arguments:     (none)
//
// Returns:       integer     CST_GLOBALREPLACE_NEW (= 2)
//                              The new, more efficient method will be used.
//                            CST_GLOBALREPLACE_LEGACY (= 1)
//                              The original method will be used.
//
//	Description:  	Obtains an integer value that represents which of_GlobalReplace
//                method/technique will be used when of_GlobalReplace is used.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

Return this.ii_globalreplacemethod
end function

public function integer of_setglobalreplacemethod (integer ai_method);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_SetGlobalReplaceMethod
//
// Access:        public
//
// Arguments:
// ai_Method      integer     CST_GLOBALREPLACE_NEW (= 2)
//                              The new, more efficient method is to be used.
//                            CST_GLOBALREPLACE_LEGACY (= 1)
//                              The original method is to be used.
//
// Returns:       integer     SUCCESS (1)  - The requested method will be used.
//                            FAILURE (-1) - ai_Method is null or not valid.
//
//	Description:  	Specifies which of_GlobalReplace method/technique is to be
//                used when the of_GlobalReplace fn is used.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

If IsNull(ai_method) Then Return FAILURE

Choose Case ai_method
	Case CST_GLOBALREPLACE_NEW
		this.ii_globalreplacemethod = CST_GLOBALREPLACE_NEW
	Case CST_GLOBALREPLACE_LEGACY
		this.ii_globalreplacemethod = CST_GLOBALREPLACE_LEGACY
	Case Else
		Return FAILURE
End Choose

Return SUCCESS
end function

public function string of_removepunctuation (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RemovePunctuation
//
//	Access:  		public

//
//	Arguments:
//	as_source		The string from which all punctuation characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all punctuation characters.
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

char		lch_char
long		ll_pos = 1
long		ll_loop
string		ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove punctuation characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if of_IsPunctuation(lch_char) = false then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function string of_urlencode (string as_value);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_URLEncode
//
//	Access: 			public
//
//	Arguments:
// as_Value       String   value to encode for URL
//
//	Returns: 		String   The encoded value
//
//	Description:   Encodes a string to use as parameter in URL.
//			         - Not encoded chars (because not reserved for special use): 
//                      a - z, A - Z, 0 - 9
//			               - _ . ! ~ * ' ( )
//			         - Space: +
//			         - all other ASCII chars: %xy (xy = hex value of the char)
//			         - all non ASCII chars: converted into two or thee Bytes, each encoded as %xy
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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

string ls_return
char lc_char
long ll_i, ll_len
n_cst_numerical lnv_numerical


IF IsNull (as_value) THEN return ""

ll_len = Len (as_value)
FOR ll_i = 1 TO ll_len
	lc_char = Mid (as_value, ll_i, 1)
	IF (ASC ('A') <= ASC (lc_char) AND ASC (lc_char) <= ASC ('Z')) THEN		// 'A'..'Z'
		ls_return += string (lc_char)
		
	ELSEIF (ASC ('a') <= ASC (lc_char) AND ASC (lc_char) <= ASC ('z')) THEN	// 'a'..'z'
		ls_return += string (lc_char)
		
	ELSEIF (ASC ('0') <= ASC (lc_char) AND ASC (lc_char) <= ASC ('9')) THEN	// '0'..'9'
		ls_return += string (lc_char)
		
	ELSEIF (lc_char = ' ') THEN							// space
		ls_return += "+"
		
	ELSEIF (lc_char = '-' OR lc_char = '_'	OR & 		
				lc_char = '.' OR lc_char = '!' OR &
				lc_char = '~~' OR lc_char = '*' OR &
				lc_char = "'" OR lc_char = '(' OR &
				lc_char = ')') THEN 							// unreserved
		ls_return += string (lc_char)
		
	ELSEIF (ASC (lc_char) <= 127) THEN					// other ASCII
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (ASC (lc_char)), 2)
		
	ELSEIF (ASC (lc_char) <= 2047) THEN					// non-ASCII <= 0x7FF
		// 0xc0 | (lc_char >> 6)
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (lnv_numerical.of_bitwiseor (192, INT (ASC (lc_char) / 2^6))), 2)
		
		// 0x80 | (lc_char & 0x3F)
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (lnv_numerical.of_bitwiseor (128, lnv_numerical.of_bitwiseand (ASC (lc_char), 63))), 2)
		
	ELSE															// 0x7FF < lc_char <= 0xFFFF
		// 0xe0 | (lc_char >> 12)
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (lnv_numerical.of_bitwiseor (224, INT (ASC (lc_char) / 2^12))), 2)
		
		// 0x80 | ((lc_char >> 6) & 0x3F)
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (lnv_numerical.of_bitwiseor (128, lnv_numerical.of_bitwiseand (INT (ASC (lc_char) / 2^6), 63))), 2)
		
		// 0x80 | (lc_char & 0x3F)
		ls_return += "%" + Right ("00" + lnv_numerical.of_hex (lnv_numerical.of_bitwiseor (128, lnv_numerical.of_bitwiseand (ASC (lc_char), 63))), 2)
	END IF
NEXT

return ls_return

end function

on pfc_n_cst_string.create
call super::create
end on

on pfc_n_cst_string.destroy
call super::destroy
end on

event constructor;call super::constructor;SetNull( cst_null )

end event

