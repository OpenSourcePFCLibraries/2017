HA$PBExportHeader$pfc_n_cst_metaclass.sru
$PBExportComments$PFC metaclass service
forward
global type pfc_n_cst_metaclass from n_base
end type
end forward

global type pfc_n_cst_metaclass from n_base autoinstantiate
end type

type variables
Protected:
boolean	ib_skip_system
boolean 	ib_NotifyObsolete
string		is_ObsoleteTag = "// ##Obsolete##"

Private:
constant integer	CST_ALL				=	1
constant integer	CST_NONVISUAL  =	2
constant integer	CST_STRUCTURE = 	3
end variables
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
public function any of_getinitialvalue (classdefinition acd_class, string as_varname)
public function any of_getinitialvalue (string as_classname, string as_varname, string as_librarylist[])
public function any of_getinitialvalue (string as_classname, string as_varname)
public function integer of_getfunctions (string as_classname, string as_librarylist[], varaccess ava_access, ref string as_functionslist[], boolean ab_append)
public function integer of_getfunctions (string as_classname, varaccess ava_access, ref string as_functionslist[], boolean ab_append)
public function integer of_getscripts (classdefinition acd_class, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append)
public function integer of_getscripts (string as_classname, string as_librarylist[], scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append)
public function integer of_getevents (string as_classname, string as_librarylist[], ref string as_eventslist[], boolean ab_append)
public function integer of_getscripts (string as_classname, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append)
public function integer of_getscripts (string as_classname, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[])
public function integer of_getscripts (string as_classname, string as_librarylist[], scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[])
public function integer of_getscripts (classdefinition acd_class, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[])
public function integer of_getfunctions (string as_classname, varaccess ava_access, ref string as_functionslist[])
public function integer of_getfunctions (string as_classname, string as_librarylist[], varaccess ava_access, ref string as_functionslist[])
public function integer of_getevents (string as_classname, string as_librarylist[], ref string as_eventslist[])
public function integer of_getevents (string as_classname, ref string as_eventslist[], boolean ab_append)
public function integer of_getevents (string as_classname, ref string as_eventslist[])
public function integer of_getfunctions (string as_classname, string as_librarylist[], ref string as_functionslist[])
public function integer of_getfunctions (string as_classname, string as_librarylist[], ref string as_functionslist[], boolean ab_append)
public function integer of_getfunctions (string as_classname, ref string as_functionslist[])
protected function integer of_getfunctions (classdefinition acd_class, varaccess ava_access, ref string as_functionslist[], boolean ab_append)
public function integer of_getfunctions (classdefinition acd_class, varaccess ava_access, ref string as_functionslist[])
public function integer of_getfunctions (classdefinition acd_class, ref string as_functionslist[])
public function integer of_getevents (classdefinition acd_class, ref string as_eventslist[], boolean ab_append)
public function integer of_getevents (classdefinition acd_class, ref string as_eventslist[])
public function integer of_getoverview (classdefinition acd_class, ref s_classoverview_attrib astr_overview)
public function integer of_getoverview (string as_classname, string as_librarylist[], ref s_classoverview_attrib astr_overview)
public function integer of_getoverview (string as_classname, ref s_classoverview_attrib astr_overview)
public function classdefinition of_getclassdefinition (string as_classname, string as_librarylist[])
public function classdefinition of_getclassdefinition (string as_classname)
public function integer of_getancestorclasses (string as_sourceclass, string as_librarylist[], ref classdefinition acd_ancestorclass[])
public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass, string as_librarylist[])
public function boolean of_iseventdefined (string as_classname, string as_eventname, string as_librarylist[])
public function boolean of_iseventimplemented (string as_classname, string as_eventname, string as_librarylist[])
public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[], string as_librarylist[])
public function integer of_getvariables (classdefinition acd_class, variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getvariables (string as_classname, string as_librarylist[], variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getvariables (string as_classname, variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append)
protected function integer of_getvariables (string as_classname, variablekind avk_kind, varaccess ava_access, ref string as_varslist[])
public function integer of_getvariables (string as_classname, string as_librarylist[], variablekind avk_kind, varaccess ava_access, ref string as_varslist[])
public function integer of_getglobalvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getinstancevariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getsharedvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getlocalvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getargumentvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append)
public function integer of_getargumentvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[])
public function integer of_getargumentvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append)
public function integer of_getinstancevariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append)
public function integer of_getglobalvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append)
public function integer of_getlocalvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append)
public function integer of_getsharedvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append)
public function integer of_getargumentvariables (classdefinition acd_class, ref string as_varslist[])
public function integer of_getinstancevariables (classdefinition acd_class, ref string as_varslist[])
public function integer of_getglobalvariables (classdefinition acd_class, ref string as_varslist[])
public function integer of_getlocalvariables (classdefinition acd_class, ref string as_varslist[])
public function integer of_getsharedvariables (classdefinition acd_class, ref string as_varslist[])
public function integer of_setskipsystemmode (boolean ab_switch)
public function boolean of_isskipsystemmodeenabled ()
public function boolean of_issystemdefined (classdefinition acd_class)
public function boolean of_isystsemdefined (variabledefinition avd_variable)
public function boolean of_issystemdefined (scriptdefinition asd_script)
public function integer of_getnesstedclasses (classdefinition acd_class, integer ai_handlingmode, ref string as_classeslist[], readonly boolean ab_append)
public function integer of_getnestedclasses (classdefinition acd_class, integer ai_handlingmode, ref string as_classeslist[])
public function integer of_getnestedclasses (classdefinition acd_class, ref string as_classeslist[])
public function integer of_getnestedclasses (classdefinition acd_class, ref string as_classeslist[], boolean ab_append)
public function integer of_getnestednonvisual (classdefinition acd_class, ref string as_classeslist[], boolean ab_append)
public function integer of_getnestedstructure (classdefinition acd_class, ref string as_classeslist[], boolean ab_append)
public function integer of_getnestedstructure (classdefinition acd_class, ref string as_classeslist[])
public function integer of_getnestednonvisual (classdefinition acd_class, ref string as_classeslist[])
public function integer of_getnestedstructure (string as_classname, string as_librarylist[], ref string as_classeslist[], boolean ab_append)
public function integer of_getnestedstructure (string as_classname, ref string as_classeslist[], boolean ab_append)
public function integer of_getnestedstructure (string as_classname, ref string as_classeslist[])
public function integer of_getnestednonvisual (string as_classname, string as_librarylist[], ref string as_classeslist[], boolean ab_append)
public function integer of_getnestednonvisual (string as_classname, ref string as_classeslist[], boolean ab_append)
public function integer of_getnestednonvisual (string as_classname, ref string as_classeslist[])
public function integer of_setobsoletetag (string as_tag)
public function string of_getObsoletetag ()
public function integer of_setnotifyObsolete (boolean ab_switch)
public function boolean of_isnotifyObsoleteenabled ()
public function boolean of_isobsolete (scriptdefinition asd_script)
public function boolean of_isobsolete (classdefinition acd_class)
public function boolean of_isobsolete (string as_classname, string as_librarylist[])
public function boolean of_isobsolete (string as_classname)
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
//	  6.0   Initial version
//	12.5	Handle the Skip System Mode
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
	
	// Skip system class, if Skip System Mode is enabled
	if this.of_isskipsystemmodeenabled( ) = true then
		if this.of_isSystemDefined( lcd_test ) = true then
			lcd_test = lcd_test.ancestor
			continue
		end if
	end if
	
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

public function any of_getinitialvalue (classdefinition acd_class, string as_varname);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinitialvalue
//
// Access:			Public
//
// Arguments:
// acd_class:		The class definition of the class containing the
//						variable to get its initial value.
// as_varname:			The name of the variable to get its initial value
//						contained into acd_class.
//
// Returns:			any
//						The initial value of the variable, or
//						NULL if an error occurs
//
// Description:	Return tne initial value of the specified variable name
//						contained in the passed classdefinition.
//
// Usage:			Call this method to get the initial value of a variable	
//							contained in a specified class.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
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

any la_rc
variabledefinition lvd_var

SetNull (la_rc)

// class definition
IF IsNull (acd_class) OR NOT IsValid (acd_class) THEN return la_rc

// variable
lvd_var = of_FindMatchingVariable (acd_class, as_varname)
IF IsNull (lvd_var) OR NOT IsValid (lvd_var) THEN return la_rc

// value
la_rc = lvd_var.InitialValue

return la_rc
end function

public function any of_getinitialvalue (string as_classname, string as_varname, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinitialvalue
//
// Access:			Public
//
// Arguments:
// as_classname:	The name of the class containing the
//						variable to get its initial value.
// as_varname:			The name of the variable to get its initial value
//						contained into acd_class.
// as_librarylist:		The array of string containing the complete library list where 
//						to find as_classname.
//
// Returns:			any
//						The initial value of the variable, or
//						NULL if an error occurs
//
// Description:	Return tne initial value of the specified variable name
//						contained in the passed classdefinition.
//
// Usage:			Call this method to get the initial value of a variable	
//							contained in a specified class.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
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

classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname, as_librarylist )

return this.of_getinitialvalue( lcd_class, as_varname )
end function

public function any of_getinitialvalue (string as_classname, string as_varname);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinitialvalue
//
// Access:			Public
//
// Arguments:
// as_classname:	The name of the class containing the
//						variable to get its initial value.
// as_varname:			The name of the variable to get its initial value
//						contained into acd_class.
//
// Returns:			any
//						The initial value of the variable, or
//						NULL if an error occurs
//
// Description:	Return tne initial value of the specified variable name
//						contained in the passed classdefinition.
//
// Usage:			Call this method to get the initial value of a variable	
//							contained in a specified class.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial Version
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

string	ls_dummy[]

return this.of_getinitialvalue( as_classname, as_varname, ls_dummy )
end function

public function integer of_getfunctions (string as_classname, string as_librarylist[], varaccess ava_access, ref string as_functionslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 1
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
// as_librarylist[]:			The library list from where the classname
//						as_classname will be searched
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classname extracted from
//						the passed librarylist and corresponding to the specified
//						Access Level, and store them into the passed result's event list
//						in append mode or not.
//
// Usage:			Call this method to ger all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname, as_librarylist, ScriptFunction!, ava_access, as_functionslist , ab_append )

end function

public function integer of_getfunctions (string as_classname, varaccess ava_access, ref string as_functionslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 3
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classname extracted from
//						the actual application's librarylist and corresponding to the specified
//						Access Level, and store them into the passed result's event list
//						in append mode or not.
//
// Usage:			Call this method to get all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string ls_dummy[]

return this.of_getscripts( as_classname, ls_dummy, ScriptFunction!, ava_access, as_functionslist , ab_append )

end function

public function integer of_getscripts (classdefinition acd_class, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 5
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the script list
//
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
//
// ava_access:		The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_scriptslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the scripts found will be or not append to
//						as_scriptslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the scritps list from the specified classname
//						and correspondiing to the specified ScriptKind and 
//						VarAccess, into specified result's variabless list, 
//						in append mode or not.
//
// Usage:			Call this method to extract any kind of variable from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

integer	li_i
integer	li_limit
integer	li_index

scriptdefinition lsd_script

if isnull( acd_class ) or not isvalid( acd_class ) then return -1

// if asked, append scripts found to the specified result list
if ab_append = true then
	li_index = upperbound( as_scriptslist )
end if

li_limit = upperbound( acd_class.scriptlist )
for li_i = 1 to li_limit

	lsd_script = acd_class.scriptlist[li_i]
	
	// Skip System script, if needed
	if this.of_isSkipsystemmodeenabled( ) = true then
		if this.of_issystemdefined( lsd_script ) = true then
			continue
		end if
	end if
	
	// Store current script name into result list, if it corresponds to specified Kind and access
	if lsd_script.kind = ask_kind and lsd_script.access = ava_access then
		li_index++
		as_scriptslist[ li_index ] = lsd_script.name
		
		// check if it is Obsolete or not, if needed
		if this.of_isnotifyObsoleteenabled( ) = true then
			if this.of_isObsolete( lsd_script ) = true then
				// if, yes apply Obsolete label
				as_scriptslist[ li_index ] += " (obs)"
			end if
		end if
	end if

next

return li_index
end function

public function integer of_getscripts (string as_classname, string as_librarylist[], scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 1
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the script list
// as_librarylist[]:			The library list where to find as_classname
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_scriptslist[]:			The array of string that will stant as result
//						list.
// ab_append:			Wether the scripts found will be or not append to
//						as_scriptslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the scritps list from the specified classname
//						searched in the specified librarylist and correspondiing
//						to the specified ScriptKind and VarAccess, into specified
//						result's scripts list, in append mode or not.
//
// Usage:			Call this method to extract any lkind of script from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname, as_librarylist )

return this.of_getscripts( lcd_class, ask_kind , ava_access, as_scriptslist, ab_append )
end function

public function integer of_getevents (string as_classname, string as_librarylist[], ref string as_eventslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 1
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's events list
// as_librarylist[]:			The library list from where the classname
//						as_classname will be searched
// as_eventslist[]:			The string array that will stand as events result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all event of the specified classname extracted from
//						the passed librarylist and store into result's event list
//						in append mode or not.
//
// Usage:			Call this method to ger all events of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname, as_librarylist, ScriptEvent!, public!, as_eventslist, ab_append )

end function

public function integer of_getscripts (string as_classname, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 3
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the script list
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_scriptslist[]:			The array of string that will stant as result
//						list.
// ab_append:			Wether the scripts found will be or not append to
//						as_scriptslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the scritps list from the specified classname
//						searched actual application's librarylist and correspondiing
//						to the specified ScriptKind and VarAccess, into specified
//						result's scripts list, in append mode or not.
//
// Usage:			Call this method to extract any lkind of script from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
string	ls_dummy[]

return this.of_getscripts( as_classname, ls_dummy, ask_kind , ava_access, as_scriptslist, ab_append )
end function

public function integer of_getscripts (string as_classname, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 4
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the script list
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_scriptslist[]:			The array of string that will stant as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the scritps list from the specified classname
//						searched in the actual application librarylist and correspondiing
//						to the specified ScriptKind and VarAccess, into specified
//						result's scripts list.
//
// Usage:			Call this method to extract any lkind of script from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string	ls_dummy[]

return this.of_getscripts( as_classname, ls_dummy, ask_kind , ava_access, as_scriptslist, false )
end function

public function integer of_getscripts (string as_classname, string as_librarylist[], scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 2
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the script list
// as_librarylist[]:			The library list where to find as_classname
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_scriptslist[]:			The array of string that will stant as result
//						list.
// ab_append:			Wether the scripts found will be or not append to
//						as_scriptslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the scritps list from the specified classname
//						searched in the specified librarylist and correspondiing
//						to the specified ScriptKind and Acesss, into specified
//						result's scripts list.
//
// Usage:			Call this method to extract any lkind of script from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname , as_librarylist, ask_kind , ava_access, as_scriptslist, false )
end function

public function integer of_getscripts (classdefinition acd_class, scriptkind ask_kind, varaccess ava_access, ref string as_scriptslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getscripts - Syntax 6
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the script list
// ask_kind:			The type of script to be found expressed using
//						the ScriptKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the script to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_scriptslist[]:			The array of string that will stant as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the scritps list from the specified classname
//						searched in the actual application's librarylist and correspondiing
//						to the specified ScriptKind and VarAccess, into specified
//						result's scripts list.
//
// Usage:			Call this method to extract any kind of script from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ask_kind, ava_access, as_scriptslist, false )
end function

public function integer of_getfunctions (string as_classname, varaccess ava_access, ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 4
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classname extracted from
//						the actual application's librarylist and corresponding to the specified
//						Access Level, and store them into the passed result's event list.
//
// Usage:			Call this method to get all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
string ls_dummy[]

return this.of_getscripts( as_classname, ls_dummy, ScriptFunction!, ava_access, as_functionslist )

end function

public function integer of_getfunctions (string as_classname, string as_librarylist[], varaccess ava_access, ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 2
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
// as_librarylist[]:			The library list from where the classname
//						as_classname will be searched
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classname extracted from
//						the passed librarylist and corresponding to the specified
//						Access Level, and store them into the passed result's event list.
//
// Usage:			Call this method to ger all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
return this.of_getscripts( as_classname, as_librarylist, ScriptFunction!, ava_access, as_functionslist )

end function

public function integer of_getevents (string as_classname, string as_librarylist[], ref string as_eventslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 2
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's events list
//
// as_eventslist[]:			The string array that will stand as events result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all event of the specified classname extracted from
//						actual application's librarylist and store into result's event list.
//
// Usage:			Call this method to ger all events of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname, as_librarylist, ScriptEvent!, public!, as_eventslist )

end function

public function integer of_getevents (string as_classname, ref string as_eventslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 3
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's events list
//
// as_eventslist[]:			The string array that will stand as events result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all event of the specified classname extracted from
//						actual application's librarylist and store into result's event list
//						in append mode or not.
//
// Usage:			Call this method to ger all events of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
return this.of_getscripts( as_classname, ScriptEvent!, public!, as_eventslist, ab_append )

end function

public function integer of_getevents (string as_classname, ref string as_eventslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 4
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's events list
//
// as_eventslist[]:			The string array that will stand as events result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all event of the specified classname extracted from
//						actual application's librarylist and store into result's event list.
//
// Usage:			Call this method to ger all events of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
return this.of_getscripts( as_classname, ScriptEvent!, public!, as_eventslist )

end function

public function integer of_getfunctions (string as_classname, string as_librarylist[], ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 6
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
// as_librarylist[]:			The library list from where the classname
//						as_classname will be searched
// as_functionslist[]:			The string array that will stand as functions result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all Public functions of the specified classname extracted from
//						the passed librarylist and store them into the passed result's event list.
//
// Usage:			Call this method to get all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname, as_librarylist, ScriptFunction!, public!, as_functionslist )

end function

public function integer of_getfunctions (string as_classname, string as_librarylist[], ref string as_functionslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 5
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
// as_librarylist[]:			The library list from where the classname
//						as_classname will be searched
// as_functionslist[]:			The string array that will stand as functions result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all Public functions of the specified classname extracted from
//						the passed librarylist and store them into the passed result's event list
//						in append mode or not.
//
// Usage:			Call this method to ger all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( as_classname, as_librarylist, ScriptFunction!, public!, as_functionslist , ab_append )

end function

public function integer of_getfunctions (string as_classname, ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 7
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to extract it's functions list
// as_functionslist[]:	The string array that will stand as functions result list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all Public functions of the specified classname extracted from
//						the actual application's librarylist and store them into the passed result's event list.
//
// Usage:			Call this method to get all public functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string ls_dummy[]

return this.of_getscripts( as_classname, ls_dummy, ScriptFunction!, public!, as_functionslist )

end function

protected function integer of_getfunctions (classdefinition acd_class, varaccess ava_access, ref string as_functionslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 8
//
// Access:			Public
//
// Arguments:
// acd_class:		The clasdefinition of the class to extract it's functions list
//
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classdefintion and corresponding to the specified
//						Access Level, and store them into the passed result's event list
//						in append mode or not.
//
// Usage:			Call this method to get all functions of a specified clasname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ScriptFunction!, ava_access, as_functionslist , ab_append )

end function

public function integer of_getfunctions (classdefinition acd_class, varaccess ava_access, ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 9
//
// Access:			Public
//
// Arguments:
// acd_class:		The classdefinition of the class to extract it's functions list
//	ava_access:				The AccessLevel of the functions to be found, expressed 
//						using the VarAccess enumerated values. For more informations
//						read the Powerbuilder's Documentation.
// as_functionslist[]:			The string array that will stand as functions result
//						list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all functions of the specified classname extracted from
//						the actual application's librarylist and corresponding to the specified
//						Access Level, and store them into the passed result's event list.
//
// Usage:			Call this method to get all functions of a specified classdefinition
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ScriptFunction!, ava_access, as_functionslist )

end function

public function integer of_getfunctions (classdefinition acd_class, ref string as_functionslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfunctions - syntax 10
//
// Access:			Public
//
// Arguments:
// acd_class:		The classdefinition of the class to extract it's functions list
// as_functionslist[]:	The string array that will stand as functions result list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all Public functions of the specified classname extracted from
//						the actual application's librarylist and store them into the passed result's event list.
//
// Usage:			Call this method to get all public functions of a specified classdefinition
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ScriptFunction!, public!, as_functionslist )

end function

public function integer of_getevents (classdefinition acd_class, ref string as_eventslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 5
//
// Access:			Public
//
// Arguments:
// acd_class:		The classdefinition of the class to extract it's events list
// as_eventslist[]:			The string array that will stand as events result
//						list.
// ab_append:			Wether the result list will be append or not.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all event of the specified classdefinition extracted 
//					and store into result's event list in append mode or not.
//
// Usage:			Call this method to ger all events of a specified classdefinition
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ScriptEvent!, public!, as_eventslist, ab_append )

end function

public function integer of_getevents (classdefinition acd_class, ref string as_eventslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getevents - syntax 6
//
// Access:			Public
//
// Arguments:
// acd_class:		The classdefinition of the class to extract it's events list
//
// as_eventslist:	The array of string that will stad as result list.
//
// Returns:			integer
//						The number of entries found, or 
//						-1, if an error occurs.
//
// Description:	Get all events of the specified classdefinitiond from
//					and store into result's event list.
//
// Usage:			Call this method to ger all events of a specified classdefinition.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getscripts( acd_class, ScriptEvent!, public!, as_eventslist )

end function

public function integer of_getoverview (classdefinition acd_class, ref s_classoverview_attrib astr_overview);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getoverview - syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The class definition of the class to get overview
//						informations.
// astr_overview:			The class overview attributes structure that will
//						hold the result.
//
// Returns:			integer
//						 1 - OK, or
//						-1 - An error occurs
//
// Description:	Extract overview information of the specified
//						classdefinition and store it in the passed Class Overview
//						Attributes structure.
//
// Usage:			Call this method to get the overview of a class
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial Version
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

integer	li_i
integer	li_limit
classdefinition lcd_ancestors[]

if isnull( acd_class ) or not isvalid( acd_class ) then return -1

li_limit =  this.of_getancestorclasses( acd_class, lcd_ancestors )

astr_overview.class = acd_class.name
astr_overview.classlib = acd_class.libraryname
astr_overview.classtype = acd_class.datatypeof
astr_overview.isautoinstanciate = acd_class.IsAutoinstantiate

astr_overview.ancestorcount = li_limit
for li_i = li_limit to 1 step -1
	astr_overview.ancestor[li_i] = lcd_ancestors[li_i].name
	astr_overview.ancestorlib[li_i] = lcd_ancestors[li_i].libraryname
next

return 1
end function

public function integer of_getoverview (string as_classname, string as_librarylist[], ref s_classoverview_attrib astr_overview);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getoverview - syntax 2
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to obtains its overview
// as_librarylist[]:			The library list from where the as_classname will
//						be extracted.
// astr_overview:			The class overview atttributes structure that
//						will hold the result.
//
// Returns:			integer
//						 1, Ok
//						-1, An error occurs.
//
// Description:	Get the overview of the specified classname extracted
//						from the specified library list.
//
// Usage:			Call this method to get the overview of the specified
//							classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial Version
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

classdefinition lcd_class

if isnull(as_classname) or len(trim(as_classname)) = 0 then return -1

if upperbound( as_librarylist ) > 0 then
	lcd_class = findclassdefinition( as_classname, as_librarylist )
else
	lcd_class = findclassdefinition( as_classname )
end if

return of_getoverview( lcd_class, astr_overview )
end function

public function integer of_getoverview (string as_classname, ref s_classoverview_attrib astr_overview);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getoverview - syntax 3
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to obtains its overview
// astr_overview:		The class overview atttributes structure that
//						will hold the result.
//
// Returns:			integer
//						 1, Ok
//						-1, An error occurs.
//
// Description:	Get the overview of the specified classname.
//
// Usage:			Call this method to get the overview of the specified
//							classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial Version
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

string ls_dummy[]

return of_getoverview( as_classname, ls_dummy, astr_overview )
end function

public function classdefinition of_getclassdefinition (string as_classname, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getclassdefinition
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to get its classdefinition
// as_librarylist[]:			The library list from where to extract the
//						classdefinition.
//
// Returns:			classdefinition
//						The classdefinition of the specified class, or
//						NULL, if an error occurs.
//
// Description:	Get the classdefinition of the specified class extracted
//						from the specified library list.
//
// Usage:			Call this method to get the classdefinition of a class
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

classdefinition lcd_rc

if upperbound( as_librarylist ) > 0 then
	lcd_rc = findclassdefinition( as_classname, as_librarylist )
else
	lcd_rc = findclassdefinition( as_classname )
end if

return lcd_rc
end function

public function classdefinition of_getclassdefinition (string as_classname);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getclassdefinition
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class to get its classdefinition
//
// Returns:			classdefinition
//						The classdefinition of the specified class, or
//						NULL, if an error occurs.
//
// Description:	Get the classdefinition of the specified class extracted
//						from the actual application's library list.
//
// Usage:			Call this method to get the classdefinition of a class
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

string ls_dummy[]

return this.of_getclassdefinition( as_classname, ls_dummy )
end function

public function integer of_getancestorclasses (string as_sourceclass, string as_librarylist[], ref classdefinition acd_ancestorclass[]);//////////////////////////////////////////////////////////////////////////////
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
//	  6.0   Initial version
//	12.5   Take into account optional library list parameter
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
lcd_object = this.of_GetClassDefinition (as_sourceclass, as_librarylist)

return of_getAncestorClasses (lcd_object, acd_ancestorclass[])
end function

public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
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
// 	as_librarylist[]		library list to use to extract source class definition
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
//	  6.0   Initial version
//  12.5	Handle optional libary list parameter
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
lcd_source = this.of_GetClassDefinition (as_sourceclass, as_librarylist )

return of_isAncestorClass (lcd_source, as_ancestorclass )
end function

public function boolean of_iseventdefined (string as_classname, string as_eventname, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
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
//  as_librarylist[]		the library list from wich will be extracted the class information
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
//		  6.0   Initial version
//		12.5	Handle optional library list parameter
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
lcd_object = this.of_GetClassDefinition (as_classname, as_librarylist)

return of_isEventDefined (lcd_object, as_eventname)
end function

public function boolean of_iseventimplemented (string as_classname, string as_eventname, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
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
//	as_librarylist[]		the library list from wich the class informaion will be extracted
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
//		  6.0   Initial version
//		12.5   Handle optional library list paramater
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
lcd_object =this.of_GetClassDefinition (as_classname, as_librarylist)

return of_isEventImplemented (lcd_object, as_eventname)
end function

public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[], string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
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
//	as_librarylist[]		The library list from wich the class information will be extracted
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
//		  6.0   Initial version
//		12.5	 Handle optional library list parameter
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
lcd_object = this.of_GetClassDefinition (as_classname, as_librarylist[] )

return of_isFunctionDefined (lcd_object, as_functionname, as_argtype[])
end function

public function integer of_getvariables (classdefinition acd_class, variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getvariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// ask_kind:			The type of variable to be found expressed using
//						the variableKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the scritps list from the specified classname
//						and correspondiing to the specified variableKind and 
//						VarAccess, into specified result's variabless list, 
//						in append mode or not.
//
// Usage:			Call this method to extract any kind of variable from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

integer	li_i
integer	li_limit
integer	li_index

variabledefinition lvd_variable

if isnull( acd_class ) or not isvalid( acd_class ) then return -1

// if asked, append variables found to the specified result list
if ab_append = true then
	li_index = upperbound( as_varslist )
end if

li_limit = upperbound( acd_class.variablelist )
for li_i = 1 to li_limit

	lvd_variable = acd_class.variablelist[li_i]
	
	// Skip System defined variable, if needed
	if this.of_IsSkipSystemModeEnabled( ) = true then
		if this.of_isystsemdefined( lvd_variable ) = true then
			continue
		end if
	end if
	
	// Store current variable name into result list, if it corresponds to specified Kind and access
	if lvd_variable.kind = avk_kind and lvd_variable.readaccess = ava_access then
		li_index++
		as_varslist[ li_index ] = lvd_variable.name
	end if

next

return li_index
end function

public function integer of_getvariables (string as_classname, string as_librarylist[], variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getvariables - Syntax 2
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the variables list
// as_librarylist[]:			The library list where to find as_classname
// avk_kind:			The type of variable to be found expressed using
//						the VariableKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_varsist[]:			The array of string that will stant as result
//						list.
// ab_append:			Wether the variables found will be or not append to
//						as_varslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the variable list from the specified classname
//						searched in the specified librarylist and correspondiing
//						to the specified VariableKind and VarAccess, into specified
//						result's variables list, in append mode or not.
//
// Usage:			Call this method to extract any kind of variable from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname, as_librarylist )

return this.of_getvariables( lcd_class, avk_kind, ava_access, as_varslist, ab_append)
end function

public function integer of_getvariables (string as_classname, variablekind avk_kind, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getvariables - Syntax 4
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the variables list
// avk_kind:			The type of variable to be found expressed using
//						the VariableKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_varsist[]:			The array of string that will stant as result
//						list.
// ab_append:			Wether the variables found will be or not append to
//						as_varslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the variable list from the specified classname
//					searched in the actual application(s librarylist and correspondiing
//					to the specified VariableKind and VarAccess, into specified
//					result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract any kind of variable from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname )

return this.of_getvariables( lcd_class, avk_kind, ava_access, as_varslist, ab_append)
end function

protected function integer of_getvariables (string as_classname, variablekind avk_kind, varaccess ava_access, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getvariables - Syntax 5
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the variables list
// avk_kind:			The type of variable to be found expressed using
//						the VariableKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_varsist[]:			The array of string that will stant as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the variable list from the specified classname
//					searched in the actual application's librarylist and correspondiing
//					to the specified VariableKind and VarAccess, into specified
//					result's variabless list.
//
// Usage:			Call this method to extract any kind of variable from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( as_classname, avk_kind, ava_access, as_varslist, false)
end function

public function integer of_getvariables (string as_classname, string as_librarylist[], variablekind avk_kind, varaccess ava_access, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getvariables - Syntax 3
//
// Access:			Public
//
// Arguments:
// as_classname:		The name of the class from wich will be extracted
//						the variables list
// as_librarylist[]:			The library list where to find as_classname
// avk_kind:			The type of variable to be found expressed using
//						the VariableKind enumerated values. For more
//						informaition, see PowerBuilder's documentation.
// ava_access:			The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
// as_varsist[]:			The array of string that will stant as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:	Extract the variable list from the specified classname
//						searched in the specified librarylist and correspondiing
//						to the specified VariableKind and VarAccess, into specified
//						result's variables list.
//
// Usage:			Call this method to extract any kind of variable from a
//							specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( as_classname, as_librarylist, avk_kind, ava_access, as_varslist, false)
end function

public function integer of_getglobalvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getglobalvariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the global variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract global variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variableglobal!, ava_access,  as_varslist, ab_append )
end function

public function integer of_getinstancevariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinstancevariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the instance variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract instance variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variableinstance!, ava_access,  as_varslist, ab_append )
end function

public function integer of_getsharedvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getsharedvariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the shared variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract shared variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variableshared!, ava_access,  as_varslist, ab_append )
end function

public function integer of_getlocalvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getlocalvariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the local variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract local variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variablelocal!, ava_access,  as_varslist, ab_append )
end function

public function integer of_getargumentvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getargumentvariables - Syntax 1
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the argument variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract argument variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variableargument!, ava_access,  as_varslist, ab_append )
end function

public function integer of_getargumentvariables (classdefinition acd_class, varaccess ava_access, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getargumentvariables - Syntax 2
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
//
// ava_access:		The access level of the variable to be found,
//						expressed using the VarAccess Enumerated values.
//						For more information, see PowerBuilder's
//						documentation.
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract the argument variables list from the specified classname
//						and correspondiing to the specified VarAccess, into specified
//						result's variabless list.
//
// Usage:			Call this method to extract argument variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getvariables( acd_class, variableargument!, ava_access,  as_varslist, false )
end function

public function integer of_getargumentvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getargumentvariables - Syntax 3
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the argument variables list from the specified classname
//						into specified result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract argument variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string		ls_tmp[]
integer	li_startindex
integer	li_i
integer	li_limit

// Get all arguments and store them in temporary list, if an error occurs : exit
if this.of_GetVariables( acd_class, variableargument!, private!,  ls_tmp, false ) = -1 then return -1
if this.of_GetVariables( acd_class, variableargument!, protected!,  ls_tmp, true ) = -1 then return -1
if this.of_GetVariables( acd_class, variableargument!, public!,  ls_tmp, true ) = -1 then return -1

// Get number of entries found
li_limit =upperbound( ls_tmp )

// Handle append mode, if needed
if ab_append = true then
	li_startindex = upperbound( as_varslist )
	for li_i = li_limit to 1 step -1
		as_varslist[li_startindex + li_i] = ls_tmp[li_i]
	next 
else
	li_startindex = 0
	as_varslist = ls_tmp
end if

// Return total of entries
return (li_startindex + li_limit )
end function

public function integer of_getinstancevariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinstancevariables - Syntax 3
//
// Access:			Public
//
// instances:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the instance variables list from the specified classname
//						into specified result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract instance variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string		ls_tmp[]
integer	li_StartIndex
integer	li_i
integer	li_limit

// Get all instances and store them in temporary list, if an error occurs : exit
if this.of_GetVariables( acd_class, variableinstance!, private!,  ls_tmp, false ) = -1 then return -1
if this.of_GetVariables( acd_class, variableinstance!, protected!,  ls_tmp, true ) = -1 then return -1
if this.of_GetVariables( acd_class, variableinstance!, public!,  ls_tmp, true ) = -1 then return -1

// Get number of entries found
li_limit =upperbound( ls_tmp )

// Handle append mode, if needed
if ab_append = true then
	li_StartIndex = upperbound( as_varslist )
	for li_i = li_limit to 1 step -1
		as_varslist[li_StartIndex + li_i] = ls_tmp[li_i]
	next 
else
	li_StartIndex = 0
	as_varslist = ls_tmp
end if

// Return total of entries
return (li_StartIndex + li_limit )
end function

public function integer of_getglobalvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getglobalvariables - Syntax 3
//
// Access:			Public
//
// globals:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the global variables list from the specified classname
//						into specified result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract global variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string		ls_tmp[]
integer	li_StartIndex
integer	li_i
integer	li_limit

// Get all globals and store them in temporary list, if an error occurs : exit
if this.of_GetVariables( acd_class, variableglobal!, private!,  ls_tmp, false ) = -1 then return -1
if this.of_GetVariables( acd_class, variableglobal!, protected!,  ls_tmp, true ) = -1 then return -1
if this.of_GetVariables( acd_class, variableglobal!, public!,  ls_tmp, true ) = -1 then return -1

// Get number of entries found
li_limit =upperbound( ls_tmp )

// Handle append mode, if needed
if ab_append = true then
	li_StartIndex = upperbound( as_varslist )
	for li_i = li_limit to 1 step -1
		as_varslist[li_StartIndex + li_i] = ls_tmp[li_i]
	next 
else
	li_StartIndex = 0
	as_varslist = ls_tmp
end if

// Return total of entries
return (li_StartIndex + li_limit )
end function

public function integer of_getlocalvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getlocalvariables - Syntax 3
//
// Access:			Public
//
// locals:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the local variables list from the specified classname
//						into specified result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract local variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string		ls_tmp[]
integer	li_StartIndex
integer	li_i
integer	li_limit

// Get all locals and store them in temporary list, if an error occurs : exit
if this.of_GetVariables( acd_class, variablelocal!, private!,  ls_tmp, false ) = -1 then return -1
if this.of_GetVariables( acd_class, variablelocal!, protected!,  ls_tmp, true ) = -1 then return -1
if this.of_GetVariables( acd_class, variablelocal!, public!,  ls_tmp, true ) = -1 then return -1

// Get number of entries found
li_limit =upperbound( ls_tmp )

// Handle append mode, if needed
if ab_append = true then
	li_StartIndex = upperbound( as_varslist )
	for li_i = li_limit to 1 step -1
		as_varslist[li_StartIndex + li_i] = ls_tmp[li_i]
	next 
else
	li_StartIndex = 0
	as_varslist = ls_tmp
end if

// Return total of entries
return (li_StartIndex + li_limit )
end function

public function integer of_getsharedvariables (classdefinition acd_class, ref string as_varslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getsharedvariables - Syntax 3
//
// Access:			Public
//
// shareds:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the shared variables list from the specified classname
//						into specified result's variabless list, in append mode or not.
//
// Usage:			Call this method to extract shared variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

string		ls_tmp[]
integer	li_StartIndex
integer	li_i
integer	li_limit

// Get all shareds and store them in temporary list, if an error occurs : exit
if this.of_GetVariables( acd_class, variableshared!, private!,  ls_tmp, false ) = -1 then return -1
if this.of_GetVariables( acd_class, variableshared!, protected!,  ls_tmp, true ) = -1 then return -1
if this.of_GetVariables( acd_class, variableshared!, public!,  ls_tmp, true ) = -1 then return -1

// Get number of entries found
li_limit =upperbound( ls_tmp )

// Handle append mode, if needed
if ab_append = true then
	li_StartIndex = upperbound( as_varslist )
	for li_i = li_limit to 1 step -1
		as_varslist[li_StartIndex + li_i] = ls_tmp[li_i]
	next 
else
	li_StartIndex = 0
	as_varslist = ls_tmp
end if

// Return total of entries
return (li_StartIndex + li_limit )
end function

public function integer of_getargumentvariables (classdefinition acd_class, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getargumentvariables - Syntax 4
//
// Access:			Public
//
// Arguments:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the argument variables list from the specified classname
//						into specified result's variabless list.
//
// Usage:			Call this method to extract argument variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getargumentvariables( acd_class, as_varslist, false )
end function

public function integer of_getinstancevariables (classdefinition acd_class, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getinstancevariables - Syntax 4
//
// Access:			Public
//
// instances:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the instance variables list from the specified classname
//						into specified result's variabless list.
//
// Usage:			Call this method to extract instance variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getinstancevariables( acd_class, as_varslist, false )
end function

public function integer of_getglobalvariables (classdefinition acd_class, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getglobalvariables - Syntax 4
//
// Access:			Public
//
// globals:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the global variables list from the specified classname
//						into specified result's variabless list.
//
// Usage:			Call this method to extract global variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getglobalvariables( acd_class, as_varslist, false )
end function

public function integer of_getlocalvariables (classdefinition acd_class, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getlocalvariables - Syntax 4
//
// Access:			Public
//
// locals:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the local variables list from the specified classname
//						into specified result's variabless list.
//
// Usage:			Call this method to extract local variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getlocalvariables( acd_class, as_varslist, false )
end function

public function integer of_getsharedvariables (classdefinition acd_class, ref string as_varslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getsharedvariables - Syntax 4
//
// Access:			Public
//
// shareds:
// acd_class:		The  classdefinition from wich will be extracted
//						the variable list
//
// as_variableslist[]:	The array of string that will stant as result
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the shared variables list from the specified classname
//						into specified result's variabless list.
//
// Usage:			Call this method to extract shared variables from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getsharedvariables( acd_class, as_varslist, false )
end function

public function integer of_setskipsystemmode (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setskipsystemmode
//
// Access:			Public
//
// Arguments:
// ab_switch:		True, enable Skip System Mode
//						False, disable Skip System Mode.
//
// Returns:			integer
//						Always return 1
//
// Description:	Enable or disable the Skip System Mode.
//						When enabled, the service will not take into account
//						PowerBuilder System Native entries.
//
// Usage:			Call this method to enable or disable Service's  skip
//							System mode.
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

ib_skip_system = ab_switch

return 1
end function

public function boolean of_isskipsystemmodeenabled ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isskipsystemmodeenabled
//
// Access:			Public
//
// Returns:			boolean
//						True, Skip System Mode is enabled.
//						False, Skip System Node is disabled.
//
// Description:	Return wether the Skip System Mode is enabled or not.
//
// Usage:			Call this method in order to know if the Skip System Mode
//							is enabled or not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial Version
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

return ib_skip_system
end function

public function boolean of_issystemdefined (classdefinition acd_class);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_issystemdefined
//
// Access:			Public
//
// Arguments:
// acd_class:		The class definition of the class to check if it
//						is a system class or not.
//
// Returns:			boolean
//						True, acd_class is a system class
//						Falsen acd_class is not a system class
//
// Description:	Return wether the specified class is a native
//						PowerBuilder System class or not
//
// Usage:			Call this method to know if a class is a system class or
//							not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial Version
//////////////////////////////////////////////////////////////////////////////

return acd_class.IsSystemType

end function

public function boolean of_isystsemdefined (variabledefinition avd_variable);
return not( avd_variable.IsUserDefined)
end function

public function boolean of_issystemdefined (scriptdefinition asd_script);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_issystemdefined
//
// Access:			Public
//
// Arguments:
// asd_script:		The script definition of the script to check if it
//						is a system script or not.
//
// Returns:			boolean
//						True, asd_script is a system script
//						Falsen asd_script is not a system script
//
// Description:	Return wether the specified script is a native
//						PowerBuilder System script or not
//
// Usage:			Call this method to know if a script is a system script or
//							not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial Version
//////////////////////////////////////////////////////////////////////////////

return (asd_script.SystemFunction <> "")

end function

public function integer of_getnesstedclasses (classdefinition acd_class, integer ai_handlingmode, ref string as_classeslist[], readonly boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedclasses - Syntax 1
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
// ai_handlingmode:	How to handle nested classes. Possible value are :
//							- CST_ALL (1) 				- Both NonvVsual and Local Structure
//							- CST_NONVISUAL (2) 	- NonVisual only
//							- CST_STRUCTURE (3)	- Local Structure only
//
// as_variableslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether the variables found will be or not append to
//						as_variableslist.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

integer	li_i
integer	li_limit
integer	li_index
boolean	lb_handleNonVisual
boolean	lb_handleLocalStructure
boolean	lb_store

classdefinition	lcd_class

if isnull( acd_class ) or not isvalid( acd_class ) then return -1

// Prepare handling mode specified
lb_handleLocalStructure = ((ai_handlingmode = cst_all) or (ai_handlingmode = cst_structure ))
lb_handleNonVisual = ((ai_handlingmode = cst_all) or (ai_handlingmode = cst_nonvisual ))

// if asked, append nested classes found to the specified result list
if ab_append = true then
	li_index = upperbound( as_classeslist )
end if

li_limit = upperbound( acd_class.nestedclasslist )
for li_i = 1 to li_limit

	lcd_class = acd_class.nestedclasslist[li_i]
	
	// Store current nested class into result list according to the specified handling mode 
	lb_store = ( lb_handleLocalStructure = true and lcd_class.isstructure = true ) or (lb_handleNonVisual = true and lcd_class.isstructure = false )

	if lb_store = true then
		li_index++
		as_classeslist[ li_index ] = lcd_class.name
	end if

next

return li_index

end function

public function integer of_getnestedclasses (classdefinition acd_class, integer ai_handlingmode, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedclasses - Syntax 2
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
// ai_handlingmode:	How to handle nested classes. Possible value are :
//							- CST_ALL (1) 				- Both NonvVsual and Local Structure
//							- CST_NONVISUAL (2) 	- NonVisual only
//							- CST_STRUCTURE (3)	- Local Structure only
//
// as_variableslist[]:	The array of string that will stand as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  classes list from the specified classname
//						into specified result's list.
//
// Usage:			Call this method to extract nesteed classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, ai_handlingmode, as_classeslist[], false )

end function

public function integer of_getnestedclasses (classdefinition acd_class, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedclasses - Syntax 4
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_variableslist[]:	The array of string that will stand as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  classes list from the specified classname
//						into specified result's list.
//
// Usage:			Call this method to extract nesteed classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.CST_ALL, as_classeslist, false )

end function

public function integer of_getnestedclasses (classdefinition acd_class, ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedclasses - Syntax 4
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.CST_ALL, as_classeslist, ab_append )

end function

public function integer of_getnestednonvisual (classdefinition acd_class, ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestednonvisual - Syntax 1
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  non visual classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed nonv visual classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.CST_NONVISUAL, as_classeslist, ab_append )

end function

public function integer of_getnestedstructure (classdefinition acd_class, ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedstructure - Syntax 1
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  local structure list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed local structure from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.cst_structure, as_classeslist, ab_append )

end function

public function integer of_getnestedstructure (classdefinition acd_class, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedstructure - Syntax 2
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  local structure list from the specified classname
//						into specified result's list.
//
// Usage:			Call this method to extract nesteed local structure from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.cst_structure, as_classeslist, false )

end function

public function integer of_getnestednonvisual (classdefinition acd_class, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestednonvisual - Syntax 2
//
// Access:			Public
//
// globals:
// acd_class:			The  classdefinition from wich will be extracted
//							the variable list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  non visual classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed nonv visual classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnesstedclasses( acd_class, this.CST_NONVISUAL, as_classeslist, false )

end function

public function integer of_getnestedstructure (string as_classname, string as_librarylist[], ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedstructure - Syntax 1
//
// Access:			Public
//
// globals:
// as_classname:	The  classname of the class from wich will be extracted
//						the nested structure list
//
// as_librarylist[]:	The library list from wich will be extracted as_classname
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  local structure list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed local structure from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname, as_librarylist )

return this.of_getnesstedclasses( lcd_class, this.CST_STRUCTURE, as_classeslist, ab_append )

end function

public function integer of_getnestedstructure (string as_classname, ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedstructure - Syntax 2
//
// Access:			Public
//
// globals:
// as_classname:	The  classname of the class from wich will be extracted
//						the nested structure list
//
// as_librarylist[]:	The library list from wich will be extracted as_classname
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  local structure list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed local structure from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname )

return this.of_getnesstedclasses( lcd_class, this.CST_STRUCTURE, as_classeslist, ab_append )

end function

public function integer of_getnestedstructure (string as_classname, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestedstructure - Syntax 2
//
// Access:			Public
//
// globals:
// as_classname:	The  classname of the class from wich will be extracted
//						the nested structure list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  local structure list from the specified classname
//						into specified result's list.
//
// Usage:			Call this method to extract nesteed local structure from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname )

return this.of_getnesstedclasses( lcd_class, this.CST_STRUCTURE, as_classeslist, false )

end function

public function integer of_getnestednonvisual (string as_classname, string as_librarylist[], ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestednonvisual - Syntax 1
//
// Access:			Public
//
// globals:
// as_classname:	The  classname from wich will be extracted
//						the nesteed nonvisual list
//
// as_librarylist[]:	The library list from where will be extracted as_classname
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  non visual classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed nonv visual classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname, as_librarylist)

return this.of_getnesstedclasses( lcd_class, this.CST_NONVISUAL, as_classeslist, ab_append )

end function

public function integer of_getnestednonvisual (string as_classname, ref string as_classeslist[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestednonvisual - Syntax 1
//
// Access:			Public
//
// globals:
// as_classname:	The  classname from wich will be extracted
//						the nesteed nonvisual list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  non visual classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed nonv visual classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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
classdefinition lcd_class

lcd_class = this.of_getclassdefinition( as_classname )

return this.of_getnesstedclasses( lcd_class, this.CST_NONVISUAL, as_classeslist, ab_append )

end function

public function integer of_getnestednonvisual (string as_classname, ref string as_classeslist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getnestednonvisual - Syntax 1
//
// Access:			Public
//
// globals:
// as_classname:	The  classname from wich will be extracted
//						the nesteed nonvisual list
//
// as_classeslist[]:	The array of string that will stand as result
//						list.
//
// ab_append:		Wether to append entries found to the result list
//
// Returns:			integer
//						The number of entries found, or
//						-1, if an error occurs
//
// Description:		Extract all the nested  non visual classes list from the specified classname
//						into specified result's list, in append mode or not.
//
// Usage:			Call this method to extract nesteed nonv visual classes from a
//						specified classname
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

return this.of_getnestednonvisual( as_classname, as_classeslist, false )

end function

public function integer of_setobsoletetag (string as_tag);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setObsoletetag
//
// Access:			Public
//
// Arguments:
// as_tag:		The new Obsolete tag value. Must be defined as a
//						valid PB comment.
//						Default value = // ##Obsolete##
//
//					NOTE: it is not case sensitive
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs
//
// Description:	Define a new Obsolete tag.
//
// Usage:			Call this method to set a new obsloted tag
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial Version
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

if isnull( as_tag ) and len(trim( as_tag)) = 0 then return -1
if left( as_tag, 2) <> "//" and ( left( as_tag, 2) <> "/*" and right( as_tag, 2) <> "*/") then return -1

is_Obsoletetag = as_tag

return 1
end function

public function string of_getObsoletetag ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getObsoletetag
//
// Access:			Public
//
// Returns:			string
//						The actual Obsolete tag value
//
// Description:	returns the actual Obsolete tag value.
//
// Usage:			Call this method to know what Obsolete tag is actually
//							used to mark an item as Obsolete
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

return is_Obsoletetag
end function

public function integer of_setnotifyObsolete (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setnotifyObsolete
//
// Access:			Public
//
// Arguments:
// ab_switch:		TRUE, enable notification
//						FASLSE, disable notification
//
// Returns:			integer
//						Always return 1.
//
// Description:	Enable or disable the notification of Obsolete item.
//
// Usage:			Call this method enable or disable notification of
//							Obsolete items
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	initial version
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

ib_notifyObsolete = ab_switch

return 1
end function

public function boolean of_isnotifyObsoleteenabled ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isnotifyObsoleteenabled
//
// Access:			Public
//
// Returns:			boolean
//						TRUE, enabeld
//						FALSE, disabeld
//
// Description:	retruns wether the Notify Obsolete item mode is enazbled
//						or not.
//
// Usage:			Call this method to know if the notification of Obsolete
//							items is enabled or not
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

return ib_notifyObsolete
end function

public function boolean of_isobsolete (scriptdefinition asd_script);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isObsolete
//
// Access:			Public
//
// Arguments:
// asd_script:		The script definition of the funciton or the
//						event that is checked to be Obsolete or not.
//
// Returns:			boolean
//						TRUE, it is Obsolete
//						FALSEn it is not Obsolete.
//
// Description:	Return wether the specified script is Obsolete or not.
//						
//						A script is considered as Obsolete when its source code
//						begin with the actually obsolte tag's value set.
//
// Usage:			Call this method to verify if a specific script is
//							Obsolete or not.
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

string ls_source
string ls_tag

ls_source = asd_script.source
if isnull( ls_source ) or len(trim( ls_source)) = 0 then return false

ls_source = mid( ls_source, pos( ls_source, ";") + 1 )
ls_tag = this.of_getObsoletetag()

return (upper( left( ls_source, len( ls_tag ) ) ) = upper( ls_tag ) )
end function

public function boolean of_isobsolete (classdefinition acd_class);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isobsolete
//
// Access:			Public
//
// Arguments:
// acd_class:		The classdefinition of the object to check if it
//						is obsolete or not.
//
// Returns:			boolean
//						TRUE, it is obsolete
//						FALSE, it is not obsolete
//
// Description:	Returns if specified class is obsolete or not
//
// Usage:			Call this method to know if the specivied class is
//							obsolete or not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial version
//////////////////////////////////////////////////////////////////////////////

return ( this.of_GetInitialValue( acd_class, "ib_isobsolete" ) = true )
end function

public function boolean of_isobsolete (string as_classname, string as_librarylist[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isobsolete
//
// Access:			Public
//
// Arguments:
// as_classname:		The classname to determine if it is obsolete or
//						not.
// as_librarylist[]:			The library list friom where will be extracted
//						as_classname.
//
// Returns:			boolean
//						TRUE, it is obsolete
//						FALSE, it is not obsolete
//
// Description:	Returns if the speciified classname extracte from the
//						specified library list, is obsolete or not.
//
// Usage:			Call this method to know if the specigied class is
//							obsolete or not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//
//////////////////////////////////////////////////////////////////////////////

return (this.of_getinitialvalue( as_classname, "ib_isobsolete", as_librarylist ) = true )
end function

public function boolean of_isobsolete (string as_classname);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_isobsolete
//
// Access:			Public
//
// Arguments:
// as_classname:		The classname to determine if it is obsolete or
//						not.
//
// Returns:			boolean
//						TRUE, it is obsolete
//						FALSE, it is not obsolete
//
// Description:	Returns if the speciified classname extracte from the
//						actual library list, is obsolete or not.
//
// Usage:			Call this method to know if the specigied class is
//							obsolete or not.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	initial version
//////////////////////////////////////////////////////////////////////////////

return (this.of_getinitialvalue( as_classname, "ib_isobsolete" ) = true )
end function

on pfc_n_cst_metaclass.create
call super::create
end on

on pfc_n_cst_metaclass.destroy
call super::destroy
end on

