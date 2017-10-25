#tag Class
Protected Class AppleControl
Inherits AppleView
	#tag Method, Flags = &h0
		Function Actions(Target as appleobject, Events as UIControlEvent) As AppleArray
		  Declare function actionsForTarget lib UIKitLibname selector "actionsForTarget:forControlEvents:" (id as ptr, target as ptr, events as UInteger) as ptr
		  return AppleArray.MakeFromPtr (actionsForTarget(id, Target.id, Events.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTarget(Target as appleobject, SEL as Ptr, Events as UIControlEvent)
		  Declare Sub addTarget lib UIKitLibname selector "addTarget:action:forControlEvents:" (id as ptr, target as ptr, SEL as ptr, events as UInteger)
		  addTarget id, target.id, sel, Events.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveTarget(Target as appleobject, SEL as Ptr, Events as UIControlEvent)
		  Declare Sub removeTarget lib UIKitLibname selector "removeTarget:action:forControlEvents:" (id as ptr, target as ptr, SEL as ptr, events as UInteger)
		  removeTarget id, target.id, sel, Events.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendAction(SEL as Ptr, Target as AppleObject, UIEvent as AppleNSEvent)
		  Declare Sub sendActionTo lib UIKitLibname selector "sendAction:to:forEvent:" (id as ptr, SEL as ptr, Target as Ptr, UIEvent as ptr)
		  SendActionTo id, SEL, Target.id, UIEvent.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendActions(Events as UIControlEvent)
		  Declare Sub sendActions lib UIKitLibname selector "sendActionsForControlEvents:" (id as ptr, events as UInteger)
		  SendActions id, Events.id
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function allControlEvents lib UIKitLibname selector "allControlEvents" (id as ptr) as UInteger
			  return new UIControlEvent(allControlEvents(id))
			End Get
		#tag EndGetter
		AllControlEvents As UIControlEvent
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function allTargets lib UIKitLibname selector "allTargets" (id as ptr) as ptr
			  return appleset.MakeFromPtr (allTargets(id))
			End Get
		#tag EndGetter
		AllTargets As AppleSet
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("UIControl")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function contentHorizontalAlignment lib UIKitLibname selector "contentHorizontalAlignment" (id as ptr) as UIControlContentHorizontalAlignment
			  return contentHorizontalAlignment (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setcontentHorizontalAlignment lib UIKitLibname selector "contentHorizontalAlignment:" (id as ptr, value as UIControlContentHorizontalAlignment)
			  setcontentHorizontalAlignment id, value
			End Set
		#tag EndSetter
		ContentHorizontalAlignment As UIControlContentHorizontalAlignment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function contentVerticalAlignment lib UIKitLibname selector "contentVerticalAlignment" (id as ptr) as UIControlContentVerticalAlignment
			  return contentVerticalAlignment (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setContentVerticalAlignment lib UIKitLibname selector "setContentVerticalAlignment:" (id as ptr, value as UIControlContentVerticalAlignment)
			  setContentVerticalAlignment id, value
			End Set
		#tag EndSetter
		ContentVerticalAlignment As UIControlContentVerticalAlignment
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function enabled lib UIKitLibname selector "isEnabled" (id as ptr) as Boolean
			  return enabled (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setEnabled lib UIKitLibname selector "setEnabled:" (id as ptr, value as Boolean)
			  setenabled id, value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function Highlighted lib UIKitLibname selector "isHighlighted" (id as ptr) as Boolean
			  return Highlighted (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setHighlighted lib UIKitLibname selector "setHighlighted:" (id as ptr, value as Boolean)
			  setHighlighted id, value
			End Set
		#tag EndSetter
		Highlighted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function selected lib UIKitLibname selector "isSelected" (id as ptr) as Boolean
			  return selected (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setSelected lib UIKitLibname selector "setSelected:" (id as ptr, value as Boolean)
			  setSelected id, value
			End Set
		#tag EndSetter
		Selected As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function state lib UIKitLibname selector "state" (id as ptr) as UIControlState
			  return state (id)
			End Get
		#tag EndGetter
		State As UIControlState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function isTouchInside lib UIKitLibname selector "isTouchInside" (id as ptr) as Boolean
			  return isTouchInside (id)
			End Get
		#tag EndGetter
		TouchInside As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function tracking lib UIKitLibname selector "isTracking" (id as ptr) as Boolean
			  return tracking (id)
			End Get
		#tag EndGetter
		Tracking As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoresizesSubviews"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClearsContextBeforeDrawing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClipsToBounds"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CollisionBoundsType"
			Group="Behavior"
			Type="UIKitFramework.UIDynamicItemCollisionBoundsType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Rectangle"
				"1 - Ellipse"
				"2 - Path"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentHorizontalAlignment"
			Group="Behavior"
			Type="UIControlContentHorizontalAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Center"
				"1 - Left"
				"2 - Right"
				"3 - Fill"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentMode"
			Group="Behavior"
			Type="UIViewContentMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - ScaleToFill"
				"1 - ScaleAspectFit"
				"2 - ScaleAspectFill"
				"3 - Redraw"
				"4 - Center"
				"5 - Top"
				"6 - Bottom"
				"7 - Left"
				"8 - Right"
				"9 - TopLeft"
				"10 - TopRight"
				"11 - BottomLeft"
				"12 - BottomRight"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentVerticalAlignment"
			Group="Behavior"
			Type="UIControlContentVerticalAlignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Center"
				"1 - Top"
				"2 - Bottom"
				"3 - Fill"
			#tag EndEnumValues
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
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExclusiveTouch"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAmbiguousLayout"
			Group="Behavior"
			Type="Boolean"
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
			Name="Height"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Highlighted"
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
			Name="IsFirstResponder"
			Group="Behavior"
			Type="Boolean"
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
			Name="MultipleTouchEnabled"
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
			Name="Opaque"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreservesSuperviewLayoutMargins"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetainCount"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="State"
			Group="Behavior"
			Type="UIControlState"
			EditorType="Enum"
			#tag EnumValues
				"0 - Normal"
				"1 - Highlighted"
				"2 - Disabled"
				"3 - Selected"
				"4 - Application"
				"5 - Reserved"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tag"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextInputContextIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TintAdjustmentMode"
			Group="Behavior"
			Type="UIViewTintAdjustmentMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Normal"
				"2 - Dimmed"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TouchInside"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tracking"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TranslatesAutoresizingMaskIntoConstraints"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserInteractionEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
