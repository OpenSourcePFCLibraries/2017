HA$PBExportHeader$n_tr.sru
forward
global type n_tr from pfc_n_tr
end type
end forward

global type n_tr from pfc_n_tr
end type
global n_tr n_tr

forward prototypes
public function long of_begin ()
end prototypes

public function long of_begin ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Begin
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  long
//
//	Description:  Begin a transaction
//
//	Note:  Logs the beginning of the transaction with the SQL Spy.
//
//////////////////////////////////////////////////////////////////////////////

long ll_rc

// If the SQLSpy Window is open, mark the beginning of the transaction.
ll_rc = of_Execute("Begin Transaction")
If ll_rc = 0 Then
	Return 1
End If

Return ll_rc
end function

on n_tr.create
call transaction::create
TriggerEvent( this, "constructor" )
end on

on n_tr.destroy
call transaction::destroy
TriggerEvent( this, "destructor" )
end on

