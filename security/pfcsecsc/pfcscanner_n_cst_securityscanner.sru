HA$PBExportHeader$pfcscanner_n_cst_securityscanner.sru
$PBExportComments$PFC Security Scanner service
forward
global type pfcscanner_n_cst_securityscanner from nonvisualobject
end type
end forward

global type pfcscanner_n_cst_securityscanner from nonvisualobject
end type
global pfcscanner_n_cst_securityscanner pfcscanner_n_cst_securityscanner

type variables
pfcscanner_n_ds 				ids_info
pfcscanner_n_ds 				ids_apps
pfcscanner_n_ds 				ids_updates
pfcscanner_n_cst_string 	inv_string
string								is_liblist[]
string 							is_app
string 							is_keyword = 'microhelp'
string 							is_separator = ';'
boolean 							ib_initscanning = false
transaction						itr_trans
end variables

forward prototypes
public function integer of_scandatawindow (string as_dataobjectname, string as_library)
public function integer of_initscanprocess (transaction a_trans, string as_app, string as_lib_list[])
protected function string of_getdesc (classdefinition a_class)
protected function string of_getmenudesc (classdefinition a_class)
protected function integer of_getscankeys (classdefinition a_control, ref string as_name, ref string as_desc, ref string as_type)
protected function string of_gettag (string as_tag)
protected function integer of_initialvalue (classdefinition a_class, string as_property, ref any aa_value)
protected function integer of_scandataobject (string as_dataobject, string as_dwname, string as_object)
protected function integer of_setsyntax (string as_dataobject, datastore ads_datastore)
public function integer of_update ()
protected function integer of_addobject (string as_app, string as_winname, string as_object, string as_objecttype, string as_desc)
protected function integer of_explodeobject (string as_object, classdefinition a_class, string as_name)
public function integer of_scanobject (string as_object, string as_library)
end prototypes

public function integer of_scandatawindow (string as_dataobjectname, string as_library);//////////////////////////////////////////////////////////////////////////////
//	Function: 		of_ScanDatawindow
//	Description:  	Scans the datawindow object and captures the information about each column
//						called from the scan window for an individual dw selection
//////////////////////////////////////////////////////////////////////////////
// get known columns
If ids_updates.Retrieve ( is_app, as_dataobjectname )   < 0 Then Return -2

Return of_ScanDataObject ( as_dataobjectname, as_dataobjectname, "" ) 
end function

public function integer of_initscanprocess (transaction a_trans, string as_app, string as_lib_list[]);//////////////////////////////////////////////////////////////////////////////
//	Function:  		of_InitScanProcess
//	Description:  	Initialize the database connection, application and library 
//               		search path. Used when scanning applications
//////////////////////////////////////////////////////////////////////////////
SetPointer ( HourGlass! )

If a_trans.dbHandle ( ) = 0 Then Return -1

ids_updates.DataObject = "d_pfcsecurity_templateupdate"
ids_apps.DataObject = "d_pfcsecurity_applookup"

ids_updates.SetTransObject ( a_trans ) 
ids_apps.SetTransObject ( a_trans ) 

is_app = Lower ( as_app ) 
is_liblist = as_lib_list
If ids_apps.Retrieve ( is_app )  = 0 Then // if the application does not exist in the database, add it
	ids_apps.ImportString ( is_app + "~t" + is_app ) 
End If

ib_initscanning = True
itr_trans = a_trans

Return 1
end function

protected function string of_getdesc (classdefinition a_class);//////////////////////////////////////////////////////////////////////////////
//	Function:	of_GetDesc
//	Description:  Return additional information about an object. 
//				     Look for attributes in the following order
//				     1. Text, if there is no text attribute or it is empty then look for
//				     2. Tag
//////////////////////////////////////////////////////////////////////////////
any		la_initialvalue
integer	li_rc
string		ls_desc

SetPointer ( HourGlass! )
// get the value of the text property
li_rc = of_InitialValue ( a_class, "text", la_initialvalue )
If li_rc > 0 Then
	ls_desc = String ( la_initialvalue ) 
Else
	// get the value of the tag property
	li_rc = of_InitialValue ( a_class, "tag", la_initialvalue )
	If li_rc > 0 Then
		ls_desc = String ( la_initialvalue ) 
		// parse the tag value
		If ls_desc <> "" Then ls_desc = of_GetTag ( ls_desc ) 
	Else
		ls_desc = ""
	End If	
End If

Return ls_desc
end function

protected function string of_getmenudesc (classdefinition a_class);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_GetMenuDesc
//	Description:  		Return additional information about an object. 
//				     		Look for attributes in the following order
//				     		1. Text, if there is no text attribute or it is empty then look for
//				     		2. Tag
//////////////////////////////////////////////////////////////////////////////
long ll_idx, ll_cnt, ll_pos
string ls_desc, ls_piece1, ls_piece2, ls_value
string	ls_script[]

SetPointer ( HourGlass! )
// get the variables from the class definition
// for a menu, the attributes are set in the create script
ll_cnt = UpperBound ( a_class.ScriptList ) 
For ll_idx = 1 To ll_cnt
	If a_class.ScriptList[ll_idx].Name = "create" Then
		// found - so return success
		ls_value = a_class.ScriptList[ll_idx].Source
		Exit
	End If
Next

// check to see if we have anything to parse
If ls_value = "" Then Return ""
inv_string.of_ParseToArray ( ls_value, "~r~n", ls_script ) 
ll_cnt = UpperBound ( ls_script ) 
For ll_idx = 1 to ll_cnt
	If Pos ( Lower ( ls_script[ll_idx] ) , "this.text" )  > 0 Then
		ls_desc = inv_string.of_GetKeyValue ( ls_script[ll_idx], "this.text", "=" ) 
		Exit
	End If
Next

If ls_desc <> "" Then
	ls_desc = inv_string.of_GlobalReplace ( ls_desc, "~"", "" ) 
	ls_desc = inv_string.of_RemoveNonPrint ( ls_desc ) 
	ll_pos = Pos ( ls_desc, "&&" ) 
	If ll_pos > 0 Then
		ls_piece1 = Mid ( ls_desc, 1, ll_pos - 1 ) 
		ls_piece2 = Mid ( ls_desc, ll_pos ) 
		ls_piece1 = inv_string.of_GlobalReplace ( ls_piece1, "&", "" ) 
		ls_piece2 = inv_string.of_GlobalReplace ( ls_piece2, "&", "" ) 
		ls_desc = ls_piece1 + "&" + ls_piece2
	Else
		ls_desc = inv_string.of_GlobalReplace ( ls_desc, "&", "" ) 
	End If
	ll_pos = Pos ( ls_desc, "~~t" ) 
	If ll_pos > 0 Then
		ls_piece1 = Mid ( ls_desc, 1, ll_pos - 1 ) 
		ls_piece2 = Mid ( ls_desc, ll_pos + 2 ) 
		ls_desc = ls_piece1 + ls_piece2
	End If
End If

Return ls_desc
end function

protected function integer of_getscankeys (classdefinition a_control, ref string as_name, ref string as_desc, ref string as_type);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_getscankeys
//////////////////////////////////////////////////////////////////////////////
If Not IsValid ( a_control )  or IsNull ( a_control ) Then Return -1

SetPointer ( HourGlass! )

as_name = a_control.Name
as_name = Mid ( as_name, Pos ( as_name, "`" )  + 1 ) 
as_desc = of_GetDesc ( a_control ) 
as_type = a_control.DataTypeOf

// change for backwards compatibility
If as_type = "menu" Then 
	as_type = "menuitem"
	as_desc = of_GetMenuDesc ( a_control ) 
End If

Return 1
end function

protected function string of_gettag (string as_tag);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_GetTag
//	Description: 		Parses the passed string. If the string is empty it returns an empty string
//							if the string contains a keyword that matches what is in ics_keyword 
//							(default is 'microhelp', default separator is ';') then the value for the keyword is returned
//							if none of the aboove is true then the original string is returned
//////////////////////////////////////////////////////////////////////////////
string ls_value

SetPointer ( HourGlass! )

// check arguments
If as_tag = "" Then Return ""

ls_value = inv_string.of_GetKeyValue ( as_tag, is_keyword, is_separator ) 
If ls_value = "" Then ls_value = as_tag

Return ls_value
end function

protected function integer of_initialvalue (classdefinition a_class, string as_property, ref any aa_value);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_InitialValue
//	Description:		Scan a class definitions variablelist looking for a property,
//						If found Then return the property's value
//////////////////////////////////////////////////////////////////////////////
long		ll_idx, ll_cnt

SetPointer ( HourGlass! )

as_property = Trim ( Lower ( as_property ) )

// get the variables from the class definition
ll_cnt = UpperBound ( a_class.VariableList ) 
For ll_idx = 1 To ll_cnt
	If as_property = a_class.VariableList[ll_idx].Name Then
		// found - so return success
		aa_value = a_class.VariableList[ll_idx].InitialValue
		Return 1 
	End If
Next

// variable not found so return error
Return -1
end function

protected function integer of_scandataobject (string as_dataobject, string as_dwname, string as_object);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_ScanDataObject
//	Description:  		Scans the datawindow object and captures the information about each column
//////////////////////////////////////////////////////////////////////////////
string ls_dwname, ls_query, ls_token, ls_ans, ls_name
int li_colcnt=0, li_posi

SetPointer ( HourGlass! )

ls_dwname = as_object 
If Len ( as_object )  > 0 Then ls_dwname += "."

If of_SetSyntax ( as_dwname, ids_info )  < 0 Then Return -1

ls_query = ids_info.Describe ( "Datawindow.Objects" ) 
ls_query = Lower ( ls_query ) 

// strip apart the tab seperated string
Do While Len ( ls_query )  > 0  
	li_posi = Pos ( ls_query, "~t" ) 
	If li_posi = 0 Then 
		// no more tabs so take what's left of the string
		li_posi = Len ( ls_query ) 
	Else
		li_posi = li_posi - 1
	End If
	
	ls_token = Left ( ls_query, li_posi )  // grab off the token
	ls_query = Mid ( ls_query, li_posi + 2 )  // skip past the tab 
	If Len ( ls_token )  > 0 Then 
		ls_ans = ids_info.Describe ( ls_token + ".Type " ) 
		ls_ans = Lower ( ls_ans ) 
		If Pos ( ls_ans, "column" )  > 0 Then // is it a column?
			ls_name = ls_dwname + ls_token
			If Not IsNull ( ls_name )  And Len ( Trim ( ls_name ) )  > 0 Then 
				// get the descriptive info
				ls_ans =ids_info.Describe ( ls_token + ".dbName " )  + " : " + &
					ids_info.Describe ( ls_token + ".ColType" )  
					of_addobject ( is_app, as_dataobject, ls_name, "Column", ls_ans )   
				li_colcnt++
			End If
		End If
	End If
Loop

Return li_colcnt
end function

protected function integer of_setsyntax (string as_dataobject, datastore ads_datastore);//////////////////////////////////////////////////////////////////////////////
//	Function:  		of_setsyntax
//	Description:  	Create the syntax in as_dataobject and place it in ads_datastore.
//						Scan the list of libraries until the dataobject is found
//////////////////////////////////////////////////////////////////////////////
string ls_syntax, ls_errors
integer li_cnt, li_idx

SetPointer ( HourGlass! )

If IsNull ( as_dataobject ) Then Return -1
If Len ( trim ( as_dataobject ) ) = 0 Then Return -1

If IsNull ( ads_datastore )  Then Return -1
If Not IsValid ( ads_datastore )  Then Return -1

li_cnt = UpperBound ( is_liblist ) 
li_idx = 1
Do While li_idx <= li_cnt
	ls_syntax = LibraryExport ( is_liblist[li_idx], as_dataobject, ExportDataWindow! )
	li_idx++
	If Len ( ls_syntax )  > 0 Then Exit
Loop
If Len ( ls_syntax )  = 0 Then Return -1

ads_datastore.Create ( ls_syntax, ls_errors ) 
If Len ( ls_errors )  > 0 Then Return -1

Return 1
end function

public function integer of_update ();//////////////////////////////////////////////////////////////////////////////
//	Function:	of_update
//	Description:  Save the changes. Delete rows that belong to controls that no longer exist
//////////////////////////////////////////////////////////////////////////////
integer 	li_rc
long 		ll_rowcnt, ll_modcount

SetPointer ( HourGlass! )

li_rc = ids_apps.Update ( True, False ) 
If li_rc >= 0 Then 
	li_rc = ids_updates.Update ( True, False ) 
End If

If li_rc < 1 Then
	RollBack Using itr_trans;
	If itr_trans.sqlcode <> 0 Then Return -2
	Return -1
Else
	Commit Using itr_trans;
	If itr_trans.SQLCode <> 0 Then Return -2
	ids_apps.ResetUpdate ( )
	ids_updates.ResetUpdate ( )
	Return 1
End If
end function

protected function integer of_addobject (string as_app, string as_winname, string as_object, string as_objecttype, string as_desc);//////////////////////////////////////////////////////////////////////////////
//	Function:	of_addobject
//////////////////////////////////////////////////////////////////////////////
integer li_rc
long ll_row
string ls_importstring

SetPointer ( HourGlass! )

// remove potential CRLF pairs
as_desc = inv_string.of_RemoveNonPrint ( as_desc )  

ll_row = ids_updates.Find ( "application='" + as_app + "' and window = '" + as_winname + "' and control = '" + &
								   as_object + "'", 1, ids_updates.RowCount ( ) ) 
									
If ll_row > 0 Then 
	ids_updates.object.object_type.Current[ll_row] = as_objecttype
	ids_updates.object.description.Current[ll_row] = as_desc
Else
	ls_importstring = as_app + "~t" + as_winname + "~t" + as_object + "~t" + as_objecttype + "~t" + as_desc
	li_rc = ids_updates.ImportString ( ls_importstring )  
	If li_rc < 0 Then
		MessageBox ( "Security Scanner","Error on importstring. Error code = " + String ( li_rc ) + ". Attempted to import the following string ~r~n" + ls_importstring ) 
	End If
End If

Return li_rc
end function

protected function integer of_explodeobject (string as_object, classdefinition a_class, string as_name);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_ExplodeObject
//	Description:  	Recursively scan an object.
//////////////////////////////////////////////////////////////////////////////
any la_initial
integer li_rc
long ll_cnt, ll_idx, ll_n, ll_nested
string ls_name, ls_desc, ls_objecttype, ls_dataobject
classdefinition l_control, l_ancestor, l_nested

SetPointer ( HourGlass! )

// see how many objects to be scaned
ll_cnt = UpperBound ( a_class.NestedClassList ) 
If ll_cnt = 0 Then 
	// does not have any nested classes so get the class it self
	of_GetScanKeys ( a_class, ls_name, ls_desc, ls_objecttype ) 
	ls_name = as_name + ls_name
	of_AddObject ( is_app, as_object, ls_name, ls_objecttype, ls_desc )
Else
	// get the controls on the object
	For ll_idx = 1 To ll_cnt
		l_control = a_class.NestedClassList[ll_idx]
		// do not scan system structures or structure datatypes.  Or NVO?
		If Not l_control.IsStructure Then
			of_GetScanKeys ( l_control, ls_name, ls_desc, ls_objecttype ) 
			ls_name = as_name + ls_name
			of_AddObject ( is_app, as_object, ls_name, ls_objecttype, ls_desc )
			
			Choose Case l_control.DataTypeOf 
				Case "datawindow" 
					li_rc = of_InitialValue ( l_control, "dataobject", la_initial )
					If li_rc > 0 Then
						ls_dataobject = string ( la_initial ) 
						If ls_dataobject <> "" Then 
							of_ScanDataObject ( as_object, ls_dataobject, ls_name ) 
						End If
					End If
				Case "menu"
					//  Make sure you add "this" control if it was not already added
					of_GetScanKeys ( a_class, ls_name, ls_desc, ls_objecttype ) 
					ls_name = as_name + ls_name
					of_AddObject ( is_app, as_object, ls_name, ls_objecttype, ls_desc )

					ll_nested = UpperBound ( l_control.NestedClassList ) 
					For ll_n = 1 to ll_nested
						l_nested = l_control.NestedClassList[ll_n]
						of_ExplodeObject ( as_object, l_nested, "" ) 
						of_GetScanKeys ( a_class, ls_name, ls_desc, ls_objecttype ) 
						ls_name = as_name + ls_name
						of_AddObject ( is_app, as_object, ls_name, ls_objecttype, ls_desc )
					Next				
				Case "tab", "userobject"
					If UpperBound( l_control.Nestedclasslist ) > 0 Then
						of_explodeObject( as_object, l_control, ls_name + "." )
					End If
				Case Else
					//
				End Choose
		End If
	Next
End If

Return 1
end function

public function integer of_scanobject (string as_object, string as_library);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_scanobject
//	Description:  	Capture information about the controls and other classes on the object.
//////////////////////////////////////////////////////////////////////////////
any		la_initial
long	ll_r, ll_rows
int li_rc
string	ls_menu, ls_name, ls_desc, ls_objecttype
classdefinition l_class

SetPointer ( HourGlass! )
// check arguments
If IsNull ( as_object ) Or Len ( trim ( as_object ) ) = 0 Then Return -1
If IsNull ( as_library ) Or Len ( trim ( as_library ) ) = 0 Then Return -1

// get known controls
ll_rows = ids_updates.Retrieve ( is_app, as_object ) 

//  Delete all the objects since we are scanning again
For ll_r = 1 to ll_rows
	ids_updates.DeleteRow ( 0 )
Next
ids_updates.Update ( )

// load the object being scaned from the pbl
l_class = FindClassDefinition ( as_object, is_liblist )  
If Not IsValid ( l_class ) Then Return -1

If l_class.DataTypeOf = "nonvisualobject" Then Return 1
					
// scan the object for controls to be secured - recursively
If of_ExplodeObject ( as_object, l_class, "" )  < 0 Then Return -1

If l_class.DataTypeOf = "window" Then
	
	//  find the name of the menu from the class definition
	li_rc = of_InitialValue ( l_class, "menuname", la_initial ) 
	If li_rc > 0 Then 
		// load the menu from the pbl and scan it
		ls_menu = la_initial
		
		//  Ptrack # 497952, windows without menus are not scanned
		If Len ( trim ( ls_menu ) ) = 0 or IsNull ( ls_menu )  Then Return 1
	
		l_class = FindClassDefinition ( ls_menu, is_liblist ) 
		of_GetScanKeys ( l_class, ls_name, ls_desc, ls_objecttype ) 
		If ls_desc = "" Then ls_desc = "Top Level Menu Object"
		// If ls_name has not been scanned before Then add it
		of_AddObject ( is_app, as_object, ls_name, ls_objecttype, ls_desc ) 
	End If
	
	If IsValid ( l_class )  Then of_ExplodeObject ( as_object, l_class, "" ) 
		
End If

Return 1
end function

on pfcscanner_n_cst_securityscanner.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfcscanner_n_cst_securityscanner.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			Constructor
//	Description:  	Create all needed  datastore objects
//////////////////////////////////////////////////////////////////////////////
ids_updates = create pfcscanner_n_ds

ids_apps = create pfcscanner_n_ds

ids_info = create pfcscanner_n_ds
end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			Destructor
//	Description:  	Destroy all created datastore objects
//////////////////////////////////////////////////////////////////////////////
If IsValid ( ids_updates ) Then Destroy ids_updates
If IsValid ( ids_info ) Then Destroy ids_info
If IsValid ( ids_apps ) Then Destroy ids_apps
end event

