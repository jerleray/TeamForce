#tag Class
Protected Class AppleURLAuthenticationChallenge
Inherits AppleObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakefromPtr(aPtr as Ptr) As AppleURLAuthenticationChallenge
		  return if (aptr = nil, nil, new AppleURLAuthenticationChallenge(aptr))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSURLAuthenticationChallenge")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function error lib FoundationLibName  selector "error" (id as ptr) as ptr
			  return AppleError.MakeFromPtr (error (id))
			End Get
		#tag EndGetter
		Error As AppleError
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function failureResponse lib FoundationLibName  selector "failureResponse" (id as ptr) as ptr
			  return AppleURLResponse.MakeFromPtr (failureResponse (id))
			End Get
		#tag EndGetter
		FailureResponse As AppleURLResponse
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function previousFailureCount lib FoundationLibName  selector "previousFailureCount" (id as ptr) as Integer
			  return previousFailureCount (id)
			End Get
		#tag EndGetter
		PreviousFailureCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function proposedCredential lib FoundationLibName  selector "proposedCredential" (id as ptr) as Ptr
			  return appleurlCredential.MakefromPtr ( proposedCredential (id))
			End Get
		#tag EndGetter
		ProposedCredential As AppleURLCredential
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function protectionSpace lib FoundationLibName  selector "protectionSpace" (id as ptr) as ptr
			  return AppleURLProtectionSpace.MakeFromPtr (protectionSpace (id))
			End Get
		#tag EndGetter
		ProtectionSpace As AppleURLProtectionSpace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function sender lib FoundationLibName  selector "sender" (id as ptr) as ptr
			  return AppleURLSessionDelegate.MakeFromPtr (sender (id))
			End Get
		#tag EndGetter
		Sender As AppleURLSessionDelegate
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
			Name="PreviousFailureCount"
			Group="Behavior"
			Type="Integer"
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
