#tag Class
Protected Class AppleDictionary
Inherits AppleMutableObjectInterface
	#tag Method, Flags = &h0
		Function allKeysForObject(anObject as AppleGeneralObject) As AppleArray
		  declare Function allKeysForObject lib FoundationLibName  selector "allKeysForObject:" (id as ptr, anobject as ptr) as ptr
		  return AppleArray.MakeFromPtr( allKeysForObject (id, anObject.GeneralID))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (Init(Alloc(ClassPtr)))
		  mhasownership = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakeFromPtr(aPtr as Ptr) As AppleDictionary
		  return if (aptr <> NIL, new AppleDictionary (aptr), NIL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObjectForKey(akey as cfstringref) As AppleObject
		  return AppleObject.MakeFromPtr (PtrForKey (akey))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PtrForKey(akey as cfstringref) As Ptr
		  declare Function objectForKey lib FoundationLibName  selector "objectForKey:" (id as ptr, key as cfstringref) as ptr
		  return objectForKey (id, akey)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PtrForKey(akey as Ptr) As Ptr
		  declare Function objectForKey lib FoundationLibName  selector "objectForKey:" (id as ptr, key as Ptr) as ptr
		  return objectForKey (id, akey)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextForKey(akey as cfstringref) As Text
		  declare Function objectForKey lib FoundationLibName  selector "objectForKey:" (id as ptr, key as cfstringref) as cfstringref
		  return objectForKey (id, akey)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextkeyForObject(anObject as AppleGeneralObject) As Text
		  return allKeysForObject(anobject).TextAtIndex(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForKey(Key as CFstringRef) As Ptr
		  declare function valueForKey lib FoundationLibName  selector "valueForKey:" (id as ptr, key as CFStringRef) as ptr
		  return valueForKey (id, key)
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function allKeys lib FoundationLibName  Selector "allKeys"(id as ptr) as ptr
			  dim myptr as ptr = allKeys (id)
			  return if (myptr <> NIL, new AppleArray (myptr), NIL)
			  
			End Get
		#tag EndGetter
		Allkeys As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function allValues lib FoundationLibName  Selector "allValues"(id as ptr) as ptr
			  dim myptr as ptr = allValues (id)
			  return if (myptr <> NIL, new AppleArray (myptr), NIL)
			  
			End Get
		#tag EndGetter
		AllValues As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSDictionary")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getCount
			End Get
		#tag EndGetter
		Count As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function descriptionInStringsFileFormat lib FoundationLibName  selector "descriptionInStringsFileFormat" (id as ptr) as CFStringRef
			  return descriptionInStringsFileFormat (id)
			End Get
		#tag EndGetter
		StringsFileFormat As Text
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
