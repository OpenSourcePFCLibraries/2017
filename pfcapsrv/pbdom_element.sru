HA$PBExportHeader$pbdom_element.sru
forward
global type pbdom_element from pbdom_object
end type
end forward

global type pbdom_element from pbdom_object native "PBDOM170.pbx"
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
public function  pbdom_element		AddContent(string strText)
public function  pbdom_element		SetText(string strText)
public function  pbdom_element		SetAttribute(pbdom_attribute pbdom_attribute_ref)
public function  pbdom_element		SetAttribute(string strName, string strValue)
public function  long				SetAttribute(string strName, string strValue, string strNamespacePrefix, string strNamespaceUri, boolean bVerifyNamespace)
public function  pbdom_element		SetAttributes(pbdom_attribute pbdom_attribute_array[])
public function  boolean			HasChildElements()
public function  boolean			IsRootElement()
public function  pbdom_element		AddNamespaceDeclaration(string strNamespacePrefix, string strNamespaceUri)
public function  pbdom_attribute	GetAttribute(string strName)
public function  pbdom_attribute	GetAttribute(string strName, string strNamespacePrefix, string strNamespaceUri)
public function  boolean			GetAttributes(ref pbdom_attribute pbdom_attribute_array[])
public function  string			GetAttributeValue(string strAttributeName)
public function  string			GetAttributeValue(string strAttributeName, string strNamespacePrefix, string strNamespaceUri)
public function  string			GetAttributeValue(string strAttributeName, string strNamespacePrefix, string strNamespaceUri, string strDefaultValue)
public function  string			GetAttributeValue(string strAttributeName, string strDefaultValue)
public function  pbdom_element		GetChildElement(string strElementName)
public function  pbdom_element		GetChildElement(string strElementName, string strNamespacePrefix, string strNamespaceUri)
public function  boolean			GetChildElements(ref pbdom_element pbdom_element_array[])
public function  boolean			GetChildElements(string strElementName, ref pbdom_element pbdom_element_array[])
public function  boolean			GetChildElements(string strElementName, string strNamespacePrefix, string strNamespaceUri, ref pbdom_element pbdom_element_array[])
public function  string			GetNamespacePrefix()
public function  string			GetNamespaceUri()
public function  string			GetQualifiedName()
public function  boolean			RemoveAttribute(pbdom_attribute pbdom_attribute_ref)
public function  boolean			RemoveAttribute(string strAttributeName)
public function  boolean			RemoveAttribute(string strAttributeName, string strNamespacePrefix, string strNamespaceUri)
public function  boolean			RemoveChildElement(string strElementName)
public function  boolean			RemoveChildElement(string strElementName, string strNamespacePrefix, string strNamespaceUri)
public function  boolean			RemoveChildElements()
public function  boolean			RemoveChildElements(string strElementName)
public function  boolean			RemoveChildElements(string strElementName, string strNamespacePrefix, string strNamespaceUri)
public function  boolean			RemoveNamespaceDeclaration(string strNamespacePrefix, string strNamespaceUri)
public function  pbdom_element		SetDocument(pbdom_object pbdom_document_ref)
public function  long				SetNamespace(string strNamespacePrefix, string strNamespaceUri, boolean bVerifyNamespace)
public function  boolean			HasAttributes()
end type
global pbdom_element pbdom_element

on pbdom_element.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pbdom_element.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

