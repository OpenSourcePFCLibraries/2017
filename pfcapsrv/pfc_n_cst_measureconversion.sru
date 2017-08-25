HA$PBExportHeader$pfc_n_cst_measureconversion.sru
$PBExportComments$PFC Convert units of measurements
forward
global type pfc_n_cst_measureconversion from n_base
end type
end forward

global type pfc_n_cst_measureconversion from n_base
end type
global pfc_n_cst_measureconversion pfc_n_cst_measureconversion

type variables

end variables

forward prototypes
public function double of_distance_millimeterstocentimeters (double vdbl_millimeters)
public function double of_distance_centimeterstometers (double vdbl_centimeters)
public function double of_distance_centimeterstoinches (double vdbl_centimeters)
public function double of_distance_inchestocentimeters (double vdbl_inches)
public function double of_distance_millimeterstoinches (double vdbl_millimeters)
public function double of_temperature_celsiustofahrenheit (double vdbl_celsius)
public function double of_temperature_celsiustokelvin (double vdbl_celsius)
public function double of_temperature_fahrenheittocelsius (double vdbl_fahrenheit)
public function double of_temperature_fahrenheittokelvin (double vdbl_fahrenheit)
public function double of_temperature_kelvintocelsius (double vdbl_kelvin)
public function double of_temperature_kelvintofahrenheit (double vdbl_kelvin)
public function double of_weight_gramstokilograms (double vdbl_grams)
public function double of_weight_gramstopounds (double vdbl_grams)
public function double of_weight_kilogramstopounds (double vdbl_kilograms)
public function double of_weight_poundstokilograms (double vdbl_pounds)
public function double of_pressure_mmhgtotorr (double vdbl_millimetersofmercury)
public function double of_pressure_kpatommhg (double vdbl_kilopascals)
public function double of_pressure_kpatotorr (double vdbl_kilopascals)
public function double of_pressure_mmhgtokpa (double vdbl_millimetersofmercury)
public function double of_pressure_torrtommhg (double vdbl_torr)
public function double of_pressure_torrtokpa (double vdbl_torr)
public function double of_pressure_psitoatm (double vdbl_poundspersquareinch)
public function double of_pressure_torrtoatm (double vdbl_torr)
public function double of_pressure_mmhgtoatm (double vdbl_millimetersofmercury)
public function double of_pressure_kpatoatm (double vdbl_kilopascals)
public function double of_pressure_inhgtoatm (double vdbl_inchesofmercury)
public function double of_pressure_atmtotorr (double vdbl_atmosphere)
public function double of_pressure_atmtommhg (double vdbl_atmosphere)
public function double of_pressure_atmtopsi (double vdbl_atmosphere)
public function double of_pressure_atmtoinhg (double vdbl_atmosphere)
public function double of_pressure_atmtokpa (double vdbl_atmosphere)
public function double of_distance_kilometerstofeet (double vdbl_kilometers)
public function double of_distance_feettokilometers (double vdbl_feet)
public function double of_distance_kilometerstomiles (double vdbl_kilometers)
public function double of_distance_milestokilometers (double vdbl_miles)
public function double of_force_newtonstoponds (double vdbl_newtons)
public function double of_force_newtonstopounds (double vdbl_newtons)
public function double of_force_pondstonewtons (double vdbl_ponds)
public function double of_force_poundstonewtons (double vdbl_poundforce)
public function double of_distance_feettomiles (double vdbl_feet)
public function double of_distance_milestofeet (double vdbl_miles)
public function double of_force_pondstopounds (double vdbl_ponds)
public function double of_force_poundstoponds (double vdbl_poundforce)
end prototypes

public function double of_distance_millimeterstocentimeters (double vdbl_millimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_millimetersToCentimeters
//
//	Access:  		public
//
//	Arguments:		Double			Number of millimeters to convert
//
//	Returns:  		Double			Number of centimeters
//
//	Description: 	Returns the number of millimeters converted to
//						centimeters
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

Return(vdbl_Millimeters / 10.0)
end function

public function double of_distance_centimeterstometers (double vdbl_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_centimetersToMeters
//
//	Access:  		public
//
//	Arguments:		Double			Number of centimeters to convert
//
//	Returns:  		Double			Number of meters
//
//	Description: 	Returns the number of centimeters converted to meters 
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

Return(vdbl_Centimeters / 100.0)
end function

public function double of_distance_centimeterstoinches (double vdbl_centimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_centimetersToInches
//
//	Access:  		public
//
//	Arguments:		Double			Number of centimeters to convert
//
//	Returns:  		Double			Number of inches
//
//	Description: 	Returns the number of centimeters converted to inches 
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

Return(vdbl_Centimeters * .393700787)
end function

public function double of_distance_inchestocentimeters (double vdbl_inches);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_inchesToCentimeters
//
//	Access:  		public
//
//	Arguments:		Double			Number of inches to convert
//
//	Returns:  		Double			Number of centimeters
//
//	Description: 	Returns the number of inches converted to centimeters
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

Return(vdbl_Inches * 2.54)
end function

public function double of_distance_millimeterstoinches (double vdbl_millimeters);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_millimetersToInches
//
//	Access:  		public
//
//	Arguments:		Double			Number of millimeters to convert
//
//	Returns:  		Double			Number of inches
//
//	Description: 	Returns the number of millimeters converted to inches 
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

Return(of_distance_centimetersToInches(of_distance_millimetersToCentimeters(vdbl_Millimeters)))
end function

public function double of_temperature_celsiustofahrenheit (double vdbl_celsius);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_celsiusToFahrenheit
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Celsius to
//											convert
//
//	Returns:  		Double			Number of degrees in Fahrenheit
//
//	Description: 	Returns the number of degrees in Celsius converted to
//						degrees in Fahrenheit.
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

Return(((9.0 / 5.0) * vdbl_Celsius) + 32.0)
end function

public function double of_temperature_celsiustokelvin (double vdbl_celsius);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_celsiusToKelvin
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Celsius to
//											convert
//
//	Returns:  		Double			Number of degrees in Kelvin
//
//	Description: 	Returns the number of degrees in Celsius converted to
//						degrees in Kelvin.
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

Return(vdbl_Celsius + 273.15)
end function

public function double of_temperature_fahrenheittocelsius (double vdbl_fahrenheit);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_fahrenheitToCelsius
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Fahrenheit to
//											convert
//
//	Returns:  		Double			Number of degrees in Celsius
//
//	Description: 	Returns the number of degrees in Fahrenheit converted to
//						degrees in Celsius.
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

Return((5.0 / 9.0) * (vdbl_Fahrenheit - 32.0))
end function

public function double of_temperature_fahrenheittokelvin (double vdbl_fahrenheit);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_fahrenheitToKelvin
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Fahrenheit to
//											convert
//
//	Returns:  		Double			Number of degrees in Kelvin
//
//	Description: 	Returns the number of degrees in Fahrenheit converted to
//						degrees in Kelvin.
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

Return(of_temperature_celsiusToKelvin(of_temperature_fahrenheitToCelsius(vdbl_Fahrenheit)))
end function

public function double of_temperature_kelvintocelsius (double vdbl_kelvin);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_kelvinToCelcius
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Kelvin to
//											convert
//
//	Returns:  		Double			Number of degrees in Celcius
//
//	Description: 	Returns the number of degrees in Kelvin converted to
//						degrees in Celcius.
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

Return(vdbl_Kelvin - 273.15)
end function

public function double of_temperature_kelvintofahrenheit (double vdbl_kelvin);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_temperature_kelvinToFahrenheit
//
//	Access:  		public
//
//	Arguments:		Double			Number of degrees in Kelvin to
//											convert
//
//	Returns:  		Double			Number of degrees in Fahrenheit
//
//	Description: 	Returns the number of degrees in Kelvin converted to
//						degrees in Fahrenheit.
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

Return(of_temperature_celsiusToFahrenheit(of_temperature_kelvinToCelsius(vdbl_Kelvin)))
end function

public function double of_weight_gramstokilograms (double vdbl_grams);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_weight_gramsToKiloGrams
//
//	Access:  		public
//
//	Arguments:		Double			Number of grams to convert
//
//	Returns:  		Double			Number of kiloGrams
//
//	Description: 	Returns the number of grams converted to kiloGrams.
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

Return(vdbl_Grams * 0.001)
end function

public function double of_weight_gramstopounds (double vdbl_grams);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_weight_gramsToPounds
//
//	Access:  		public
//
//	Arguments:		Double			Number of grams to convert
//
//	Returns:  		Double			Number of pounds
//
//	Description: 	Returns the number of grams converted to pounds.
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

Return(of_weight_kiloGramsToPounds(of_weight_gramsToKiloGrams(vdbl_Grams)))
end function

public function double of_weight_kilogramstopounds (double vdbl_kilograms);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_weight_kiloGramsToPounds
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloGrams to convert
//
//	Returns:  		Double			Number of pounds
//
//	Description: 	Returns the number of kiloGrams converted to pounds.
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

Return(vdbl_KiloGrams * 2.20462262)
end function

public function double of_weight_poundstokilograms (double vdbl_pounds);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_weight_poundsToKiloGrams
//
//	Access:  		public
//
//	Arguments:		Double			Number of pounds to convert
//
//	Returns:  		Double			Number of kiloGrams
//
//	Description: 	Returns the number of pounds converted to kiloGrams.
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

Return(vdbl_Pounds * 0.45359237)
end function

public function double of_pressure_mmhgtotorr (double vdbl_millimetersofmercury);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_mmHgToTorr
//
//	Access:  		public
//
//	Arguments:		Double			Number of millimeters of mercury to
//											convert
//
//	Returns:  		Double			Number of Torrs
//
//	Description: 	Returns the number of millimeters of mercury converted
//						to Torrs.
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

Return(of_pressure_atmToTorr(of_pressure_mmHgToAtm(vdbl_millimetersOfMercury)))			//	Return(vdbl_millimetersOfMercury / 0.999999849988)
end function

public function double of_pressure_kpatommhg (double vdbl_kilopascals);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_kPaTommHG
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloPascals to convert
//
//	Returns:  		Double			Number of millimeters of mercury
//
//	Description: 	Returns the number of kiloPascals converted to
//						millimeters of mercury.
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

Return(of_pressure_atmTommHg(of_pressure_kPaToAtm(vdbl_kiloPascals)))	//	Return(vdbl_kiloPascals / 0.133322368)
end function

public function double of_pressure_kpatotorr (double vdbl_kilopascals);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_kPaToTorr
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloPascals to convert
//
//	Returns:  		Double			Number of Torrs
//
//	Description: 	Returns the number of kiloPascals converted to Torrs.
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

Return(of_pressure_atmToTorr(of_pressure_kPaToAtm(vdbl_kiloPascals)))	//	Return(of_pressure_mmHgToTorr(of_pressure_kPaTommHg(vdbl_kiloPascals)))
end function

public function double of_pressure_mmhgtokpa (double vdbl_millimetersofmercury);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_mmHgTokPa
//
//	Access:  		public
//
//	Arguments:		Double			Number of millimeters of mercury to
//											convert
//
//	Returns:  		Double			Number of kiloPascals
//
//	Description: 	Returns the number of millimeters of mercury converted
//						to kiloPascals.
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

Return(of_pressure_atmTokPa(of_pressure_mmHgToAtm(vdbl_millimetersOfMercury)))			//	Return(vdbl_millimetersOfMercury / 7.50061683)
end function

public function double of_pressure_torrtommhg (double vdbl_torr);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_torrTommHg
//
//	Access:  		public
//
//	Arguments:		Double			Number of Torrs to convert
//
//	Returns:  		Double			Number of millimeters of Mercury
//
//	Description: 	Returns the number of Torrs converted to millimeters of
//						Mercury.
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

Return(of_pressure_atmTommHg(of_pressure_torrToAtm(vdbl_torr)))			//	Return(vdbl_torr * 1.00000015001)
end function

public function double of_pressure_torrtokpa (double vdbl_torr);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_torrTokPa
//
//	Access:  		public
//
//	Arguments:		Double			Number of Torrs to convert
//
//	Returns:  		Double			Number of kiloPascals
//
//	Description: 	Returns the number of Torrs converted to kiloPascals.
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

Return(of_pressure_atmTokPa(of_pressure_torrToAtm(vdbl_torr)))
end function

public function double of_pressure_psitoatm (double vdbl_poundspersquareinch);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_PSIToAtm
//
//	Access:  		public
//
//	Arguments:		Double			Number of pounds per square inch to
//											convert
//
//	Returns:  		Double			Number of atmospheres
//
//	Description: 	Returns the number of pounds per square inch converted
//						to atmospheres.
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

Return(vdbl_poundsPerSquareInch * 0.0680459570643)
end function

public function double of_pressure_torrtoatm (double vdbl_torr);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_torrToAtm
//
//	Access:  		public
//
//	Arguments:		Double			Number of Torrs to convert
//
//	Returns:  		Double			Number of atmospheres
//
//	Description: 	Returns the number of Torrs converted to atmospheres.
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

Return(vdbl_torr * 0.00131578935941)
end function

public function double of_pressure_mmhgtoatm (double vdbl_millimetersofmercury);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_mmHgToAtm
//
//	Access:  		public
//
//	Arguments:		Double			Number of millimeters of Mercury to
//											convert
//
//	Returns:  		Double			Number of atmospheres
//
//	Description: 	Returns the number of millimeters of Mercury converted
//						to atmospheres.
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

Return(vdbl_millimetersOfMercury * 0.00131578955679)
end function

public function double of_pressure_kpatoatm (double vdbl_kilopascals);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_kPaToAtm
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloPascals to convert
//
//	Returns:  		Double			Number of atmospheres
//
//	Description: 	Returns the number of kiloPascals converted to
//						atmospheres.
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

Return(vdbl_kiloPascals * 0.00986923169314)
end function

public function double of_pressure_inhgtoatm (double vdbl_inchesofmercury);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_inHgToAtm
//
//	Access:  		public
//
//	Arguments:		Double			Number of inches of Mercury to convert
//
//	Returns:  		Double			Number of atmospheres
//
//	Description: 	Returns the number of inches of Mercury converted to
//						atmospheres.
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

Return(vdbl_inchesOfMercury * 0.0334210543544)
end function

public function double of_pressure_atmtotorr (double vdbl_atmosphere);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_atmToTorr
//
//	Access:  		public
//
//	Arguments:		Double			Number of atmospheres to convert
//
//	Returns:  		Double			Number of Torr
//
//	Description: 	Returns the number of atmospheres converted to Torr.
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

Return(vdbl_atmosphere * 760.000066005)
end function

public function double of_pressure_atmtommhg (double vdbl_atmosphere);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_atmTommHg
//
//	Access:  		public
//
//	Arguments:		Double			Number of atmospheres to convert
//
//	Returns:  		Double			Number of millimeters of mercury
//
//	Description: 	Returns the number of atmospheres converted to
//						millimeters of mercury.
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

Return(vdbl_atmosphere * 759.9999519980989)
end function

public function double of_pressure_atmtopsi (double vdbl_atmosphere);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_atmToPSI
//
//	Access:  		public
//
//	Arguments:		Double			Number of atmospheres to convert
//
//	Returns:  		Double			Number of pounds per square inch
//
//	Description: 	Returns the number of atmospheres converted to pounds
//						per square inch.
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

Return(vdbl_atmosphere * 14.695950254)
end function

public function double of_pressure_atmtoinhg (double vdbl_atmosphere);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_atmToinHg
//
//	Access:  		public
//
//	Arguments:		Double			Number of atmospheres to convert
//
//	Returns:  		Double			Number of inches of mercury
//
//	Description: 	Returns the number of atmospheres converted to inches
//						of mercury.
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

Return(vdbl_atmosphere * 29.9212583001)
end function

public function double of_pressure_atmtokpa (double vdbl_atmosphere);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pressure_atmTokPa
//
//	Access:  		public
//
//	Arguments:		Double			Number of atmospheres to convert
//
//	Returns:  		Double			Number of kiloPascals
//
//	Description: 	Returns the number of atmospheres converted to
//						kiloPascals.
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

Return(vdbl_atmosphere * 101.32501)
end function

public function double of_distance_kilometerstofeet (double vdbl_kilometers);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_kiloMetersToFeet
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloMeters to convert
//
//	Returns:  		Double			Number of feet
//
//	Description: 	Returns the number of kiloMeters converted to feet 
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

Return(vdbl_kiloMeters * 3280.83989501)
end function

public function double of_distance_feettokilometers (double vdbl_feet);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_feetToKiloMeters
//
//	Access:  		public
//
//	Arguments:		Double			Number of feet to convert
//
//	Returns:  		Double			Number of kiloMeters
//
//	Description: 	Returns the number of feet converted to kiloMeters 
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

Return(vdbl_feet * 0.0003048)
end function

public function double of_distance_kilometerstomiles (double vdbl_kilometers);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_kiloMetersToMiles
//
//	Access:  		public
//
//	Arguments:		Double			Number of kiloMeters to convert
//
//	Returns:  		Double			Number of miles
//
//	Description: 	Returns the number of kiloMeters converted to miles 
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

Return(vdbl_kiloMeters * 0.621371192237)
end function

public function double of_distance_milestokilometers (double vdbl_miles);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_milesToKiloMeters
//
//	Access:  		public
//
//	Arguments:		Double			Number of miles to convert
//
//	Returns:  		Double			Number of kiloMeters
//
//	Description: 	Returns the number of miles converted to kiloMeters 
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

Return(vdbl_miles * 1.609344)
end function

public function double of_force_newtonstoponds (double vdbl_newtons);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_NewtonsToPonds
//
//	Access:  		public
//
//	Arguments:		Double			Number of Newtons to convert
//
//	Returns:  		Double			Number of ponds
//
//	Description: 	Returns the number of Newtons converted to ponds. 
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

Return(vdbl_newtons * 101.971621298)
end function

public function double of_force_newtonstopounds (double vdbl_newtons);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_NewtonsToPounds
//
//	Access:  		public
//
//	Arguments:		Double			Number of Newtons to convert
//
//	Returns:  		Double			Number of pound-force units
//
//	Description: 	Returns the number of Newtons converted to
//						pound-force units. 
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

Return(vdbl_newtons * 0.224808943871)
end function

public function double of_force_pondstonewtons (double vdbl_ponds);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_pondsToNewtons
//
//	Access:  		public
//
//	Arguments:		Double			Number of ponds to convert
//
//	Returns:  		Double			Number of newtons
//
//	Description: 	Returns the number of ponds units converted to Newtons. 
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

Return(vdbl_ponds * 0.00980665)
end function

public function double of_force_poundstonewtons (double vdbl_poundforce);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_poundsToNewtons
//
//	Access:  		public
//
//	Arguments:		Double			Number of pound-force units to convert
//
//	Returns:  		Double			Number of newtons
//
//	Description: 	Returns the number of pound-force units converted to
//						Newtons. 
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

Return(vdbl_poundForce * 4.4482216)
end function

public function double of_distance_feettomiles (double vdbl_feet);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_feetToMiles
//
//	Access:  		public
//
//	Arguments:		Double			Number of feet to convert
//
//	Returns:  		Double			Number of miles
//
//	Description: 	Returns the number of feet converted to miles
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

Return(of_distance_kiloMetersToMiles(of_distance_feetToKiloMeters(vdbl_feet)))
end function

public function double of_distance_milestofeet (double vdbl_miles);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_distance_milesToFeet
//
//	Access:  		public
//
//	Arguments:		Double			Number of miles to convert
//
//	Returns:  		Double			Number of feet
//
//	Description: 	Returns the number of miles converted to feet 
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

Return(of_distance_kiloMetersToFeet(of_distance_milesToKiloMeters(vdbl_miles)))
end function

public function double of_force_pondstopounds (double vdbl_ponds);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_pondsToPounds
//
//	Access:  		public
//
//	Arguments:		Double			Number of ponds to convert
//
//	Returns:  		Double			Number of pounds
//
//	Description: 	Returns the number of ponds units converted to pound
//						force units. 
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

Return(of_force_newtonsToPounds(of_force_pondsToNewtons(vdbl_ponds)))
end function

public function double of_force_poundstoponds (double vdbl_poundforce);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_force_poundsToPonds
//
//	Access:  		public
//
//	Arguments:		Double			Number of pound-force units to convert
//
//	Returns:  		Double			Number of ponds
//
//	Description: 	Returns the number of pound-force units converted to
//						ponds. 
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

Return(of_force_newtonsToPonds(of_force_poundsToNewtons(vdbl_poundForce)))
end function

on pfc_n_cst_measureconversion.create
call super::create
end on

on pfc_n_cst_measureconversion.destroy
call super::destroy
end on

