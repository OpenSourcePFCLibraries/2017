HA$PBExportHeader$pfc_u_calculator.sru
$PBExportComments$PFC Calculator class
forward
global type pfc_u_calculator from u_base
end type
type dw_calculator from u_dw within pfc_u_calculator
end type
end forward

global type pfc_u_calculator from u_base
int Width=457
int Height=416
long BackColor=80263328
event type integer pfc_dropdown ( )
dw_calculator dw_calculator
end type
global pfc_u_calculator pfc_u_calculator

type variables
Public:
// Datawindow Register ColumnStyle constants.
constant integer NONE = 1
constant integer DDLB = 2
constant integer DDLB_WITHARROW = 3

n_cst_dropdown	inv_dropdown

Protected:
// Internal attibutes.
constant string EMPTY = ''
dragobject idrg_requestor
datawindow idw_requestor
editmask iem_requestor
Double	idbl_value
Double	idbl_repeatvalue
String	is_currvalue
String	is_curroperator
String	is_repeatoperator
String	is_prevkeystroke
Boolean	ib_validresetvalue
n_cst_calculatorattrib inv_calculatorattrib

// API accessible attributes
Boolean	ib_closeonclick = True
Boolean	ib_initialvalue= False

//API accessible attributes - DataWindow only attributes.
string	is_dwcolumns[]
string	is_dwcolumnsexp[]
integer	ii_dwcolumnstyle[]
end variables

forward prototypes
public function integer of_setrequestor (dragobject adrg_requestor)
public function integer of_setcloseonclick (boolean ab_switch)
public function integer of_getregistered (ref string as_dwcolumns[])
public function boolean of_isregistered (string as_dwcolumn)
protected function integer of_setfocusonrequestor ()
public function integer of_register ()
public function integer of_register (string as_dwcolumn)
protected function integer of_setvalue (double adbl_value, boolean ab_setrequestor)
protected function integer of_performmath (ref double adbl_value, string as_operator, double idbl_operand)
protected function boolean of_isnumerictype (string as_type)
protected function integer of_buttonclicked (string as_key)
protected function integer of_setvalueonrequestor (string as_value)
protected function integer of_dropdown ()
public function integer of_register (string as_dwcolumn, integer ai_style)
public function integer of_register (integer ai_style)
public function integer of_unregister (string as_dwcolumn)
public function integer of_unregister ()
public function integer of_getregistered (ref string as_dwcolumns[], ref integer ai_dwcolumnstyle[])
public function integer of_getregisteredstyle (string as_dwcolumn)
public function integer of_reset ()
public function boolean of_IsCloseOnClick ()
public function integer of_setdropdown (boolean ab_switch)
public function boolean of_IsDropDown ()
public function integer of_GetRegisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_SetInitialValue (boolean ab_switch)
public function boolean of_IsInitialValue ()
protected function boolean of_isoperator (string as_operator)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
protected function integer of_redirectfocus ()
end prototypes

event pfc_dropdown;call super::pfc_dropdown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_dropdown
//
//	(Arguments:		None)
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Request the dropdown calculator.
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

Return of_DropDown()
end event

public function integer of_setrequestor (dragobject adrg_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRequestor
//
//	Access:    Public
//
//	Arguments:
//   adrg_requestor   The object requesting the service.
//			Valid objects are DataWindow! and editmask!.
//
//	Returns:  Integer
//		1 if it succeeds 
//		-1 if an error occurs.
//		-2 if attempting to associate object where only dropdowns are supported.
//		-3 MaskDataType is incorrect.
//
//	Description:  Associates an object control with this object 
//		by setting the requestor instance variable(s).
//		The valid objects which can be associated are of type datawindow and 
//		type editmask.  Editmask type should further have a mask of 
//		type DecimalMask! or NumericMask!.
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

dragobject	ldrg_notvalid
editmask		lem_testonly
boolean		lb_dropdownbehavior

// Validate Reference.
If IsNull(adrg_requestor) or Not IsValid(adrg_requestor) Then
	Return -1
End If

// Invalidate references.
idrg_requestor = ldrg_notvalid
idw_requestor = ldrg_notvalid
iem_requestor = ldrg_notvalid

// Is this object behaving as a dropdown object.
If IsValid(inv_dropdown) Then
	lb_dropdownbehavior = True
End If

// Make sure it is one of the expected type and get the 
// parent window reference.
CHOOSE CASE TypeOf(adrg_requestor)
	CASE DataWindow!
		// Datawindow object must be a dropdown.
		If Not lb_dropdownbehavior Then
			Return -2
		End If
		idw_requestor = adrg_requestor
	CASE EditMask!
		lem_testonly = adrg_requestor
		If lem_testonly.MaskDataType <> DecimalMask! And &
			lem_testonly.MaskDataType <> NumericMask! Then
			Return -3
		End If
		iem_requestor = adrg_requestor
		If Not lb_dropdownbehavior Then
			// Field cannot be typed on.
			iem_requestor.DisplayOnly = True
			// Set initial value.
			of_Reset()
		End If				
	CASE ELSE
		Return -1
END CHOOSE

// Set the generic reference.
idrg_requestor = adrg_requestor

Return 1
end function

public function integer of_setcloseonclick (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_CloseOnClick
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines when to close the object.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the switch that determines when to close the 
//						object.
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

// Check to see if the passed style number is valid.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_closeonclick = ab_switch
Return 1
end function

public function integer of_getregistered (ref string as_dwcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_dwcolumns[]	Columns names for which the service is providing a calculator 
//						(by reference)
//
//	Returns:  		integer
//						The number of entries in the returned array.
//
//	Description:  	This function returns the column names for which the service 
//						is providing calculator capabilities.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_style[]

Return of_GetRegistered(as_dwcolumns, li_style)
end function

public function boolean of_isregistered (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		boolean
//						True or False depending if the column is already registered.
//
//	Description: 	This function is called to determine if the passed in 
//						column name has already been registered with the service.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_count
integer	li_i

// Check arguments
If IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0 Then 
	Return False
End If

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return False
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find column name.
li_count = upperbound(is_dwcolumns)
For li_i=1 To li_count
	If is_dwcolumns[li_i] = as_dwcolumn THEN
		// Column name was found.
		Return True
	end if
Next

// Column name not found in array.
Return False
end function

protected function integer of_setfocusonrequestor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFocusOnRequestor
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Sets the focus on the requestor.
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

// Validate Reference.
If IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then 
	Return -1
End If

Return idrg_requestor.SetFocus()
end function

public function integer of_register ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 ai_style		The style for all the columns.
//
//	Returns:  		Integer
//						The number of columns registered.
//						-1 if an error is encountered.
//
//	Description: 	
//		Register all the appropriate columns that are holding numeric fields.
// 	This version should only be called when "ALL" date columns are desired, 
// 	otherwise call the version which accepts a column name as an argument.
//		Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Numeric.
//		*Note:	Function is only valid when serving a DataWindow control.
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

Return of_Register(NONE)
end function

public function integer of_register (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 as_dwcolumn	Column to register.
//	 ai_style		The columnstyle.
//
//	Returns:  		Integer
//						1 if the column was added.
//						0 if the column was not added.
//						-1 if an error is encountered.
//
//	Description: 	
//	 Register the column which should be holding an appropriate type field.
//	 Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Numeric.
//		*Note:	Function is only valid when serving a DataWindow control.
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

Return of_Register (as_dwcolumn, NONE)
end function

protected function integer of_setvalue (double adbl_value, boolean ab_setrequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetValue
//
//	Access:    Protected
//
//	Arguments:
//  adbl_value		The value to set.
//	 ab_setrequestor	Switch stating if the requestor object should get this value.
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 
//	Sets a new value.  If appropriate, it will also set the requestor to get
//	this new date.
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

Integer			li_rc = 1
Integer 			li_month
Integer 			li_year
Integer 			li_day
Integer  		li_FirstDayNum
String			ls_newcell

// Check the argument(s).
If IsNull(adbl_value) Then
	Return -1
End If

// Set the new date.
idbl_value = adbl_value

// If appropriate, set the requestor with the new date.
If ab_setrequestor Then
	of_SetValueOnRequestor( string(idbl_value) )
End If			 

Return li_rc
end function

protected function integer of_performmath (ref double adbl_value, string as_operator, double idbl_operand);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PerformMath
//
//	Access:    Protected
//
//	Arguments:	
//	 adbl_value(by reference) The running value.
//	 as_operator 	The operator.
//	 idbl_operand	The number to be used on the calculation.
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//
//	Description:  Perform the math according to the operator.
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
CHOOSE CASE as_operator
	CASE '/'
		If idbl_operand = 0 Then
			of_MessageBox('pfc_calculator_dividezero', 'Division', &
				'Division by zero is not valid', Exclamation!, Ok!, 1)
			Return -1
		Else
			adbl_value /= idbl_operand
		End If
	CASE '*'
		adbl_value *= idbl_operand					
	CASE '+'
		adbl_value += idbl_operand					
	CASE '-'
		adbl_value -= idbl_operand		
	CASE ELSE
		Return -1
END CHOOSE					

Return 1
end function

protected function boolean of_isnumerictype (string as_type);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsNumericType
//
//	Access: 			Protected
//
//	Arguments:		
//	 as_type			The type to test for.
//
//	Returns: 		boolean
//						True if the type is numeric. False otherwise.
//
//	Description:	Determine if the type passed in is of type numeric.
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
boolean	lb_numeric
string	ls_testtype

// Check the required reference.
If IsNull(as_type) Then
	Return False
End If

ls_testtype = Lower(Left(as_type, 4))
lb_numeric = (ls_testtype='deci' Or ls_testtype='long' Or ls_testtype='numb')

Return lb_numeric
end function

protected function integer of_buttonclicked (string as_key);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ButtonClicked
//
//	Access:    Protected
//
//	Arguments:	
//		as_key	The button/key pressed.
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the key is disregarded.
//
//	Description:  
//		Perform the calculator actions depending on the button/key pressed.
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

double ldbl_value
double ldbl_currvalue
Integer	li_rc

// Validate the keystroke.
as_key = Lower(as_key)
CHOOSE CASE as_key
	CASE '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', &
		  '/', '*', '+', '-', '=', 'c', 'ce'
	CASE ELSE
		Return -1
END CHOOSE

// Get the current running total.
ldbl_value = idbl_value

// Get the current value.
ldbl_currvalue = Double(is_currvalue)

CHOOSE CASE as_key
	CASE 'c'
		// Clear the Current variables.
		is_curroperator = EMPTY
		is_currvalue = EMPTY

		// Clear the Repeat variables.
		is_repeatoperator	= EMPTY
		idbl_repeatvalue = 0		
		
		// Clear the Running value.
		of_SetValue(0, True)
		
	CASE 'ce'		
		// Clear the Current Value but not the Current Operator.
		is_currvalue = EMPTY

		// Clear the Repeat Value but not the Repeat Operator.
		idbl_repeatvalue = 0	

		// Determine if this should also Clear the Running value.
		If is_curroperator=EMPTY Then
			// Clear the Running value.
			of_SetValue(0, True)
		Else
			// Do not Clear the Running value, only updates the current value.
			of_SetValueOnRequestor ('0')			
		End If
		
	CASE '.'
		If Pos(is_currvalue, '.')>0 Then
			// Disregard all '.' after one has been entered.
			Return 0
		End If
		is_currvalue += as_key
		of_SetValueOnRequestor (is_currvalue)
		
	CASE '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		is_currvalue += as_key
		idbl_repeatvalue = Double (is_currvalue)
		of_SetValueOnRequestor (is_currvalue)
		
	CASE '/', '*', '+', '-', '='
		// Determine if this operator simply replaces the previous operator.
		If of_IsOperator(as_key) And of_IsOperator(is_prevkeystroke) Then
			is_prevkeystroke = as_key
			is_curroperator = as_key
			Return 1
		End If
		
		// Conclude the previous operation.
		If Len(is_currvalue) > 0 And Len(is_curroperator) > 0 Then
			// Perform a new Math operation.
			If of_PerformMath (ldbl_value, is_curroperator, ldbl_currvalue) < 0 Then
				Return -1
			End If
			
		ElseIf Len(is_currvalue) > 0 And Len(is_curroperator) = 0 Then
			// There is no Math operation, use the current value as the new value.
			ldbl_value = ldbl_currvalue
			
		ElseIf as_key = '=' And Len(is_repeatoperator)>0 Then
			// Perform a Repeat Math operation.
			If of_PerformMath (ldbl_value, is_repeatoperator, idbl_repeatvalue) < 0 Then
				Return -1
			End If			
		End If

		// Keep track of the last repeat action.
		If of_IsOperator(as_key) Then
			// The last operator is the new Repeat operator.
			is_repeatoperator = as_key
			// Update the repeat value to the current running value.
			idbl_repeatvalue = ldbl_value
		End If

		// Reset the Current variables.
		is_curroperator = EMPTY					
		is_currvalue = EMPTY
		If of_IsOperator(as_key) Then
			is_curroperator = as_key		
		End If				
		
		// Set the new value.
		of_SetValue (ldbl_value, True)
END CHOOSE

// Store the previous keystroke.
is_prevkeystroke = as_key

Return 1
end function

protected function integer of_setvalueonrequestor (string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetValueOnRequestor
//
//	Access:    Public
//
//	Arguments:
//   adbl_value	The value to set.
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Sets the value on the requestor.
//
//	*Note: This function's argument is a string in order to not loose the decimal
//		point in numbers that have no decimal values. (i.e. 6.)
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

// Validate Reference.
If IsValid(idw_requestor) Or IsValid(iem_requestor) Then
	// Good reference.
Else
	Return -1
End If

// Validate the value.
If Not IsNumber(as_value) Then
	Return -1
End If

// Set the requestor with the new value.
If IsValid(idw_requestor) Then
	idw_requestor.SetText(as_value)
ElseIf IsValid(iem_requestor) Then
	iem_requestor.Text = as_value	
Else
	Return -1
End If

Return 1
end function

protected function integer of_dropdown ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DropDown
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Drop Down the Object after getting the appropriate location.
//		For datawindow columns check that the current column has 
//		been registered.
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
Integer 	li_rc
String	ls_colname
String	ls_coltype
Integer	li_x
Integer	li_y

// Check the required references.
If IsNull(inv_dropdown) Or Not IsValid(inv_dropdown) or &
	IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then
	Return -1
End If

// Datawindow control specific checks.
If IsValid(idw_requestor) Then
	// Get the current column name.
	ls_colname = idw_requestor.GetColumnName()

	// Check if column is in the search column array.
	If Not of_IsRegistered(ls_colname) Then
		Return 0
	End If

	// Validate that it is still an appropriate type.
	ls_coltype = idw_requestor.Describe(ls_colname+".coltype")
	If Not of_IsNumericType(ls_coltype) Then
		Return -1
	End If
End If

// Set this object on its new Position.
li_rc = inv_dropdown.of_Position(idrg_requestor, False)
If li_rc < 0 Then Return -1

// Set the current value on the calculator.
of_Reset()

// Show the object.
This.Visible = True	

Return 1

end function

public function integer of_register (string as_dwcolumn, integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 as_dwcolumn	Column to register.
//	 ai_style		The columnstyle.
//
//	Returns:  		Integer
//						1 if the column was added.
//						0 if the column was not added.
//						-1 if an error is encountered.
//
//	Description: 	
//	 Register the column which should be holding an appropriate type field.
//	 Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Numeric.
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer 		li_cnt, li_rc
integer		li_availableentry
integer		li_upperbound
string		ls_coltype
string		ls_modexp
string		ls_descexp
string		ls_descret
string		ls_editstyle
string		ls_storemodify=''
string		ls_rc

// Check the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Check arguments
If (IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0) Or &
	(ai_style < NONE or ai_style >  DDLB_WITHARROW) Or &
	IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then 
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Check if the column is already registered.
If of_IsRegistered(as_dwcolumn) Then
	Return 0
End If

// Get the column type.

ls_coltype = idw_requestor.Describe(as_dwcolumn+".coltype")

// Only add if of numeric type.
If of_IsNumericType(ls_coltype) Then

	// Get the upperbound of all registered columns.
	li_upperbound = upperbound(is_dwcolumns)
	
	// Determine if there is an open slot available other than a
	// new entry on the array
	For li_cnt = 1 to li_upperbound
		If IsNull(is_dwcolumns[li_cnt]) or Len(Trim(is_dwcolumns[li_cnt])) = 0 Then
			If li_availableentry = 0 Then
				//Get the first slot found
				li_availableentry = li_cnt
				Exit
			End If
		End If
	Next
	//If an available slot was not found then create a new entry
	If li_availableentry = 0 Then
		li_availableentry = li_upperbound + 1
	End If
		
	// Add/Initilize the new entry.				
	is_dwcolumns[li_availableentry] = as_dwcolumn
	ii_dwcolumnstyle[li_availableentry] = ai_style
	is_dwcolumnsexp[li_availableentry] = ''
	
	If ai_style = DDLB Or ai_style = DDLB_WITHARROW Then	

		// Store the Modify expression needed to unregister the column.
		ls_editstyle = idw_requestor.Describe (as_dwcolumn+".Edit.Style")
		CHOOSE CASE Lower(ls_editstyle)
			CASE 'edit'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".Edit.Required")
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".Edit.Required=" + ls_descret + " "
					ls_modexp = as_dwcolumn+".DDLB.Required=" + ls_descret + " "
				End If			
				ls_descret = idw_requestor.Describe (as_dwcolumn+".Edit.NilIsNull")				
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".Edit.NilIsNull=" + ls_descret + " "				
					ls_modexp += as_dwcolumn+".DDLB.NilIsNull=" + ls_descret + " "
				End If					
			CASE 'editmask'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.Mask")
				If ls_descret = '!' or ls_descret = '?' Then
					ls_storemodify += as_dwcolumn+".EditMask.Mask='' "		
				Else
					ls_storemodify += as_dwcolumn+".EditMask.Mask='" + ls_descret + "' "				
				End If						
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.Required")
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".EditMask.Required=" + ls_descret + " "				
					ls_modexp = as_dwcolumn+".DDLB.Required=" + ls_descret + " "
				End If			
				ls_descret = idw_requestor.Describe (as_dwcolumn+".EditMask.NilIsNull")				
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify += as_dwcolumn+".EditMask.NilIsNull=" + ls_descret + " "				
					ls_modexp += as_dwcolumn+".DDLB.NilIsNull=" + ls_descret + " "
				End If					
			CASE 'ddlb'
				ls_descret = idw_requestor.Describe (as_dwcolumn+".DDLB.useasborder")	
				If ls_descret = 'yes' or ls_descret = 'no' Then
					ls_storemodify = as_dwcolumn+".DDLB.useasborder=" + ls_descret + " "	
				End If			
			CASE Else
				// Not a valid original edit style.
				Return -1
		END CHOOSE
			
		// Store the Modify statement that allows unregister.
		is_dwcolumnsexp[li_availableentry] = ls_storemodify		
		
		// Convert to DDLB.
		ls_modexp += as_dwcolumn+".DDLB.limit=0 " + &
						 as_dwcolumn+".DDLB.AllowEdit=Yes " 
		ls_rc = idw_requestor.Modify (ls_modexp)
		If Len(ls_rc) > 0 Then Return -1

		If ai_style = DDLB_WITHARROW Then		
			ls_modexp =	as_dwcolumn+".DDLB.useasborder=Yes " 
			ls_rc = idw_requestor.Modify (ls_modexp)	
			If Len(ls_rc) > 0 Then Return -1			
		End If
	End If	
	
	// The column was registered.
	Return 1
End If	

// The column was not registered.
Return 0

end function

public function integer of_register (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	 ai_style		The style for all the columns.
//
//	Returns:  		Integer
//						The number of columns registered.
//						-1 if an error is encountered.
//
//	Description: 	
//		Register all the appropriate columns that are holding numeric fields.
// 	This version should only be called when "ALL" date columns are desired, 
// 	otherwise call the version which accepts a column name as an argument.
//		Columns need to be of editstyle 'ddlb', 'edit' or 'editmask'.
//
//		*Note:	For a column to be added it most have a field of type Numeric.
//		*Note:	Function is only valid when serving a DataWindow control.
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

integer		li_colcount, li_i, li_count, li_rc
string		ls_colname
string		ls_coltype
string		ls_editstyle

// Check the arguments.
If	(ai_style < NONE or ai_style >  DDLB_WITHARROW)  Then
	Return -1
End If

// Check the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for date columns.
For li_i=1 to li_colcount
	//Get-Validate the name and column type of the column.
	ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")
	ls_coltype = idw_requestor.Describe("#"+string(li_i)+".ColType")	
	ls_editstyle = idw_requestor.Describe ("#"+string(li_i)+".Edit.Style")
	If ls_coltype = '!' or ls_colname = '!' or ls_editstyle = '!' Then 
		Return -1	
	End If
	
	If ls_editstyle = 'ddlb' or ls_editstyle='edit' or ls_editstyle='editmask' Then
		If of_IsNumericType(ls_coltype) Then
			// Add entry into array.
			li_rc = of_Register(ls_colname, ai_style)
		End If
	End If
Next

Return upperbound(is_dwcolumns)
end function

public function integer of_unregister (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		Integer
//	1 successful.
// 0 not previously registered.
//	-1 error.
//
//	Description: 	
//	 UnRegisters the object from the service by the column name.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

Integer	li_upper
Integer	li_cnt
String	ls_rc

// Check for a valid ID.
If IsNull(as_dwcolumn) or Len(Trim(as_dwcolumn))= 0  Then
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find the Column.
li_upper = UpperBound(is_dwcolumns)
For li_cnt = 1 to li_upper
	If as_dwcolumn = is_dwcolumns[li_cnt] Then 
		// The entry has been found.  
		// Clear out any attribute changes.
		If Len(is_dwcolumnsexp[li_cnt]) > 0 Then
			ls_rc = idw_requestor.Modify (is_dwcolumnsexp[li_cnt])	
			If Len(ls_rc) > 0 Then 
				Return -1			
			End If
		End If

		// Perform the actual Unregister.
		is_dwcolumns[li_cnt] = EMPTY
		is_dwcolumnsexp[li_cnt]= EMPTY
		ii_dwcolumnstyle[li_cnt]= 0
		
		Return 1
	End If
Next

// The column was not found.
Return 0
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UnRegister
//
//	Access:  		Public.
//
//	Arguments:		None
//
//	Returns:  		Integer
//	1 successful.
// 0 nothing previously registered.
//
//	Description: 	
//	 UnRegisters all registerd columns from the service.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

Integer	li_upper
Integer	li_cnt
Integer	li_unregistered = 0

// Loop around all registered columns.
li_upper = UpperBound(is_dwcolumns)
For li_cnt = 1 to li_upper
	If Len(is_dwcolumns[li_cnt]) > 0 Then
		If of_Unregister(is_dwcolumns[li_cnt]) = 1 Then
			li_unregistered ++
		End If
	End If
Next

If li_unregistered > 0 Then
	Return 1
End If
	
Return 0
end function

public function integer of_getregistered (ref string as_dwcolumns[], ref integer ai_dwcolumnstyle[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_dwcolumns[]	Columns names for which the service is providing a calculator 
//						(by reference)
//	ai_dwcolumnstyle[] The style for the columns (by reference)

//
//	Returns:  		integer
//						The number of entries in the returned array(s).
//
//	Description:  	This function returns the column names for which the service 
//						is providing calculator capabilities.  It also returns the style.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer 	li_i
integer	li_loop
integer	li_upper
integer	li_cnt
string	ls_empty[]
integer	li_empty[]

// Initialize strings.
as_dwcolumns = ls_empty
ai_dwcolumnstyle = li_empty

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Loop around all entries and populate arrays with columnnames and style.
li_upper = upperbound(is_dwcolumns)
For li_i=1 To li_upper
	If Len(is_dwcolumns[li_i]) > 0 Then
		li_cnt ++
		as_dwcolumns[li_cnt] = is_dwcolumns[li_i]
		ai_dwcolumnstyle[li_cnt] = ii_dwcolumnstyle[li_i]
	End If
Next

Return UpperBound(as_dwcolumns)
end function

public function integer of_getregisteredstyle (string as_dwcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisteredStyle
//
//	Access:  		Public.
//
//	Arguments:
//	as_dwcolumn		The registered column to search for.
//
//	Returns:  		integer
//		The style for the column passed in.
//		0 if the column is not registered.
//		-1 if an error is encountered.
//
//	Description: 	
//	 This function is called to determine the style of the column name passed in.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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
integer	li_count
integer	li_i

// Check arguments
If IsNull(as_dwcolumn) Or Len(Trim(as_dwcolumn))=0 Then 
	Return 0
End If

// Validate the references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Trim and Convert to lower case.
as_dwcolumn = Trim(Lower(as_dwcolumn))

// Find column name.
li_count = upperbound(is_dwcolumns)
For li_i=1 To li_count
	If is_dwcolumns[li_i] = as_dwcolumn THEN
		// Column name was found.
		Return ii_dwcolumnstyle[li_i]
	end if
Next

// Column name not found in array.
Return 0
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Reset
//
//	Access:    Public
//
//	Arguments:	None.
//
//	Returns:  Integer
//		1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 
//		Resets the object value to the current value found on the requestor.
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

integer	li_rc
string 	ls_value

// Validate Reference.
If IsValid(idw_requestor) Or IsValid(iem_requestor) Then
	// Good reference.
Else
	Return -1
End If

// Get the current value from the requesting object.
If IsValid(idw_requestor) Then
	ls_value = idw_requestor.GetText()
ElseIf IsValid(iem_requestor) Then
	ls_value = iem_requestor.Text
Else
	Return -1
End If

// Bring focus on the object.
li_rc = SetFocus(this)
li_rc = SetFocus(dw_calculator)

// Validate the value.
// Keep track if the value was valid or not.
ib_validresetvalue = IsNumber(ls_value)
If ib_validresetvalue Then
	// Set the new date.  Do not Update the requestor.
	of_SetValue(Double(ls_value), False)
Else
	// Set the new value.  The requestor is/is_not updated according 
	// to the ib_initialvalue attribute.
	of_SetValue(0, ib_initialvalue)
End If

// Clear the Current value variables.
is_curroperator = EMPTY
is_currvalue = EMPTY

// Clear the Repeat value variables.
is_repeatoperator	= EMPTY
idbl_repeatvalue = 0

Return 1
end function

public function boolean of_IsCloseOnClick ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsCloseOnClick
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Boolean
//  True / False
//
//	Description:  	
//		Helps in determining when it is ok to close the object. "Single Click"
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

Return ib_closeonclick
end function

public function integer of_setdropdown (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetDropDown
//
//	Arguments:
//	ab_switch   starts/stops the UserObject DropDown service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action necessary
//	-1 = An error was encountered
//
//	Description:
//	Starts or stops the UserObject DropDown service
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

integer	li_rc

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_dropdown) Or not IsValid (inv_dropdown) then
		inv_dropdown = create n_cst_dropdown
		inv_dropdown.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_dropdown) then
		destroy inv_dropdown
		li_rc = 1
	end if
end if

return li_rc
end function

public function boolean of_IsDropDown ();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_IsDropDown
//
//	Arguments: None
//
//	Returns:  boolean
//	 True if the behavior is that of a DropDown object.
//	 False if not.
//
//	Description:
//	Reports if the behavior of the object is that of a DropDown object.
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

If IsValid (inv_dropdown) then
	Return True
End If

Return False

end function

public function integer of_GetRegisterable (ref string as_allcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisterable
//
//	Access:  		public
//
//	Arguments:
//	as_allcolumns[] By Reference.  All columns belonging to the requestor which
//						could be registered.
//
//	Returns:  		Integer
//	 The column count.
//	-1 if an error is encountered.
//
//	Description:
//	 Determines all columns belonging to the requestor which could be registered.
//
//		*Note:	Function is only valid when serving a DataWindow control.
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

integer		li_colcount, li_i
integer		li_count
string		ls_coltype
string		ls_colname
string		ls_editstyle
string		ls_allcolumns[]

// Initialize.
as_allcolumns = ls_allcolumns

// Validate required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for Date columns.
For li_i=1 to li_colcount
	ls_coltype = idw_requestor.Describe("#"+string(li_i)+".coltype")
	ls_editstyle = idw_requestor.Describe ("#"+string(li_i)+".Edit.Style")

	If ls_editstyle = 'ddlb' or ls_editstyle='edit' or ls_editstyle='editmask' Then
		If of_IsNumericType(ls_coltype) Then	
			ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")

			// Add entry into array.
			li_count = upperbound(ls_allcolumns) +1
			ls_allcolumns[li_count] = ls_colname		
		End If
	End If
	
Next

as_allcolumns = ls_allcolumns
Return UpperBound(as_allcolumns)

end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Object Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'Calculator'
anv_infoattrib.is_description = &
	'Provides Datawindows and EditMask numeric fields with a Calculator '+&
	'functionality.'
	
Return 1
end function

public function integer of_SetInitialValue (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetInitialValue
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines if a zero value should be set on the
//					requestor when a null value is found on the requestor.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	
// Sets the switch that determines if an initial '0' value should be used when
// an initial invalid value or no value is found on the requestor.
//
// *Note: The main behavior change through this attribute is in the row/column status.
//		For example,
//		A) The attribute is set to True.
//			1) The calculator is requested on a field that has no value.
//			2) The calculator drops down.
//			3) The field displays a zero value.  This means the column status may
//				have changed.  One possibility is from NotModified! to Modified!.
//		B) The attribute is set to False.
//			1) The calculator is requested on a field that has no value.
//			2) The calculator drops down.
//			3) The field continues to display empty.  This means the column status 
//				has not changed.
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

// Validate the argument.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_initialvalue = ab_switch
Return 1
end function

public function boolean of_IsInitialValue ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsInitialValue
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Boolean
//
//	Description:
// Gets the switch that determines if an initial '0' value should be used when
// an initial invalid value or no value is found on the requestor.
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

Return ib_initialvalue

end function

protected function boolean of_isoperator (string as_operator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsOperator
//
//	Access:    Protected
//
//	Arguments:	
//		as_operator	A value to be tested.
//
//	Returns:  Boolean
//	True if the tested value is an operator.
//
//	Description:  
//	Determines if the passed in value is an operator.
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

CHOOSE CASE as_operator
	CASE '/', '*', '+', '-'
		Return True
END CHOOSE

Return False

end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvcalculator'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

protected function integer of_redirectfocus ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RedirectFocus
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//	1 if it succeeds.
//	-1 if an error occurs.
//
//	Description:  
//	Prevent this object from having focus while not visible.
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

// Prevent this object from having focus while not visible.
If this.Visible = False Then
	Return of_SetFocusOnRequestor()
End If

Return 1
end function

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	The Calculator object.
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

If IsValid(Message.PowerObjectParm) Then
	If inv_calculatorattrib.ClassName() = Message.PowerObjectParm.ClassName() Then
		inv_calculatorattrib = Message.PowerObjectParm
		
		// Is the object to behave as a dropdown object?
		If inv_calculatorattrib.ib_dropdown Then
			// Yes, it is a dropdown object.  
			// Immediately hide the object and Create the dropdown service.
			this.Visible = False	
			of_SetDropDown(True)
		End If
	End IF
End If

// This is not an updateable object.
this.of_SetUpdateable(False)
end event

on pfc_u_calculator.create
int iCurrent
call u_base::create
this.dw_calculator=create dw_calculator
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=dw_calculator
end on

on pfc_u_calculator.destroy
call u_base::destroy
destroy(this.dw_calculator)
end on

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Destructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Destroy the instantiated services attached.
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

// Unregister all columns.
of_Unregister()

of_SetDropDown(False)
end event

type dw_calculator from u_dw within pfc_u_calculator
event key pbm_dwnkey
int X=0
int Y=0
int Width=462
int Height=420
int TabOrder=20
string DataObject="d_calculator"
boolean VScrollBar=false
boolean LiveScroll=false
end type

event key;call super::key;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  key
//
//	Arguments:
//	key
//	keyflags
//
//	Returns:  None
//
//	Description:  
//	Provide KeyBoard support.
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

String	ls_buttontext

// Look out for the Escape and the Tab keys.
Choose Case key
	Case KeyEscape! 
		//If appropriate, hide the Calendar.
		If IsValid(inv_dropdown) Then
			If ib_closeonclick Then
				// Set focus on the Requestor object which in turns hides the calendar.
				of_SetFocusOnRequestor()
			End If
		End If
		Return
	Case KeyTab!
		If IsValid(inv_dropdown) Then
			Post of_SetFocusOnRequestor()
		End If
		Return
End Choose

// Determine what action to take.
If KeyDown(KeyDecimal!) or (Not KeyDown(KeyShift!) And KeyDown(KeyPeriod!)) Then
	ls_buttontext = '.'
ElseIf KeyDown(KeyNumpad0!) or (Not KeyDown(KeyShift!) And KeyDown(Key0!)) Then
	ls_buttontext = '0'
ElseIf KeyDown(KeyNumpad1!) or (Not KeyDown(KeyShift!) And KeyDown(Key1!)) Then
	ls_buttontext = '1'
ElseIf KeyDown(KeyNumpad2!) or (Not KeyDown(KeyShift!) And KeyDown(Key2!)) Then
	ls_buttontext = '2'
ElseIf KeyDown(KeyNumpad3!) or (Not KeyDown(KeyShift!) And KeyDown(Key3!)) Then
	ls_buttontext = '3'
ElseIf KeyDown(KeyNumpad4!) or (Not KeyDown(KeyShift!) And KeyDown(Key4!)) Then
	ls_buttontext = '4'
ElseIf KeyDown(KeyNumpad5!) or (Not KeyDown(KeyShift!) And KeyDown(Key5!)) Then
	ls_buttontext = '5'
ElseIf KeyDown(KeyNumpad6!) or (Not KeyDown(KeyShift!) And KeyDown(Key6!)) Then
	ls_buttontext = '6'
ElseIf KeyDown(KeyNumpad7!) or (Not KeyDown(KeyShift!) And KeyDown(Key7!)) Then
	ls_buttontext = '7'
ElseIf KeyDown(KeyNumpad8!) or (Not KeyDown(KeyShift!) And KeyDown(Key8!)) Then
	ls_buttontext = '8'
ElseIf KeyDown(KeyNumpad9!) or (Not KeyDown(KeyShift!) And KeyDown(Key9!)) Then
	ls_buttontext = '9'
ElseIf KeyDown(KeyAdd!) or (KeyDown(KeyShift!) And KeyDown(KeyEqual!)) Then
	ls_buttontext = '+'
ElseIf KeyDown(KeySubtract!) or (Not KeyDown(KeyShift!) And KeyDown(KeyDash!)) Then
	ls_buttontext = '-'
ElseIf KeyDown(KeyMultiply!) or (KeyDown(KeyShift!) And KeyDown(Key8!)) Then
	ls_buttontext = '*'
ElseIf KeyDown(KeyDivide!) or (Not KeyDown(KeyShift!) And KeyDown(KeySlash!)) Then
	ls_buttontext = '/'
ElseIf KeyDown(KeyEnter!) or (Not KeyDown(KeyShift!) And KeyDown(KeyEqual!)) Then
	ls_buttontext = '='
Else
	// Not a key on which action is needed.
	Return
End IF

// Tell the object of the clicked button.
If Len(ls_buttontext) > 0 Then
	of_ButtonClicked (ls_buttontext)
End If

// Determine if the Main object should go away.
If ls_buttontext = '=' Then
	If IsValid(inv_dropdown) And ib_closeonclick Then			
		of_SetFocusOnRequestor()
		Return
	End If
End If

Return
end event

event buttonclicked;call super::buttonclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  buttonclicked
//
//	Arguments:	
//	row
//	actionreturncode
//	dwo
//
//	Returns:  None
//
//	Description:  
//	Tell the object which button has been pressed.
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

Integer	li_rc
String 	ls_buttonname
String 	ls_buttontext

If IsNull(dwo) Then Return
If IsNull(dwo.Name) Then Return
If IsNull(dwo.Text) Then Return

// Get the clicked information.
ls_buttonname = Trim(dwo.Name)
ls_buttontext = Trim(dwo.Text)

// Tell the object of the clicked button.
If Len(ls_buttontext) > 0 Then
	of_ButtonClicked (ls_buttontext)
End If

// Determine if the Main object should go away.
If ls_buttontext = '=' Then
	If IsValid(inv_dropdown) And ib_closeonclick Then			
		of_SetFocusOnRequestor()
		Return
	End If
End If
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:
// Make sure there is one row.
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

// This is not an updateable object.
this.of_SetUpdateable(False)

// Make sure there is one row.
If this.RowCount() <> 1 Then
	this.Reset()
	this.InsertRow(0)
End If
end event

event getfocus;call super::getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  getfocus
//
//	Arguments:	None
//
//	Returns:  None
//
//	Description:  
//	Description:	The object may need to redirect focus when not visible.
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

// Prevent this object from having focus while not visible.
Post of_RedirectFocus()
end event

event losefocus;call super::losefocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  losefocus
//
//	Arguments:	None
//
//	Returns:  None
//
//	Description:  
//	If this object is being used as a DropDown object, hide it when focus
// is lost.
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

//Determine if the object is being used as a dropdown object.
If IsValid(inv_dropdown) Then
	// Hide object.
	Parent.Visible = False
End If

Return
end event

