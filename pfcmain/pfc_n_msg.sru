HA$PBExportHeader$pfc_n_msg.sru
$PBExportComments$PFC Message class
forward
global type pfc_n_msg from message
end type
end forward

global type pfc_n_msg from message
end type
global pfc_n_msg pfc_n_msg

type variables
Protected:
powerobject		ipo_parm
string			is_parm
double		idbl_parm
boolean		ib_IsObsolete
end variables

forward prototypes
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_SetPowerObjectParm (powerobject apo_parm)
public function integer of_setstringparm (string as_parm)
public function string of_getstringparm ()
public function powerobject of_getpowerobjectparm ()
public function integer of_copyto (n_msg am_target)
public function integer of_SetDoubleParm (double adbl_parm)
public function double of_getdoubleparm ()
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

public function integer of_SetPowerObjectParm (powerobject apo_parm);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetPowerObjectParm
//
//	Access:  public
//
//	Arguments:
//	apo_parm   the desired powerobject property value.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the powerobject property
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

ipo_parm = apo_parm
return 1

end function

public function integer of_setstringparm (string as_parm);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetStringParm
//
//	Access:  public
//
//	Arguments:
//	apo_parm   the desired string property value.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the string property
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

is_parm = as_parm
return 1

end function

public function string of_getstringparm ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetStringParm
//
//	Access:  public
//
//	Arguments:	None
//
//	Returns:  string
//	 The string property value.
//
//	Description:
//	Gets the string property value.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

Return is_parm
end function

public function powerobject of_getpowerobjectparm ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetPowerObjectParm
//
//	Access:  public
//
//	Arguments:	None
//
//	Returns:  powerobject
//	 The powerobject property value.
//
//	Description:
//	Gets the powerobject property value.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

Return ipo_parm
end function

public function integer of_copyto (n_msg am_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CopyTo
//
//	Access:  public
//
//	Arguments:		
//	am_target  target message object passed by reference.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Copy the contents of this object to the message object passed in.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

// Check arguments
if IsNull(am_target) Or not IsValid (am_target) then
	return -1
end if

// Copy the system transaction values
am_target.Handle = this.Handle
am_target.Number = this.Number
am_target.WordParm = this.WordParm
am_target.LongParm = this.LongParm
am_target.DoubleParm = this.DoubleParm
am_target.StringParm = this.StringParm
am_target.PowerObjectParm = this.PowerObjectParm
am_target.Processed	 = this.Processed	
am_target.ReturnValue	 = this.ReturnValue	

// Copy the pfc transaction properties
am_target.of_SetPowerObjectParm (ipo_parm)
am_target.of_SetStringParm (is_parm)
am_target.of_SetDoubleParm (idbl_parm)

return 1
end function

public function integer of_SetDoubleParm (double adbl_parm);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDoubleParm
//
//	Access:  public
//
//	Arguments:
//	apo_parm   the desired Double property value.
//
//	Returns:  Integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the Double property
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

idbl_parm = adbl_parm
return 1

end function

public function double of_getdoubleparm ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDoubleParm
//
//	Access:  public
//
//	Arguments:	None
//
//	Returns:  double
//	 The Double property value.
//
//	Description:
//	Gets the Double property value.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0.01   Initial version
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

Return idbl_parm
end function

on pfc_n_msg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_msg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

