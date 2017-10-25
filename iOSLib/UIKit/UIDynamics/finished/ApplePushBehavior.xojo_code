#tag Class
Protected Class ApplePushBehavior
Inherits AppleDynamicBehavior
	#tag Method, Flags = &h0
		Sub AddItem(item as AppleView)
		  Declare sub additem lib UIKitLibName selector "addItem:" (id as ptr, item as ptr)
		  additem id,item.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(items as AppleArray, mode as UIPushBehaviorMode)
		  Declare function initWithItems lib UIKitLibName selector "initWithItems:mode:" (id as ptr, items as ptr, mode as UIPushBehaviorMode) as ptr
		  super.Constructor (initWithItems(alloc(classptr), items.id, mode))
		  mHasOwnership = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as AppleView, mode as UIPushBehaviorMode)
		  dim myArray as AppleMutableArray = AppleMutableArray.fromAppleObjects (item)
		  Constructor (myArray, mode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(item as ioscontrol, mode as UIPushBehaviorMode)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Constructor (item.appleview, mode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem(item as AppleView)
		  Declare sub removeItem lib UIKitLibName selector "removeItem:" (id as ptr, item as ptr)
		  removeItem id,item.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAngleAndMagnitude(Angle as Double, Magnitude as Double)
		  #if Target64Bit
		    Declare sub setAngleMagnitude lib UIKitLibName selector "setAngle:magnitude:" (id as ptr, angle as double, magnitude as double)
		  #elseif Target32Bit
		    Declare sub setAngleMagnitude lib UIKitLibName selector "setAngle:magnitude:" (id as ptr, angle as single, magnitude as single)
		  #endif
		  SetAngleMagnitude id, angle, Magnitude
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTargetOffset(OffsetFromCenter as UIOffset, forItem as AppleView)
		  #if Target64Bit
		    Declare sub setTargetOffsetFromCenter lib UIKitLibName selector "setTargetOffsetFromCenter:forItem:" (id as ptr, offset as uioffset, item as ptr)
		    setTargetOffsetFromCenter id, OffsetFromCenter, foritem.id
		  #elseif Target32Bit
		    Declare sub setTargetOffsetFromCenter lib UIKitLibName selector "setTargetOffsetFromCenter:forItem:" (id as ptr, offset as uioffset32Bit, item as ptr)
		    setTargetOffsetFromCenter id, OffsetFromCenter.toUIOffset32, foritem.id
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TargetOffset(forItem as AppleView) As UIOffset
		  #if Target64Bit
		    Declare function getTargetOffsetFromCenter lib UIKitLibName selector "setTargetOffsetFromCenterForItem:" (id as ptr, item as ptr) as UIOffset
		    return getTargetOffsetFromCenter (id, foritem.id)
		  #elseif Target32Bit
		    Declare function getTargetOffsetFromCenter lib UIKitLibName selector "setTargetOffsetFromCenterForItem:" (id as ptr, item as ptr) as UIOffset32Bit
		    return getTargetOffsetFromCenter (id, foritem.id).touioffset
		  #endif
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function active lib UIKitLibName selector "active" (id as ptr) as boolean
			  return active (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setActive lib UIKitLibName selector "setActive:" (id as ptr, value as Boolean)
			  setActive id, value
			End Set
		#tag EndSetter
		Active As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function angle lib UIKitLibName selector "angle" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function angle lib UIKitLibName selector "angle" (id as ptr) as single
			  #endif
			  return angle (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setAngle lib UIKitLibName selector "setAngle:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare sub setAngle lib UIKitLibName selector "setAngle:" (id as ptr, value as single)
			  #endif
			  setangle (id, value)
			  
			End Set
		#tag EndSetter
		Angle As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Angle.RadianToDegree
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  angle = value.DegreeToRadian
			End Set
		#tag EndSetter
		AngleInDegrees As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static targetID as ptr
			  if targetID = Nil then
			    dim methods() as TargetClassMethodHelper
			    methods.Append new TargetClassMethodHelper("willMoveToAnimator:", AddressOf impl_willMoveToAnimator, "v@:@")
			    
			    targetID = BuildTargetClass ("UIPushBehavior", "iOSLibPushBehavior",methods)
			  end if
			  Return targetID
			  
			  
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function magnitude lib UIKitLibName selector "magnitude" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function magnitude lib UIKitLibName selector "magnitude" (id as ptr) as single
			  #endif
			  return Magnitude (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setMagnitude lib UIKitLibName selector "setMagnitude:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare sub setMagnitude lib UIKitLibName selector "setMagnitude:" (id as ptr, value as single)
			  #endif
			  setMagnitude (id, value)
			  
			End Set
		#tag EndSetter
		Magnitude As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function mode lib UIKitLibName selector "mode" (id as ptr) as UIPushBehaviorMode
			  return mode (id)
			  
			End Get
		#tag EndGetter
		Mode As UIPushBehaviorMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function pushDirection lib UIKitLibName selector "pushDirection" (id as ptr) as FoundationFrameWork.cgvector
			    return pushDirection (id)
			  #elseif Target32Bit
			    Declare function pushDirection lib UIKitLibName selector "pushDirection" (id as ptr) as FoundationFrameWork.cgvector32Bit
			    return pushDirection(id).tocgvector
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setPushDirection lib UIKitLibName selector "setPushDirection:" (id as ptr, value as FoundationFrameWork.cgvector)
			    setPushDirection (id, value)
			  #elseif Target32Bit
			    Declare sub setPushDirection lib UIKitLibName selector "setPushDirection:" (id as ptr, value as FoundationFrameWork.cgvector32Bit)
			    setPushDirection (id, value.toCGVector32)
			  #endif
			  
			End Set
		#tag EndSetter
		PushDirection As FoundationFrameWork.CGVector
	#tag EndComputedProperty


	#tag Enum, Name = UIPushBehaviorMode, Type = Integer, Flags = &h0
		Continuous
		Instantaneous
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Active"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Angle"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AngleInDegrees"
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
			Name="Magnitude"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Group="Behavior"
			Type="UIPushBehaviorMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Continuous"
				"1 - Instantaneous"
			#tag EndEnumValues
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
