HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvmultitable.sru
$PBExportComments$PFC DataWindow Property - The Multitable service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvmultitable from u_tabpg_dwproperty_base
end type
type ddlb_table from u_ddlb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type st_table from u_st within pfc_u_tabpg_dwproperty_srvmultitable
end type
type lb_keycolumns from u_lb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type st_keycolumns from u_st within pfc_u_tabpg_dwproperty_srvmultitable
end type
type lb_updatecolumns from u_lb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type st_updatecolumns from u_st within pfc_u_tabpg_dwproperty_srvmultitable
end type
type cbx_register from u_cbx within pfc_u_tabpg_dwproperty_srvmultitable
end type
type rb_wherekey from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type rb_wherekeyandupd from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type rb_wherekeyandmod from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type rb_keydelthenins from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type rb_keyupdate from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type gb_1 from u_gb within pfc_u_tabpg_dwproperty_srvmultitable
end type
type gb_2 from u_gb within pfc_u_tabpg_dwproperty_srvmultitable
end type
end forward

global type pfc_u_tabpg_dwproperty_srvmultitable from u_tabpg_dwproperty_base
event type integer pfc_propertypopulateds ( )
event type integer pfc_propertyloadtable ( string as_table )
event type integer pfc_propertyrefreshtable ( string as_table )
event type integer pfc_propertycontrols ( )
ddlb_table ddlb_table
st_table st_table
lb_keycolumns lb_keycolumns
st_keycolumns st_keycolumns
lb_updatecolumns lb_updatecolumns
st_updatecolumns st_updatecolumns
cbx_register cbx_register
rb_wherekey rb_wherekey
rb_wherekeyandupd rb_wherekeyandupd
rb_wherekeyandmod rb_wherekeyandmod
rb_keydelthenins rb_keydelthenins
rb_keyupdate rb_keyupdate
gb_1 gb_1
gb_2 gb_2
end type
global pfc_u_tabpg_dwproperty_srvmultitable pfc_u_tabpg_dwproperty_srvmultitable

type variables
Protected:

string	is_msgtitle = 'Property'
integer	ii_selectedindex
string	is_selectedtable
boolean	ib_changespending = False
n_ds	ids_data
end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
protected function integer of_setdata (string as_option)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

event pfc_propertypopulateds;call super::pfc_propertypopulateds;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertypopulateds
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the hidden datastore.
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

integer	li_tablecnt
integer	li_cnt
integer 	li_rc
integer	li_index
integer	li_row
string	ls_registered
string	ls_keyinplace
boolean	lb_key
boolean	lb_update
integer	li_i
integer	li_columncount
integer	li_colcnt
integer	li_upper
string	ls_tables[]
string	ls_table
string	ls_columns[]
string	ls_column
string	ls_reg_keycolumns[]
string	ls_reg_updatablecolumns[]
boolean	lb_reg_keyinplace
integer	li_reg_whereoption

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_multitable) or Not IsValid(idw_requestor.inv_multitable) Then
	Return -1
End If

// Clear out the known information.
ids_data.Reset()

// Get all the Tables.
li_rc = idw_requestor.inv_multitable.of_GetRegisterableTable(ls_tables)

// Loop around all tables.
li_tablecnt = UpperBound(ls_tables)
For li_cnt = 1 to li_tablecnt
	
	// Get the table.
	ls_table = ls_tables[li_cnt]
	
	// Determine if the table is registered.
	If idw_requestor.inv_multitable.of_IsRegistered(ls_table) Then
		li_rc = idw_requestor.inv_multitable.of_GetRegistered(ls_table, &
			ls_reg_keycolumns, ls_reg_updatablecolumns, lb_reg_keyinplace, li_reg_whereoption)
		ls_registered = 'Y'
	Else
		ls_registered = 'N'
	End If
	
	// Insert a row to hold the main table information.
	li_row = ids_data.InsertRow(0)
	If li_row <=0 Then Return -1
	
	If lb_reg_keyinplace Then ls_keyinplace='Y' Else ls_keyinplace='N'
	// First goes the first row.
	ids_data.object.pfc_sort.primary[li_row] = 1
	ids_data.object.pfc_register.primary[li_row] = ls_registered
	ids_data.object.pfc_table.primary[li_row] = ls_table
	ids_data.object.pfc_keyinplace.primary[li_row] = ls_keyinplace
	ids_data.object.pfc_whereoption.primary[li_row] = li_reg_whereoption

	// Get the columns associated with this table.
	li_rc = idw_requestor.inv_multitable.of_GetRegisterableColumn(ls_table, ls_columns)
	
	// Loop around all the columns.
	li_columncount = UpperBound(ls_columns) 
	For li_colcnt = 1 to li_columncount

		// Insert new rows as needed (one for each column).
		If li_colcnt > 1 Then
			// Skipping the insertion of the first main row.
			li_row = ids_data.InsertRow(0)
			If li_row <=0 Then Return -1
		End If

		// Set the table name.
		ids_data.object.pfc_table.primary[li_row] = ls_table

		// Get / Set the column name.
		ls_column = ls_columns[li_colcnt]
		ids_data.object.pfc_column.primary[li_row] = Lower(ls_column)
		
		// Provide default for all columns.
		ids_data.object.pfc_key.primary[li_row] = 'N'
		ids_data.object.pfc_update.primary[li_row] = 'N'
		
		// Set the Sort order.
		ids_data.object.pfc_sort.primary[li_row] = li_colcnt
				
		// Determine if this is a key column.
		If ls_registered = 'Y' Then
			lb_key = False
			li_upper = UpperBound(ls_reg_keycolumns)
			For li_i = 1 to li_upper
				If ls_reg_keycolumns[li_i] = ls_column Then
					lb_key = True
					Exit
				End If
			Next
			If lb_key Then
				ids_data.object.pfc_key.primary[li_row] = 'Y'
			End If
		End If
		
		// Determine if this is a Update column.
		If ls_registered = 'Y' Then
			lb_update = False
			li_upper = UpperBound(ls_reg_updatablecolumns)
			For li_i = 1 to li_upper
				If ls_reg_updatablecolumns[li_i] = ls_column Then
					lb_update = True
					Exit
				End If
			Next
			If lb_update Then
				ids_data.object.pfc_update.primary[li_row] = 'Y'
			End If
		End If
		
	Next
	
Next

Return 1

end event

event pfc_propertyloadtable;call super::pfc_propertyloadtable;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_propertyloadtable
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	The user has selected a new table to view.
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

string	ls_column
integer	li_rc = 1
integer 	li_rowcount
integer 	li_row
integer	li_item
integer	li_whereoption
boolean	lb_keyoption

// Validate arguments.
If Len(Trim(as_table)) = 0 Then li_rc = -1

// Filter and Sort just the table related data.
If li_rc > 0 Then
	li_rowcount = of_SetData(as_table)
	If li_rowcount <= 0 Then li_rc = -1
End If

If li_rc < 0 Then
	// Clear all to some default value.
	cbx_register.Checked = False
	rb_wherekey.Checked = True
	rb_wherekeyandupd.Checked = False
	rb_wherekeyandmod.Checked = False
	rb_keydelthenins.Checked = True
	rb_keyupdate.Checked = False
	lb_keycolumns.Reset()
	lb_updatecolumns.Reset()
	Return -1
End If

// Set the register visual.
cbx_register.Checked = ( Upper(ids_data.object.pfc_register.primary[1]) = 'Y')

// Populate the WhereClause option information.
li_whereoption = ids_data.object.pfc_whereoption.primary[1]
rb_wherekey.Checked = (li_whereoption = 0)
rb_wherekeyandupd.Checked = (li_whereoption = 1)
rb_wherekeyandmod.Checked = (li_whereoption = 2)

// Populate the Key
If (Upper(ids_data.object.pfc_keyinplace.primary[1]) = 'Y') Then
	rb_keyupdate.Checked = False
	rb_keydelthenins.Checked = True
Else
	rb_keydelthenins.Checked = False	
	rb_keyupdate.Checked = True
End If

// Populate the Columns information.
lb_keycolumns.Reset()
lb_keycolumns.SetState(0, False)
lb_updatecolumns.Reset()
lb_updatecolumns.SetState(0, False)
For li_row = 1 to li_rowcount
	ls_column = ids_data.object.pfc_column.primary[li_row]
	
	// Add the Key Columns - Select the currently registered ones.
	li_item = lb_keycolumns.AddItem(ls_column)
	If Upper(ids_data.object.pfc_key.primary[li_row]) = 'Y' Then
		lb_keycolumns.SetState(li_item, True)
	End If
	
	// Add the Update Columns - Select the currently registered ones.
	li_item = lb_updatecolumns.AddItem(ls_column)
	If Upper(ids_data.object.pfc_update.primary[li_row]) = 'Y' Then
		lb_updatecolumns.SetState(li_item, True)
	End If
	
Next
	
Return 1
end event

event pfc_propertyrefreshtable;call super::pfc_propertyrefreshtable;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_propertyrefreshtable
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Refresh the datawindow to match the selected on-screen attribute values.
//	Keep track if changes were applied.
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

boolean	lb_keyinplace, lb_newkeyinplace
boolean	lb_register
boolean	lb_changespending = False
integer	li_whereoption, li_newwhereoption
Integer	li_rowcount
Integer	li_row
Integer	li_itemcount
Integer	li_item
string	ls_column
boolean	lb_keycolumn, lb_newkeycolumn
boolean 	lb_updatecolumn, lb_newupdatecolumn

// Validate the arguments.
If Len(Trim(as_table)) = 0 Then Return -1

// Filter and Sort just the table related data.
li_rowcount = of_SetData(as_table)
If li_rowcount <= 0 Then Return -1

// Refresh the Register flag.
lb_register = (Upper(ids_data.object.pfc_register.primary[1]) = 'Y')
If lb_register <> cbx_register.Checked Then
	lb_changespending = True
	If cbx_register.Checked Then
		ids_data.object.pfc_register.primary[1] = 'Y'
	Else
		ids_data.object.pfc_register.primary[1] = 'N'
	End If
End If

// Refresh the WhereClause option.
li_whereoption = ids_data.object.pfc_whereoption.primary[1]
If rb_wherekey.Checked Then
	li_newwhereoption  = 0
ElseIf rb_wherekeyandupd.Checked Then
	li_newwhereoption  = 1
Else
	li_newwhereoption  = 2
End If
If li_whereoption <> li_newwhereoption Then
	lb_changespending = True
	ids_data.object.pfc_whereoption.primary[1] = li_newwhereoption
End If

// Refresh the Key option.
lb_keyinplace = Upper(ids_data.object.pfc_keyinplace.primary[1]) = 'Y'
lb_newkeyinplace = (rb_keydelthenins.Checked)
If lb_keyinplace <> lb_newkeyinplace Then
	lb_changespending = True
	If rb_keydelthenins.Checked Then
		ids_data.object.pfc_keyinplace.primary[1] = 'Y'
	Else
		ids_data.object.pfc_keyinplace.primary[1] = 'N'
	End If
End If

// Refresh the Columns information (both column lists have the same entries & order).
li_itemcount = lb_keycolumns.TotalItems()
For li_item = 1 to li_itemcount
	ls_column = lb_keycolumns.Text(li_item)
	
	// Find the corresponding row entry.
	li_row = ids_data.Find('pfc_column = "'+Lower(ls_column)+'"', 0, 9999)
	If li_row <= 0 Then Return -1
	
	// Refresh the Key columns.
	lb_keycolumn = Upper(ids_data.object.pfc_key.primary[li_row]) = 'Y'
	lb_newkeycolumn = (lb_keycolumns.State(li_item) = 1)
	If lb_keycolumn <> lb_newkeycolumn Then
		lb_changespending = True		
		If lb_newkeycolumn Then
			ids_data.object.pfc_key.primary[li_row] = 'Y'
		Else
			ids_data.object.pfc_key.primary[li_row] = 'N'
		End If		
	End If
	
	// Refresh the Update columns.
	lb_updatecolumn = Upper(ids_data.object.pfc_update.primary[li_row]) = 'Y'
	lb_newupdatecolumn = (lb_updatecolumns.State(li_item) = 1)
	If lb_updatecolumn <> lb_newupdatecolumn Then
		lb_changespending = True		
		If lb_newupdatecolumn Then
			ids_data.object.pfc_update.primary[li_row] = 'Y'
		Else
			ids_data.object.pfc_update.primary[li_row] = 'N'
		End If		
	End If	
Next

// Remember if changes were applied.
If lb_changespending Then
	ib_changespending = True
End If

Return 1
end event

event pfc_propertycontrols;call super::pfc_propertycontrols;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_propertycontrols
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Enable or Disable the appropriate controls.
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

boolean lb_available

// Determine if the objects should available.
lb_available = cbx_register.Checked

// Disable or Enable the controls.
rb_wherekey.Enabled = lb_available
rb_wherekeyandupd.Enabled = lb_available
rb_wherekeyandmod.Enabled = lb_available
rb_keydelthenins.Enabled = lb_available
rb_keyupdate.Enabled = lb_available
lb_keycolumns.Enabled = lb_available
lb_updatecolumns.Enabled = lb_available

Return 1
end event

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
anv_infoattrib.is_name = 'DW Property Multitable Service'
anv_infoattrib.is_description = 'DW Property Multitable Service'

Return 1
end function

protected function integer of_setdata (string as_option);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetData
//
//	Access:   		Protected
//
//	Arguments:		
//		as_option	The option desired, If unknown then a table name.
//
//	Returns:  		Integer
//	 # of rows in the object.
//	-1 for error.
//
//	Description:  
//	 Sets the object to hold the desired data.
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


string	ls_filterexp
string	ls_sortexp

// Validate arguments.
If Len(Trim(as_option)) = 0 Then Return -1

If as_option = 'pfc_mainrows' Then
	// Set the Filter/Sort as to only row the Main row for each table.
	ls_filterexp = 'pfc_sort = 1'
	ls_sortexp = 'pfc_table A'

Else
	// Set the Filter/Sort to just the table related data.
	ls_filterexp = 'pfc_table = "'+as_option+'"'
	ls_sortexp = 'pfc_sort A'
End If

// Filter and Sort just the table related data.
If ids_data.SetFilter(ls_filterexp) < 0 Then Return -1
If ids_data.Filter() < 0 Then Return -1
If ids_data.SetSort(ls_sortexp) < 0 Then Return -1
If ids_data.Sort() < 0 Then Return -1

Return ids_data.RowCount()
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

// The Property Tab Text.
anv_attrib.is_propertytabtext ='General'

Return 1
end function

on pfc_u_tabpg_dwproperty_srvmultitable.create
int iCurrent
call super::create
this.ddlb_table=create ddlb_table
this.st_table=create st_table
this.lb_keycolumns=create lb_keycolumns
this.st_keycolumns=create st_keycolumns
this.lb_updatecolumns=create lb_updatecolumns
this.st_updatecolumns=create st_updatecolumns
this.cbx_register=create cbx_register
this.rb_wherekey=create rb_wherekey
this.rb_wherekeyandupd=create rb_wherekeyandupd
this.rb_wherekeyandmod=create rb_wherekeyandmod
this.rb_keydelthenins=create rb_keydelthenins
this.rb_keyupdate=create rb_keyupdate
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_table
this.Control[iCurrent+2]=this.st_table
this.Control[iCurrent+3]=this.lb_keycolumns
this.Control[iCurrent+4]=this.st_keycolumns
this.Control[iCurrent+5]=this.lb_updatecolumns
this.Control[iCurrent+6]=this.st_updatecolumns
this.Control[iCurrent+7]=this.cbx_register
this.Control[iCurrent+8]=this.rb_wherekey
this.Control[iCurrent+9]=this.rb_wherekeyandupd
this.Control[iCurrent+10]=this.rb_wherekeyandmod
this.Control[iCurrent+11]=this.rb_keydelthenins
this.Control[iCurrent+12]=this.rb_keyupdate
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.gb_2
end on

on pfc_u_tabpg_dwproperty_srvmultitable.destroy
call super::destroy
destroy(this.ddlb_table)
destroy(this.st_table)
destroy(this.lb_keycolumns)
destroy(this.st_keycolumns)
destroy(this.lb_updatecolumns)
destroy(this.st_updatecolumns)
destroy(this.cbx_register)
destroy(this.rb_wherekey)
destroy(this.rb_wherekeyandupd)
destroy(this.rb_wherekeyandmod)
destroy(this.rb_keydelthenins)
destroy(this.rb_keyupdate)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertypopulate
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the screen edit controls with the current service values.
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

integer 	li_rc
integer	li_rowcount
integer	li_cnt
string	ls_table

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_multitable) or Not IsValid(idw_requestor.inv_multitable) Then
	Return -1
End If

// Populate the datastore.
li_rc = this.Event pfc_propertypopulateds()
If li_rc < 0 Then Return -1

// Set the appropriate Filter/Sort as to Populate the Table object.
li_rowcount = of_SetData('pfc_mainrows')
If li_rowcount = 0 Then Return 1

// Populate the Table list.
For li_cnt = 1 to li_rowcount
	ls_table = ids_data.object.pfc_table.primary[li_cnt]
	ddlb_table.AddItem(ls_table)
Next

// Show the first table.
ddlb_table.SelectItem(1)
ddlb_table.Event selectionchanged(1)

Return 1

end event

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_PropertyApply
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  		
//	 Apply the requested changes.
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

integer	li_tablecnt
integer	li_newupper
integer	li_cnt
integer 	li_rc
integer	li_stylecurrent, li_styledesired
integer	li_index
string	ls_tables[]
string	ls_table
integer	li_row
integer	li_rowcount
boolean	lb_registrationerror = False
boolean	lb_keyinplace
integer	li_whereoption
string	ls_column
string	ls_msg
string	ls_keycolumns[]
string	ls_updatecolumns[]
string	ls_empty[]

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_multitable) or Not IsValid(idw_requestor.inv_multitable) Then
	Return -1
End If

// -- Make sure there any changes pending.
If Not ib_changespending Then
	Return 1
End IF

// -- Unregister all. --
li_rc = idw_requestor.inv_multitable.of_Unregister()

// Get all the Tables.
li_rc = idw_requestor.inv_multitable.of_GetRegisterableTable(ls_tables)

// Loop around all tables.
li_tablecnt = UpperBound(ls_tables)
For li_cnt = 1 to li_tablecnt
	
	// Initialize.
	ls_keycolumns = ls_empty
	ls_updatecolumns = ls_empty
	
	// Get one table.
	ls_table = ls_tables[li_cnt]
	
	// Set the internal data to the table.
	li_rowcount = of_SetData(ls_table)
	If li_rowcount <= 0 Then Continue
	
	// Determine if this table needs to be registered.
	If Upper(ids_data.object.pfc_register.primary[1]) = 'N' Then
		// Table will not be registered.
		Continue
	End If
	
	// Get the data from the main row.
	lb_keyinplace = (Upper(ids_data.object.pfc_keyinplace.primary[1]) = 'Y')
	li_whereoption = ids_data.object.pfc_whereoption.primary[1]

	// Loop around all the columns.
	For li_row = 1 to li_rowcount

		// Get the column name.
		ls_column = ids_data.object.pfc_column.primary[li_row]
		
		// Determine if this is a key column.
		If Upper(ids_data.object.pfc_key.primary[li_row]) = 'Y' Then
			li_newupper = UpperBound(ls_keycolumns) + 1
			ls_keycolumns[li_newupper] = ls_column
		End If
		
		// Determine if this is a Update column.
		If Upper(ids_data.object.pfc_update.primary[li_row]) = 'Y' Then
			li_newupper = UpperBound(ls_updatecolumns) + 1
			ls_updatecolumns[li_newupper] = ls_column			
		End If
	Next
			
	// Register the table.
	li_rc = idw_requestor.inv_multitable.of_Register(ls_table, ls_keycolumns, &
		ls_updatecolumns, lb_keyinplace, li_whereoption)
	If li_rc <= 0 Then
		lb_registrationerror = True
		If Len(ls_msg) >0 Then ls_msg += ', '
		ls_msg += ls_table
	End If		
			
Next

// Report any problems.
If lb_registrationerror Then
	of_MessageBox('pfc_dwproperty_multitable_regfailed',is_msgtitle , &
		'Registration of the following table(s) failed:~r~n'+ls_msg, StopSign!, OK!, 1)
End If	

Return 1
end event

event pfc_propertyvalidation;call super::pfc_propertyvalidation;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyValidation
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Validate the object.  
//	Make sure all required information has been selected.
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

Integer	li_rowcount
Integer	li_row
Integer	li_itemcount
Integer	li_item
string	ls_column

// Only validate if the table is to be registered.
If cbx_register.Checked Then

	// Validate the Where option has been set.
	If rb_wherekey.Checked or rb_wherekeyandupd.Checked or &
		rb_wherekeyandmod.Checked Then
		// OK
	Else
		of_MessageBox('pfc_dwproperty_multitable_whereoption', is_msgtitle, &
			'The Where option needs to be set.', StopSign!, OK!, 1)
		Return -1
	End If

	// Validate the Key option has been set.
	If rb_keydelthenins.Checked or rb_keyupdate.Checked Then
		// OK
	Else
		of_MessageBox('pfc_dwproperty_multitable_keyoption', is_msgtitle, &
			'The Key option needs to be set.', StopSign!, OK!, 1)
		Return -1
	End If

	// Validate that at least one Update column has been set.
	If lb_updatecolumns.SelectedIndex() <= 0 Then
		of_MessageBox('pfc_dwproperty_multitable_updatecol', is_msgtitle,&
			'The Update column(s) need to be set.', StopSign!, OK!, 1)
		Return -1
	End If

	// Validate that at least one Key column has been set.
	If lb_keycolumns.SelectedIndex() <= 0 Then
		of_MessageBox('pfc_dwproperty_multitable_keycol', is_msgtitle,&
			'The Key column(s) need to be set.', StopSign!, OK!, 1)
		Return -1
	End If
End If

// Refresh the data.
// Using the previously selected table.
this.Event pfc_propertyrefreshtable(is_selectedtable)

Return 1
end event

event pfc_propertysyntax;call super::pfc_propertysyntax;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertysyntax
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		String
//	  The syntax required to create the currently selections.
//   '!' in error
//
//	Description:  
//	Create the required syntax to match the current selections.
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

integer	li_rowcount
integer	li_row
integer 	li_rc
integer	li_tablecnt
integer	li_whereoption
integer	li_keysubscript
integer	li_updatesubscript
string	ls_table, ls_column
string	ls_syntax
string	ls_keycolumns
string	ls_updatecolumns
string	ls_tables[]
boolean	lb_keyinplace

n_cst_conversion lnv_conversion

integer	li_upper
integer	li_cnt

integer	li_index


// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_multitable) or Not IsValid(idw_requestor.inv_multitable) Then
	Return '!'
End If

// -- Define needed variables. --
ls_syntax += 'String ls_keycolumns[]~r~n'
ls_syntax += 'String ls_updatecolumns[]~r~n'
ls_syntax += 'String ls_initialize[]~r~n'
ls_syntax += '~r~n'

// -- Start the service. --
ls_syntax += 'This.of_SetMultitable(True)~r~n'

// Get all the Tables.
li_rc = idw_requestor.inv_multitable.of_GetRegisterableTable(ls_tables)

// Loop around all tables.
li_tablecnt = UpperBound(ls_tables)
For li_cnt = 1 to li_tablecnt

	// Get one table.
	ls_table = ls_tables[li_cnt]	
	
	// Initialize.
	ls_keycolumns = '// Key columns for "'+ls_table+'". ~r~nls_keycolumns = ls_initialize~r~n'
	ls_updatecolumns = '// Update columns for"'+ls_table+'". ~r~nls_updatecolumns = ls_initialize~r~n'
	li_keysubscript = 0
	li_updatesubscript = 0
	
	// Set the internal data to the table.
	li_rowcount = of_SetData(ls_table)
	If li_rowcount <= 0 Then Continue
	
	// Determine if this table needs to be registered.
	If Upper(ids_data.object.pfc_register.primary[1]) = 'N' Then
		// Table will not be registered.
		Continue
	End If
	
	// Get the data from the main row.
	lb_keyinplace = (Upper(ids_data.object.pfc_keyinplace.primary[1]) = 'Y')
	li_whereoption = ids_data.object.pfc_whereoption.primary[1]

	// Loop around all the columns.
	For li_row = 1 to li_rowcount

		// Get the column name.
		ls_column = ids_data.object.pfc_column.primary[li_row]
		
		// Determine if this is a key column.
		If Upper(ids_data.object.pfc_key.primary[li_row]) = 'Y' Then
			//If li_keysubscript > 0 Then ls_keycolumns += '~r~n'
			li_keysubscript ++
			ls_keycolumns += 'ls_keycolumns['+string(li_keysubscript)+']' + &
				'="'+ls_column+'" ~r~n'		
		End If
		
		// Determine if this is a Update column.
		If Upper(ids_data.object.pfc_update.primary[li_row]) = 'Y' Then
			//If li_updatesubscript > 0 Then ls_updatecolumns += '~r~n'
			li_updatesubscript ++
			ls_updatecolumns += 'ls_updatecolumns['+string(li_updatesubscript)+']' + &
				'="'+ls_column+'" ~r~n'			
			End If
	Next

	// Add the arrays.
	ls_syntax += '~r~n'
	ls_syntax += ls_keycolumns
	ls_syntax += '~r~n'
	ls_syntax += ls_updatecolumns
	
	// -- Register. --
	ls_syntax += '~r~n// Register "'+ls_table+'"~r~n'
	ls_Syntax += 'This.inv_multitable.of_Register("'+ls_table + &
		'", ls_keycolumns, ls_updatecolumns, '+lnv_conversion.of_String(lb_keyinplace)+&
		', '+String(li_whereoption)+')~r~n'
		
Next

Return ls_syntax

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		constructor
//
//	Arguments:  	None
//
//	Returns:   		Integer
//
//	Description:  		
//	 Create the required datastore.
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

//	 Create the required datastore.
ids_data = Create n_ds
ids_data.DataObject = 'd_dwproperty_multitable'
end event

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		destructor
//
//	Arguments:  	None
//
//	Returns:   		Integer
//
//	Description:  		
//	 Perform cleanup.
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

If IsValid(ids_data) Then Destroy ids_data
end event

type ddlb_table from u_ddlb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 104
integer width = 1038
integer height = 348
integer taborder = 10
long backcolor = 1090519039
integer accelerator = 116
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		selectionchanged
//
//	Arguments:  	
//	index
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	A table has been selected.
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

// Determine if there has been a table previously selected.
If ii_selectedindex > 0 Then
	If ii_selectedindex <> index Then
		// Validate that changing is ok.
		li_rc = Parent.Event pfc_PropertyValidation()
		If li_rc <= 0 Then
			// Prevent going to a new table.
			this.SelectItem(ii_selectedindex)
			this.Event selectionchanged(ii_selectedindex)
			Return
		End If
	End If
End If

If ii_selectedindex <> index Then
// Get the newly selected index / table.
ii_selectedindex = index
is_selectedtable = this.Text

// Using the newly selected table.
Parent.Event pfc_propertyloadtable(is_selectedtable)

// Enable or Disable the appropriate controls.
Parent.Event pfc_propertycontrols()
End If
end event

type st_table from u_st within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 36
integer width = 1038
string text = "&Table"
end type

type lb_keycolumns from u_lb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 882
integer y = 892
integer width = 832
integer height = 460
integer taborder = 60
boolean multiselect = true
integer accelerator = 107
end type

type st_keycolumns from u_st within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 882
integer y = 828
integer width = 827
string text = "Uni&que Key Column(s)"
end type

type lb_updatecolumns from u_lb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 892
integer width = 832
integer height = 460
integer taborder = 50
boolean bringtotop = true
boolean multiselect = true
integer accelerator = 99
end type

type st_updatecolumns from u_st within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 828
integer width = 850
string text = "Updateable &Column(s)"
end type

type cbx_register from u_cbx within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 1129
integer y = 104
integer width = 608
integer height = 68
integer taborder = 20
string text = "&Register"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		clicked
//
//	Arguments:  	None
//
//	Returns:   None
//
//	Description:  	
//	The user has changed the Register flag.  
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

Parent.Event pfc_propertycontrols()

end event

type rb_wherekey from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 101
integer y = 292
integer width = 1568
integer height = 68
string text = "&Key Columns"
end type

type rb_wherekeyandupd from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 101
integer y = 364
integer width = 1568
integer height = 68
string text = "Key and U&pdateable Columns"
end type

type rb_wherekeyandmod from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 101
integer y = 436
integer width = 1568
integer height = 68
boolean bringtotop = true
string text = "Key and &Modified Columns"
end type

type rb_keydelthenins from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 101
integer y = 632
integer width = 1568
integer height = 68
string text = "Use &Delete then Insert"
end type

type rb_keyupdate from u_rb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 101
integer y = 704
integer width = 1568
integer height = 68
boolean bringtotop = true
string text = "Use &Update"
end type

type gb_1 from u_gb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 224
integer width = 1682
integer height = 304
integer taborder = 30
string text = "Where clause for Update/Delete"
end type

type gb_2 from u_gb within pfc_u_tabpg_dwproperty_srvmultitable
integer x = 27
integer y = 564
integer width = 1682
integer height = 236
integer taborder = 40
string text = "Key modification"
end type

