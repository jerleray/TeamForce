#tag Module
Protected Module Wrapper
	#tag Method, Flags = &h0
		Function decodeBase64(aText as text) As Text
		  'By Jason King
		  'Function decodeBase64(aText as text) As Text
		  declare function initWithBase64EncodedString lib FoundationLib selector "initWithBase64EncodedString:options:" _
		  (obj_id as ptr, str as CFStringRef, options as Integer) as ptr
		  declare function alloc lib FoundationLib selector "alloc" (clsRef as ptr) as ptr
		  declare function NSClassFromString lib FoundationLib (clsName as CFStringRef) as ptr
		  
		  dim mData as ptr = initWithBase64EncodedString(alloc(NSClassFromString("NSData")), aText, 1)
		  
		  const NSUTF8StringEncoding = 4
		  
		  declare function initWithData lib FoundationLib selector "initWithData:encoding:" (obj_id as ptr, data as ptr, encoding as Integer) as CFStringRef
		  Return initWithData(alloc(NSClassFromString("NSString")), mData, NSUTF8StringEncoding)
		  'End Function
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib Foundation (aClassName as CFStringRef) As Ptr
	#tag EndExternalMethod


	#tag Constant, Name = Foundation, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UIKit, Type = Text, Dynamic = False, Default = \"UIKit", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WrFoundationLib, Type = Text, Dynamic = False, Default = \"foundation.framework", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
End Module
#tag EndModule
