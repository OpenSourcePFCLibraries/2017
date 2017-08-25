HA$PBExportHeader$pfc_n_base.sru
$PBExportComments$PFC NonVisual Base class
forward
global type pfc_n_base from nonvisualobject
end type
end forward

global type pfc_n_base from nonvisualobject
end type
global pfc_n_base pfc_n_base

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0
//constant integer 		FAILURE = -1

Protected:
boolean	ib_IsObsolete
end variables

forward prototypes
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
protected function integer of_messagebox (string as_title, string as_text)
protected function integer of_messagebox (string as_title, string as_text, icon ae_icon)
protected function integer of_messagebox (string as_title, string as_text, icon ae_icon, button ae_button)
protected function integer of_messagebox (string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
end prototypes

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:
//	as_id			An ID for the Message.
//	as_title  	Text for title bar
//	as_text		Text for the actual message.
//	ae_icon 		The icon you want to display on the MessageBox.
//	ae_button	Set of CommandButtons you want to display on the MessageBox.
//	ai_default  The default button.
//
//	Returns:  integer
//	Return value of the MessageBox.
//
//	Description:
//	Display a PowerScript MessageBox.  
//	Allow PFC MessageBoxes to be manipulated prior to their actual display.
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

Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

protected function integer of_messagebox (string as_title, string as_text);/////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:			as_title  	Text for title bar
//							as_text		Text for the actual message
//
//	Returns:				integer		Return value from of_messageBox
//
//	Description:		Overload of of_messageBox
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version				12.5			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return of_messageBox('', as_title, as_text, Information!, OK!, 1)
end function

protected function integer of_messagebox (string as_title, string as_text, icon ae_icon);/////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:			as_title  	Text for title bar
//							as_text		Text for the actual message
//							ae_icon 		The icon you want to display on the
//											MessageBox
//
//	Returns:				integer		Return value from of_messageBox
//
//	Description:		Overload of of_messageBox
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version				12.5			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return of_messageBox('', as_title, as_text, ae_icon, OK!, 1)
end function

protected function integer of_messagebox (string as_title, string as_text, icon ae_icon, button ae_button);/////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:			as_title  	Text for title bar
//							as_text		Text for the actual message
//							ae_icon 		The icon you want to display on the
//											MessageBox
//							ae_button	Set of CommandButtons you want to display
//											on the MessageBox.
//
//	Returns:				integer		Return value from of_messageBox
//
//	Description:		Overload of of_messageBox
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version				12.5			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return of_messageBox('', as_title, as_text, ae_icon, ae_button, 1)
end function

protected function integer of_messagebox (string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);/////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:			as_title  	Text for title bar
//							as_text		Text for the actual message
//							ae_icon 		The icon you want to display on the
//											MessageBox
//							ae_button	Set of CommandButtons you want to display
//											on the MessageBox
//							ai_default	The default button
//
//	Returns:				integer		Return value from of_messageBox
//
//	Description:		Overload of of_messageBox
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version				12.5			Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return of_messageBox('', as_title, as_text, ae_icon, ae_button, ai_default)
end function

on pfc_n_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

