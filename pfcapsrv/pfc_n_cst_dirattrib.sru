HA$PBExportHeader$pfc_n_cst_dirattrib.sru
$PBExportComments$PFC DIR attributes (used by the File services)
forward
global type pfc_n_cst_dirattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dirattrib from n_cst_baseattrib autoinstantiate
end type

type variables
// FileName is long file name where supported
String	is_FileName

// Last write Date and Time
Date	id_LastWriteDate
Time	it_LastWriteTime

// File size
Double	idb_FileSize

// Attributes
Boolean	ib_ReadOnly
Boolean	ib_Hidden
Boolean	ib_System
Boolean	ib_Subdirectory
Boolean	ib_Archive
Boolean	ib_Drive

// The following attributes are used ONLY by the Win32 version
// of the File Services
// AltFileName is the 8.3 name where long file names are supported
String	is_AltFileName

// Creation Date and Time
Date	id_CreationDate
Time	it_CreationTime

// Last access Date
Date	id_LastAccessDate

end variables

on pfc_n_cst_dirattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dirattrib.destroy
TriggerEvent( this, "destructor" )
end on

