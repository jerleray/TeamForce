#tag Class
Protected Class AppleInvocation
Inherits AppleObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetArgument(argument as Applearray, Index as Integer)
		  declare sub GetArgument lib FoundationLibName  selector "getArgument:atIndex:" (id as ptr, agument as ptr, index as integer)
		  GetArgument id, argument.id, Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RetainArguments()
		  declare sub retainArguments lib FoundationLibName  selector "retainArguments:" (id as ptr)
		  retainArguments id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetArgument(argument as Applearray, Index as Integer)
		  declare sub setArgument lib FoundationLibName  selector "setArgument:atIndex:" (id as ptr, agument as ptr, index as integer)
		  setArgument id, argument.id, Index
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function argumentsRetained lib FoundationLibName  selector "argumentsRetained" (id as ptr) as Boolean
			  return argumentsRetained (id)
			End Get
		#tag EndGetter
		ArgumentsRetained As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as ptr = FoundationFramework.NSClassFromString ("NSInvocation")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function methodSignature lib FoundationLibName  selector "methodSignature" (id as ptr) as Ptr
			  return ApplemethodSignature.makefromptr (methodSignature(id))
			End Get
		#tag EndGetter
		MethodSignature As AppleMethodSignature
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function getSelector lib FoundationLibName  selector "selector" (id as ptr) as ptr
			  return getSelector (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setSelector lib FoundationLibName  selector "setSelector:" (id as ptr, value as ptr)
			  setSelector (id, value)
			End Set
		#tag EndSetter
		Selector As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return FoundationFrameWork.NSStringFromSelector (Selector)
			End Get
		#tag EndGetter
		SelectorName As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function target lib FoundationLibName  selector "target" (id as ptr) as ptr
			  return target (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setTarget lib FoundationLibName  selector "setTarget:" (id as ptr, value as ptr)
			  setTarget (id, value)
			End Set
		#tag EndSetter
		Target As Ptr
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ArgumentsRetained"
			Group="Behavior"
			Type="Boolean"
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
			Name="SelectorName"
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
