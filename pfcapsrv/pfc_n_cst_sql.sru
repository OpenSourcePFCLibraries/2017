HA$PBExportHeader$pfc_n_cst_sql.sru
$PBExportComments$PFC Base SQL service
forward
global type pfc_n_cst_sql from n_base
end type
end forward

global type pfc_n_cst_sql from n_base autoinstantiate
end type

forward prototypes
public function string of_assemble (n_cst_sqlattrib astr_sql[])
public function integer of_parse (string as_sql, ref n_cst_sqlattrib astr_sql[])
end prototypes

public function string of_assemble (n_cst_sqlattrib astr_sql[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Assemble
//
//	Access: 			public
//
//	Arguments:
//	astr_sql[]		Array of sql attributes, each element containing a
//						SQL statement that will be joined with an UNION.
//
//	Returns:  		String
//						The function returns an empty string if an error
//						was encountered.
//
//	Description:	Build a SQL statement from its component parts.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Integer	li_NumStats, li_Cnt
String	ls_SQL

li_NumStats = UpperBound(astr_sql[])

For li_Cnt = 1 to li_NumStats

	// Check for valid data
	If Trim(astr_sql[li_Cnt].s_Verb) = "" Or &
		Trim(astr_sql[li_Cnt].s_Tables) = "" Then
		Return ""
	End if

	// If there is more than one statement in the array, they are SELECTs that
	// should be joined by a UNION
	If li_Cnt > 1 Then
		ls_SQL = ls_SQL + " UNION "
	End if

	ls_SQL = ls_SQL + astr_sql[li_Cnt].s_Verb

	If astr_sql[li_Cnt].s_Verb = "SELECT" Then
		If Trim(astr_sql[li_Cnt].s_Columns) = "" Then
			Return ""
		Else
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns + &
						" FROM " + astr_sql[li_Cnt].s_Tables
		End if

	Else
		ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Tables

		If astr_sql[li_Cnt].s_Verb = "UPDATE" Then
			ls_SQL = ls_SQL + " SET " + astr_sql[li_Cnt].s_Columns
		Elseif Trim(astr_sql[li_Cnt].s_Columns) <> "" Then
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns
		End if
	End if

	If Trim(astr_sql[li_Cnt].s_Values) <> "" Then
		ls_SQL = ls_SQL + " VALUES " + astr_sql[li_Cnt].s_Values
	End if

	If Trim(astr_sql[li_Cnt].s_Where) <> "" Then
		ls_SQL = ls_SQL + " WHERE " + astr_sql[li_Cnt].s_Where
	End if

	If Trim(astr_sql[li_Cnt].s_Group) <> "" Then
		ls_SQL = ls_SQL + " GROUP BY " + astr_sql[li_Cnt].s_Group
	End if

	If Trim(astr_sql[li_Cnt].s_Having) <> "" Then
		ls_SQL = ls_SQL + " HAVING " + astr_sql[li_Cnt].s_Having
	End if

	If Trim(astr_sql[li_Cnt].s_Order) <> "" Then
		ls_SQL = ls_SQL + " ORDER BY " + astr_sql[li_Cnt].s_Order
	End if
Next

Return ls_SQL

end function

public function integer of_parse (string as_sql, ref n_cst_sqlattrib astr_sql[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Parse
//
//	Access: 			public
//
//	Arguments:
//	as_SQL			The SQL statement to parse.
//	astr_sql[]		An array of sql attributes, passed by
//						reference, to be filled with the parsed SQL.
//
//	Returns:  		integer
//						The number of elements in the array.
//
//	Description:	Parse a SQL statement into its component parts.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0	Parse for UNION cannot include data from WHERE CLAUSE
// 8.0   Add support to parse keyword UNION ALL
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

integer	li_Pos, li_KWNum, li_NumStats, li_Cnt, li_PosU
string	ls_UpperSQL, ls_Keyword[7], ls_Clause[7], ls_SQL[], ls_right
constant string LI_UNIONREPLACE="*%$!@"
constant string LI_ALLREPLACE="   "
char lc_char
n_cst_string  lnv_string
boolean lb_isUnion, lb_isUnionAll
integer li_PosAll

// Remove Carriage returns, Newlines, and Tabs
as_SQL = lnv_string.of_GlobalReplace(as_SQL, "~r", " ", FALSE)
as_SQL = lnv_string.of_GlobalReplace(as_SQL, "~n", " ", FALSE)
as_SQL = lnv_string.of_GlobalReplace(as_SQL, "~t", " ", FALSE)
as_SQL = Trim(as_SQL) 

// Search for UNION keyword, must be followed by SELECT Keyword.
// Replace UNION with bogus string so that the UNIONs can
// be separated
li_PosU = Pos(Lower(as_SQL), "union") 
li_Pos = li_PosU
lb_isUnion = FALSE 
lb_isUnionAll = FALSE 
Do Until li_Pos <= 0
	lb_isUnion = FALSE 
	lb_isUnionAll = FALSE 
	If li_Pos > 0 Then
		li_Pos = li_Pos + 5
		Do While True
			//  Bypass embedded spaces  
			lc_char = Mid(as_SQL, li_Pos, 1)
			If lnv_string.of_IsSpace(lc_char) Then
				lb_isUnion = TRUE
				li_Pos++
			Else
				Exit
			End If
		Loop
		if lb_isUnion = TRUE then
			// check if "ALL" follows "UNION"
			li_PosAll = li_pos
			ls_right = Mid(Trim(as_SQL), li_PosAll,3)
			if UPPER(ls_right) = "ALL" then
				li_pos = li_pos + 3
				Do While True
					lc_char = Mid(as_SQL, li_pos, 1)
					If lnv_string.of_IsSpace(lc_char) Then
						lb_isUnionAll = TRUE
						li_pos++
					Else
						exit
					End IF
				Loop
			End if
			If lb_isUnionAll = TRUE Then
				as_SQL = Replace(as_SQL, li_PosAll, 3, LI_ALLREPLACE)
			Else
				li_Pos = li_PosAll
			End If
			ls_right = Mid(Trim(as_SQL), li_Pos, 6)
			If Upper(ls_right) = "SELECT" Then
				as_SQL = Replace(as_SQL, li_PosU, 5, LI_UNIONREPLACE)
			End If															
		End If
		li_PosU = Pos(Lower(as_SQL), "union", li_Pos+5) 
		li_Pos = li_PosU
	End If
Loop

// Separate the statement into multiple statements separated by UNIONs
li_NumStats = lnv_string.of_ParseToArray(as_SQL, LI_UNIONREPLACE, ls_SQL)

For li_Cnt = 1 to li_NumStats

	// Remove leading and trailing spaces
	ls_SQL[li_Cnt] = Trim(ls_SQL[li_Cnt])

	// Convet to upper case
	ls_UpperSQL = Upper(ls_SQL[li_Cnt])

	// Determine what type of SQL this is
	// and assign the appropriate kewords
	// for the corresponding type
	If Left(ls_UpperSQL, 7) = "SELECT " Then
		// Parse the SELECT statement
		ls_Keyword[1] = "SELECT "
		ls_Keyword[2] = " FROM "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[4] = " GROUP BY "
		ls_Keyword[5] = " HAVING "
		ls_Keyword[6] = " ORDER BY "

	Elseif Left(ls_UpperSQL, 7) = "UPDATE " Then
		// Parse the UPDATE statement
		ls_Keyword[1] = "UPDATE "
		ls_Keyword[2] = " SET "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[6] = " ORDER BY "

	Elseif Left(ls_UpperSQL, 12) = "INSERT INTO " Then
		// Parse the INSERT statement (test before 'insert')
		ls_Keyword[1] = "INSERT INTO "
		ls_Keyword[7] = " VALUES "
		
	Elseif Left(ls_UpperSQL, 7) = "INSERT " Then
		// Parse the INSERT statement (test after 'insert to')
		ls_Keyword[1] = "INSERT "
		ls_Keyword[7] = " VALUES "		

	Elseif Left(ls_UpperSQL, 12) = "DELETE FROM " Then
		// Parse the DELETE statement (test before 'delete')
		ls_Keyword[1] = "DELETE FROM "
		ls_Keyword[3] = " WHERE "

	Elseif Left(ls_UpperSQL, 7) = "DELETE " Then
		// Parse the DELETE statement (test after 'delete from')
		ls_Keyword[1] = "DELETE "
		ls_Keyword[3] = " WHERE "
		
	End if

	// There is a maximum of 7 keywords
	For li_KWNum = 7 To 1 Step -1
		If ls_Keyword[li_KWNum] <> "" Then
			// Find the position of the Keyword
			li_Pos = Pos(ls_UpperSQL, ls_Keyword[li_KWNum]) - 1

			If li_Pos >= 0 Then
				ls_Clause[li_KWNum] = Right(ls_SQL[li_Cnt], &
													(Len(ls_SQL[li_Cnt]) - &
														(li_Pos + Len(ls_Keyword[li_KWNum]))))
				ls_SQL[li_Cnt] = Left(ls_SQL[li_Cnt], li_Pos)
			Else
				ls_Clause[li_KWNum] = ""
			End if
		End if
	Next

	astr_sql[li_Cnt].s_Verb = Trim(ls_Keyword[1])

	If Pos(astr_sql[li_Cnt].s_Verb, "SELECT") > 0 Then
		astr_sql[li_Cnt].s_Columns = Trim(ls_Clause[1])
		astr_sql[li_Cnt].s_Tables 	= Trim(ls_Clause[2])
	Else
		astr_sql[li_Cnt].s_Tables = Trim(ls_Clause[1])

		If Pos(astr_sql[li_Cnt].s_Verb, "INSERT") > 0 Then
			li_Pos = Pos(astr_sql[li_Cnt].s_Tables, " ")
			If li_Pos > 0 Then
				astr_sql[li_Cnt].s_Columns = Trim(Right(astr_sql[li_Cnt].s_Tables, &
											(Len(astr_sql[li_Cnt].s_Tables) - li_Pos)))
				astr_sql[li_Cnt].s_Tables = Left(astr_sql[li_Cnt].s_Tables, (li_Pos - 1))
			End if
		Else
			astr_sql[li_Cnt].s_Columns = Trim(ls_Clause[2])
		End if
	End if

	astr_sql[li_Cnt].s_Where 	= Trim(ls_Clause[3])
	astr_sql[li_Cnt].s_Group 	= Trim(ls_Clause[4])
	astr_sql[li_Cnt].s_Having 	= Trim(ls_Clause[5])
	astr_sql[li_Cnt].s_Order 	= Trim(ls_Clause[6])
	astr_sql[li_Cnt].s_Values 	= Trim(ls_Clause[7])
Next

Return li_NumStats
end function

on pfc_n_cst_sql.create
call super::create
end on

on pfc_n_cst_sql.destroy
call super::destroy
end on

