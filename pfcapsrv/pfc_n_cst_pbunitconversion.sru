HA$PBExportHeader$pfc_n_cst_pbunitconversion.sru
$PBExportComments$PFC Programmatic conversion of dataWindow units.  Goes beyond pixels and PowerBuilder units to include inches, centimeters and twips.
forward
global type pfc_n_cst_pbunitconversion from n_base
end type
end forward

global type pfc_n_cst_pbunitconversion from n_base autoinstantiate
end type

type variables
Private:

	n_cst_platform						invo_platform
	n_cst_measureConversion			invo_measurementConversion
	
Public:

	CONSTANT Integer		PBUNITS								= 0				//	PB Units
	CONSTANT Integer		PIXELS								= 1				//	Pixels
	CONSTANT Integer		INCHES_1000ths						= 2				//	1/1000 Inch
	CONSTANT Integer		CENTIMETER_1000ths				= 3				//	1/1000 Centimeter
end variables

forward prototypes
public function decimal of_inchestotwipsx (decimal vdec_inches)
public function decimal of_inchestotwipsy (decimal vdec_inches)
private function long of_twipsperpixely ()
public function decimal of_twipstoinchesx (decimal vdec_twips)
public function decimal of_twipstoinchesy (decimal vdec_twips)
private function long of_twipsperpixelx ()
public function decimal of_pbunitstoinchesx (long vl_pbunits)
public function decimal of_pbunitstoinchesy (long vl_pbunits)
public function decimal of_inchestopbunitsx (decimal vdec_inches)
public function decimal of_inchestopbunitsy (decimal vdec_inches)
public function decimal of_twipstopixelsx (decimal vdec_twips)
public function decimal of_twipstopixelsy (decimal vdec_twips)
public function long of_convertunitsx (double vdbl_units, integer vl_fromunits, integer vl_tounits)
public function long of_convertunitsy (double vdbl_units, integer vl_fromunits, integer vl_tounits)
public function decimal of_inchestopixelsx (decimal vdec_inches)
public function decimal of_inchestopixelsy (decimal vdec_inches)
public function decimal of_pixelstoinchesy (decimal vdec_pixels)
public function decimal of_pixelstoinchesx (decimal vdec_pixels)
public function decimal of_centimeterstopbunitsx (decimal vdec_centimeters)
public function decimal of_centimeterstopbunitsy (decimal vdec_centimeters)
public function decimal of_centimeterstopixelsx (decimal vdec_centimeters)
public function decimal of_centimeterstopixelsy (decimal vdec_centimeters)
public function decimal of_centimeterstotwipsx (decimal vdec_centimeters)
public function decimal of_centimeterstotwipsy (decimal vdec_centimeters)
public function decimal of_pbunitstocentimetersx (long vl_pbunits)
public function decimal of_pbunitstocentimetersy (long vl_pbunits)
public function decimal of_pixelstocentimetersx (decimal vdec_pixels)
public function decimal of_pixelstocentimetersy (decimal vdec_pixels)
public function decimal of_twipstocentimetersx (decimal vdec_twips)
public function decimal of_twipstocentimetersy (decimal vdec_twips)
end prototypes

public function decimal of_inchestotwipsx (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToTwipsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to twips
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of twips
//
//	Description: 	Converts inches to twips along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(vdec_Inches * Dec(1440))
end function

public function decimal of_inchestotwipsy (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToTwipsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to twips
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of twips
//
//	Description: 	Converts inches to twips along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(vdec_Inches * Dec(1440))
end function

private function long of_twipsperpixely ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsPerPixelY
//
//	Access:  		private
//
//	Arguments:		None
//
//	Returns:  		Long				Number of twips
//
//	Description: 	Returns the number of twips per pixel along the Y axis
//						of the monitor
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

f_setPlatform(invo_platform, TRUE)

unsignedLong				lul_twipsPerPixelsY
lul_twipsPerPixelsY		= 1440 / invo_platform.of_GetDPIY()

Return(lul_twipsPerPixelsY)
end function

public function decimal of_twipstoinchesx (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToInchesX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to inches
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of inches
//
//	Description: 	Converts twips to inches along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(Round(vdec_Twips / Dec(1440), 3))
end function

public function decimal of_twipstoinchesy (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToInchesY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to inches
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of inches
//
//	Description: 	Converts twips to inches along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(Round(vdec_Twips / Dec(1440), 3))
end function

private function long of_twipsperpixelx ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsPerPixelX
//
//	Access:  		private
//
//	Arguments:		None
//
//	Returns:  		Long				Number of twips
//
//	Description: 	Returns the number of twips per pixel along the X axis
//						of the monitor
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

f_setPlatform(invo_platform, TRUE)

unsignedLong				lul_twipsPerPixelsX
lul_twipsPerPixelsX		= 1440 / invo_platform.of_GetDPIX()

Return(lul_twipsPerPixelsX)
end function

public function decimal of_pbunitstoinchesx (long vl_pbunits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PBUnitsToInchesX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of PBUnits to convert to inches
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts PBUnits to inches along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						that in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Pixels
ll_Pixels					= UnitsToPixels(vl_PBUnits, XUnitsToPixels!)

Return(of_TwipsToInchesX(Dec(of_TwipsPerPixelX() * ll_Pixels)))
end function

public function decimal of_pbunitstoinchesy (long vl_pbunits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PBUnitsToInchesY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of PBUnits to convert to inches
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts PBUnits to inches along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Pixels
ll_Pixels					= UnitsToPixels(vl_PBUnits, YUnitsToPixels!)

Return(of_TwipsToInchesY(Dec(of_TwipsPerPixelY() * ll_Pixels)))
end function

public function decimal of_inchestopbunitsx (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToPBUnitsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to PBUnits
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts inches to PBUnits along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_Twips
ldec_Twips					= of_InchesToTwipsX(vdec_Inches)

Return(PixelsToUnits(ldec_Twips / of_TwipsPerPixelX(), XPixelsToUnits!))
end function

public function decimal of_inchestopbunitsy (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToPBUnitsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to PBUnits
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts inches to PBUnits along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_Twips
ldec_Twips					= of_InchesToTwipsY(vdec_Inches)

Return(PixelsToUnits(ldec_Twips / of_TwipsPerPixelY(), YPixelsToUnits!))
end function

public function decimal of_twipstopixelsx (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToPixelsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to pixels
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts twips to pixels along the X axis of the
//						monitor.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(vdec_Twips / of_TwipsPerPixelX())
end function

public function decimal of_twipstopixelsy (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToPixelsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to pixels
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts twips to pixels along the Y axis of the
//						monitor.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(vdec_Twips / of_TwipsPerPixelY())
end function

public function long of_convertunitsx (double vdbl_units, integer vl_fromunits, integer vl_tounits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_convertUnitsX
//
//	Access:  		public
//
//	Arguments:		Double			Unit value to convert along the x axis
//											of the monitor
//						Integer			Type of units that vdbl_units is stored
//											as
//						Integer			Type of units that vdbl_units is to be
//											converted to
//
//	Returns:  		Long				New unit value in vl_toUnits units
//
//	Description: 	Converts PowerBuilder units from one unit of measure to
//						another.  Goes beyond PixelsToUnits() and UnitsToPixels()
//						by also supporting 1/1000th inches and 1/1000th
//						centimeters units
//
//						If working with inches and centimeters, this routine
//						assumes you are passing in the values as whole numbers
//						but in 1000ths, 1000 = 1 inch and the routine will
//						return the value as a whole number representing 1000ths.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Width = 0

//	First, convert source units to PBUnits
CHOOSE CASE vl_FromUnits
	CASE PBUNITS
		ll_Width				= Truncate(vdbl_Units, 0)
	CASE PIXELS
		ll_Width				= PixelsToUnits(Truncate(vdbl_Units, 0), XPixelsToUnits!)
	CASE INCHES_1000ths
		ll_Width				= of_InchesToPBUnitsX(vdbl_Units / 1000)
	CASE CENTIMETER_1000ths
		ll_Width				= of_InchesToPBUnitsX(invo_measurementConversion.of_distance_centimetersToInches(vdbl_Units / 1000))
END CHOOSE

//	Now convert PBUnits to destination units
CHOOSE CASE vl_ToUnits
	CASE PBUNITS
		ll_Width				= ll_Width
	CASE PIXELS
		ll_Width				= UnitsToPixels(ll_Width, XUnitsToPixels!)
	CASE INCHES_1000ths
		ll_Width				= Truncate(of_PBUnitsToInchesX(ll_Width) * 1000, 0)
	CASE CENTIMETER_1000ths
		ll_Width				= Truncate(invo_measurementConversion.of_distance_inchesToCentimeters(of_PBUnitsToInchesX(ll_Width)) * 1000, 0)
END CHOOSE

Return(ll_Width)
end function

public function long of_convertunitsy (double vdbl_units, integer vl_fromunits, integer vl_tounits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_convertUnitsY
//
//	Access:  		public
//
//	Arguments:		Double			Unit value to convert along the y axis
//											of the monitor
//						Integer			Type of units that vdbl_units is stored
//											as
//						Integer			Type of units that vdbl_units is to be
//											converted to
//
//	Returns:  		Long				New unit value in vl_toUnits units
//
//	Description: 	Converts PowerBuilder units from one unit of measure to
//						another.  Goes beyond PixelsToUnits() and UnitsToPixels()
//						by also supporting 1/1000th inches and 1/1000th
//						centimeters units
//
//						If working with inches and centimeters, this routine
//						assumes you are passing in the values as whole numbers
//						but in 1000ths, 1 inch = 1000 and the routine will
//						return the value as a whole number representing 1000ths.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Height = 0

//	First, convert source units to PBUnits
CHOOSE CASE vl_FromUnits
	CASE PBUNITS
		ll_Height			= Truncate(vdbl_Units, 0)
	CASE PIXELS
		ll_Height			= PixelsToUnits(Truncate(vdbl_Units, 0), YPixelsToUnits!)
	CASE INCHES_1000ths
		ll_Height			= of_InchesToPBUnitsY(vdbl_Units / 1000)
	CASE CENTIMETER_1000ths
		ll_Height			= of_InchesToPBUnitsY(invo_measurementConversion.of_distance_centimetersToInches(vdbl_Units / 1000))
END CHOOSE

//	Now convert PBUnits to destination units
CHOOSE CASE vl_ToUnits
	CASE PBUNITS
		ll_Height			= ll_Height
	CASE PIXELS
		ll_Height			= UnitsToPixels(ll_Height, YUnitsToPixels!)
	CASE INCHES_1000ths
		ll_Height			= Truncate(of_PBUnitsToInchesY(ll_Height) * 1000, 0)
	CASE CENTIMETER_1000ths
		ll_Height			= Truncate(invo_measurementConversion.of_distance_inchesToCentimeters(of_PBUnitsToInchesY(ll_Height)) * 1000, 0)
END CHOOSE

Return(ll_Height)
end function

public function decimal of_inchestopixelsx (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToPixelsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to pixels
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts inches to pixels along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(of_inchesToTwipsX(vdec_Inches) / of_TwipsPerPixelX())
end function

public function decimal of_inchestopixelsy (decimal vdec_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inchesToPixelsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of inches to convert to pixels
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts inches to pixels along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(of_inchesToTwipsY(vdec_Inches) / of_TwipsPerPixelY())
end function

public function decimal of_pixelstoinchesy (decimal vdec_pixels);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pixelsToInchesY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of pixels to convert to inches
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of inches
//
//	Description: 	Converts pixels to inches along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(of_TwipsToInchesY(of_TwipsPerPixelY() * vdec_pixels))
end function

public function decimal of_pixelstoinchesx (decimal vdec_pixels);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pixelsToInchesX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of pixels to convert to inches
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of inches
//
//	Description: 	Converts pixels to inches along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 inch, you actually
//						pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(of_TwipsToInchesX(of_TwipsPerPixelX() * vdec_pixels))
end function

public function decimal of_centimeterstopbunitsx (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToPBUnitsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to PBUnits
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts centimeters to PBUnits along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Decimal						ldec_Twips
ldec_Twips					= of_InchesToTwipsX(ldec_Inches)

Return(PixelsToUnits(ldec_Twips / of_TwipsPerPixelX(), XPixelsToUnits!))
end function

public function decimal of_centimeterstopbunitsy (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToPBUnitsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to PBUnits
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts centimeters to PBUnits along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Decimal						ldec_Twips
ldec_Twips					= of_InchesToTwipsY(ldec_Inches)

Return(PixelsToUnits(ldec_Twips / of_TwipsPerPixelY(), XPixelsToUnits!))
end function

public function decimal of_centimeterstopixelsx (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToPixelsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to pixels
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts centimeters to pixels along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Return(of_inchesToTwipsX(ldec_Inches) / of_TwipsPerPixelX())
end function

public function decimal of_centimeterstopixelsy (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToPixelsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to pixels
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of pixels
//
//	Description: 	Converts centimeters to pixels along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Return(of_inchesToTwipsY(ldec_Inches) / of_TwipsPerPixelY())
end function

public function decimal of_centimeterstotwipsx (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToTwipsX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to twips
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of twips
//
//	Description: 	Converts centimeters to twips along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Return(ldec_Inches * Dec(1440))
end function

public function decimal of_centimeterstotwipsy (decimal vdec_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_centimetersToTwipsY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of centimeters to convert to twips
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of twips
//
//	Description: 	Converts centimeters to twips along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= Round(invo_measurementConversion.of_distance_centimetersToInches(vdec_centimeters), 3)

Return(ldec_Inches * Dec(1440))
end function

public function decimal of_pbunitstocentimetersx (long vl_pbunits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PBUnitsToCentimetersX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of PBUnits to convert to
//											centimeters along the X axis of the
//											monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts PBUnits to centimeters along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually that in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Pixels
ll_Pixels					= UnitsToPixels(vl_PBUnits, XUnitsToPixels!)

Decimal						ldec_inches
ldec_inches					= of_TwipsToInchesX(Dec(of_TwipsPerPixelX() * ll_Pixels))

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

public function decimal of_pbunitstocentimetersy (long vl_pbunits);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_PBUnitsToCentimetersY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of PBUnits to convert to
//											centimeters along the Y axis of the
//											monitor
//
//	Returns:  		Decimal			Number of PBUnits
//
//	Description: 	Converts PBUnits to centimeters along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually that in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Long							ll_Pixels
ll_Pixels					= UnitsToPixels(vl_PBUnits, YUnitsToPixels!)

Decimal						ldec_inches
ldec_inches					= of_TwipsToInchesY(Dec(of_TwipsPerPixelY() * ll_Pixels))

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

public function decimal of_pixelstocentimetersx (decimal vdec_pixels);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pixelsToCentimetersX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of pixels to convert to
//											centimeters along the X axis of the
//											monitor
//
//	Returns:  		Decimal			Number of centimeters
//
//	Description: 	Converts pixels to centimeters along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= of_TwipsToInchesX(of_TwipsPerPixelX() * vdec_pixels)

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

public function decimal of_pixelstocentimetersy (decimal vdec_pixels);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pixelsToCentimetersY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of pixels to convert to
//											centimeters along the Y axis of the
//											monitor
//
//	Returns:  		Decimal			Number of centimeters
//
//	Description: 	Converts pixels to centimeters along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= of_TwipsToInchesY(of_TwipsPerPixelY() * vdec_pixels)

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

public function decimal of_twipstocentimetersx (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToCentimetersX
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to centimeters
//											along the X axis of the monitor
//
//	Returns:  		Decimal			Number of centimeters
//
//	Description: 	Converts twips to centimeters along the X axis of the
//						monitor.  This routine differs from convertUnitsX() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= vdec_Twips / Dec(1440)

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

public function decimal of_twipstocentimetersy (decimal vdec_twips);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_twipsToCentimetersY
//
//	Access:  		public
//
//	Arguments:		Decimal			Number of twips to convert to centimeters
//											along the Y axis of the monitor
//
//	Returns:  		Decimal			Number of centimeters
//
//	Description: 	Converts twips to centimeters along the Y axis of the
//						monitor.  This routine differs from convertUnitsY() in
//						that, instead of passing 1000 for 1 centimeter, you
//						actually pass in 1.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Decimal						ldec_inches
ldec_inches					= vdec_Twips / Dec(1440)

Return(Round(invo_measurementConversion.of_distance_inchesToCentimeters(ldec_inches), 3))
end function

on pfc_n_cst_pbunitconversion.create
call super::create
end on

on pfc_n_cst_pbunitconversion.destroy
call super::destroy
end on

event destructor;call super::destructor;f_setPlatform(invo_platform, FALSE)
end event

