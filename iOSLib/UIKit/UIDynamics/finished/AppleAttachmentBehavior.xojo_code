#tag Class
Protected Class AppleAttachmentBehavior
Inherits AppleDynamicBehavior
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as Appleview, attachtoItem as AppleView)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Declare function initWithItemsAttached lib UIKitLibName selector "initWithItems:attachedToItem:" (id as ptr, item as Ptr, attachtoItem as ptr) as ptr
		  Super.Constructor (initWithItemsAttached(alloc(classptr), item.id, attachtoItem.id))
		  MHasOwnership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as Appleview, anchor as FoundationFrameWork.nspoint)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  #if Target64Bit
		    Declare function initWithItems lib UIKitLibName selector "initWithItems:attachedToAnchor:" (id as ptr, item as Ptr, anchor as FoundationFrameWork.nspoint) as ptr
		    Super.Constructor (initwithItems(alloc(classptr), item.id, anchor))
		  #elseif Target32Bit
		    Declare function initWithItems lib UIKitLibName selector "initWithItems:attachedToAnchor:" (id as ptr, item as Ptr, anchor as FoundationFrameWork.nspoint32bit) as ptr
		    Super.Constructor (initwithItems(alloc(classptr), item.id, anchor.toNSPoint32))
		  #endif
		  MHasOwnership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as Appleview, OffsetFromCenter as UIOffset, anchor as FoundationFrameWork.nspoint)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  #if Target64Bit
		    Declare function initWithItemsOffset lib UIKitLibName selector "initWithItems:offsetFromCenter:attachedToAnchor:" (id as ptr, item as Ptr, Offset as UIOffset, anchor as FoundationFrameWork.nspoint) as ptr
		    Super.Constructor (initwithItemsOffset(alloc(classptr), item.id, OffsetFromCenter, anchor))
		  #elseif Target32Bit
		    Declare function initWithItemsOffset lib UIKitLibName selector "initWithItems:offsetFromCenter:attachedToAnchor:" (id as ptr, item as Ptr, Offset as UIOffset32Bit, anchor as FoundationFrameWork.nspoint32bit) as ptr
		    Super.Constructor (initwithItemsOffset(alloc(classptr), item.id, OffsetFromCenter.toUIOffset32, anchor.toNSPoint32))
		  #endif
		  MHasOwnership = true
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function anchorPoint lib UIKitLibName selector "anchorPoint" (id as ptr) as FoundationFrameWork.nspoint
			    return anchorPoint (id)
			  #elseif Target32Bit
			    Declare function anchorPoint lib UIKitLibName selector "anchorPoint" (id as ptr) as FoundationFrameWork.nspoint32bit
			    return anchorPoint(id).toNSPoint
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setAnchorPoint lib UIKitLibName selector "setAnchorPoint:" (id as ptr, value as FoundationFrameWork.nspoint)
			    setAnchorPoint (id, value)
			  #elseif Target32Bit
			    Declare sub setAnchorPoint lib UIKitLibName selector "setAnchorPoint:" (id as ptr, value as FoundationFrameWork.nspoint32Bit)
			    setAnchorPoint (id, value.tonsPoint32)
			  #endif
			  
			End Set
		#tag EndSetter
		AnchorPoint As FoundationFrameWork.NSPoint
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function attachedBehaviorType lib UIKitLibName selector "attachedBehaviorType" (id as ptr) as UIAttachmentBehaviorType
			  return attachedBehaviorType(id)
			  
			End Get
		#tag EndGetter
		AttachedBehaviorType As UIAttachmentBehaviorType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static targetID as ptr
			  if targetID = Nil then
			    dim methods() as TargetClassMethodHelper
			    methods.Append new TargetClassMethodHelper("willMoveToAnimator:", AddressOf impl_willMoveToAnimator, "v@:@")
			    
			    targetID = BuildTargetClass ("UIAttachmentBehavior", "iOSLibAttachmentBehavior",methods)
			  end if
			  Return targetID
			  
			  
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function damping lib UIKitLibName selector "damping" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function damping lib UIKitLibName selector "damping" (id as ptr) as single
			  #endif
			  return damping (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setDamping lib UIKitLibName selector "setDamping:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare sub setDamping lib UIKitLibName selector "setDamping:" (id as ptr, value as single)
			  #endif
			  setDamping (id, value)
			  
			End Set
		#tag EndSetter
		Damping As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function frequency lib UIKitLibName selector "frequency" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function frequency lib UIKitLibName selector "frequency" (id as ptr) as single
			  #endif
			  return frequency (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setFrequency lib UIKitLibName selector "setFrequency:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare sub setFrequency lib UIKitLibName selector "setFrequency:" (id as ptr, value as single)
			  #endif
			  setFrequency (id, value)
			  
			End Set
		#tag EndSetter
		Frequency As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function items lib UIKitLibName selector "items" (id as ptr) as ptr
			  return AppleMutableArray.MakeFromPtr ( items (id))
			End Get
		#tag EndGetter
		Items As AppleArray
	#tag EndComputedProperty


	#tag Enum, Name = UIAttachmentBehaviorType, Type = Integer, Flags = &h0
		Items
		Anchor
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AttachedBehaviorType"
			Group="Behavior"
			Type="UIAttachmentBehaviorType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Items"
				"1 - Anchor"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Damping"
			Group="Behavior"
			Type="double"
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
			Name="Frequency"
			Group="Behavior"
			Type="double"
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
