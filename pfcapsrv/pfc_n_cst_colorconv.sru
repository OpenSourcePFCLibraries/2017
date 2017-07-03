HA$PBExportHeader$pfc_n_cst_colorconv.sru
$PBExportComments$PFC Color Conversion Service
forward
global type pfc_n_cst_colorconv from n_base
end type
end forward

global type pfc_n_cst_colorconv from n_base autoinstantiate
end type

type variables
Protected:
// Return values symbolics constants
constant integer	OK									=  1
constant integer	ERR_MISSING_PARM 			= -1
constant integer	ERR_OUTOFRANGE_PARM 	= -2

// Math Constants
constant double PI = Pi(1)

// Conversion Ref Constants
constant decimal	cst_ref_x = 95.047 
constant decimal	cst_ref_y = 100.000
constant decimal	cst_ref_z = 108.883


end variables

forward prototypes
public function integer of_xyz2rgb (s_xyz_colorattrib astr_xyz, ref s_rgb_colorattrib astr_rgb)
public function integer of_yxy2xyz (s_yxy_colorattrib astr_from, ref s_xyz_colorattrib astr_to)
public function integer of_rgb2xyz (s_rgb_colorattrib astr_from, ref s_xyz_colorattrib astr_to)
public function integer of_xyz2yxy (s_xyz_colorattrib astr_from, ref s_yxy_colorattrib astr_to)
public function integer of_xyz2hunterlab (s_xyz_colorattrib astr_from, ref s_hunterlab_colorattrib astr_to)
public function integer of_hunterlab2xyz (s_hunterlab_colorattrib astr_from, ref s_xyz_colorattrib astr_to)
public function integer of_xyz2cielab (s_xyz_colorattrib astr_from, ref s_cielab_colorattrib astr_to)
protected function decimal of_deg2rad (decimal adec_deg)
public function integer of_xyz2cieluv (s_xyz_colorattrib astr_from, ref s_cieluv_colorattrib astr_to)
public function integer of_rgb2hsl (s_rgb_colorattrib astr_from, ref s_hsl_colorattrib astr_to)
public function integer of_hsl2rgb (s_hsl_colorattrib astr_from, ref s_rgb_colorattrib astr_to)
public function integer of_hsv2rgb (s_hsv_colorattrib astr_from, ref s_rgb_colorattrib astr_to)
public function integer of_rgb2hsv (s_rgb_colorattrib astr_from, ref s_hsv_colorattrib astr_to)
protected function any of_max (any aa_values[])
protected function any of_min (any aa_values[])
protected function decimal of_rad2deg (decimal adec_rad)
protected function decimal of_hue2rgb (decimal adec_v1, decimal adec_v2, decimal adec_vh)
public function integer of_rgb2cmy (s_rgb_colorattrib astr_from, ref s_cmy_colorattrib astr_to)
public function integer of_cmy2rgb (s_cmy_colorattrib astr_from, ref s_rgb_colorattrib astr_to)
public function integer of_cmyk2cmy (s_cmyk_colorattrib astr_from, ref s_cmy_colorattrib astr_to)
public function integer of_cmy2cmyk (s_cmy_colorattrib astr_from, ref s_cmyk_colorattrib astr_to)
public function long of_rgb (s_rgb_colorattrib astr_rgb)
public function integer of_cielab2cielch (s_cielab_colorattrib astr_from, ref s_cielch_colorattrib astr_to)
public function integer of_cielab2xyz (s_cielab_colorattrib astr_from, ref s_xyz_colorattrib astr_to)
public function integer of_cielch2cielab (s_cielch_colorattrib astr_from, ref s_cielab_colorattrib astr_to)
public function integer of_cieluv2xyz (s_cieluv_colorattrib astr_from, ref s_xyz_colorattrib astr_to)
end prototypes

public function integer of_xyz2rgb (s_xyz_colorattrib astr_xyz, ref s_rgb_colorattrib astr_rgb);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_Xyz2Rgb
//
//	Access:  			public
//
//	Arguments:
//	s_xyz_colorattrib		- CIE 1391 XYZ color space structure to be converted into RGB values
//	s_rgb_colorattrib  	- RGB color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - missing parameter
//								-2, Error - out of rnage parameter
//
//	Description:
//	Convert an CIE 1391 XYZ Color space value into an RGB color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_x
decimal	ldec_y
decimal	ldec_z
decimal	ldec_r
decimal	ldec_g
decimal	ldec_b

// Check missing parm
if isnull( astr_xyz ) then return ERR_MISSING_PARM
if isnull( astr_rgb ) then return ERR_MISSING_PARM

// Check parameters allowed range or values
if astr_xyz.x < 0 or astr_xyz.x > 95.047 		then return ERR_OUTOFRANGE_PARM
if astr_xyz.y < 0 or astr_xyz.y > 100.000 	then return ERR_OUTOFRANGE_PARM
if astr_xyz.z < 0 or astr_xyz.z > 108.883 	then return ERR_OUTOFRANGE_PARM

// Prepare Conversion
ldec_X = astr_xyz.X / 100        
ldec_Y = astr_xyz.Y / 100        
ldec_Z = astr_xyz.Z / 100        

ldec_R = ldec_X *  3.2406 + ldec_Y * -1.5372 + ldec_Z * -0.4986
ldec_G = ldec_X * -0.9689 + ldec_Y *  1.8758 + ldec_Z *  0.0415
ldec_B = ldec_X *  0.0557 + ldec_Y * -0.2040 + ldec_Z *  1.0570

if ( ldec_R > 0.0031308 ) then
	ldec_R = 1.055 * ( ldec_R ^ ( 1 / 2.4 ) ) - 0.055
else                     
	ldec_R = 12.92 * ldec_R
end if

if ( ldec_G > 0.0031308 ) then 
	ldec_G = 1.055 * ( ldec_G ^ ( 1 / 2.4 ) ) - 0.055
else
	ldec_G = 12.92 * ldec_G
end if

if ( ldec_B > 0.0031308 ) then 
	ldec_B = 1.055 * ( ldec_B ^ ( 1 / 2.4 ) ) - 0.055
else
	ldec_B = 12.92 * ldec_B
end if

// Complete conversion
astr_rgb.R = ldec_R * 255
astr_rgb.G = ldec_G * 255
astr_rgb.B = ldec_B * 255

return OK
end function

public function integer of_yxy2xyz (s_yxy_colorattrib astr_from, ref s_xyz_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_yxy2xyz
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- YXY color structure to be converted into XYZ values
//	astr_to  			- CIE 1391 XYZ color space structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing Parameter
//
//	Description:
//	Convert an  YXY color value into an CIE 1391 XYZ Color space value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check for missing parameters
if isnull( astr_from ) 	then return ERR_MISSING_PARM
if isnull( astr_to ) 		then return ERR_MISSING_PARM

// Check allowed range of parameters value
if astr_from.y < 0 or astr_from.y > 100 	then return ERR_OUTOFRANGE_PARM
if astr_from.y < 0 or astr_from.y > 1 		then return ERR_OUTOFRANGE_PARM
if astr_from.y_ < 0 or astr_from.y_ > 1 	then return ERR_OUTOFRANGE_PARM

// Apply conversion

astr_to.X =astr_from.x * ( astr_from.Y /astr_from.y_ )
astr_to.Y = astr_from.Y
astr_to.Z = ( 1 -astr_from.x -astr_from.y_ ) * (astr_from.Y / astr_from.y_ )

return OK
end function

public function integer of_rgb2xyz (s_rgb_colorattrib astr_from, ref s_xyz_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_RGB2XYZ
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- RGB color structure to be converted into RGB values
//	astr_to  	- CIE 1391 XYZ color space structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing Parameter
//
//	Description:
//	Convert an  RGB color value into an CIE 1391 XYZ Color space value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_x
decimal	ldec_y
decimal	ldec_z
decimal	ldec_r
decimal	ldec_g
decimal	ldec_b

// Check Missing Parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion

ldec_R = ( astr_from.R / 255 )        //R from 0 to 255
ldec_G = ( astr_from.G / 255 )        //G from 0 to 255
ldec_B = ( astr_from.B / 255 )        //B from 0 to 255

if ( ldec_R > 0.04045 ) then
	ldec_R = ( ( ldec_R + 0.055 ) / 1.055 ) ^ 2.4
else                   
	ldec_R = ldec_R / 12.92
end if

if ( ldec_G > 0.04045 ) then
	ldec_G = ( ( ldec_G + 0.055 ) / 1.055 ) ^ 2.4
else                   
	ldec_G = ldec_G / 12.92
end if

if ( ldec_B > 0.04045 ) then 
	ldec_B = ( ( ldec_B + 0.055 ) / 1.055 ) ^ 2.4
else                   
	ldec_B = ldec_B / 12.92
end if

ldec_R = ldec_R * 100
ldec_G = ldec_G * 100
ldec_B = ldec_B * 100

// Complete conversion
astr_to.X = ldec_R * 0.4124 + ldec_G * 0.3576 + ldec_B * 0.1805
astr_to.Y = ldec_R * 0.2126 + ldec_G * 0.7152 + ldec_B * 0.0722
astr_to.Z = ldec_R * 0.0193 + ldec_G * 0.1192 + ldec_B * 0.9505

return OK
end function

public function integer of_xyz2yxy (s_xyz_colorattrib astr_from, ref s_yxy_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_xyz2yxy
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- XYZ color structure to be converted into YXY values
//	astr_to  			- YXY color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//								-2, Error - Out of range parameter
//
//	Description:
//	Convert an  RGB color value into an CIE 1391 XYZ Color space value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Check parameters range values
if astr_from.x < 0 or astr_from.x > 95.047 		then return ERR_OUTOFRANGE_PARM
if astr_from.y < 0 or astr_from.y > 100.000 	then return ERR_OUTOFRANGE_PARM
if astr_from.z < 0 or astr_from.z > 108.883 	then return ERR_OUTOFRANGE_PARM

// Complete conversion
astr_to.y = astr_from.y
astr_to.x = astr_from.X / ( astr_from.X + astr_from.Y + astr_from.Z )
astr_to.y_ = astr_from.Y / ( astr_from.X + astr_from.Y + astr_from.Z )

return OK
end function

public function integer of_xyz2hunterlab (s_xyz_colorattrib astr_from, ref s_hunterlab_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_xyz2hunterlab
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- XYZ color structure to be converted into YXY values
//	astr_to  			- Hunter-Lab color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//								-2, Error - Out of range parameter
//
//	Description:
//	Convert an  CIE 1391 XYZ Color space value into an  Hunter-Lab color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

astr_to.L = 10 * sqrt( astr_from.Y )
astr_to.a = 17.5 * ( ( ( 1.02 * astr_from.X ) - astr_from.Y ) / sqrt( astr_from.Y ) )
astr_to.b = 7 * ( ( astr_from.Y - ( 0.847 * astr_from.Z ) ) / sqrt( astr_from.Y ) )

return OK
end function

public function integer of_hunterlab2xyz (s_hunterlab_colorattrib astr_from, ref s_xyz_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_xyz2hunterlab
//
//	Access:  			public
//
//	Arguments:
//	astr_from  	- Hunter-Lab color structure to be converted into YXY values
//	astr_to		- XYZ color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an an Hunter-Lab color value into CIE 1391 XYZ Color space value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_x
decimal ldec_var_y
decimal ldec_var_z

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_var_Y = astr_from.L / 10
ldec_var_X = astr_from.a / 17.5 * astr_from.L / 10
ldec_var_Z = astr_from.b / 7 * astr_from.L / 10

// Complete Conversion
astr_to.Y = ldec_var_Y ^ 2
astr_to.X = ( ldec_var_X + astr_to.Y ) / 1.02
astr_to.Z = -( ldec_var_Z - astr_to.Y ) / 0.847

return OK
end function

protected function integer of_xyz2cielab (s_xyz_colorattrib astr_from, ref s_cielab_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_xyz2hunterlab
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- XYZ color structure to be converted into CIE-L*AB values
//	astr_to  			- CIE-L*AB color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an  CIE 1391 XYZ Color space value into an  CIE-L*AB color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_x
decimal ldec_var_y
decimal ldec_var_Z

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare conversion
ldec_var_X = astr_from.X / cst_ref_X   
ldec_var_Y = astr_from.Y / cst_ref_Y          
ldec_var_Z = astr_from.Z / cst_ref_Z          

if ( ldec_var_X > 0.008856 ) then
	ldec_var_X = ldec_var_X ^ ( 1/3 )
else                    
	ldec_var_X = ( 7.787 * ldec_var_X ) + ( 16 / 116 )
end if

if ( ldec_var_Y > 0.008856 ) then
	ldec_var_Y = ldec_var_Y ^ ( 1/3 )
else                    
	ldec_var_Y = ( 7.787 * ldec_var_Y ) + ( 16 / 116 )
end if

if ( ldec_var_Z > 0.008856 ) then
	ldec_var_Z = ldec_var_Z ^ ( 1/3 )
else                    
	ldec_var_Z = ( 7.787 * ldec_var_Z ) + ( 16 / 116 )
end if

// Complete conversion
astr_to.L = ( 116 * ldec_var_Y ) - 16
astr_to.a = 500 * ( ldec_var_X - ldec_var_Y )
astr_to.b = 200 * ( ldec_var_Y - ldec_var_Z )

return OK
end function

public function decimal of_deg2rad (decimal adec_deg);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_deg2rad
//
//	Access:  			public
//
//	Arguments:
//	adec_deg 	- Degrees to be converted into Radians
//
//	Returns:  decimal	:	 result of the conversion in Radians, or
//								null, if adec_rad is null
//
//	Description:
//	Convert Degrees into Radians. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return (adec_deg * PI ) / 180
end function

protected function integer of_xyz2cieluv (s_xyz_colorattrib astr_from, ref s_cieluv_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_xyz2hunterlab
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- XYZ color structure to be converted into CIE-L*UV values
//	astr_to  			- CIE-L*UV color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an  CIE 1391 XYZ Color space value into an CIE-L*UV color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_u
decimal ldec_var_v
decimal ldec_var_y
decimal ldec_ref_U
decimal ldec_ref_V

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_var_U = ( 4 * astr_from. X ) / ( astr_from.X + ( 15 * astr_from.Y ) + ( 3 * astr_from.Z ) )
ldec_var_V = ( 9 * astr_from. Y ) / ( astr_from.X + ( 15 * astr_from.Y ) + ( 3 * astr_from.Z ) )

ldec_var_Y = astr_from.Y / 100
if ( ldec_var_Y > 0.008856 ) then 
	ldec_var_Y = ldec_var_Y ^ ( 1/3 )
else                    
	ldec_var_Y = ( 7.787 * ldec_var_Y ) + ( 16 / 116 )
end if

ldec_ref_U = ( 4 * cst_ref_X ) / ( cst_ref_X + ( 15 * cst_ref_Y ) + ( 3 * cst_ref_Z ) )
ldec_ref_V = ( 9 * cst_ref_Y ) / ( cst_ref_X + ( 15 * cst_ref_Y ) + ( 3 * cst_ref_Z ) )

// Complete Conversion
astr_to.L = ( 116 * ldec_var_Y ) - 16
astr_to.u = 13 * astr_to.L * ( ldec_var_U - ldec_ref_U )
astr_to.v = 13 * astr_to.L * ( ldec_var_V - ldec_ref_V )

return OK
end function

public function integer of_rgb2hsl (s_rgb_colorattrib astr_from, ref s_hsl_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_rgb2hsl
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- RGB color structure to be converted into HSL values
//	astr_to  		- HSL structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing Parameter
//
//	Description:
//	Convert an  RGB color value into an HSL  value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_del_r
decimal	ldec_del_g
decimal	ldec_del_b
decimal	ldec_r
decimal	ldec_g
decimal	ldec_b
decimal 	ldec_var_min
decimal 	ldec_var_max
decimal 	ldec_del_max
any		la_val[3]

// Check Missing Parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_R = ( astr_from.R / 255 )        
ldec_G = ( astr_from.G / 255 )        
ldec_B = ( astr_from.B / 255 )        

la_val[1] = ldec_R
la_val[2] = ldec_G
la_val[3] = ldec_B

ldec_var_Min = this.of_min( la_val )    				//Min. value of RGB
ldec_var_Max = this.of_max( la_val )    				//Max. value of RGB
ldec_del_Max = ldec_var_Max - ldec_var_Min  		 //Delta RGB value

// Complete conversion
astr_to.L = ( ldec_var_Max + ldec_var_Min ) / 2

if ( ldec_del_Max = 0 ) then               //This is a gray, no chroma...
   astr_to.H = 0                                //HSL results from 0 to 1
   astr_to.S = 0
else                                    //Chromatic data...
   	if ( astr_to.L < 0.5 ) then
		astr_to.S = ldec_del_Max / ( ldec_var_Max + ldec_var_Min )
   	else           
		astr_to.S = ldec_del_Max / ( 2 - ldec_var_Max - ldec_var_Min )
	end if

	ldec_del_R = ( ( ( ldec_var_Max - ldec_R ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max
	ldec_del_G = ( ( ( ldec_var_Max - ldec_G ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max
	ldec_del_B = ( ( ( ldec_var_Max - ldec_B ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max

	if ( ldec_R = ldec_var_Max ) then
		astr_to.H = ldec_del_B - ldec_del_G
	elseif ( ldec_G = ldec_var_Max ) then
		astr_to.H = ( 1 / 3 ) + ldec_del_R - ldec_del_B
	elseif ( ldec_B = ldec_var_Max ) then
		astr_to.H = ( 2 / 3 ) + ldec_del_G - ldec_del_R
	end if
	
	if ( astr_to.H < 0 ) then astr_to.H += 1
	if ( astr_to.H > 1 ) then astr_to.H -= 1
end if

return OK
end function

public function integer of_hsl2rgb (s_hsl_colorattrib astr_from, ref s_rgb_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_hsl2rgb
//
//	Access:  			public
//
//	Arguments:
//	astr_from	-  HSL color structure to be converted into RGB values
//	astr_to  		- RGB structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing Parameter
//
//	Description:
//	Convert an HSL color value into an RGB value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_var_1
decimal	ldec_var_2

// Check Missing Parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Apply conversion
if ( astr_from.S = 0 )	then				//HSL from 0 to 1
	astr_to.R = astr_from.L * 255		//RGB results from 0 to 255
   	astr_to.G = astr_from.L * 255
   	astr_to.B = astr_from.L * 255
else
   	if ( astr_from.L < 0.5 ) then 
			ldec_var_2 = astr_from.L * ( 1 + astr_from.S )
   	else           
			ldec_var_2 = ( astr_from.L + astr_from.S ) - ( astr_from.S * astr_from.L )
	end if

   ldec_var_1 = 2 * astr_from.L - ldec_var_2

   astr_to.R = 255 * this.of_Hue2RGB( ldec_var_1, ldec_var_2, astr_from.H + ( 1 / 3 ) ) 
   astr_to.G = 255 * this.of_Hue2RGB( ldec_var_1, ldec_var_2, astr_from.H )
   astr_to.B = 255 * this.of_Hue2RGB(  ldec_var_1,  ldec_var_2, astr_from.H - ( 1 / 3 ) )
end if

return OK
end function

public function integer of_hsv2rgb (s_hsv_colorattrib astr_from, ref s_rgb_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_hsv2rgb
//
//	Access:  			public
//
//	Arguments:
//	s_hsv_colorattrib	- HSV color space structure to be converted into RGB values
//	s_rgb_colorattrib  	- RGB color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - missing parameter
//								-2, Error - out of rnage parameter
//
//	Description:
//	Convert an HSV Color value into an RGB color value. 
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
 * ==================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_var_R
decimal	ldec_var_G
decimal	ldec_var_B
decimal	ldec_var_i
decimal	ldec_var_h
decimal	ldec_var_1
decimal	ldec_var_2
decimal	ldec_var_3

// Check missing parm
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
if ( astr_from.S = 0 ) then	//HSV from 0 to 1
	astr_to.R = astr_from.V * 255
	astr_to.G = astr_from.V * 255
	astr_to.B = astr_from.V * 255
else
   ldec_var_h =astr_from. H * 6
   if ( ldec_var_h = 6 )  then ldec_var_h = 0      //H must be < 1
   ldec_var_i = int( ldec_var_h )            
   ldec_var_1 = astr_from.V * ( 1 - astr_from.S )
   ldec_var_2 = astr_from.V * ( 1 - astr_from.S * ( ldec_var_h - ldec_var_i ) )
   ldec_var_3 = astr_from.V * ( 1 - astr_from.S * ( 1 - ( ldec_var_h - ldec_var_i ) ) )

   if ( ldec_var_i = 0 ) then
		ldec_var_r = astr_from.V 
		ldec_var_g = ldec_var_3
		ldec_var_b = ldec_var_1
   elseif ( ldec_var_i = 1 ) then 
		ldec_var_r = ldec_var_2
		ldec_var_g = astr_from.V
		ldec_var_b = ldec_var_1
   elseif ( ldec_var_i = 2 ) then 
		ldec_var_r = ldec_var_1
		ldec_var_g = astr_from.V
		ldec_var_b = ldec_var_3
   elseif ( ldec_var_i = 3 ) then 
		ldec_var_r = ldec_var_1
		ldec_var_g = ldec_var_2 
		ldec_var_b = astr_from.V 
   elseif ( ldec_var_i = 4 ) then 
		ldec_var_r = ldec_var_3
		ldec_var_g = ldec_var_1
		ldec_var_b = astr_from.V
   else
		ldec_var_r = astr_from.V
		ldec_var_g = ldec_var_1 
		ldec_var_b = ldec_var_2 
	end if
	
	// Complete conversion
   	astr_to.R = ldec_var_r * 255                  //RGB results from 0 to 255
   	astr_to.G = ldec_var_g * 255
   	astr_to.B = ldec_var_b * 255
end if

return OK
end function

public function integer of_rgb2hsv (s_rgb_colorattrib astr_from, ref s_hsv_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_rgb2hsv
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- RGB color structure to be converted into HSV values
//	astr_to  		- HSV structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing Parameter
//
//	Description:
//	Convert an  RGB color value into an HSV  value . 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_del_r
decimal	ldec_del_g
decimal	ldec_del_b
decimal	ldec_var_r
decimal	ldec_var_g
decimal	ldec_var_b
decimal 	ldec_var_min
decimal 	ldec_var_max
decimal 	ldec_del_max
any		la_val[3]

// Check Missing Parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_var_R = ( astr_from.R / 255 )                     //RGB from 0 to 255
ldec_var_G = ( astr_from.G / 255 )
ldec_var_B = ( astr_from.B / 255 )

la_val [1] = ldec_var_r
la_val [2] = ldec_var_g
la_val [3] = ldec_var_b

ldec_var_Min = this.of_min( la_val )    //Min. value of RGB
ldec_var_Max = this.of_max( la_val )    //Max. value of RGB
ldec_del_Max = ldec_var_Max - ldec_var_Min             //Delta RGB value 

astr_to.V = ldec_var_Max

if ( ldec_del_Max = 0 ) then //This is a gray, no chroma...
   astr_to.H = 0                                //HSV results from 0 to 1
   astr_to.S = 0
else                                    //Chromatic data...
   astr_to.S = ldec_del_Max / ldec_var_Max

   ldec_del_R = ( ( ( ldec_var_Max - ldec_var_R ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max
   ldec_del_G = ( ( ( ldec_var_Max - ldec_var_G ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max
   ldec_del_B = ( ( ( ldec_var_Max - ldec_var_B ) / 6 ) + ( ldec_del_Max / 2 ) ) / ldec_del_Max

   if ( ldec_var_R = ldec_var_Max ) then 
		astr_to.H = ldec_del_B - ldec_del_G
   elseif ( ldec_var_G = ldec_var_Max ) then
		astr_to.H = ( 1 / 3 ) + ldec_del_R - ldec_del_B
   elseif ( ldec_var_B = ldec_var_Max ) then
		astr_to.H = ( 2 / 3 ) + ldec_del_G - ldec_del_R
	end if
	
   if ( astr_to.H < 0 ) then astr_to.H += 1
   if ( astr_to.H > 1 ) then astr_to.H -= 1
end if

return OK
end function

protected function any of_max (any aa_values[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_max
//
//	Access:  			public
//
//	Arguments:
//	aa_values[] 	- Arrays of values to extract the maximum from
//
//	Returns:  decimal	:	 The maximum found in aa_values[], or
//								null, if aa_values[] is null
//
//	Description:
//	Find the maximum value in the specified arrays of values
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer li_i
integer li_limit
any	  la_rc = -99999999999999

li_limit = upperbound( aa_values )

if li_limit < 1 then 
	Setnull(la_rc)
	return la_rc
end if

for li_i = 1 to li_limit
	if aa_values[li_i] > la_rc then
		la_rc = aa_values[li_i]
	end if
next

return la_rc
end function

protected function any of_min (any aa_values[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_min
//
//	Access:  			public
//
//	Arguments:
//	aa_values[] 	- Arrays of values to extract the minimum from
//
//	Returns:  decimal	:	 The minimum found in aa_values[], or
//								null, if aa_values[] is null
//
//	Description:
//	Find the minimum value in the specified arrays of values
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer li_i
integer li_limit
any	  la_rc = 99999999999999

li_limit = upperbound( aa_values )

if li_limit < 1 then 
	Setnull(la_rc)
	return la_rc
end if

for li_i = 1 to li_limit
	if aa_values[li_i] < la_rc then
		la_rc = aa_values[li_i]
	end if
next

return la_rc
end function

protected function decimal of_rad2deg (decimal adec_rad);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_rad2deg
//
//	Access:  			public
//
//	Arguments:
//	adec_rad 	- Radians to be converted into Degrees
//
//	Returns:  decimal	:	 result of the conversion in Degrees, or
//								null, if adec_rad is null
//
//	Description:
//	Convert Radians into Degrees. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return (adec_rad *180 ) / PI
end function

protected function decimal of_hue2rgb (decimal adec_v1, decimal adec_v2, decimal adec_vh);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_hue2rgb
//
//	Access:  			public
//
//	Arguments:
//		adec_v1	- Hue value 1 to be converted in RGB
//		adec_v1	- Hue value 2 to be converted in RGB
//		adec_vh	- Hue value H to be converted in RGB
//
//	Returns: Decimal - Hue converteg to RGB value, or NULL if an error occurs
//
//	Description:
//	return Specified HUE value converted to RGB
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

   if ( adec_vH < 0 ) then adec_vH += 1
   if ( adec_vH > 1 ) then adec_vH -= 1
	
   if ( ( 6 * adec_vH ) < 1 ) then return ( adec_v1 + ( adec_v2 - adec_v1 ) * 6 * adec_vH )
   if ( ( 2 * adec_vH ) < 1 ) then return ( adec_v2 )
   if ( ( 3 * adec_vH ) < 2 ) then return ( adec_v1 + ( adec_v2 - adec_v1 ) * ( ( 2 / 3 ) - adec_vH ) * 6 )

   return adec_v1
end function

public function integer of_rgb2cmy (s_rgb_colorattrib astr_from, ref s_cmy_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_rgb2CMY
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- RGB color structure  to be converted into CMY color value
//	astr_to		- CMY color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an RGB color value into an CMY value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check missing Parameter
if isnull( astr_from ) then return err_missing_parm
if isnull( astr_to ) then return err_missing_parm

// Complete conversion

astr_to.C = 1 - ( astr_from.R / 255 )
astr_to.M = 1 - ( astr_from.G / 255 )
astr_to.Y = 1 - ( astr_from.B / 255 )

return OK
end function

public function integer of_cmy2rgb (s_cmy_colorattrib astr_from, ref s_rgb_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cmy2rgb
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CMY color structure  to be converted into RGB color value
//	astr_to		- RGB color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an CMY color value into an RGB value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check missing Parameter
if isnull( astr_from ) then return err_missing_parm
if isnull( astr_to ) then return err_missing_parm

// Complete conversion
astr_to.R = ( 1 - astr_from.C ) * 255
astr_to.G = ( 1 - astr_from.M ) * 255
astr_to.B = ( 1 - astr_from.Y ) * 255

return OK
end function

public function integer of_cmyk2cmy (s_cmyk_colorattrib astr_from, ref s_cmy_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cmyk2cmy
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CMYK value to be converted into CMY color value
//	astr_to		- CMY color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an CMYK color value into an CMY value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check missing Parameter
if isnull( astr_from ) then return err_missing_parm
if isnull( astr_to ) then return err_missing_parm

// Complete conversion
astr_to.C = ( astr_from.C * ( 1 - astr_from.K ) + astr_from.K )
astr_to.M = ( astr_from.M * ( 1 - astr_from.K ) + astr_from.K )
astr_to.Y = ( astr_from.Y * ( 1 - astr_from.K ) + astr_from.K )

return OK
end function

public function integer of_cmy2cmyk (s_cmy_colorattrib astr_from, ref s_cmyk_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cmy2cmyk
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CMY value to be converted into CMYK color value
//	astr_to		- CMYK color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an CMY color value into an CMYK value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal	ldec_var_k

// Check missing Parameter
if isnull( astr_from ) then return err_missing_parm
if isnull( astr_to ) then return err_missing_parm

// Prepare Conversion
ldec_var_K = 1

if ( astr_from.C < ldec_var_K )  then ldec_var_K = astr_from.C
if ( astr_from.M < ldec_var_K )  then ldec_var_K = astr_from.M
if ( astr_from.Y < ldec_var_K )   then ldec_var_K = astr_from.Y

// Complete Conversion
if ( ldec_var_K = 1 ) then  //Black
   astr_to.C = 0
   astr_to.M = 0
   astr_to.Y = 0
else
   astr_to.C = ( astr_from.C - ldec_var_K ) / ( 1 - ldec_var_K )
   astr_to.M = ( astr_from.M - ldec_var_K ) / ( 1 - ldec_var_K )
   astr_to.Y = ( astr_from.Y - ldec_var_K ) / ( 1 - ldec_var_K )
end if

astr_to.K = ldec_var_K

return OK
end function

public function long of_rgb (s_rgb_colorattrib astr_rgb);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_RGB
//
//	Access:  			public
//
//	Arguments:
//	astr_RGB	- RGB color structure to be converted in LONG value
//
//	Returns:  long	:	 the converted value, or nuill is an error occurs
//
//	Description:
//	returns long value corresponding to specified RGB structure
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Check Missing Parameter
if isnull( astr_rgb ) then
	long ll_null
	Setnull( ll_null)
	return ll_null
end if

return rgb( astr_rgb.r, astr_rgb.g, astr_rgb.b)

end function

public function integer of_cielab2cielch (s_cielab_colorattrib astr_from, ref s_cielch_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cielabcielch
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CIE-L*AB color structure  to be converted into CIE_L*CH* color value
//	astr_to		- CIE_L*CH* color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an  CIE-L*AB color value into an CIE_L*CH* Color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_h

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_var_H = ATan( astr_from.b / astr_from.a )  //Quadrant by signs

if ( ldec_var_H > 0 ) then
	ldec_var_H = ( ldec_var_H / PI ) * 180
else             
	ldec_var_H = 360 - ( abs( ldec_var_H ) / PI ) * 180
end if

// Complete Conversion
astr_to.L = astr_from.L
astr_to.C = sqrt( astr_from.a ^ 2 + astr_from.b ^ 2 )
astr_to.H = ldec_var_H

return OK
end function

public function integer of_cielab2xyz (s_cielab_colorattrib astr_from, ref s_xyz_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cielab2xyz
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CIE-L*AB color structure  to be converted into XYZ color value
//	astr_to		- XYZ color structures that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an  CIE-L*AB color value into an CIE 1391 XYZ Color space value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_x
decimal ldec_var_y
decimal ldec_var_Z

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare conversion
ldec_var_Y = ( astr_from.L + 16 ) / 116
ldec_var_X = astr_from.a / 500 + ldec_var_Y
ldec_var_Z = ldec_var_Y - astr_from.b / 200

if ( ldec_var_Y^3 > 0.008856 ) then
	ldec_var_Y = ldec_var_Y^3
else                      
	ldec_var_Y = ( ldec_var_Y - 16 / 116 ) / 7.787
end if

if ( ldec_var_X^3 > 0.008856 ) then
	ldec_var_X = ldec_var_X^3
else                      
	ldec_var_X = ( ldec_var_X - 16 / 116 ) / 7.787
end if

if ( ldec_var_Z^3 > 0.008856 ) then
	ldec_var_Z = ldec_var_Z^3
else                      
	ldec_var_Z = ( ldec_var_Z - 16 / 116 ) / 7.787
end if

//Complete conversion
astr_to.X = cst_ref_X * ldec_var_X    
astr_to.Y = cst_ref_Y * ldec_var_Y    
astr_to.Z = cst_ref_Z * ldec_var_Z

return OK
end function

public function integer of_cielch2cielab (s_cielch_colorattrib astr_from, ref s_cielab_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cielch2cielab
//
//	Access:  			public
//
//	Arguments:
//	astr_from	- CIE_L*CH* to be converted into CIE-L*AB color value.
//	astr_to		- CIE-L*AB color structures that will hold the conversion result (by ref) 
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//								-2, Error - Parameter out of range
//
//	Description:
//	Convert an CIE_L*CH* color value into an CIE-L*AB Color value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_h

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Check parameter value range
//CIE-H$$HEX2$$b0002000$$ENDHEX$$from 0 to 360$$HEX1$$b000$$ENDHEX$$
if astr_from.h < 0 or astr_from.h > 360 then return ERR_OUTOFRANGE_PARM

astr_to.L = astr_from.L
astr_to.a = cos( of_deg2rad( astr_from.H ) ) * astr_from.C
astr_to.b = sin( of_deg2rad( astr_from.H ) ) * astr_from.C

return OK
end function

public function integer of_cieluv2xyz (s_cieluv_colorattrib astr_from, ref s_xyz_colorattrib astr_to);//////////////////////////////////////////////////////////////////////////////
//
//	Function:			of_cieluv2xyz
//
//	Access:  			public
//
//	Arguments:
//	astr_from		- CIE-L*UV color structure to be converted into XYZ values
//	astr_to  			-XYZ color structure that will hold the conversion result (by ref)
//
//	Returns:  integer	:	 1, OK
//								-1, Error - Missing parameter
//
//	Description:
//	Convert an CIE-L*UV value into an CIE 1391 XYZ Color space value. 
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
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

decimal ldec_var_u
decimal ldec_var_v
decimal ldec_var_y
decimal ldec_ref_U
decimal ldec_ref_V

// Check missing parameter
if isnull( astr_from ) then return ERR_MISSING_PARM
if isnull( astr_to ) then return ERR_MISSING_PARM

// Prepare Conversion
ldec_var_Y = ( astr_from.L + 16 ) / 116
if ( ldec_var_Y^3 > 0.008856 ) then
	ldec_var_Y = ldec_var_Y^3
else                      
	ldec_var_Y = ( ldec_var_Y - 16 / 116 ) / 7.787
end if

ldec_ref_U = ( 4 * cst_ref_X ) / ( cst_ref_X + ( 15 * cst_ref_Y ) + ( 3 * cst_ref_Z ) )
ldec_ref_V = ( 9 * cst_ref_Y ) / ( cst_ref_X + ( 15 * cst_ref_Y ) + ( 3 * cst_ref_Z ) )

ldec_var_U = astr_from.u / ( 13 * astr_from.L ) + astr_from.U
ldec_var_V = astr_from.v / ( 13 * astr_from.L ) + astr_from.V

astr_to.Y = ldec_var_Y * 100
astr_to.X =  - ( 9 * astr_to.Y * ldec_var_U ) / ( ( ldec_var_U - 4 ) * ldec_var_V  - ldec_var_U * ldec_var_V )
astr_to.Z = ( 9 * astr_to.Y - ( 15 * ldec_var_V * astr_to.Y ) - ( ldec_var_V * astr_to.X ) ) / ( 3 * ldec_var_V )

return OK
end function

on pfc_n_cst_colorconv.create
call super::create
end on

on pfc_n_cst_colorconv.destroy
call super::destroy
end on

