#tag Class
Protected Class AppleTextViewer
Inherits AppleViewcontrol
Implements AppleNSEventReceiver
	#tag Event
		Sub Close()
		  // call me.AppleView.AutoRelease me.Handle
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function CreateView() As UInteger
		  dim frame as  FoundationFrameWork.NSRect = FoundationFrameWork.NSMakeRect (0,0,100,100)
		  viewobject = new AppleTextField1 (frame, self)
		  ViewObject.AutoRelease
		  Return UInteger(viewobject.id)
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function impl_layerClass(id as ptr, sel as ptr) As Ptr
		  return FoundationFramework.NSClassFromString ("CATiledLayer")
		  
		  #Pragma Unused id
		  #Pragma Unused  sel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub impl_layoutSubviews(id as ptr, sel as ptr)
		  dim Ego as new AppleView (id)
		  if not ego.IsNIL then
		    dim sublayers as AppleArray = ego.Layer.SubLayers
		    if not sublayers.IsNIL then
		      if sublayers.count > 0 then
		        for q as uinteger = 0 to sublayers.Count -1
		          dim sublayer as  new  AppleCALayer (sublayers.PtrAtIndex(q))
		          sublayer.Frame = ego.Bounds
		        next
		      end if
		    end if
		  end if
		  
		  #Pragma Unused id
		  #Pragma Unused  sel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReceivedEvent(Details as AppleArray)
		  // Part of the AppleNSEventReceiver interface.
		  
		  system.DebugLog Details.DebugDescription
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ViewObject
			End Get
		#tag EndGetter
		AppleView As AppleTextfield1
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static customClassPtr as Ptr
			  if customClassPtr = nil then
			    dim methods() as TargetClassMethodHelper
			    'methods.Append new TargetClassMethodHelper("layoutSubviews", AddressOf impl_layoutSubviews, "v@:")
			    'methods.Append new TargetClassMethodHelper("layerClass", AddressOf impl_layerClass, "#@:", true, true)
			    
			    customClassPtr = BuildTargetClass("UITextField","iOSLibTextViewer",methods)
			  end if
			  return customClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mid
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mid As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ViewObject As AppleTextfield1
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
