#tag Class
Protected Class AppleImageAsset
Inherits AppleObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // no constructor at all. Image assets are created by UIImage/AppleImage if several representations of one image are available.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image(TraitCollection as AppleTraitCollection) As AppleImage
		  Declare function imageWithTraitCollection lib UIKitLibname selector "imageWithTraitCollection:" (id as ptr, TraitCollection as ptr) as ptr
		  return AppleImage.MakeFromPtr (imageWithTraitCollection(id, TraitCollection.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakefromPtr(aPtr as Ptr) As AppleImageAsset
		  return if (aptr = nil, nil, new AppleImageAsset(aptr))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterImage(Image As AppleImage, TraitCollection as AppleTraitCollection)
		  Declare sub registerImage lib UIKitLibname selector "registerImage:withTraitCollection:" (id as ptr, image as ptr, TraitCollection as ptr)
		  registerImage (id, image.id, TraitCollection.id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterImage(TraitCollection as AppleTraitCollection)
		  Declare sub unregisterImageWithTraitCollection lib UIKitLibname selector "unregisterImageWithTraitCollection:" (id as ptr, TraitCollection as ptr)
		  unregisterImageWithTraitCollection (id, TraitCollection.id)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (ClassPtr <> nil)
			End Get
		#tag EndGetter
		Shared ClassAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("UIImageAsset")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty


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
