#tag Class
Protected Class AppleMutableDictionary
Inherits AppleDictionary
	#tag Method, Flags = &h0
		Sub AddDictionary(aDictionary as AppleDictionary)
		  declare sub addEntriesFromDictionary lib FoundationLibName  selector "addEntriesFromDictionary:" (id as ptr, aDictionary as ptr)
		  addEntriesFromDictionary id, aDictionary.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Capacity as uinteger = 1)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (DoInitWithCapacity (alloc(classptr), Capacity))
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakeFromPtr(aPtr as Ptr) As AppleMutableDictionary
		  return if (aPtr = NIL, NIL, new AppleMutableDictionary (aptr))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ObjectForKey(Key as cfstringref, assigns anObject as AppleGeneralObject)
		  Declare sub setObjectForKeyString lib FoundationLibName  selector "setObject:forKey:" (id as ptr, value  as ptr, key as cfstringref)
		  setObjectForKeyString id, anObject.GeneralID, key
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObject()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDictionary(aDictionary as AppleDictionary)
		  declare sub SetDictionary lib FoundationLibName  selector "setDictionary:" (id as ptr, aDictionary as ptr)
		  SetDictionary id, aDictionary.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObjectForKey(Key as AppleGeneralObject, anObject as AppleGeneralObject)
		  setObjectForKey  key.GeneralID, anObject.GeneralID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObjectForKey(Key as Ptr, anObject as Ptr)
		  Declare sub setObjectForKey lib FoundationLibName  selector "setObject:forKey:" (id as ptr, value  as ptr, key as ptr)
		  setObjectForKey id, anObject, key
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetObjectForKey(Key as Ptr, anObject as Weakref)
		  setObjectForKey  key, anObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValueForKey(Key as CFstringRef, assigns value as cfstringref)
		  Declare sub setValueForKey lib FoundationLibName  selector "setValue:forKey:" (id as ptr, value as CFStringRef, key as CFStringRef)
		  setValueForKey id, value, key
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSMutableDictionary")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
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
			Name="StringsFileFormat"
			Group="Behavior"
			Type="Text"
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
