HA$PBExportHeader$pbdom_attribute.sru
forward
global type pbdom_attribute from pbdom_object
end type
end forward

global type pbdom_attribute from pbdom_object native "PBDOM170.pbx"
public function  string			GetName()
public function  string			GetText()
public function  boolean			GetContent(ref pbdom_object pbdom_object_array[])
public function  pbdom_object		AddContent(pbdom_object pbdom_object_ref)
public function  pbdom_object		InsertContent(pbdom_object pbdom_object_new, pbdom_object pbdom_object_ref)
public function  boolean			RemoveContent(pbdom_object pbdom_object_ref)
public function  pbdom_object		SetContent(pbdom_object pbdom_object_array[])
public function  boolean			SetName(string strName)
public function  pbdom_object		Clone(boolean bDeep)
public function  boolean			Equals(pbdom_object pbdom_object_ref)
public function  long				GetObjectClass()
public function  string			GetObjectClassString()
public function  pbdom_document	GetOwnerDocumentObject()
public function  pbdom_object		Detach()
public function  pbdom_object		GetParentObject()
public function  boolean			HasChildren()
public function  string			GetTextNormalize()
public function  string			GetTextTrim()
public function  boolean			IsAncestorObjectOf(pbdom_object pbdom_object_ref)
public function  pbdom_object		SetParentObject(pbdom_object pbdom_object_ref)
public function  boolean			GetBooleanValue()
public function  double			GetDoubleValue()
public function  real				GetRealValue()
public function  int				GetIntValue()
public function  long				GetLongValue()
public function  uint				GetUintValue()
public function  date				GetDateValue(string strDateFormat)
public function  datetime			GetDateTimeValue(string strDateFormat, string strTimeFormat)
public function  time				GetTimeValue(string strTimeFormat)
public function  ulong				GetUlongValue()
public function  string			GetNamespacePrefix()
public function  string			GetNamespaceUri()
public function  string			GetQualifiedName()
public function  long				SetNamespace(string strNamespacePrefix, string strNamespaceUri, boolean bVerifyNamespace)
public function  pbdom_attribute	SetText(string strText)
public function  pbdom_attribute	SetBooleanValue(boolean boolValue)
public function  pbdom_attribute	SetDoubleValue(double doubleValue)
public function  pbdom_attribute	SetRealValue(real realValue)
public function  pbdom_attribute	SetIntValue(int intValue)
public function  pbdom_attribute	SetLongValue(long longValue)
public function  pbdom_attribute	SetUintValue(uint uintValue)
public function  pbdom_attribute	SetDateValue(date dateValue, string strDateFormat)
public function  pbdom_attribute	SetDateTimeValue(datetime datetimeValue, string strDateFormat, string strTimeFormat)
public function  pbdom_attribute	SetTimeValue(time timeValue, string strTimeFormat)
public function  pbdom_attribute	SetUlongValue(ulong ulongValue)
public function  pbdom_element		GetOwnerElementObject()
public function  pbdom_attribute	SetOwnerElementObject(pbdom_element pbdom_element_ref)
end type
global pbdom_attribute pbdom_attribute

on pbdom_attribute.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pbdom_attribute.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

