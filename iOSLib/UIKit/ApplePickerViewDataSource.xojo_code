#tag Class
Protected Class ApplePickerViewDataSource
Inherits AppleObject
	#tag Method, Flags = &h0
		Sub AddColumn(values() as text)
		  Columns.Append values
		  RowHeights.Append StandardRowHeight
		  Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aPicker as iOSLibPicker)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  myPicker = aPicker
		  Super.Constructor   (Init(Alloc(classptr)))
		  mhasownership = true
		  
		  if RetainDict = nil then RetainDict = new Dictionary
		  RetainDict.Value(id) = self
		  system.debuglog "created new PickerViewdatasource: "+integer(id).totext
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRowHeight(Column as Integer) As Double
		  if RowHeights.Ubound >= Column then
		    Return RowHeights(Column)
		  else
		    Return StandardRowHeight
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( "Not yet implemented" ) Private Shared Function impl_attributedTitleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as Integer) As ptr
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused picker
		  #Pragma Unused row
		  #Pragma Unused component
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_didSelectRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer)
		  ApplePickerViewDataSource(RetainDict.Value(pid)).SelectRowAndComponent(row,component)
		  #pragma unused sel
		  #pragma unused picker
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfComponents(pid as ptr, sel as ptr, picker as ptr) As Integer
		  return ApplePickerViewDataSource(retaindict.Value(pid)).Columns.Ubound+1
		  #pragma unused sel
		  #pragma unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_numberOfRowsInComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Integer
		  dim rows() as text = ApplePickerViewDataSource(RetainDict.Value(pid)).Columns(component)
		  Return rows.Ubound+1
		  #pragma unused sel
		  #pragma unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_rowHeightForComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Double
		  return ApplePickerViewDataSource(RetainDict.Value(pid)).GetRowHeight(component)
		  #pragma unused sel
		  #pragma unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_titleForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as Integer, component as integer) As CFStringRef
		  return ApplePickerViewDataSource(RetainDict.Value(pid)).TextInRowAndColumn(row,component)
		  #pragma unused sel
		  #pragma unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function impl_viewForRowAndComponent(pid as ptr, sel as ptr, picker as ptr, row as integer, component as integer, view as ptr) As ptr
		  return ApplePickerViewDataSource(RetainDict.Value(pid)).ViewForRow(row,component, view)
		  #pragma unused sel
		  #pragma unused picker
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Attributes( "not yet implemented" ) Private Shared Function impl_widthForComponent(pid as ptr, sel as ptr, picker as ptr, component as integer) As Double
		  #Pragma Unused pid
		  #Pragma Unused sel
		  #Pragma Unused picker
		  #Pragma Unused component
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfRowsInComponentInPickerView1(PickerView as iOSLibPicker, Component as Integer) As Integer
		  Declare Function numberOfRowsInComponent lib UIKitLibname selector "pickerView:numberOfRowsInComponent:" (id as ptr, pv as ptr, component as integer) as Integer
		  Return numberOfRowsInComponent (id, PickerView.id, Component)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reload()
		  Declare Sub reloadAllComponents lib UIKitLibname selector "reloadAllComponents" (obj_ref As Ptr)
		  
		  reloadAllComponents(myPicker.id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReloadColumn(column as integer)
		  Declare Sub reloadComponent lib UIKitLibname selector "reloadComponent:" (id as ptr, component as integer)
		  ReloadComponent (myPicker.id, column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveColumn(column as integer)
		  if column<0 or column>columns.Ubound then Return
		  columns.Remove column
		  RowHeights.remove column
		  Reload
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFromDict()
		  if RetainDict.HasKey(id) then
		    RetainDict.Remove (id)
		    system.DebugLog "Removed DataSource from Dict"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRow(Column As integer) As integer
		  Declare Function selectedRowInComponent lib UIKitLibname selector "selectedRowInComponent:" (obj_ref As Ptr, component As Integer) As Integer
		  
		  Return selectedRowInComponent(myPicker.id, Column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedRow(column As Integer, Assigns value As Integer)
		  Declare Sub selectRowinComponentanimated lib UIKitLibname selector "selectRow:inComponent:animated:" (obj_ref As Ptr, row As Integer, component As Integer, animated As Boolean)
		  
		  selectRowinComponentanimated(myPicker.id, value, column, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectRowAndComponent(row as integer, component as integer)
		  RaiseEvent SelectionChanged(row,component)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setRowHeight(Column as Integer, value as double)
		  if RowHeights.Ubound >= Column then
		    RowHeights(Column) = value
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextInRowAndColumn(row as integer, column as integer) As Text
		  if column < 0 or column>columns.Ubound then Return ""
		  dim rows() as Text = columns(column)
		  if row < 0 or row > rows.Ubound then Return ""
		  Return rows(row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ViewForRow(Row as Integer, Component as integer, view as ptr) As ptr
		  Declare Function viewForRow lib UIKitLibname selector "viewForRow:forComponent:resuingView:" (id as ptr, row as integer, component as integer, view as ptr) as Ptr
		  return viewForRow (mypicker.id, Row, Component, view)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SelectionChanged(row as integer, column as integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static targetID as ptr
			  if targetID = Nil then
			    dim methods() as TargetClassMethodHelper
			    //delegate methods
			    methods.Append new TargetClassMethodHelper("pickerView:rowHeightForComponent:", AddressOf impl_rowHeightForComponent, "f@:@i")
			    'methods.Append new TargetClassMethodHelper("pickerView:widthForComponent:", AddressOf impl_widthForComponent, "f@:@@")
			    methods.Append new TargetClassMethodHelper("pickerView:titleForRow:forComponent:", AddressOf impl_titleForRowAndComponent, "*@:@ii")
			    'methods.Append new TargetClassMethodHelper("pickerView:attributedTitleForRow:forComponent:", AddressOf impl_attributedTitleForRowAndComponent, "@@:@ii")
			    // methods.Append new TargetClassMethodHelper("pickerView:viewForRow:forComponent:reusingView:", AddressOf impl_viewForRowAndComponent, "@@:@ii@")
			    methods.Append new TargetClassMethodHelper("pickerView:didSelectRow:inComponent:", AddressOf impl_didSelectRowAndComponent, "v@:@ii")
			    
			    //datasource methods
			    methods.Append new TargetClassMethodHelper("numberOfComponentsInPickerView:", AddressOf impl_numberOfComponents, "i@:@")
			    methods.Append new TargetClassMethodHelper("pickerView:numberOfRowsInComponent:", AddressOf impl_numberOfRowsInComponent, "i@:@i")
			    
			    targetID = BuildTargetClass ("NSObject", "ApplePickerViewDataSource",methods)
			  end if
			  Return targetID
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Columns() As Auto
	#tag EndProperty

	#tag Property, Flags = &h0
		myPicker As iOSLibPicker
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared RetainDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RowHeights() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		StandardRowHeight As Double = 28
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hash"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNIL"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isProxy"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetainCount"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StandardRowHeight"
			Group="Behavior"
			InitialValue="28"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
