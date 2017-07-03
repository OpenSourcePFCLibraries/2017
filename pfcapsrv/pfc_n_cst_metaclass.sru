HA$PBExportHeader$pfc_n_cst_metaclass.sru
$PBExportComments$PFC metaclass service
forward
global type pfc_n_cst_metaclass from nonvisualobject
end type
end forward

global type pfc_n_cst_metaclass from nonvisualobject autoinstantiate
end type

forward prototypes
public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[])
public function boolean of_iseventdefined (string as_classname, string as_eventname)
public function boolean of_iseventimplemented (string as_classname, string as_eventname)
public function variabledefinition of_findmatchingvariable (classdefinition acd_object, string as_varname)
public function variabledefinition of_findmatchingvariable (scriptdefinition ascrd_object, string as_varname)
public function scriptdefinition of_findmatchingevent (classdefinition acd_object, string as_eventname)
public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass)
public function integer of_getancestorclasses (string as_sourceclass, ref classdefinition acd_ancestorclass[])
public function integer of_getancestorclasses (classdefinition acd_sourceclass, ref classdefinition acd_ancestorclass[])
public function boolean of_isancestorclass (classdefinition acd_source, string as_ancestorclass)
public function boolean of_iseventdefined (classdefinition acd_source, string as_eventname)
public function boolean of_iseventimplemented (classdefinition acd_source, string as_eventname)
public function boolean of_isfunctiondefined (classdefinition acd_source, string as_functionname, string as_argtype[])
end prototypes

public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isFunctionDefined
//
//	Access:
//	public
//
//	Arguments:
//	as_classname		classname to check if function is defined for
//	as_functionname	function name to check if it is defined on as_classname
//	as_argtype[]		array of argument data types that are signature of as_functionname
//
//	Returns:
//	boolean
//	true = function is defined for class
//	false = function is not defined for class
//
//	Description:
//	Determines if a function is defined for a class
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

classdefinition	lcd_object

// Find class definition
lcd_object = findClassDefinition (as_classname)

return of_isFunctionDefined (lcd_object, as_functionname, as_argtype[])
end function

public function boolean of_iseventdefined (string as_classname, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isEventDefined
//
//	Access:
//	public
//
//	Arguments:
//	as_classname		classname to check if event is defined for
//	as_eventname		event name to check if it is defined on as_classname
//
//	Returns:
//	boolean
//	true = event is defined for class
//	false = event is not defined for class
//
//	Description:
//	Determines if a event is defined for a class
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

classdefinition	lcd_object

// Find class definition
lcd_object = findClassDefinition (as_classname)

return of_isEventDefined (lcd_object, as_eventname)
end function

public function boolean of_iseventimplemented (string as_classname, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isEventImplemented
//
//	Access:
//	public
//
//	Arguments:
//	as_classname		classname to check if event is implemented for
//	as_eventname		event name to check if it is implemented on as_classname
//
//	Returns:
//	boolean
//	true = event is implemented for class
//	false = event is not implemented for class
//
//	Description:
//	Determines if a event is implemented (defined and scripted) for a class
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

classdefinition	lcd_object

// Find class definition
lcd_object = findClassDefinition (as_classname)

return of_isEventImplemented (lcd_object, as_eventname)
end function

public function variabledefinition of_findmatchingvariable (classdefinition acd_object, string as_varname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_findMatchingVariable
//
//	Access:
//	public
//
//	Arguments:
//	acd_object	classdefinition reference for variables that are to be found
//	as_varname	variable name to find definition for
//
//	Returns:
//	variabledefinition
//	If varname is not found on classdefinition or classdefinition is invalid, returns NULL
//
//	Description:
//	Finds a variabledefinition reference for the passed in variable name and classdefinition
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

boolean	lb_found
int		li_variables
int		li_cnt = 1
variabledefinition	lvrd_object
variabledefinition		lvrd_list[]

setNull (lvrd_object)

// Verify class definition
if not isValid (acd_object) or isNull (acd_object) then
	return lvrd_object
end if

// Find matching variable
lvrd_list[] = acd_object.variablelist[]
li_variables = upperBound (lvrd_list)
do while li_cnt <= li_variables and not lb_found
	if acd_object.variablelist[li_cnt].name = as_varname then
		lb_found = true
	else
		li_cnt++
	end if
loop

return acd_object.variablelist[li_cnt]
end function

public function variabledefinition of_findmatchingvariable (scriptdefinition ascrd_object, string as_varname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_findMatchingVariable
//
//	Access:
//	public
//
//	Arguments:
//	ascrd_object	scriptdefinition reference for variables that are to be found
//	as_varname		variable name to find definition for
//
//	Returns:
//	variabledefinition
//	If varname is not found for ascrd_object or ascrd_object is invalid, returns NULL
//
//	Description:
//	Returns a variabledefinition for the passed in variable name and scriptdefinition reference.
//	This function will look for the variable in both local variables and arguments.
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

boolean	lb_found
int		li_variables
int		li_cnt = 1
variabledefinition	lvrd_object
variabledefinition	lvrd_local[]
variabledefinition	lvrd_arg[]

setNull (lvrd_object)

// Verify script definition
if not isValid (ascrd_object) or isNull (ascrd_object) then
	return lvrd_object
end if

// Check for matching variable in arguments
lvrd_arg[] = ascrd_object.argumentList[]
li_variables = upperBound (lvrd_arg[])
do while li_cnt <= li_variables and not lb_found
	if ascrd_object.argumentList[li_cnt].name = as_varname then
		lb_found = true
	else
		li_cnt++
	end if
loop
if lb_found then
	return ascrd_object.argumentList[li_cnt]
else
	li_cnt = 1
end if

// Check for matching variable in local variables
lvrd_local[] = ascrd_object.localVariableList[]
li_variables = upperBound (lvrd_local[])
do while li_cnt <= li_variables and not lb_found
	if ascrd_object.localVariableList[li_cnt].name = as_varname then
		lb_found = true
	else
		li_cnt++
	end if
loop
if lb_found then
	lvrd_object = ascrd_object.localVariableList[li_cnt]
end if

return lvrd_object
end function

public function scriptdefinition of_findmatchingevent (classdefinition acd_object, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_findMatchingEvent
//
//	Access:
//	public
//
//	Arguments:
//	acd_object	classdefinition reference to find event for
//	as_eventname	event name to find on class definition
//
//	Returns:
//	scriptdefinition
//	NULL scriptdefinition will be returned if acd_object is not valid or if as_eventname
//	could not be found.
//
//	Description:
//	Returns the scriptdefinition for a given eventname and classdefinition
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

boolean	lb_found
int		li_scripts
int		li_cnt = 1
scriptdefinition	lscrd_object
scriptdefinition	lscrd_list[]

setNull (lscrd_object)

// Check class definition
if not isValid (acd_object) or isNull (acd_object) then
	return lscrd_object
end if

// Find event definition
lscrd_list[] = acd_object.scriptList[]
li_scripts = upperBound (lscrd_list[])
do while li_cnt <= li_scripts and not lb_found
	if acd_object.scriptlist[li_cnt].name = as_eventname and acd_object.scriptlist[li_cnt].kind = scriptevent! then
		lb_found = true
	else
		li_cnt++
	end if
loop

if lb_found then
	lscrd_object = acd_object.scriptlist[li_cnt]
end if

return lscrd_object
end function

public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isAncestorClass
//
//	Access:
//	public
//
//	Arguments:
//	as_sourceclass		source classname
//	as_ancestorclass	ancestor classname
//
//	Returns:
//	boolean
//
//	Description:
//	Determines if as_ancestorclass is an ancestor class of as_sourceclass
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

boolean	lb_ancestor
classdefinition	lcd_source

// Validate source classname
lcd_source = findClassDefinition (as_sourceclass)

return of_isAncestorClass (lcd_source, as_ancestorclass)
end function

public function integer of_getancestorclasses (string as_sourceclass, ref classdefinition acd_ancestorclass[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_getAncestorClasses
//
//	Access:
//	public
//
//	Arguments:
//	as_sourceclass		classname to get ancestor classes for
//	acd_ancestorclass[]	ancestor classesdefinitions by reference
//
//	Returns:
//	integer
//	Returns the number of ancestor classes
//	Returns -1 if there is an error
//
//	Description:
//	Gets all ancestor classdefinitions of a given classname.
//	Classes are returned in ascending order (subclass to ancestor class)
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

classdefinition	lcd_object

// Find sourceclass
lcd_object = findClassDefinition (as_sourceclass)

return of_getAncestorClasses (lcd_object, acd_ancestorclass[])
end function

public function integer of_getancestorclasses (classdefinition acd_sourceclass, ref classdefinition acd_ancestorclass[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_getAncestorClasses
//
//	Access:
//	public
//
//	Arguments:
//	acd_sourceclass		classdefinition to get ancestor classes for
//	acd_ancestorclass[]	ancestor classesdefinitions by reference
//
//	Returns:
//	integer
//	Returns the number of ancestor classes
//	Returns -1 if there is an error
//
//	Description:
//	Gets all ancestor classdefinitions of a given classdefinition.
//	Classes are returned in ascending order (subclass to ancestor class)
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

int	li_cnt = 1
classdefinition	lcd_test
classdefinition	lcd_temp[]

// Check source classdefinition
if not isValid (acd_sourceclass) or isNull (acd_sourceclass) then
	return -1
end if

// Clear the reference array
acd_ancestorclass[] = lcd_temp[]

// Get ancestor classes
lcd_test = acd_sourceclass.ancestor
do while isValid (lcd_test)
	acd_ancestorclass[li_cnt] = lcd_test
	li_cnt++
	lcd_test = lcd_test.ancestor
loop

return upperBound (acd_ancestorclass[])
end function

public function boolean of_isancestorclass (classdefinition acd_source, string as_ancestorclass);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isAncestorClass
//
//	Access:
//	public
//
//	Arguments:
//	acd_source	source classdefinition
//	as_ancestorclass	ancestor classname
//
//	Returns:
//	boolean
//
//	Description:
//	Determines if as_ancestorclass is an ancestor class of acd_source
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

boolean	lb_ancestor
classdefinition	lcd_ancestor
classdefinition	lcd_test

// Validate classnames
if not isValid (acd_source) or isNull (acd_source) then
	return lb_ancestor
end if
lcd_ancestor = findClassDefinition (as_ancestorclass)
if not isValid (lcd_ancestor) or isNull (lcd_ancestor) then
	return lb_ancestor
end if

// Check if there is an ancestor relationship
lcd_test = acd_source.ancestor
do while isValid (lcd_test) and not lb_ancestor
	if lcd_test.name = lcd_ancestor.name then
		lb_ancestor = true
	else
		lcd_test = lcd_test.ancestor
	end if
loop

return lb_ancestor
end function

public function boolean of_iseventdefined (classdefinition acd_source, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isEventDefined
//
//	Access:
//	public
//
//	Arguments:
//	acd_source		classdefinition to check if event is defined for
//	as_eventname	event name to check if it is defined for acd_source
//
//	Returns:
//	boolean
//	true = event is defined for class
//	false = event is not defined for class
//
//	Description:
//	Determines if a event is defined for a class
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

boolean	lb_found
int		li_scripts
int		li_cnt = 1
scriptdefinition	lscrd_object

// Check class definition
if not isValid (acd_source) or isNull (acd_source) then
	return lb_found
end if

// Find event definition
li_scripts = upperBound (acd_source.scriptlist)
do while li_cnt <= li_scripts and not lb_found
	if acd_source.scriptlist[li_cnt].name = as_eventname and acd_source.scriptlist[li_cnt].kind = scriptevent! then
		lb_found = true
	else
		li_cnt++
	end if
loop

return lb_found
end function

public function boolean of_iseventimplemented (classdefinition acd_source, string as_eventname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isEventImplemented
//
//	Access:
//	public
//
//	Arguments:
//	acd_source			classdefinition to check if event is implemented for
//	as_eventname		event name to check if it is implemented on acd_source
//
//	Returns:
//	boolean
//	true = event is implemented for class
//	false = event is not implemented for class
//
//	Description:
//	Determines if a event is implemented (defined and scripted) for a class
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

boolean	lb_found
boolean	lb_implemented
int		li_scripts
int		li_cnt = 1
scriptdefinition	lscrd_object

// Check class definition
if not isValid (acd_source) or isNull (acd_source) then
	return lb_found
end if

// Find event definition
li_scripts = upperBound (acd_source.scriptlist)
do while li_cnt <= li_scripts and not lb_found
	if acd_source.scriptlist[li_cnt].name = as_eventname and acd_source.scriptlist[li_cnt].kind = scriptevent! then
		lb_found = true
	else
		li_cnt++
	end if
loop

// Check if event is scripted
if lb_found then
	lb_implemented = acd_source.scriptlist[li_cnt].isScripted
end if

return lb_implemented
end function

public function boolean of_isfunctiondefined (classdefinition acd_source, string as_functionname, string as_argtype[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_isFunctionDefined
//
//	Access:
//	public
//
//	Arguments:
//	acd_source			classdefinition to check if function is defined for
//	as_functionname	function name to check if it is defined on acd_source
//	as_argtype[]		array of argument data types that are signature of as_functionname
//
//	Returns:
//	boolean
//	true = function is defined for class
//	false = function is not defined for class
//
//	Description:
//	Determines if a function is defined for a class
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

boolean	lb_found
scriptdefinition	lscrd_object

// Check class definition
if not isValid (acd_source) or isNull (acd_source) then
	return lb_found
end if

// Find method definition
lscrd_object = acd_source.findMatchingFunction (as_functionname, as_argtype[])
if isValid (lscrd_object) then
	lb_found = true
end if

return lb_found
end function

on pfc_n_cst_metaclass.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_metaclass.destroy
TriggerEvent( this, "destructor" )
end on

