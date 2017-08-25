HA$PBExportHeader$pfc_n_cst_numerical.sru
$PBExportComments$PFC Base Numerical service
forward
global type pfc_n_cst_numerical from n_base
end type
end forward

global type pfc_n_cst_numerical from n_base autoinstantiate
end type

type prototypes
Subroutine CopyInt2UInt( ref UInt dest, ref Integer source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyUInt2Int( ref Integer dest, ref UInt source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyLong2ULong( ref ULong dest, ref Long source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyULong2Long( ref Long dest, ref ULong source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyBlob2ULong( ref ULong dest, ref Blob source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyULong2Blob( ref Blob dest, ref ULong source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyLongLong2Blob( ref Blob dest, ref LongLong source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyBlob2LongLong( ref LongLong dest, ref Blob source, Long copylength) Library "kernel32.dll" Alias For "RtlMoveMemory"

end prototypes

forward prototypes
public function string of_binary (long al_decimal)
public function long of_decimal (string as_binary)
public function long of_bitwiseand (long al_value1, long al_value2)
public function long of_bitwiseor (long al_value1, long al_value2)
public function long of_bitwisexor (long al_value1, long al_value2)
public function long of_bitwisenot (long al_value)
public function string of_numberbasestring (unsignedlong aul_value, unsignedinteger aui_base)
public function string of_numberbasestring (unsignedinteger aui_value, unsignedinteger aui_base)
public function string of_numberbasestring (long al_value, unsignedinteger aui_base)
public function string of_numberbasestring (integer ai_value, unsignedinteger aui_base)
public function string of_hex (unsignedinteger aui_value)
public function string of_hex (integer ai_value)
public function string of_hex (long al_value)
public function string of_hex (unsignedlong aul_value)
public function string of_octal (integer ai_value)
public function string of_octal (long al_value)
public function string of_octal (unsignedinteger aui_value)
public function string of_octal (unsignedlong aul_value)
public function boolean of_getbit (unsignedlong aul_decimal, unsignedinteger aui_bit)
public function boolean of_getbit (long al_decimal, unsignedinteger aui_bit)
public function boolean of_getbit (unsignedinteger aui_decimal, unsignedinteger aui_bit)
public function boolean of_getbit (integer ai_decimal, unsignedinteger aui_bit)
public function string of_binary (unsignedlong aul_decimal)
public function string of_binary (unsignedinteger aui_decimal)
public function string of_binary (integer ai_decimal)
public function unsignedlong of_bitwiseand (unsignedlong aul_value1, unsignedlong aul_value2)
public function unsignedinteger of_bitwiseand (unsignedinteger aui_value1, unsignedinteger aui_value2)
public function integer of_bitwiseand (integer ai_value1, integer ai_value2)
public function unsignedlong of_bitwiseor (unsignedlong aul_value1, unsignedlong aul_value2)
public function unsignedinteger of_bitwiseor (unsignedinteger aui_value1, unsignedinteger aui_value2)
public function integer of_bitwiseor (integer ai_value1, integer ai_value2)
public function unsignedlong of_bitwisenot (unsignedlong aul_value)
public function unsignedinteger of_bitwisenot (unsignedinteger aui_value)
public function integer of_bitwisenot (integer ai_value)
public function unsignedlong of_bitwisexor (unsignedlong aul_value1, unsignedlong aul_value2)
public function integer of_bitwisexor (integer ai_value1, integer ai_value2)
public function unsignedinteger of_bitwisexor (unsignedinteger aui_value1, unsignedinteger aui_value2)
public function unsignedlong of_decimal_ulong (string as_binary)
public function unsignedinteger of_decimal_uint (string as_binary)
public function integer of_decimal_int (string as_binary)
public function long of_decimal_long (string as_binary)
public function unsignedlong of_gethiword (longlong all_value)
public function unsignedlong of_getloword (longlong all_value)
public function string of_binary (longlong all_decimal)
public function longlong of_createlonglong (unsignedlong aul_hi, unsignedlong aul_lo)
public function longlong of_bitwiseand (longlong all_value1, longlong all_value2)
public function longlong of_bitwisenot (longlong all_value)
public function longlong of_bitwiseor (longlong all_value1, longlong all_value2)
public function longlong of_bitwisexor (longlong all_value1, longlong all_value2)
public function boolean of_getbit (longlong all_decimal, unsignedinteger aui_bit)
public function longlong of_decimal_longlong (string as_binary)
public function string of_hex (longlong all_value)
public function string of_numberbasestring (longlong all_value, unsignedinteger aui_base)
public function string of_binary (byte abyte_decimal)
public function string of_numberbasestring (byte abyte_value, unsignedinteger aui_base)
public function byte of_bitwiseand (byte abyte_value1, byte abyte_value2)
public function byte of_bitwisenot (byte abyte_value)
public function byte of_bitwiseor (byte abyte_value1, byte abyte_value2)
public function byte of_bitwisexor (byte abyte_value1, byte abyte_value2)
public function byte of_decimal_byte (string as_binary)
public function boolean of_getbit (byte abyte_decimal, unsignedinteger aui_bit)
public function string of_hex (byte abyte_value)
public function string of_octal (byte abyte_value)
public function string of_octal (longlong all_value)
public function byte of_setbit (byte abyte_value, unsignedinteger aui_bit, boolean ab_new)
public function integer of_setbit (integer ai_value, unsignedinteger aui_bit, boolean ab_new)
public function long of_setbit (long al_value, unsignedinteger aui_bit, boolean ab_new)
public function longlong of_setbit (longlong all_value, unsignedinteger aui_bit, boolean ab_new)
public function unsignedinteger of_setbit (unsignedinteger aui_value, unsignedinteger aui_bit, boolean ab_new)
public function unsignedlong of_setbit (unsignedlong aul_value, unsignedinteger aui_bit, boolean ab_new)
end prototypes

public function string of_binary (long al_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_decimal     Long: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Rewrite to correctly process negative decimal values.
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

string ls_null
ulong  aul_decimal

// Validate the argument.
SetNull(ls_null)
If IsNull(al_decimal) Then Return ls_null

// Copy the bit pattern in the signed long to an unsigned long so that
// the bit pattern can be decoded if the decimal value is negative.
CopyLong2ULong(aul_decimal, al_decimal, 4)

Return This.of_NumberBaseString(aul_decimal, 2)
end function

public function long of_decimal (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		Long
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
//
// Notes:         Has been superceded by of_Decimal_Long. Maintained for
//                backwards compatibility. It now handles negative numbers.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Rewrite to use new of_Decimal_Long method that has better arg validation
//       and handles setting of bit 32 correctly, if necessary. This function
//       used to return -1 if arg value was not valid -- However, -1 can be a
//       valid decimal return value. Therefore, null is now returned if the
//       arg value is not valid.
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

Long ll_decimal

ll_decimal = This.of_Decimal_Long(as_binary)
Return ll_decimal
end function

public function long of_bitwiseand (long al_value1, long al_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_Value1		Long: The first value to be used in the operation. (e.g. 55)
//	al_Value2		Long: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		Long
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (al_Value1 && al_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise AND    0000 0000 0000 0000 0000 0000 0010 0100 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Rewrite to use more efficient algorithm that does not need/use of_GetBit.
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

Long    ll_result
ULong   lul_value1, lul_value2, lul_temp

// Return null if any argument is null.
SetNull(ll_result)
If IsNull(al_value1) Or IsNull(al_value2) Then Return ll_result

// Copy the bit pattern in both arguments to unsigned longs, then use
// the overloaded version of the function to perform the bitwise AND.
CopyLong2ULong(lul_value1, al_value1, 4)
CopyLong2ULong(lul_value2, al_value2, 4)

lul_temp = This.of_BitwiseAnd(lul_value1, lul_value2)

// Copy the bit pattern of the AND-ed result into a signed long.
// The target variable must not be null when CopyULong2Long is called.
ll_result = 0
CopyULong2Long(ll_result, lul_temp, 4)
Return ll_result
end function

public function long of_bitwiseor (long al_value1, long al_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr
//
//	Access: 			public
//
//	Arguments:
//	al_Value1		Long: The first value to be used in the operation (e.g. 55).
//	al_Value2		Long: The second value to be used in the operation (e.g. 44).
//
//	Returns: 		Long
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, function returns null.
//
//	Description:   Performs a bitwise OR operation (al_Value1 || al_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise OR     0000 0000 0000 0000 0000 0000 0011 1111 = 63 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Rewrite to use more efficient algorithm that does not need/use of_GetBit.
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

Long    ll_result
ULong   lul_value1, lul_value2, lul_temp

// Return null if any argument is null.
SetNull(ll_result)
If IsNull(al_value1) Or IsNull(al_value2) Then Return ll_result

// Copy the bit pattern in both arg's to unsigned longs, then use
// the overloaded version of the function to perform the bitwise OR.
CopyLong2ULong(lul_value1, al_value1, 4)
CopyLong2ULong(lul_value2, al_value2, 4)

lul_temp = This.of_BitwiseOr(lul_value1, lul_value2)

// Copy the bit pattern of the OR-ed result into a signed long.
// The target variable must not be null when CopyULong2Long is called.
ll_result = 0
CopyULong2Long(ll_result, lul_temp, 4)
Return ll_result
end function

public function long of_bitwisexor (long al_value1, long al_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_Value1		Long: The first value to be used in the operation (e.g. 55).
//	al_Value2		Long: The second value to be used in the operation (e.g. 44).
//
//	Returns: 		Long
//						The result of the XOR operation (e.g. 27).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise exclusive OR operation (al_Value1 XOR al_Value2),
//						which exclusively ORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise XOR    0000 0000 0000 0000 0000 0000 0001 1011 = 27 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5  Rewrite to use more efficient algorithm that does not need/use of_GetBit.
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

Long    ll_result
ULong   lul_value1, lul_value2, lul_temp

// Return null if any argument is null.
SetNull(ll_result)
If IsNull(al_value1) Or IsNull(al_value2) Then Return ll_result

// Copy the bit pattern in both arg's to unsigned longs, then use
// the overloaded version of the function to perform the bitwise XOR.
CopyLong2ULong(lul_value1, al_value1, 4)
CopyLong2ULong(lul_value2, al_value2, 4)

lul_temp = This.of_BitwiseXor(lul_value1, lul_value2)

// Copy the bit pattern of the XOR-ed result into a signed long.
// The target variable must not be null when CopyULong2Long is called.
ll_result = 0
CopyULong2Long(ll_result, lul_temp, 4)
Return ll_result
end function

public function long of_bitwisenot (long al_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_Value       Long: The value to be used in the operation (e.g. 55)
//
//	Returns: 		Long
//						The result of the NOT operation (e.g. -56)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! al_Value),
//						which reverses each bit.
//						(! 55) = -56
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                Bitwise NOT  = 1111 1111 1111 1111 1111 1111 1100 1000
//                             = -56 (decimal, signed long)
//
// Notes:         Negating the hi-order bit changes the value between positive
//                and negative.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0     Initial version
// 5.0.02  Fixed function from returning negative wrong value
// 12.5    Rewrite to use more efficient algorithm that does not need/use
//         of_Binary and of_Decimal conversion functions.
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

Long    ll_result
ULong   lul_value, lul_temp

// Return null if the argument is null.
SetNull(ll_result)
If IsNull(al_value) Then Return ll_result

// Copy the bit pattern in the argument to an unsigned long, then use
// the overloaded version of the function to perform the bitwise NOT.
CopyLong2ULong(lul_value, al_value, 4)

lul_temp = This.of_BitwiseNot(lul_value)

// Copy the bit pattern of the negated result into a signed long.
// The target variables must not be null when CopyULong2Long is called.
ll_result = 0
CopyULong2Long(ll_result, lul_temp, 4)
Return ll_result
end function

public function string of_numberbasestring (unsignedlong aul_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aul_value      The numeric value to be converted.
// aui_base       The numeric base (2-16) to convert the value into.
//
//	Returns:       string
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts an unsigned long (4-byte) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 5831 (decimal) -> '1011011000111' (base 2)
//                                        -> '13307'         (base 8, or octal)
//                                        -> '5831'          (base 10)
//                                        -> '16c7'          (base 16, or hexadecimal)
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

uint   lui_unsigned
char   lc_digit[0 To 15] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
string ls_result

// Return null if either argument is null.
SetNull(ls_result)
If IsNull(aul_value) Or IsNull(aui_base) Then Return ls_result

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_result

ls_result = ''

Do While aul_value > 0
	ls_result = lc_digit[Mod(aul_value,aui_base)] + ls_result
	aul_value /= aui_base
Loop

If ls_result = '' Then ls_result = '0'

Return ls_result
end function

public function string of_numberbasestring (unsignedinteger aui_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aui_value      The numeric value to be converted.
// aui_base       The numeric base (2-16) to convert the value into.
//
//	Returns:       string
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts an unsigned integer (2-byte) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 5831 (decimal) -> '1011011000111' (base 2)
//                                        -> '13307'         (base 8, or octal)
//                                        -> '5831'          (base 10)
//                                        -> '16c7'          (base 16, or hexadecimal)
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

char   lc_digit[0 To 15] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
string ls_result

// Return null if either argument is null.
SetNull(ls_result)
If IsNull(aui_value) Or IsNull(aui_base) Then Return ls_result

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_result

ls_result = ''

Do While aui_value > 0
	ls_result = lc_digit[Mod(aui_value,aui_base)] + ls_result
	aui_value /= aui_base
Loop

If ls_result = '' Then ls_result = '0'

Return ls_result
end function

public function string of_numberbasestring (long al_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	al_value       The numeric value to be converted.
// aui_base       The numeric base (2-16) to convert the value into.
//
//	Returns:       string
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts a signed long (4-byte) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 5831 (decimal) -> (base  2) '1011011000111'
//                                        -> (base  8) '13307'
//                                        -> (base 10) '5831'
//                                        -> (base 16) '16c7'
//
//                         -956 (decimal) -> (base  2) '11111111111111111111110001000100'
//                                        -> (base  8) '37777776104'
//                                        -> (base 10) '4294966340' * SEE NOTE
//                                        -> (base 16) 'fffffc44'
//
// Notes:         A PB long is a signed, 4-byte whole number. All possible
//                values are stored in 32 bits. The hi-order bit determines
//                whether the value is positive (bit=0) or negative (bit=1).
//
//                In addition to the hi-order bit being set to 1, a negative
//                value is stored in "2's complement" form. Thus, the decimal
//                value 15 is stored as the binary pattern:
//
//                   0000 0000 0000 0000 0000 0000 0000 1111
//
//                The decimal value -15 is stored as the binary pattern:
//
//                   1111 1111 1111 1111 1111 1111 1111 0001
//
//                and NOT as the binary pattern for 15 with the sign bit on.
//
//                In order to faithfully represent the bit pattern for negative
//                values, the memory contents of the 4-byte long integer are first
//                copied into a 4-byte unsignedlong integer, then converted to the
//                requested numeric base.
//
//                The binary pattern for -15 in a (signed) long is identical
//                to the binary pattern for 4294967281 in an unsignedlong.
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

ulong  lul_value
string ls_null

// Return null if either argument is null.
SetNull(ls_null)
If IsNull(al_value) Or IsNull(aui_base) Then Return ls_null

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_null

// Copy the memory contents of the signed 4-byte long number into
// an unsigned long to preserve the original value's bit pattern.
CopyLong2ULong(lul_value, al_value, 4)

Return This.of_NumberBaseString(lul_value, aui_base)
end function

public function string of_numberbasestring (integer ai_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	ai_value       The numeric value to be converted.
// aui_base       The numeric base (2-16) to convert the value into.
//
//	Returns:       string
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts a signed integer (2-byte) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 5831 (decimal) -> (base  2) '1011011000111'
//                                        -> (base  8) '13307'
//                                        -> (base 10) '5831'
//                                        -> (base 16) '16c7'
//
//                         -956 (decimal) -> (base  2) '1111110001000100'
//                                        -> (base  8) '176104'
//                                        -> (base 10) '64580' * SEE NOTES
//                                        -> (base 16) 'fc44'
//
// Notes:         A PB integer is a signed, 2-byte whole number. All possible
//                values are stored in 16 bits. The hi-order bit determines
//                whether the value is positive (bit=0) or negative (bit=1).
//
//                In addition to the hi-order bit being set to 1, a negative
//                value is stored in "2's complement" form. Thus, the decimal
//                value 15 is stored as the binary pattern:
//
//                   0000 0000 0000 1111
//
//                The decimal value -15 is stored as the binary pattern:
//
//                   1111 1111 1111 0001
//
//                and NOT as the binary pattern for 15 with the sign bit on.
//
//                In order to faithfully represent the bit pattern for negative
//                values, the memory contents of the 2-byte integer are first
//                copied into a 2-byte unsigned integer, then converted to the
//                requested numeric base.
//
//                The binary pattern for -15 in a signed integer is identical
//                to the binary pattern for 65521 in an unsigned integer.
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

uint   lui_value
ulong  lul_value
string ls_null

// Return null if either argument is null.
SetNull(ls_null)
If IsNull(ai_value) Or IsNull(aui_base) Then Return ls_null

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_null

// Copy the memory contents of the signed 2-byte integer number into
// an unsigned integer to preserve the original value's bit pattern.
CopyInt2UInt(lui_value, ai_value, 2)
lul_value = lui_value

Return This.of_NumberBaseString(lul_value, aui_base)
end function

public function string of_hex (unsignedinteger aui_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aui_value      UnsignedInteger: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts an unsigned integer (2-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 673 (decimal) -> "2a1"
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

string ls_null

SetNull(ls_null)
If IsNull(aui_value) Then Return ls_null

Return This.of_NumberBaseString(aui_value, 16)
end function

public function string of_hex (integer ai_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	ai_value       Integer: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed integer (2-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 673 (decimal) -> "2a1"
//                         -15 (decimal) -> "fff1"
//
//                Please refer to the Notes section in the of_NumberBaseString
//                function (for signed integers) for more information about
//                the conversion of negative values to other numeric bases.
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

string ls_null

SetNull(ls_null)
If IsNull(ai_value) Then Return ls_null

Return This.of_NumberBaseString(ai_value, 16)
end function

public function string of_hex (long al_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	al_value       Long: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed long (4-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 673 (decimal) -> "2a1"
//                         -15 (decimal) -> "fffffff1"
//
//                Please refer to the Notes section in the of_NumberBaseString
//                function (for signed longs) for more information about
//                the conversion of negative values to other numeric bases.
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

string ls_null

SetNull(ls_null)
If IsNull(al_value) Then Return ls_null

Return This.of_NumberBaseString(al_value, 16)
end function

public function string of_hex (unsignedlong aul_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aul_value      UnsignedLong: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts an unsigned long (4-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 673 (decimal) -> "2a1"
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

string ls_null

SetNull(ls_null)
If IsNull(aul_value) Then Return ls_null

Return This.of_NumberBaseString(aul_value, 16)
end function

public function string of_octal (integer ai_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	ai_value       Integer: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed integer (2-byte) value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is peformed.
//
//                Example: 673 (decimal) -> "1241"
//                         -15 (decimal) -> "177761"
//
// Notes:         Please refer to the Notes section in the of_NumberBaseString
//                function (for signed integers) for more information about
//                the conversion of negative values to other numeric bases.
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

string ls_null

SetNull(ls_null)
If IsNull(ai_value) Then Return ls_null

Return This.of_NumberBaseString(ai_value, 8)
end function

public function string of_octal (long al_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	al_value       Long: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed long (4-byte) value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is peformed.
//
//                Example: 673 (decimal) -> "1241"
//                         -15 (decimal) -> "37777777761"
//
// Notes:         Please refer to the Notes section in the of_NumberBaseString
//                function (for signed longs) for more information about
//                the conversion of negative values to other numeric bases.
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

string ls_null

SetNull(ls_null)
If IsNull(al_value) Then Return ls_null

Return This.of_NumberBaseString(al_value, 8)
end function

public function string of_octal (unsignedinteger aui_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aui_value      UnsignedInteger: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts an unsigned integer (2-byte) value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is performed.
//
//                Example: 673 (decimal) -> "1241"
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

string ls_null

SetNull(ls_null)
If IsNull(aui_value) Then Return ls_null

Return This.of_NumberBaseString(aui_value, 8)
end function

public function string of_octal (unsignedlong aul_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	aul_value      UnsignedLong: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts an unsigned long (4-byte) value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is performed.
//
//                Example: 673 (decimal) -> "1241"
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

string ls_null

SetNull(ls_null)
If IsNull(aul_value) Then Return ls_null

Return This.of_NumberBaseString(aul_value, 8)
end function

public function boolean of_getbit (unsignedlong aul_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_decimal    UnsignedLong: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 16.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
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

Boolean lb_null

// Validate the arguments.
SetNull(lb_null)
If IsNull(aul_decimal) or IsNull(aui_bit) Then Return lb_null

If aui_bit < 1 Or aui_bit > 32 Then Return lb_null

//Assumption aui_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//aul_decimal is a binary number as a base 10 long.
If Int(Mod(aul_decimal / (2 ^(aui_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function boolean of_getbit (long al_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_decimal		Long: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 32.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0      Initial version
// 5.0.03   Fixed problem when dealing with large numbers (>32k)
//          from "mod int" to "int mod"
// 12.5     Revise to use overloaded version accepting an unsigned long.
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

Boolean lb_null
ULong   lul_temp

// Validate the arguments.
SetNull(lb_null)
If IsNull(al_decimal) or IsNull(aui_bit) Then Return lb_null

If aui_bit < 1 Or aui_bit > 32 Then Return lb_null

// Copy the bit pattern in the signed long into an unsigned long
// so that the sign bit (bit 32) does not affect the results.
// The target variable must not be null when CopyLong2ULong is called.
lul_temp = 0
CopyLong2ULong(lul_temp, al_decimal, 4)

Return This.of_GetBit(lul_temp, aui_bit)
end function

public function boolean of_getbit (unsignedinteger aui_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_decimal    UnsignedInteger: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 16.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
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

Boolean lb_null

// Validate the arguments.
SetNull(lb_null)
If IsNull(aui_decimal) or IsNull(aui_bit) Then Return lb_null

If aui_bit < 1 Or aui_bit > 16 Then Return lb_null

// Assumptions: aui_bit is the nth bit counting right to left with
// the leftmost bit being bit number 1.
// aul_decimal is a binary number as a base 10 long.
If Int(Mod(aui_decimal / (2 ^(aui_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function boolean of_getbit (integer ai_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_decimal		Integer: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 16.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
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

Boolean lb_null
UInt    lui_temp

// Validate the arguments.
SetNull(lb_null)
If IsNull(ai_decimal) or IsNull(aui_bit) Then Return lb_null

If aui_bit < 1 Or aui_bit > 16 Then Return lb_null

// Copy the bit pattern in the signed long into an unsigned long
// so that the sign bit (bit 32) does not affect the results.
// The target variable must not be null when CopyInt2UInt is called.
lui_temp = 0
CopyInt2UInt(lui_temp, ai_decimal, 2)

Return This.of_GetBit(lui_temp, aui_bit)
end function

public function string of_binary (unsignedlong aul_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_decimal    UnsignedLong: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
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

string ls_null

// Validate the argument.
SetNull(ls_null)
If IsNull(aul_decimal) Then Return ls_null

Return This.of_NumberBaseString(aul_decimal, 2)
end function

public function string of_binary (unsignedinteger aui_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_decimal    UnsignedInteger: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
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

string ls_null

// Validate the argument.
SetNull(ls_null)
If IsNull(aui_decimal) Then Return ls_null

Return This.of_NumberBaseString(aui_decimal, 2)
end function

public function string of_binary (integer ai_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_decimal     Integer: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
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

string  ls_null
uint    lui_decimal

// Validate the argument.
SetNull(ls_null)
If IsNull(ai_decimal) Then Return ls_null

// Copy the bit pattern in the signed integer to an unsignedinteger so that
// the bit pattern can be decoded if the decimal value happens to be negative.
CopyInt2UInt(lui_decimal, ai_decimal, 2)

Return This.of_NumberBaseString(lui_decimal, 2)
end function

public function unsignedlong of_bitwiseand (unsignedlong aul_value1, unsignedlong aul_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_Value1     UnsignedLong: The first value to be used in the operation. (e.g. 55)
//	aul_Value2     UnsignedLong: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedLong
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (aul_Value1 && aul_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise AND    0000 0000 0000 0000 0000 0000 0010 0100 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
ULong   lul_result, lul_factor

// Return null if any argument is null.
SetNull(lul_result)
If IsNull(aul_value1) Or IsNull(aul_value2) Then Return lul_result

lul_result = 0
For li_i = 1 To 32
	If aul_value1 = 0 Or aul_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lul_factor = 1
	Else
		lul_factor *= 2
	End If
	
	If Mod(aul_value1, 2) = 1 And Mod(aul_value2, 2) = 1 Then
		lul_result += lul_factor
	End If
	
	aul_value1 /= 2
	aul_value2 /= 2
Next

Return lul_result
end function

public function unsignedinteger of_bitwiseand (unsignedinteger aui_value1, unsignedinteger aui_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_Value1     UnsignedInteger: The first value to be used in the operation. (e.g. 55)
//	aui_Value2     UnsignedInteger:The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedInteger
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (aui_Value1 && aui_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise AND    0000 0000 0010 0100 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
UInt    lui_result, lui_factor

// Return null if any argument is null.
SetNull(lui_result)
If IsNull(aui_value1) Or IsNull(aui_value2) Then Return lui_result

lui_result = 0
For li_i = 1 To 16
	If aui_value1 = 0 Or aui_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lui_factor = 1
	Else
		lui_factor *= 2
	End If
	
	If Mod(aui_value1, 2) = 1 And Mod(aui_value2, 2) = 1 Then
		lui_result += lui_factor
	End If
	
	aui_value1 /= 2
	aui_value2 /= 2
Next

Return lui_result
end function

public function integer of_bitwiseand (integer ai_value1, integer ai_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_Value1      Integer: The first value to be used in the operation. (e.g. 55)
//	ai_Value2      Integer: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		Integer
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (ai_Value1 && ai_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise AND    0000 0000 0010 0100 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_result
UInt    lui_value1, lui_value2, lui_temp

// Return null if any argument is null.
SetNull(li_result)
If IsNull(ai_value1) Or IsNull(ai_value2) Then Return li_result

// Copy the bit pattern in both arguments to unsigned integers, then
// use the overloaded version of the function to perform the bitwise AND.
CopyInt2UInt(lui_value1, ai_value1, 2)
CopyInt2UInt(lui_value2, ai_value2, 2)

lui_temp = This.of_BitwiseAnd(lui_value1, lui_value2)

// Copy the bit pattern of the AND-ed result into a signed integer.
// The target variable must not be null when CopyUInt2Int is called.
li_result = 0
CopyUInt2Int(li_result, lui_temp, 2)
Return li_result
end function

public function unsignedlong of_bitwiseor (unsignedlong aul_value1, unsignedlong aul_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_Value1     UnsignedLong: The first value to be used in the operation. (e.g. 55)
//	aul_Value2     UnsignedLong: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedLong
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, function returns null.
//
//	Description:   Performs a bitwise OR operation (aul_Value1 || aul_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise OR     0000 0000 0000 0000 0000 0000 0011 1111 = 63 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
ULong   lul_result, lul_factor

// Return null if any argument is null.
SetNull(lul_result)
If IsNull(aul_value1) Or IsNull(aul_value2) Then Return lul_result

lul_result = 0
For li_i = 1 To 32
	If aul_value1 = 0 And aul_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lul_factor = 1
	Else
		lul_factor *= 2
	End If
	
	If Mod(aul_value1, 2) = 1 Or Mod(aul_value2, 2) = 1 Then
		lul_result += lul_factor
	End If
	
	aul_value1 /= 2
	aul_value2 /= 2
Next

Return lul_result
end function

public function unsignedinteger of_bitwiseor (unsignedinteger aui_value1, unsignedinteger aui_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_Value1     UnsignedInteger: The first value to be used in the operation. (e.g. 55)
//	aui_Value2     UnsignedInteger: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedInteger
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise OR operation (aui_Value1 || aui_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise OR     0000 0000 0011 1111 = 63 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
UInt    lui_result, lui_factor

// Return null if any argument is null.
SetNull(lui_result)
If IsNull(aui_value1) Or IsNull(aui_value2) Then Return lui_result

lui_result = 0
For li_i = 1 To 16
	If aui_value1 = 0 And aui_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lui_factor = 1
	Else
		lui_factor *= 2
	End If
	
	If Mod(aui_value1, 2) = 1 Or Mod(aui_value2, 2) = 1 Then
		lui_result += lui_factor
	End If
	
	aui_value1 /= 2
	aui_value2 /= 2
Next

Return lui_result
end function

public function integer of_bitwiseor (integer ai_value1, integer ai_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_Value1		Integer: The first value to be used in the operation (e.g. 55).
//	ai_Value2		Integer: The second value to be used in the operation (e.g. 44).
//
//	Returns: 		Integer
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise OR operation (ai_Value1 || ai_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise OR     0000 0000 0011 1111 = 63 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_result
UInt    lui_value1, lui_value2, lui_temp

// Return null if any argument is null.
SetNull(li_result)
If IsNull(ai_value1) Or IsNull(ai_value2) Then Return li_result

// Copy the bit pattern in both arg's to unsigned integers, then use
// the overloaded version of the function to perform the bitwise OR.
CopyInt2UInt(lui_value1, ai_value1, 2)
CopyInt2UInt(lui_value2, ai_value2, 2)

lui_temp = This.of_BitwiseOr(lui_value1, lui_value2)

// Copy the bit pattern of the OR-ed result into a signed integer.
// The target variable must not be null when CopyUInt2Int is called.
li_result = 0
CopyUInt2Int(li_result, lui_temp, 4)
Return li_result
end function

public function unsignedlong of_bitwisenot (unsignedlong aul_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_Value      UnsignedLong: The value to be used in the operation (e.g. 55)
//
//	Returns: 		UnsignedLong
//						The result of the NOT operation (e.g. 4294967240)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! aul_Value),
//						which reverses each bit.
//						(! 55) = 4294967240
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                Bitwise NOT  = 1111 1111 1111 1111 1111 1111 1100 1000
//                             = 4294967240 (decimal, unsigned long)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
ULong   lul_result, lul_factor

// Return null if the argument is null.
SetNull(lul_result)
If IsNull(aul_value) Then Return lul_result

lul_result = 0
For li_i = 1 To 32
	If li_i = 1 Then
		lul_factor = 1
	Else
		lul_factor *= 2
	End If
	
	If Mod(aul_value, 2) = 0 Then
		lul_result += lul_factor
	End If
	
	aul_value /= 2
Next

Return lul_result
end function

public function unsignedinteger of_bitwisenot (unsignedinteger aui_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_Value      The value to be used in the operation (e.g. 55)
//
//	Returns: 		UnsignedLong
//						The result of the NOT operation (e.g. 65480)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! aul_Value),
//						which reverses each bit.
//						(! 55) = 65480
//
//                55 (decimal) = 0000 0000 0011 0111
//                Bitwise NOT  = 1111 1111 1100 1000
//                             = 65480 (decimal, unsigned integer)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
UInt    lui_result, lui_factor

// Return null if the argument is null.
SetNull(lui_result)
If IsNull(aui_value) Then Return lui_result

lui_result = 0
For li_i = 1 To 15
	If li_i = 1 Then
		lui_factor = 1
	Else
		lui_factor *= 2
	End If
	
	If Mod(aui_value, 2) = 0 Then
		lui_result += lui_factor
	End If
	
	aui_value /= 2
Next

Return lui_result
end function

public function integer of_bitwisenot (integer ai_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_Value       Integer: The value to be used in the operation (e.g. 55)
//
//	Returns: 		Integer
//						The result of the NOT operation (e.g. -56)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! ai_Value),
//						which reverses each bit.
//						(! 55) = -56
//
//                55 (decimal) = 0000 0000 0011 0111
//                Bitwise NOT  = 1111 1111 1100 1000
//                             = -56 (decimal, signed integer)
//
// Notes:         Negating the hi-order bit changes the value between positive
//                and negative.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_result
UInt    lui_value, lui_temp

// Return null if the argument is null.
SetNull(li_result)
If IsNull(ai_value) Then Return li_result

// Copy the bit pattern in the argument to an unsigned integer, then use
// the overloaded version of the function to perform the bitwise NOT.
CopyInt2UInt(lui_value, ai_value, 2)

lui_temp = This.of_BitwiseNot(lui_value)

// Copy the bit pattern of the negated result into a signed integer.
// The target variable must not be null when CopyUInt2Int is called.
li_result = 0 
CopyUInt2Int(li_result, lui_temp, 2)
Return li_result
end function

public function unsignedlong of_bitwisexor (unsignedlong aul_value1, unsignedlong aul_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_Value1     Long: The first value to be used in the operation. (e.g. 55)
//	aul_Value2     Long: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedLong
//						The result of the XOR operation (e.g. 27).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise XOR operation (aul_Value1 XOR aul_Value2),
//						which XORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0000 0000 0000 0000 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0000 0000 0000 0000 0010 1100
//                               ---------------------------------------
//                Bitwise XOR    0000 0000 0000 0000 0000 0000 0001 1011 = 27 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
ULong   lul_result, lul_temp

// Return null if any argument is null.
SetNull(lul_result)
If IsNull(aul_value1) Or IsNull(aul_value2) Then Return lul_result

lul_result = 0
For li_i = 1 To 32
	If li_i = 1 Then
		lul_temp = 1
	Else
		lul_temp *= 2
	End If
	
	If Mod(aul_value1, 2) <> Mod(aul_value2, 2) Then
		lul_result += lul_temp
	End If
	
	aul_value1 /= 2
	aul_value2 /= 2
Next

Return lul_result
end function

public function integer of_bitwisexor (integer ai_value1, integer ai_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_Value1      Integer: The first value to be used in the operation. (e.g. 55)
//	ai_Value2      Integer: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		Integer
//						The result of the XOR operation (e.g. 27)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise XOR operation (ai_Value1 XOR ai_Value2),
//						which XORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise AND    0000 0000 0001 1011 = 27 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_result
UInt    lui_value1, lui_value2, lui_temp

// Return null if any argument is null.
SetNull(li_result)
If IsNull(ai_value1) Or IsNull(ai_value2) Then Return li_result

// Copy the bit pattern in both arg's to unsigned integers, then
// use the overloaded version of the function to perform the bitwise XOR.
CopyInt2UInt(lui_value1, ai_value1, 2)
CopyInt2UInt(lui_value2, ai_value2, 2)

lui_temp = This.of_BitwiseXor(lui_value1, lui_value2)

// Copy the bit pattern of the XOR-ed result into a signed integer.
// The target variable must not be null when CopyUInt2Int is called.
li_result = 0
CopyUInt2Int(li_result, lui_temp, 2)
Return li_result
end function

public function unsignedinteger of_bitwisexor (unsignedinteger aui_value1, unsignedinteger aui_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_Value1     UnsignedInteger: The first value to be used in the operation. (e.g. 55)
//	aui_Value2     UnsignedInteger: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedInteger
//						The result of the XOR operation (e.g. 27)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise XOR operation (aui_Value1 XOR aui_Value2),
//						which XORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise XOR    0000 0000 0001 1011 = 27 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
UInt    lui_result, lui_temp

// Return null if any argument is null.
SetNull(lui_result)
If IsNull(aui_value1) Or IsNull(aui_value2) Then Return lui_result

lui_result = 0
For li_i = 1 To 16
	If li_i = 1 Then
		lui_temp = 1
	Else
		lui_temp *= 2
	End If
	
	If Mod(aui_value1, 2) <> Mod(aui_value2, 2) Then
		lui_result += lui_temp
	End If
	
	aui_value1 /= 2
	aui_value2 /= 2
Next

Return lui_result
end function

public function unsignedlong of_decimal_ulong (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_ULong
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		UnsignedLong
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

Integer li_numdigits, li_i
ULong   lul_null, lul_factor, lul_decimal
Char    lc_digit[]

// Validate the "binary string" argument.
SetNull(lul_null)
If IsNull(as_binary) Then Return lul_null

// Anything left after trimming leading/trailing blanks?
as_binary = Trim(as_binary)
If as_binary = '' Then Return lul_null

// The digit sequences must contain only 0's and 1's.
If Not Match(as_binary, '^[01]+$') Then Return lul_null

// More than 32 binary digits will not fit into an unsigned long.
li_numdigits = Len(as_binary)
If li_numdigits > 32 Then Return lul_null

// Copy the string into a character array.
lc_digit = as_binary

lul_decimal = 0
lul_factor  = 1

// Process the binary digit characters from least significant to most (Right to Left).
For li_i = li_numdigits To 1 Step -1
	If lc_digit[li_i] = '1' Then lul_decimal += lul_factor
	lul_factor *= 2
Next

Return lul_decimal
end function

public function unsignedinteger of_decimal_uint (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_UInt
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		UnsignedInteger
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

Integer li_numdigits, li_i
UInt    lui_null, lui_factor, lui_decimal
Char    lc_digit[]

// Validate the "binary string" argument.
SetNull(lui_null)
If IsNull(as_binary) Then Return lui_null

// Anything left after trimming leading/trailing blanks?
as_binary = Trim(as_binary)
If as_binary = '' Then Return lui_null

// The digit sequences must contain only 0's and 1's.
If Not Match(as_binary, '^[01]+$') Then Return lui_null

// More than 16 binary digits will not fit into an unsigned integer.
li_numdigits = Len(as_binary)
If li_numdigits > 16 Then Return lui_null

// Copy the string into a character array.
lc_digit = as_binary

lui_decimal = 0
lui_factor  = 1

// Process the binary digit characters from least significant to most (Right to Left).
For li_i = li_numdigits To 1 Step -1
	If lc_digit[li_i] = '1' Then lui_decimal += lui_factor
	lui_factor *= 2
Next

Return lui_decimal
end function

public function integer of_decimal_int (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_Int
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		Integer
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

UInt    lui_result
Integer li_result

// The UInt version of this method will perform all argument validation.
lui_result = This.of_Decimal_UInt(as_binary)
If IsNull(lui_result) Then
	SetNull(li_result)
	Return li_result
End If

// Copy the bit pattern from the unsigned integer into the integer.
CopyUInt2Int(li_result, lui_result, 2)
Return li_result
end function

public function long of_decimal_long (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_Long
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		Long
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

ULong lul_temp
Long  ll_result

// The ULong version of this method will perform all argument validation.
SetNull(ll_result)
lul_temp = This.of_Decimal_ULong(as_binary)
If IsNull(lul_temp) Then Return ll_result

// Copy the bit pattern from the unsigned long into the long.
// The target variable must not be null when CopyULong2Long is called.
ll_result = 0
CopyULong2Long(ll_result, lul_temp, 4)
Return ll_result
end function

public function unsignedlong of_gethiword (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_GetHiWord
//
//	Access:        public
//
//	Arguments:
//	all_value      LongLong: The value from which the high-order 32 bits is wanted.
//
//	Returns:       UnsignedLong
//                Null will be returned if the argument value is null.
//
//	Description:  	Obtains the high-order 32 bits from a 64-bit (longlong) integer.
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

Integer li_rc
ULong   lul_null, lul_hi
Byte    lbyte_temp
Blob{8} lblob_temp   // Blob to hold 8 bytes, maximum.

// Validate the argument.
SetNull(lul_null)
If IsNull(all_value) Then Return lul_null

// Copy the bit pattern of the 8-byte longlong value into a blob.
CopyLongLong2Blob(lblob_temp, all_value, 8)

// The bytes from the longlong value are in the blob, but they are
// in least-significant to most-significant order. Replace the first
// set of four bytes in the blob with the second set of four bytes.
li_rc = GetByte(lblob_temp, 5, lbyte_temp)
li_rc = SetByte(lblob_temp, 1, lbyte_temp)

li_rc = GetByte(lblob_temp, 6, lbyte_temp)
li_rc = SetByte(lblob_temp, 2, lbyte_temp)

li_rc = GetByte(lblob_temp, 7, lbyte_temp)
li_rc = SetByte(lblob_temp, 3, lbyte_temp)

li_rc = GetByte(lblob_temp, 8, lbyte_temp)
li_rc = SetByte(lblob_temp, 4, lbyte_temp)

// Copy the bit pattern now in the first four bytes of the blob into the unsignedlong.
// The target variable must not be null when CopyBlob2ULong is called.
lul_hi = 0
CopyBlob2ULong(lul_hi, lblob_temp, 4)
Return lul_hi
end function

public function unsignedlong of_getloword (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_GetLoWord
//
//	Access:        public
//
//	Arguments:
//	all_value      LongLong: The value from which the low-order 32 bits is wanted.
//
//	Returns:       UnsignedLong
//                Null will be returned if the argument value is null.
//
//	Description:  	Obtains the low-order 32 bits from a 64-bit (longlong) integer.
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

Integer li_rc
ULong   lul_null, lul_lo
Blob{8} lblob_temp   // Blob to hold 8 bytes, maximum

// Validate the argument.
SetNull(lul_null)
If IsNull(all_value) Then Return lul_null

// Copy the bit pattern of the 8-byte longlong value into a blob.
CopyLongLong2Blob(lblob_temp, all_value, 8)

// The bytes from the longlong value are in the blob, but they are in least-significant
// to most-significant order. The first set of four bytes in the blob contains the low-
// order 32 bits, so copy the bit pattern of the first four bytes into the unsigned long.
// The target variables can not be null when CopyBlob2ULong is called.
lul_lo = 0
CopyBlob2ULong(lul_lo, lblob_temp, 4)
Return lul_lo
end function

public function string of_binary (longlong all_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_decimal    LongLong: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
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

string  ls_null, ls_binary
string  ls_32zeroes = '00000000000000000000000000000000'
ulong   lul_hi, lul_lo

// Validate the argument.
SetNull(ls_null)
If IsNull(all_decimal) Then Return ls_null

// There currently is no "unsignedlonglong" data type, so split the 64-bit
// signed integer value into two 32-bit unsignedlong halves, then use them
// the task at hand.
lul_hi = This.of_GetHiWord(all_decimal)
lul_lo = This.of_GetLoWord(all_decimal)

// Create a string representing the bit pattern in the lo-order 32-bits
// (no leading zeroes). If the hi-order 32-bits are all zero, we're done.
ls_binary = This.of_NumberBaseString(lul_lo, 2)
If lul_hi = 0 Then Return ls_binary

// Ensure the part that has been converted to a base 2 string contains all of the
// necessary leading zeroes before appending it to the end of the hi-order 32 bits.
Return This.of_NumberBaseString(lul_hi, 2) + Right(ls_32zeroes + ls_binary, 32)
end function

public function longlong of_createlonglong (unsignedlong aul_hi, unsignedlong aul_lo);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_CreateLongLong
//
//	Access:        public
//
//	Arguments:
// aul_hi         UnsignedLong: The high-order 32-bit value. Bit 32 will
//                eventually become the sign bit of the new longlong value.
// aul_lo         UnsignedLong: The low-order 32-bit value.
//
//	Returns:       LongLong
//                Null will be returned if either argument value is null.
//
//	Description:  	Creates a 64-bit longlong integer from two 32-bit 
//                unsignedlong integers.
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

Integer  li_rc
ULong    lul_null
LongLong lll_result
Byte     lbyte_temp[4]
Blob{8}  lblob_temp

// Validate the arguments.
SetNull(lul_null)
If IsNull(aul_hi) Or IsNull(aul_lo) Then Return lul_null

// Copy the bit pattern of the high-order 32-bit unsignedlong into a blob.
CopyULong2Blob(lblob_temp, aul_hi, 4)

// The bytes from the unsignedlong are in the blob, but they are in
// least-significant to most-significant order. Copy them into an array
// of bytes temporarily.
li_rc = GetByte(lblob_temp, 1, lbyte_temp[1])
li_rc = GetByte(lblob_temp, 2, lbyte_temp[2])
li_rc = GetByte(lblob_temp, 3, lbyte_temp[3])
li_rc = GetByte(lblob_temp, 4, lbyte_temp[4])

// Copy the bit pattern of the low-order 32-bit unsignedlong into the blob
// (this is where those bytes need to be positioned to become a longlong).
CopyULong2Blob(lblob_temp, aul_lo, 4)

// Copy the high-order bytes saved earlier into the 5th-8th bytes of
// the blob, then copy the entire 8-byte pattern into a longlong.
li_rc = SetByte(lblob_temp, 5, lbyte_temp[1])
li_rc = SetByte(lblob_temp, 6, lbyte_temp[2])
li_rc = SetByte(lblob_temp, 7, lbyte_temp[3])
li_rc = SetByte(lblob_temp, 8, lbyte_temp[4])

lll_result = 0 // Ensure this variable is NOT null before bits are copied.
CopyBlob2LongLong(lll_result, lblob_temp, 8)

Return lll_result
end function

public function longlong of_bitwiseand (longlong all_value1, longlong all_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_Value1     LongLong: The first value to be used in the operation. (e.g. 55)
//	all_Value2     LongLong: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		LongLong
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (all_Value1 && all_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0x0000000000000037
//                44 (decimal) = 0x000000000000002c
//                               ------------------
//                Bitwise AND    0x0000000000000024 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

LongLong lll_result
ULong    lul_hi1, lul_lo1, lul_hi2, lul_lo2, lul_temphi, lul_templo

// Return null if any argument is null.
SetNull(lll_result)
If IsNull(all_value1) Or IsNull(all_value2) Then Return lll_result

// There is no unsignedlonglong data type, so split both 64-bit longlong values
// into two 32-bit unsignedlong values. Then perform the bitwise AND on them.
lul_hi1 = This.of_GetHiWord(all_value1)
lul_lo1 = This.of_GetLoWord(all_value1)

lul_hi2 = This.of_GetHiWord(all_value2)
lul_lo2 = This.of_GetLoWord(all_value2)

lul_temphi = This.of_BitwiseAnd(lul_hi1, lul_hi2)
lul_templo = This.of_BitwiseAnd(lul_lo1, lul_lo2)

// Create a new longlong value from the AND'd unsignedlong values.
lll_result = This.of_CreateLongLong(lul_temphi, lul_templo)
Return lll_result
end function

public function longlong of_bitwisenot (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_Value      LongLong: The value to be used in the operation (e.g. 55)
//
//	Returns: 		LongLong
//						The result of the NOT operation (e.g. -56)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! all_Value),
//						which reverses each bit.
//						(! 55) = -56
//
//                55 (decimal) = 0x0000000000000037
//                Bitwise NOT  = 0xffffffffffffffc8
//                             = -56 (decimal, longlong)
//
// Notes:         Negating the hi-order bit changes the value between positive
//                and negative.
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

LongLong lll_result
ULong    lul_hi, lul_lo, lul_temphi, lul_templo

// Return null if the argument is null.
SetNull(lll_result)
If IsNull(all_value) Then Return lll_result

// There is no unsignedlonglong data type, so split the 64-bit longlong value
// into two 32-bit unsignedlong values. Then perform the bitwise NOT on them.
lul_hi = This.of_GetHiWord(all_value)
lul_lo = This.of_GetLoWord(all_value)

lul_temphi = This.of_BitwiseNot(lul_hi)
lul_templo = This.of_BitwiseNot(lul_lo)

// Create a new longlong value from the NOT'd unsignedlong values.
lll_result = This.of_CreateLongLong(lul_temphi, lul_templo)
Return lll_result
end function

public function longlong of_bitwiseor (longlong all_value1, longlong all_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr
//
//	Access: 			public
//
//	Arguments:
//	all_Value1     LongLong: The first value to be used in the operation (e.g. 55).
//	all_Value2     LongLong: The second value to be used in the operation (e.g. 44).
//
//	Returns: 		LongLong
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise OR operation (all_Value1 || all_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0x0000000000000037
//                44 (decimal) = 0x000000000000002c
//                               ------------------
//                Bitwise OR     0x000000000000003f = 63 (decimal)
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

LongLong lll_result
ULong    lul_hi1, lul_lo1, lul_hi2, lul_lo2, lul_temphi, lul_templo

// Return null if any argument is null.
SetNull(lll_result)
If IsNull(all_value1) Or IsNull(all_value2) Then Return lll_result

// There is no unsignedlonglong data type, so split both 64-bit longlong values
// into two 32-bit unsignedlong values. Then perform the bitwise OR on them.
lul_hi1 = This.of_GetHiWord(all_value1)
lul_lo1 = This.of_GetLoWord(all_value1)

lul_hi2 = This.of_GetHiWord(all_value2)
lul_lo2 = This.of_GetLoWord(all_value2)

lul_temphi = This.of_BitwiseOr(lul_hi1, lul_hi2)
lul_templo = This.of_BitwiseOr(lul_lo1, lul_lo2)

// Create a new longlong value from the OR'd unsignedlong values.
lll_result = This.of_CreateLongLong(lul_temphi, lul_templo)
Return lll_result
end function

public function longlong of_bitwisexor (longlong all_value1, longlong all_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_Value1     LongLong: The first value to be used in the operation (e.g. 55).
//	all_Value2     LongLong: The second value to be used in the operation (e.g. 44).
//
//	Returns: 		LongLong
//						The result of the XOR operation (e.g. 27).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise exclusive OR operation (all_Value1 XOR all_Value2),
//						which exclusively ORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0x0000000000000037
//                44 (decimal) = 0x000000000000002c
//                               ------------------
//                Bitwise XOR    0x000000000000001b = 27 (decimal)
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

LongLong lll_result
ULong    lul_hi1, lul_lo1, lul_hi2, lul_lo2, lul_temphi, lul_templo

// Return null if any argument is null.
SetNull(lll_result)
If IsNull(all_value1) Or IsNull(all_value2) Then Return lll_result

// There is no unsignedlonglong data type, so split both 64-bit longlong values
// into two 32-bit unsignedlong values. Then perform the bitwise XOR on them.
lul_hi1 = This.of_GetHiWord(all_value1)
lul_lo1 = This.of_GetLoWord(all_value1)

lul_hi2 = This.of_GetHiWord(all_value2)
lul_lo2 = This.of_GetLoWord(all_value2)

lul_temphi = This.of_BitwiseXor(lul_hi1, lul_hi2)
lul_templo = This.of_BitwiseXor(lul_lo1, lul_lo2)

// Create a new longlong value from the XOR'd unsignedlong values.
lll_result = This.of_CreateLongLong(lul_temphi, lul_templo)
Return lll_result
end function

public function boolean of_getbit (longlong all_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_decimal    LongLong: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 64.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
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

Boolean lb_result
ULong   lul_temphi, lul_templo

// Validate the arguments.
SetNull(lb_result)
If IsNull(all_decimal) or IsNull(aui_bit) Then Return lb_result

If aui_bit < 1 Or aui_bit > 64 Then Return lb_result

// Split the 64-bit longlong integer into two 32-bit unsignedlong integers.
lul_temphi = This.of_GetHiWord(all_decimal)
lul_templo = This.of_GetLoWord(all_decimal)

// Obtain the value of the requested bit from the appropriate unsignedlong.
If aui_bit <= 32 Then
	lb_result = This.of_GetBit(lul_templo, aui_bit)
Else
	lb_result = This.of_GetBit(lul_temphi, aui_bit - 32)
End If

Return lb_result
end function

public function longlong of_decimal_longlong (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_LongLong
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		LongLong
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

Integer  li_numdigits
ULong    lul_temphi, lul_templo
LongLong lll_result
String   ls_hi, ls_lo

// Validate the "binary string" argument.
SetNull(lll_result)
If IsNull(as_binary) Then Return lll_result

// Anything left after trimming leading/trailing blanks?
as_binary = Trim(as_binary)
If as_binary = '' Then Return lll_result

// The digit sequence must contain only 0's and 1's.
If Not Match(as_binary, '^[01]+$') Then Return lll_result

li_numdigits = Len(as_binary)
Choose Case li_numdigits
	Case Is <= 32
		lll_result = This.of_decimal_ulong(as_binary)
	Case Is <= 64
		// Break the string into the high-order portion and lo-order portion
		ls_hi = Mid(as_binary, 1, li_numdigits - 32)
		ls_lo = Right(as_binary, 32)
		
		lul_temphi = This.of_decimal_ulong(ls_hi)
		lul_templo = This.of_decimal_ulong(ls_lo)
		
		// Create the 64-bit longlong value from the two 32-bit unsignedlong values.
		lll_result = This.of_CreateLongLong(lul_temphi, lul_templo)
	Case Else
		// String is too long. lll_result is already set to null.
End Choose

Return lll_result
end function

public function string of_hex (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	all_value      LongLong: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed longlong (8-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 673 (decimal) -> "2a1"
//                         -15 (decimal) -> "fffffffffffffff1"
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

String  ls_null, ls_result
ULong   lul_temphi, lul_templo

// Validate the argument.
SetNull(ls_null)
If IsNull(all_value) Then Return ls_null

// There currently is no "unsignedlonglong" data type, so split the 64-bit
// signed integer value into two 32-bit unsignedlong halves, then work with them.
lul_temphi = This.of_GetHiWord(all_value)
lul_templo = This.of_GetLoWord(all_value)

// Create a string representing the hex digits in the lo-order 32-bits
// (no leading zeroes). If the hi-order unsignedlong is zero, we're done.
ls_result = This.of_NumberBaseString(lul_templo, 16)
If lul_temphi = 0 Then Return ls_result

// Ensure the first part that has been converted to a base 2 string contains all
// of the necessary leading zeroes before appending it to the hi-order portion.
ls_result = This.of_NumberBaseString(lul_temphi, 16) + Right('00000000' + ls_result, 8)

Return ls_result
end function

public function string of_numberbasestring (longlong all_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	all_value      The numeric value to be converted.
// aui_base       The numeric base (2-16) to convert the value into.
//
//	Returns:       string
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts a (signed) longlong (8-byte) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 5831 (decimal) -> (base  2) '1011011000111'
//                                        -> (base  8) '13307'
//                                        -> (base 10) '5831'
//                                        -> (base 16) '16c7'
//
// Notes:         Because there currently is no unsigned version of a longlong,
//                the process used for other integer data types cannot be used
//                for a longlong when the sign bit (bit 64) is 1 (i.e., when the
//                value to be converted is negative...
//
//                EXCEPT for conversions to base 2, 8 or 16. Therefore, this
//                function returns a value of null when a negative value to be
//                converted is supplied and aui_base is not 2, 8 or 16.
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

uint   lui_unsigned
char   lc_digit[0 To 15] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
string ls_null, ls_result

// Return null if either argument is null.
SetNull(ls_null)
If IsNull(all_value) Or IsNull(aui_base) Then Return ls_null

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_null

// The value to be converted cannot be negative (longlong data type only).
// UNLESS converting to base 2, 8, or 16. These are special cases that
// can be and are handled in the of_Binary, of_Octal and of_Hex functions.
If all_value < 0 Then
	Choose Case aui_base
		Case 2
			ls_result = This.of_Binary(all_value)
		Case 8
			ls_result = This.of_Octal(all_value)
		Case 16
			ls_result = This.of_Hex(all_value)
		Case Else
			Return ls_null
	End Choose
	Return ls_result
End If

ls_result = ''

Do While all_value > 0
	ls_result = lc_digit[Mod(all_value,aui_base)] + ls_result
	all_value /= aui_base
Loop

If ls_result = '' Then ls_result = '0'

Return ls_result
end function

public function string of_binary (byte abyte_decimal);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Binary [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_decimal  Byte: The value whose binary representation needs to be 
//                determined (e.g. 83)
//
//	Returns: 		String
//						The binary representation of the value as a string (e.g. "1010011")
//						If the argument is null, the function returns null.
//
//	Description:   Determines the binary representation of a decimal number as
//                a string.
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

string ls_null

// Validate the argument.
SetNull(ls_null)
If IsNull(abyte_decimal) Then Return ls_null

Return This.of_NumberBaseString(abyte_decimal, 2)
end function

public function string of_numberbasestring (byte abyte_value, unsignedinteger aui_base);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_NumberBaseString [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	abyte_value    Byte: The numeric value to be converted.
// aui_base       UnsignedInteger: The numeric base (2-16) to convert the value into.
//
//	Returns:       String
//                Null will be returned if either argument value is null.
//
//	Description:  	Converts a byte (which is unsigned) value into a string
//                representing the value in the requested numeric base.
//
//                No left-side padding of zeroes is performed.
//
//                Example: 115 (decimal) -> '1110011' (base 2)
//                                       -> '163'     (base 8, or octal)
//                                       -> '115'     (base 10)
//                                       -> '73'      (base 16, or hexadecimal)
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

char   lc_digit[0 To 15] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
string ls_result

// Return null if either argument is null.
SetNull(ls_result)
If IsNull(abyte_value) Or IsNull(aui_base) Then Return ls_result

// Validate numeric base (must 2 to 16).
If aui_base < 2 Or aui_base > 16 Then Return ls_result

ls_result = ''

Do While abyte_value > 0
	ls_result = lc_digit[Mod(abyte_value,aui_base)] + ls_result
	abyte_value /= aui_base
Loop

If ls_result = '' Then ls_result = '0'

Return ls_result
end function

public function byte of_bitwiseand (byte abyte_value1, byte abyte_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseAnd [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_Value1   Byte: The first value to be used in the operation. (e.g. 55)
//	abyte_Value2   Byte: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		Byte
//						The result of the AND operation (e.g. 36)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise AND operation (abyte_Value1 && abyte_Value2),
//						which ANDs each bit of the values.
//						(55 && 44) = 36
//
//                55 (decimal) = 0000 0000 0011 0111
//                44 (decimal) = 0000 0000 0010 1100
//                               -------------------
//                Bitwise AND    0000 0000 0010 0100 = 36 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
Byte    lbyte_result, lbyte_factor

// Return null if any argument is null.
SetNull(lbyte_result)
If IsNull(abyte_value1) Or IsNull(abyte_value2) Then Return lbyte_result

lbyte_result = 0
For li_i = 1 To 8
	If abyte_value1 = 0 Or abyte_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lbyte_factor = 1
	Else
		lbyte_factor *= 2
	End If
	
	If Mod(abyte_value1, 2) = 1 And Mod(abyte_value2, 2) = 1 Then
		lbyte_result += lbyte_factor
	End If
	
	abyte_value1 /= 2
	abyte_value2 /= 2
Next

Return lbyte_result
end function

public function byte of_bitwisenot (byte abyte_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseNot [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_Value    Byte: The value to be used in the operation (e.g. 55)
//
//	Returns: 		Byte
//						The result of the NOT operation (e.g. 200)
//						If the argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise NOT operation (! abyte_Value),
//						which reverses each bit.
//						(! 55) = 200
//
//                55 (decimal) = 0011 0111
//                Bitwise NOT  = 1100 1000
//                             = 200 (decimal, byte)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
Byte    lbyte_result, lbyte_factor

// Return null if the argument is null.
SetNull(lbyte_result)
If IsNull(abyte_value) Then Return lbyte_result

lbyte_result = 0
For li_i = 1 To 8
	If li_i = 1 Then
		lbyte_factor = 1
	Else
		lbyte_factor *= 2
	End If
	
	If Mod(abyte_value, 2) = 0 Then
		lbyte_result += lbyte_factor
	End If
	
	abyte_value /= 2
Next

Return lbyte_result
end function

public function byte of_bitwiseor (byte abyte_value1, byte abyte_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseOr [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_Value1   Byte: The first value to be used in the operation. (e.g. 55)
//	abyte_Value2   Byte: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		UnsignedInteger
//						The result of the OR operation (e.g. 63).
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise OR operation (aui_Value1 || aui_Value2),
//						which ORs each bit of the values.
//						(55 || 44) = 63
//
//                55 (decimal) = 0011 0111
//                44 (decimal) = 0010 1100
//                               ---------
//                Bitwise OR     0011 1111 = 63 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
Byte    lbyte_result, lbyte_factor

// Return null if any argument is null.
SetNull(lbyte_result)
If IsNull(abyte_value1) Or IsNull(abyte_value2) Then Return lbyte_result

lbyte_result = 0
For li_i = 1 To 8
	If abyte_value1 = 0 And abyte_value2 = 0 Then Exit
	
	If li_i = 1 Then
		lbyte_factor = 1
	Else
		lbyte_factor *= 2
	End If
	
	If Mod(abyte_value1, 2) = 1 Or Mod(abyte_value2, 2) = 1 Then
		lbyte_result += lbyte_factor
	End If
	
	abyte_value1 /= 2
	abyte_value2 /= 2
Next

Return lbyte_result
end function

public function byte of_bitwisexor (byte abyte_value1, byte abyte_value2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BitwiseXor [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_Value1   Byte: The first value to be used in the operation. (e.g. 55)
//	abyte_Value2   Byte: The second value to be used in the operation. (e.g. 44)
//
//	Returns: 		Byte
//						The result of the XOR operation (e.g. 27)
//						If either argument's value is null, the function returns null.
//
//	Description:   Performs a bitwise XOR operation (abyte_Value1 XOR abyte_Value2),
//						which XORs each bit of the values.
//						(55 XOR 44) = 27
//
//                55 (decimal) = 0011 0111
//                44 (decimal) = 0010 1100
//                               ---------
//                Bitwise XOR    0001 1011 = 27 (decimal)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
// 12.5  Initial version
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

Integer li_i
UInt    abyte_result, abyte_temp

// Return null if any argument is null.
SetNull(abyte_result)
If IsNull(abyte_value1) Or IsNull(abyte_value2) Then Return abyte_result

abyte_result = 0
For li_i = 1 To 8
	If li_i = 1 Then
		abyte_temp = 1
	Else
		abyte_temp *= 2
	End If
	
	If Mod(abyte_value1, 2) <> Mod(abyte_value2, 2) Then
		abyte_result += abyte_temp
	End If
	
	abyte_value1 /= 2
	abyte_value2 /= 2
Next

Return abyte_result
end function

public function byte of_decimal_byte (string as_binary);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal_UInt
//
//	Access: 			public
//
//	Arguments:
//	as_binary		String: Sequence of 0's and 1's whose decimal 
//                representation needs to be determined. (e.g "1010011")
//
//	Returns: 		Byte
//						The decimal representation of the Binary number (e.g. 83).
//						If any argument's value is null, the function returns null.
//						If any argument's value is not valid, function returns null.
//
//	Description:   Determines the decimal representation of a character string
//                containing a sequence of binary digit characters ("0" and "1".)
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

Integer li_numdigits, li_i
Byte    lbyte_null, lbyte_factor, lbyte_decimal
Char    lc_digit[]

// Validate the "binary string" argument.
SetNull(lbyte_null)
If IsNull(as_binary) Then Return lbyte_null

// Anything left after trimming leading/trailing blanks?
as_binary = Trim(as_binary)
If as_binary = '' Then Return lbyte_null

// The digit sequences must contain only 0's and 1's.
If Not Match(as_binary, '^[01]+$') Then Return lbyte_null

// More than 8 binary digits will not fit into a byte.
li_numdigits = Len(as_binary)
If li_numdigits > 8 Then Return lbyte_null

// Copy the string into a character array.
lc_digit = as_binary

lbyte_decimal = 0
lbyte_factor  = 1

// Process the binary digit characters from least significant to most (Right to Left).
For li_i = li_numdigits To 1 Step -1
	If lc_digit[li_i] = '1' Then lbyte_decimal += lbyte_factor
	lbyte_factor *= 2
Next

Return lbyte_decimal
end function

public function boolean of_getbit (byte abyte_decimal, unsignedinteger aui_bit);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_decimal  Byte: Decimal value whose on/off value needs to be determined.
//	aui_bit			UnsignedInteger: Requested bit position (from right to left); 1 to 8.
//
//	Returns: 		Boolean
//						True  if the value is 1 (On).
//						False if the value is 0 (Off).
//						If any argument's value is null, the function returns null.
//
//	Description:   Determines if the nth binary bit of a decimal number is
//						1 or 0.
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

Boolean lb_null

// Validate the arguments.
SetNull(lb_null)
If IsNull(abyte_decimal) or IsNull(aui_bit) Then Return lb_null

If aui_bit < 1 Or aui_bit > 8 Then Return lb_null

// Assumptions: aui_bit is the nth bit counting right to left with
// the leftmost bit being bit number 1.
// abyte_decimal is a binary number as a base 10 long.
If Int(Mod(abyte_decimal / (2 ^(aui_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function string of_hex (byte abyte_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Hex [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	abyte_value    Byte: The numeric value to be converted into hexadecimal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts an unsigned integer (2-byte) value into a string
//                representing the value in hexadecimal (base 16).
//
// Notes:         No left-side padding with leading zeroes is performed.
//
//                Example: 73 (decimal) -> "49"
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

string ls_null

SetNull(ls_null)
If IsNull(abyte_value) Then Return ls_null

Return This.of_NumberBaseString(abyte_value, 16)
end function

public function string of_octal (byte abyte_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	abyte_value    Byte: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a byte (unsigned) integer value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is performed.
//
//                Example: 73 (decimal) -> "111"
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

string ls_null

SetNull(ls_null)
If IsNull(abyte_value) Then Return ls_null

Return This.of_NumberBaseString(abyte_value, 8)
end function

public function string of_octal (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	   of_Octal [Overloaded]
//
//	Access:        public
//
//	Arguments:
//	all_value      LongLong: The numeric value to be converted into octal.
//
//	Returns:       String
//                Null will be returned if the argument value is null.
//
//	Description:  	Converts a signed longlong (8-byte) value into a string
//                representing the value in octal (base 8).
//
//                No left-side padding with zeroes is performed.
//
//                Example: 673 (decimal) -> "1241"
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

String ls_null, ls_result, ls_temp
ULong  lul_temphi, lul_templo

SetNull(ls_null)
If IsNull(all_value) Then Return ls_null

// Because there is no unsignedlonglong data type, the generic base converter
// function cannot be used if the value is negative (it can't properly handle
// the sign bit). However, with a little coding magic it is possible to convert
// a negative longlong value into octal.
If all_value >= 0 Then
	Return This.of_NumberBaseString(all_value, 8)
End If

// First, split the 8-byte longlong value into two 4-byte unsignedlongs.
lul_temphi = This.of_GetHiWord(all_value)
lul_templo = This.of_GetLoWord(all_value)

// Convert the entire lo-order unsigned long into an octal string.
ls_result = This.of_NumberBaseString(lul_templo, 8)

// Here's the trick: The first character of the octal string represent the
// value of bits 31 and 32, so it has to be a 0, 1, 2 or 3. These two bits
// need to be "combined" with bit 1 from the hi-order unsignedlong to produce
// the octet that spans the two unsignedlongs.
//
// If this bit is zero, no change is needed to the first character of the
// octal string produced from the lo-order unsignedlong.
//
// If this bit is one, the first character of the octal string needs to change
// from 0->4, 1->5, 2->6 or 3->7.
If Mod(lul_temphi, 2) = 1 Then
	ls_temp = Mid(ls_result, 1, 1)
	ls_result = Mid(ls_result, 2)
	Choose Case ls_temp
		Case '0'
			ls_temp = '4'
		Case '1'
			ls_temp = '5'
		Case '2'
			ls_temp = '6'
		Case Else
			ls_temp = '7'
	End Choose
	// The string now contains the octal representation of the lo-order
	// 33 bits of the original longlong value.
	ls_result = ls_temp + ls_result
End If

// Bit 1 of the upper unsignedlong has just been processed, so shift the value of the
// hi-order unsignedlong one bit to right (divide by 2). Convert that 31-bit result to
// octal and concatenate it with the octal representation of the lo-order 33 bits.
lul_temphi /= 2
Return This.of_NumberBaseString(lul_temphi, 8) + ls_result
end function

public function byte of_setbit (byte abyte_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	abyte_value    Byte: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 8.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		Byte: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 8, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

Byte    lbyte_temp
Boolean lb_current

// Validate the arguments.
SetNull(lbyte_temp)
If IsNull(abyte_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return lbyte_temp

If aui_bit < 1 Or aui_bit > 8 Then Return lbyte_temp

lb_current = This.of_GetBit(abyte_value, aui_bit)
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return abyte_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return abyte_value
	End If
End If

// The current and new values are not (yet) the same.
lbyte_temp = 2 ^ (aui_bit - 1)
If ab_new Then
	// Turn the requested bit on.
	abyte_value = This.of_BitwiseOr(abyte_value, lbyte_temp)
Else
	// Turn the requested bit off.
	lbyte_temp  = This.of_BitwiseNot(lbyte_temp)
	abyte_value = This.of_BitwiseAnd(abyte_value, lbyte_temp)
End If

Return abyte_value
end function

public function integer of_setbit (integer ai_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	ai_value       Integer: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 16.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		Integer: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 16, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

Integer li_null
UInt    lui_newmask, lui_value
Boolean lb_current

// Validate the arguments.
SetNull(li_null)
If IsNull(ai_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return li_null

If aui_bit < 1 Or aui_bit > 16 Then Return li_null

// Fewer intermediate conversions between unsigned and signed integers
// will be done if unsigned integers are used as much as possible.
lui_value = 0
CopyInt2UInt(lui_value, ai_value, 2)

lb_current = This.of_GetBit(lui_value, aui_bit)
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return ai_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return ai_value
	End If
End If

// The current and new values are not (yet) the same.
lui_newmask = 2 ^ (aui_bit - 1)

If ab_new Then
	// Turn the requested bit on.
	lui_value = This.of_BitwiseOr(lui_value, lui_newmask)
Else
	// Turn the requested bit off.
	lui_newmask = This.of_BitwiseNot(lui_newmask)
	lui_value   = This.of_BitwiseAnd(lui_value, lui_newmask)
End If

// Copy the modified bit pattern into a signed integer.
ai_value = 0
CopyUInt2Int(ai_value, lui_value, 2)

Return ai_value
end function

public function long of_setbit (long al_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	al_value       Long: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 32.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		Long: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 32, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

Long    ll_null
ULong   lul_newmask, lul_value
Boolean lb_current

// Validate the arguments.
SetNull(ll_null)
If IsNull(al_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return ll_null

If aui_bit < 1 Or aui_bit > 32 Then Return ll_null

// Fewer intermediate conversions between unsigned and signed longs
// if unsigned longs are used as much as possible.
lul_value = 0
CopyLong2ULong(lul_value, al_value, 4)

lb_current = This.of_GetBit(lul_value, aui_bit)
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return al_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return al_value
	End If
End If

// The current and new values are not (yet) the same.
lul_newmask = 2 ^ (aui_bit - 1)

If ab_new Then
	// Turn the requested bit on.
	lul_value = This.of_BitwiseOr(lul_value, lul_newmask)
Else
	// Turn the requested bit off.
	lul_newmask = This.of_BitwiseNot(lul_newmask)
	lul_value   = This.of_BitwiseAnd(lul_value, lul_newmask)
End If

// Copy the modified bit pattern into a signed long.
al_value = 0
CopyULong2Long(al_value, lul_value, 4)

Return al_value
end function

public function longlong of_setbit (longlong all_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	all_value      LongLong: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 64.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		LongLong: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 64, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

UInt     lui_bit
LongLong lll_null
ULong    lul_newmask, lul_temp, lul_otherhalf
Boolean  lb_current

// Validate the arguments.
SetNull(lll_null)
If IsNull(all_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return lll_null

If aui_bit < 1 Or aui_bit > 64 Then Return lll_null

// Which unsignedlong half of the longlong contains the bit to be checked/manipulated?
If aui_bit <= 32 Then
	lul_otherhalf = This.of_GetHiWord(all_value)
	lul_temp      = This.of_GetLoWord(all_value)
	lui_bit       = aui_bit
Else
	lul_temp      = This.of_GetHiWord(all_value)
	lul_otherhalf = This.of_GetLoWord(all_value)
	lui_bit       = 64 - aui_bit
End If
lb_current = This.of_GetBit(lul_temp, lui_bit)

// Maybe the requested bit is already set properly?
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return all_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return all_value
	End If
End If

// The current and new values are not (yet) the same.
lul_newmask = 2 ^ (lui_bit - 1)

If ab_new Then
	// Turn the requested bit on.
	lul_temp = This.of_BitwiseOr(lul_temp, lul_newmask)
Else
	// Turn the requested bit off.
	lul_newmask = This.of_BitwiseNot(lul_newmask)
	lul_temp    = This.of_BitwiseAnd(lul_temp, lul_newmask)
End If

// Re-construct the longlong value using the modified 32-bit
// unsignedlong along with the other, un-modified half.
If aui_bit <= 32 Then
	all_value = This.of_CreateLongLong(lul_otherhalf, lul_temp)
Else
	all_value = This.of_CreateLongLong(lul_temp, lul_otherhalf)
End If

Return all_value
end function

public function unsignedinteger of_setbit (unsignedinteger aui_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aui_value      UnsignedInteger: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 16.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		UnsignedInteger: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 16, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

UInt    lui_null, lui_newmask, lui_value
Boolean lb_current

// Validate the arguments.
SetNull(lui_null)
If IsNull(aui_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return lui_null

If aui_bit < 1 Or aui_bit > 16 Then Return lui_null

lb_current = This.of_GetBit(aui_value, aui_bit)
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return aui_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return aui_value
	End If
End If

// The current and new values are not (yet) the same.
lui_newmask = 2 ^ (aui_bit - 1)

If ab_new Then
	// Turn the requested bit on.
	aui_value = This.of_BitwiseOr(aui_value, lui_newmask)
Else
	// Turn the requested bit off.
	lui_newmask = This.of_BitwiseNot(lui_newmask)
	aui_value   = This.of_BitwiseAnd(aui_value, lui_newmask)
End If

Return aui_value
end function

public function unsignedlong of_setbit (unsignedlong aul_value, unsignedinteger aui_bit, boolean ab_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetBit [Overloaded]
//
//	Access: 			public
//
//	Arguments:
//	aul_value      UnsignedLong: The value that is to be manipulated.
//	aui_bit        UnsignedInteger: Requested bit position (from right to left); 1 to 32.
// ab_new         Boolean: The new value for the bit (True=1, False=0).
//
//	Returns: 		UnsignedLong: The new value after the requested bit has been set.
//						If any argument's value is null, the function returns null.
//                If aui_bitnumber is not between 1 and 32, the function returns null.
//
//	Description:   Sets a specific bit on or off.
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

ULong   lul_null, lul_newmask, lul_value
Boolean lb_current

// Validate the arguments.
SetNull(lul_null)
If IsNull(aul_value) or IsNull(aui_bit) Or IsNull(ab_new) Then Return lul_null

If aui_bit < 1 Or aui_bit > 32 Then Return lul_null

lb_current = This.of_GetBit(aul_value, aui_bit)
If lb_current Then
	If ab_new Then
		// Current bit value same as requested new bit value (1).
		Return aul_value
	End If
Else
	If Not ab_new Then
		// Current bit value same as requested new bit value (0).
		Return aul_value
	End If
End If

// The current and new values are not (yet) the same.
lul_newmask = 2 ^ (aui_bit - 1)

If ab_new Then
	// Turn the requested bit on.
	aul_value = This.of_BitwiseOr(aul_value, lul_newmask)
Else
	// Turn the requested bit off.
	lul_newmask = This.of_BitwiseNot(lul_newmask)
	aul_value   = This.of_BitwiseAnd(aul_value, lul_newmask)
End If

Return aul_value
end function

on pfc_n_cst_numerical.create
call super::create
end on

on pfc_n_cst_numerical.destroy
call super::destroy
end on

