#tag Class
Protected Class AppleDynamicBehavior
Inherits Appleobject
	#tag Method, Flags = &h0
		Sub AddChildBehavior(Behavior as AppleDynamicBehavior)
		  Declare sub addChildBehavior lib UIKitLibName selector "addChildBehavior:" (id as ptr, Behavior as ptr)
		  addChildBehavior id, Behavior.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub impl_willMoveToAnimator(pid as ptr, sel as ptr, animator as Ptr)
		  dim ego as new AppleDynamicBehavior (pid)
		  if not ego.IsNIL then ego.informonWillMoveToAnimator(animator)
		  
		  #Pragma Unused  sel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonWillMoveToAnimator(animator as ptr)
		  raiseEvent WillMoveToAnimator (new AppleDynamicAnimator(animator))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChildBehavior(Behavior as AppleDynamicBehavior)
		  Declare sub removeChildBehavior lib UIKitLibName selector "removeChildBehavior:" (id as ptr, Behavior as ptr)
		  removeChildBehavior id, Behavior.id
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event WillMoveToAnimator(Animator as AppleDynamicAnimator)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  Declare sub setAction lib UIKitLibName selector "setAction:" (id as ptr, action as ptr)
			  setAction id, value.Handle
			End Set
		#tag EndSetter
		Action As iosBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function childBehaviors lib UIKitLibName selector "childBehaviors" (id as ptr) as ptr
			  return AppleArray.MakeFromPtr (childBehaviors(id))
			End Get
		#tag EndGetter
		ChildBehaviors As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static targetID as ptr
			  if targetID = Nil then
			    dim methods() as TargetClassMethodHelper
			    methods.Append new TargetClassMethodHelper("willMoveToAnimator:", AddressOf impl_willMoveToAnimator, "v@:@")
			    
			    targetID = BuildTargetClass ("UIDynamicBehavior", "iOSLibDynamicBehavior",methods)
			  end if
			  Return targetID
			  
			  
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function dynamicAnimator lib UIKitLibName selector "dynamicAnimator" (id as ptr) as ptr
			  return AppleDynamicAnimator.MakeFromPtr (dynamicAnimator(id))
			End Get
		#tag EndGetter
		DynamicAnimator As AppleDynamicAnimator
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
